#!/usr/bin/env python3
import sys
import json
import subprocess

def get_pipewire_dump():
    """Fetches the current PipeWire state as JSON."""
    result = subprocess.run(['pw-dump'], capture_output=True, text=True)
    try:
        return json.loads(result.stdout)
    except json.JSONDecodeError:
        print("Error: Could not parse pw-dump output.")
        sys.exit(1)

def find_node(dump, name_query, role):
    """
    Finds a node by name and its explicit media class role.
    role: "source" (app outputting audio) or "sink" (app receiving audio)
    """
    valid_classes = (
        ["Stream/Output/Audio", "Audio/Source"] if role == "source"
        else ["Stream/Input/Audio", "Audio/Sink"]
    )

    for obj in dump:
        if obj.get('type') == 'PipeWire:Interface:Node':
            props = obj.get('info', {}).get('props', {})
            media_class = props.get('media.class', '')

            names = [
                props.get('application.name', ''),
                props.get('node.name', ''),
                props.get('node.description', ''),
                props.get('media.name', '')
            ]

            if any(name_query.lower() in str(n).lower() for n in names if n):
                if media_class in valid_classes:
                    display_name = props.get('application.name') or props.get('node.description') or name_query
                    return str(obj['id']), display_name

    return None, None

def get_ports(dump, node_id, direction):
    """Gets ports for a node. Falls back to port ID if channel is unmapped."""
    ports = {}
    for obj in dump:
        if obj.get('type') == 'PipeWire:Interface:Port':
            info = obj.get('info', {})
            props = info.get('props', {})

            if str(props.get('node.id')) == node_id:
                port_dir = str(info.get('direction') or props.get('port.direction') or '').lower()

                if direction in port_dir or not port_dir:
                    channel = props.get('audio.channel') or props.get('port.name') or f"unmapped_{obj['id']}"
                    ports[channel] = obj['id']
    return ports

def get_existing_links(dump):
    """Returns a set of (out_port_id, in_port_id) tuples representing active links."""
    links = set()
    for obj in dump:
        if obj.get('type') == 'PipeWire:Interface:Link':
            info = obj.get('info', {})
            props = info.get('props', {})

            # Extract port IDs (can be nested in props or root info depending on version)
            out_port = props.get('link.output.port') or info.get('output-port-id') or info.get('output_port_id')
            in_port = props.get('link.input.port') or info.get('input-port-id') or info.get('input_port_id')

            if out_port is not None and in_port is not None:
                try:
                    links.add((int(out_port), int(in_port)))
                except ValueError:
                    continue
    return links

def main():
    if len(sys.argv) != 3:
        print("Usage: ./pw-connect.py <output_app_name> <input_app_name>")
        print("Example: ./pw-connect.py spotify 'webrtc voiceengine'")
        sys.exit(1)

    out_query = sys.argv[1]
    in_query = sys.argv[2]

    print("Fetching PipeWire state...")
    dump = get_pipewire_dump()

    # 1. Find the Nodes using Media Class
    out_node_id, out_name = find_node(dump, out_query, "source")
    if not out_node_id:
        print(f"Error: Could not find playback node for '{out_query}'. Is the app running?")
        sys.exit(1)

    in_node_id, in_name = find_node(dump, in_query, "sink")
    if not in_node_id:
        print(f"Error: Could not find recording node for '{in_query}'. Is the app capturing audio?")
        sys.exit(1)

    print(f"Found Source: {out_name} (Node ID: {out_node_id})")
    print(f"Found Sink:   {in_name} (Node ID: {in_node_id})")

    # 2. Get the Ports
    out_ports = get_ports(dump, out_node_id, "out")
    in_ports = get_ports(dump, in_node_id, "in")

    # 3. Check for Paused/Suspended States
    if not out_ports or not in_ports:
        print("\n[!] ERROR: Node found, but missing audio ports.")
        if not out_ports:
            print(f" -> '{out_name}' has 0 active output ports. (Is the audio paused?)")
        if not in_ports:
            print(f" -> '{in_name}' has 0 active input ports. (Is the mic activated in the app?)")
        print("\nFix: Make sure both applications are actively playing/recording audio right now.")
        sys.exit(1)

    # 4. Map the target port pairs based on Audio Channel / Fallback logic
    target_pairs = []
    in_channels = list(in_ports.keys())

    for i, (out_chan, out_port_id) in enumerate(out_ports.items()):
        if out_chan in in_ports:
            in_port_id = in_ports[out_chan]
            target_pairs.append((int(out_port_id), int(in_port_id), f"[Exact Match: {out_chan}]"))
        else:
            fallback_chan = in_channels[i % len(in_channels)]
            in_port_id = in_ports[fallback_chan]
            target_pairs.append((int(out_port_id), int(in_port_id), f"[Fallback: {out_chan} -> {fallback_chan}]"))

    # 5. Determine whether to Connect or Disconnect (Toggle Logic)
    existing_links = get_existing_links(dump)

    # If ANY of our target connections already exist, we switch to disconnect mode
    disconnect_mode = any((out_id, in_id) in existing_links for out_id, in_id, _ in target_pairs)

    print("-" * 30)
    if disconnect_mode:
        print("Existing connections detected. Mode: DISCONNECT")
        for out_id, in_id, label in target_pairs:
            if (out_id, in_id) in existing_links:
                print(f"Disconnecting {label}: Port {out_id} -x-> Port {in_id}")
                subprocess.run(['pw-link', '-d', str(out_id), str(in_id)])
            else:
                print(f"Skipping {label}: Port {out_id} and Port {in_id} are already unlinked.")
    else:
        print("No existing connections detected. Mode: CONNECT")
        for out_id, in_id, label in target_pairs:
            print(f"Linking {label}: Port {out_id} -> Port {in_id}")
            subprocess.run(['pw-link', str(out_id), str(in_id)])

    print("Done!")

if __name__ == '__main__':
    main()

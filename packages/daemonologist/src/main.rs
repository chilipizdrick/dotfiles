use std::{
    env,
    error::Error,
    fs,
    io::Read,
    os::unix::net::UnixStream,
    process::{Child, Command},
};

type AnyError = Box<dyn Error>;
type AnyErrResult<T> = Result<T, AnyError>;

fn main() -> AnyErrResult<()> {
    let hyprland_instance_signature = env::var("HYPRLAND_INSTANCE_SIGNATURE")?;
    let xdg_runtime_dir = env::var("XDG_RUNTIME_DIR")?;
    let hyprland_socket2_path = format!(
        "{}/hypr/{}/.socket2.sock",
        xdg_runtime_dir, hyprland_instance_signature
    );
    let mut stream = UnixStream::connect(hyprland_socket2_path)?;
    let mut buf = [0u8; 4096];

    loop {
        let size = stream.read(&mut buf)?;
        let msg = str::from_utf8(&buf[..size])?;
        let events = msg.lines().filter_map(parse_event);
        for event in events {
            println!("Recieved event: {event:?}");
            if let Event::OpenWindow {
                window_class: "discord",
                ..
            } = event
            {
                let _ = start_easyeffects_if_not_running();
            }
        }
    }
}

fn is_program_running(executable_name: &str) -> AnyErrResult<bool> {
    for entry in fs::read_dir("/proc")?.flatten() {
        let name = entry.file_name();
        let name = name.to_str().ok_or("String contains non UTF8 characters")?;

        if name.chars().all(char::is_numeric) {
            let exe_path = entry.path().join("exe");
            if let Ok(exe) = fs::read_link(exe_path)
                && exe.ends_with(executable_name)
            {
                return Ok(true);
            }
        }
    }

    Ok(false)
}

fn start_easyeffects_if_not_running() -> AnyErrResult<Option<Child>> {
    if !is_program_running(".easyeffects-wrapped")? {
        let child = Command::new("easyeffects").arg("--hide-window").spawn()?;
        println!("Started Easy Effects");
        return Ok(Some(child));
    }
    Ok(None)
}

fn parse_event<'a>(event_str: &'a str) -> Option<Event<'a>> {
    let mut type_data = event_str.split(">>");
    let type_ = type_data.next()?;
    let mut data = type_data.next()?.split(",");

    let event = match type_ {
        "openwindow" => {
            let address_str = data.next()?;
            let address = usize::from_str_radix(address_str, 16).ok()?;
            let workspace_name = data.next()?;
            let window_class = data.next()?;
            let window_title = data.next()?;
            Event::OpenWindow {
                address,
                workspace_name,
                window_class,
                window_title,
            }
        }
        _ => return None,
    };

    Some(event)
}

#[allow(unused)]
#[derive(Debug, Clone)]
enum Event<'a> {
    OpenWindow {
        address: usize,
        workspace_name: &'a str,
        window_class: &'a str,
        window_title: &'a str,
    },
}

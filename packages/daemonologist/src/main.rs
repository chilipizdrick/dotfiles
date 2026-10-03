use std::{
    env,
    error::Error,
    fs,
    io::{BufRead, BufReader},
    os::unix::net::UnixStream,
    process::{Child, Command},
};

type AnyError = Box<dyn Error>;
type AnyErrResult<T> = Result<T, AnyError>;

const HYPRLAND_INSTANCE_SIGNATURE: &str = "HYPRLAND_INSTANCE_SIGNATURE";
const XDG_RUNTIME_DIR: &str = "XDG_RUNTIME_DIR";

fn main() -> AnyErrResult<()> {
    let hyprland_instance_signature = env::var(HYPRLAND_INSTANCE_SIGNATURE).map_err(|err| {
        format!("Error reading {HYPRLAND_INSTANCE_SIGNATURE} environment variable: {err}")
    })?;
    let xdg_runtime_dir = env::var(XDG_RUNTIME_DIR)
        .map_err(|err| format!("Error reading {XDG_RUNTIME_DIR} environment variable: {err}"))?;

    let hyprland_socket2_path = format!(
        "{}/hypr/{}/.socket2.sock",
        xdg_runtime_dir, hyprland_instance_signature
    );

    let stream = UnixStream::connect(&hyprland_socket2_path)
        .map_err(|err| format!("Error connecting to {hyprland_socket2_path} unix socket: {err}"))?;

    run(stream)
}

fn run(stream: UnixStream) -> ! {
    let mut reader = BufReader::new(stream);
    let mut message = String::new();

    loop {
        message.clear();

        if let Err(err) = reader.read_line(&mut message) {
            eprintln!("[ERROR] Error reading stream: {err}");
            continue;
        }

        let Some(event) = parse_event(&message) else {
            // The event is eiter malformed, or we are not interested in it, thus we skip it
            continue;
        };

        match event {
            Event::OpenWindow {
                window_class: "discord",
                ..
            } => {
                if let Err(err) = start_easyeffects_if_not_running() {
                    eprintln!("[ERROR] {err}")
                }
            }

            _ => {}
        }
    }
}

fn start_easyeffects_if_not_running() -> AnyErrResult<Option<Child>> {
    if !is_program_running(".easyeffects-wrapped")? {
        let child = Command::new("easyeffects").arg("--hide-window").spawn()?;
        eprintln!("Started Easy Effects");
        return Ok(Some(child));
    }
    Ok(None)
}

fn is_program_running(executable_name: &str) -> AnyErrResult<bool> {
    for entry in fs::read_dir("/proc")?.flatten() {
        let name = entry.file_name();
        let name = name
            .to_str()
            .ok_or("String contains non UTF-8 characters")?;

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

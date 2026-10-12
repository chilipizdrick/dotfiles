use std::{
    env,
    error::Error,
    fs,
    io::{self, BufRead, BufReader, ErrorKind},
    os::unix::net::UnixStream,
    process::{Child, Command},
};

type AnyError = Box<dyn Error>;
type AnyErrResult<T> = Result<T, AnyError>;

const HYPRLAND_INSTANCE_SIGNATURE: &str = "HYPRLAND_INSTANCE_SIGNATURE";
const XDG_RUNTIME_DIR: &str = "XDG_RUNTIME_DIR";

fn main() -> AnyErrResult<()> {
    let hyprland_instance_signature = env::var(HYPRLAND_INSTANCE_SIGNATURE).map_err(|e| {
        format!("could not read {HYPRLAND_INSTANCE_SIGNATURE} environment variable: {e}")
    })?;
    let xdg_runtime_dir = env::var(XDG_RUNTIME_DIR)
        .map_err(|e| format!("could not read {XDG_RUNTIME_DIR} environment variable: {e}"))?;

    let hyprland_socket2_path = format!(
        "{}/hypr/{}/.socket2.sock",
        xdg_runtime_dir, hyprland_instance_signature
    );

    loop {
        let stream = UnixStream::connect(&hyprland_socket2_path).map_err(|e| {
            format!("could not connect to {hyprland_socket2_path} unix socket: {e}")
        })?;

        if let Err(e) = run_inner_loop(stream) {
            eprintln!("[ERROR] could not read hyprland sock: {e}")
        }
    }
}

fn run_inner_loop(stream: UnixStream) -> AnyErrResult<()> {
    let mut reader = BufReader::new(stream);
    let mut message = String::new();

    loop {
        message.clear();

        // Here [`ErrorKind::WouldBlock`], [`ErrorKind::TimedOut`] and [`ErrorKind::Interrupted`]
        // would never surface, thus we propagate every error encountered. If any severe error
        // occurs, the connection will not be reestablished and the daemon would exit.
        let read_len = reader.read_line(&mut message)?;

        if read_len == 0 {
            return Err(io::Error::from(ErrorKind::UnexpectedEof).into());
        }

        let Some(event) = parse_event(&message) else {
            // The event is eiter malformed, or we are not interested in it, thus we skip it
            continue;
        };

        if let Event::OpenWindow {
            window_class: "discord",
            ..
        } = event
            && let Err(e) = start_easyeffects_if_not_running()
        {
            eprintln!("[ERROR] could not start easyeffects: {e}")
        }
    }
}

fn start_easyeffects_if_not_running() -> AnyErrResult<Option<Child>> {
    if !is_program_running(".easyeffects-wrapped")? {
        let child = Command::new("easyeffects").arg("--hide-window").spawn()?;
        eprintln!("[INFO] started Easy Effects");
        return Ok(Some(child));
    }
    Ok(None)
}

fn is_program_running(executable_name: &str) -> AnyErrResult<bool> {
    for entry in fs::read_dir("/proc")?.flatten() {
        let name = entry.file_name();
        let name = name
            .to_str()
            .ok_or("string contains non UTF-8 characters")?;

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

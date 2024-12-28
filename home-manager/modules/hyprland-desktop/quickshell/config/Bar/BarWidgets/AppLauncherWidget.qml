import QtQuick
import QtQuick.Controls
import Quickshell.Io
import "root:/Bar"
import "root:/Shared"

BarWidget {
    childId: appLauncherButton
    width: parent.height

    BarButton {
        id: appLauncherButton

        contentItem: Rectangle {
            id: barButtonContent
            height: parent.height
            width: parent.height
            color: "transparent"
            Image {
                id: barButtonIcon
                anchors.fill: parent
                source: "root:Shared/assets/nix-snowflake-white.svg"
            }
        }

        action: Action {
            onTriggered: appLauncherProc.running = !appLauncherProc.running
        }
    }

    Process {
        id: appLauncherProc
        command: ["rofi", "-show", "drun", "-modi", "drun,calc"]
    }
}

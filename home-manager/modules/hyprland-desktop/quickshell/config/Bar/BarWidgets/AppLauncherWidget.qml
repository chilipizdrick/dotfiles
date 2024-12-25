import QtQuick
import QtQuick.Controls
import Quickshell.Io
import Quickshell
import "root:/Bar"
import "root:/Shared"

BarWidgetWrapper {
    childId: appLauncherButton
    width: parent.height
    Button {
        id: appLauncherButton
        height: parent.height
        width: parent.width
        background: Rectangle {
            radius: 8
            height: parent.height
            width: parent.height
            color: appLauncherButton.buttonColor
        }

        property color colorNormal: "transparent"
        property color colorHovered: Style.opague
        property color colorClicked: Style.blue

        contentItem: Rectangle {
            id: appLauncherButtonContent
            height: parent.height
            width: parent.height
            color: "transparent"

            Image {
                id: appLauncherButtonIcon
                anchors.fill: parent
                source: "root:Shared/assets/nix-snowflake-white.svg"
            }
        }

        onPressed: {
            appLauncherButtonAnimation.start();
        }
        onClicked: {
            appLauncherProc.running = !appLauncherProc.running;
        }

        property var buttonColor: if (appLauncherButton.down) {
            appLauncherButton.colorClicked;
        } else {
            appLauncherButton.hovered ? appLauncherButton.colorHovered : appLauncherButton.colorNormal;
        }

        SequentialAnimation {
            id: appLauncherButtonAnimation

            // Expand the button
            PropertyAnimation {
                target: appLauncherButtonContent
                property: "scale"
                to: 1.5
                duration: 200
                easing.type: Easing.InOutSine
            }

            // Shrink back to normal
            PropertyAnimation {
                target: appLauncherButtonContent
                property: "scale"
                to: 1.0
                duration: 200
                easing.type: Easing.InOutSine
            }
        }
    }

    // Placeholder. Will be here until I create my own launcher
    // (if I even do so in the first place).
    Process {
        id: appLauncherProc
        command: ["rofi", "-show", "drun", "-modi", "drun,calc"]
    }
}

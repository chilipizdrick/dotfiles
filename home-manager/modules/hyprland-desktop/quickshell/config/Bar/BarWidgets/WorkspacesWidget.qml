import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "root:/Bar"
import "root:/Shared"

BarWidget {
    childId: workspaceWidget

    RowLayout {
        id: workspaceWidget
        width: repeater.width
        height: parent.height
        Repeater {
            id: repeater
            height: parent.height
            width: childrenRect.width
            model: Hyprland.workspaces
            delegate: BarButton {
                id: workspaceBarButton
                // width: parent.height
                // height: parent.height
                required property var modelData
                contentItem: Rectangle {
                    id: barButtonContent
                    anchors.fill: parent
                    color: "transparent"
                    DefaultText {
                        anchors.centerIn: parent
                        text: modelData.id
                    }
                }
            }
        }
    }
}

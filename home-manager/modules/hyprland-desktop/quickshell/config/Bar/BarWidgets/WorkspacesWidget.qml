import QtQuick
import "root:/Bar"
import "root:/Shared"

BarWidgetWrapper {
    childId: workspaceWidget
    DefaultText {
        id: workspaceWidget
        anchors.centerIn: parent
        text: "workspaces"
    }
}

import QtQuick
import "root:/Bar"
import "root:/Shared"

BarWidgetWrapper {
    childId: mprisWidget
    DefaultText {
        id: mprisWidget
        anchors.centerIn: parent
        text: "mpris"
    }
}

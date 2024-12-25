import QtQuick
import "root:/Bar"
import "root:/Shared"

BarWidgetWrapper {
    childId: timeWidget
    DefaultText {
        id: timeWidget
        anchors.centerIn: parent
        text: Time.time
    }
}

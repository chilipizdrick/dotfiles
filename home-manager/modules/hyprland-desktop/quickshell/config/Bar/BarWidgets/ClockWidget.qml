import QtQuick
import "root:/Bar"
import "root:/Shared"

BarWidget {
    childId: timeWidget
    DefaultText {
        id: timeWidget
        anchors.centerIn: parent
        text: Time.time
    }
}

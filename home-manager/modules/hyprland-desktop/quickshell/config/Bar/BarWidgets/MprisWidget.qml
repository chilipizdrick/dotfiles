import QtQuick
import "root:/Bar"
import "root:/Shared"

BarWidget {
    childId: mprisWidget
    DefaultText {
        id: mprisWidget
        anchors.centerIn: parent
        text: "mpris"
    }
}

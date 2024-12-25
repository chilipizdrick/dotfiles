import QtQuick

Rectangle {
    required property var childId
    height: parent.height
    implicitWidth: childId.implicitWidth + 10 * 2
    color: "transparent"
}

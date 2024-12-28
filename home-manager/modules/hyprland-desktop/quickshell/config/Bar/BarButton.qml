import QtQuick
import QtQuick.Controls
import "root:/Bar"
import "root:/Shared"

Button {
    id: barButton

    property color colorNormal: "transparent"
    property color colorHovered: Style.opague
    property color colorClicked: Style.blue

    height: parent.height
    width: parent.width
    background: Rectangle {
        id: barButtonBackground
        radius: 8
        height: parent.height
        width: parent.height
        color: barButton.buttonColor
    }

    onPressed: {
        barButtonAnimation.start();
    }

    property var buttonColor: {
        barButton.hovered ? barButton.colorHovered : barButton.colorNormal;
    }

    SequentialAnimation {
        id: barButtonAnimation

        PropertyAnimation {
            target: barButtonBackground
            property: "color"
            to: barButton.colorClicked
            duration: 200
            easing.type: Easing.InOutSine
        }

        PropertyAnimation {
            target: barButtonBackground
            property: "color"
            to: barButton.colorNormal
            duration: 200
            easing.type: Easing.InOutSine
        }
    }
}

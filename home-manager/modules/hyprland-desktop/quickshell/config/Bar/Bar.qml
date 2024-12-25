import Quickshell
import QtQuick
import "root:/Shared"
import "BarWidgets"

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                left: 5
                right: 5
                top: 5
            }

            height: 27

            color: "transparent"

            BarSegment {
                id: leftBarSegment
                anchors.left: parent.left

                Row {
                    height: parent.height

                    width: childrenRect.width

                    spacing: 10

                    AppLauncherWidget {}
                    WorkspacesWidget {}
                    MprisWidget {}
                }
            }

            BarSegment {
                id: centerBarSegment
                anchors.centerIn: parent

                Row {
                    height: parent.height

                    width: childrenRect.width

                    spacing: 10

                    ClockWidget {}
                }
            }

            BarSegment {
                id: rightBarSegment
                anchors.right: parent.right

                Row {
                    height: parent.height

                    width: childrenRect.width

                    spacing: 10

                    ClockWidget {}
                }
            }
        }
    }
}

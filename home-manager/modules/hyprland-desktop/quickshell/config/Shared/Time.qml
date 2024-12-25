pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    property string time

    Process {
        id: dateProc
        command: ["date", "+%H:%M  %a %d %b"]
        running: true

        stdout: SplitParser {
            onRead: data => time = data
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}

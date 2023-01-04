import QtQuick 2.12
import QtQuick.Controls 2.12

Column {
    spacing: 0
    
    Text {
        id: dateLabel

        anchors.right: parent.right

        renderType: Text.NativeRendering
        font.family: "Atkinson Hyperlegible"
        font.pointSize: 64

        function updateDate() {
            text = new Date().toLocaleDateString(Qt.locale(), "dddd, MMMM d")
        }
    }

    Text {
        id: timeLabel

        anchors.right: parent.right

        renderType: Text.NativeRendering
        font.family: "Atkinson Hyperlegible"
        font.pointSize: 84
        font.bold: true

        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(), Locale.ShortFormat)
        }
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            timeLabel.updateTime()
            dateLabel.updateDate()
        }
    }

    Component.onCompleted: {
        timeLabel.updateTime()
        dateLabel.updateDate()
    }
}

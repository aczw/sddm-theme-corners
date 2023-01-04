import QtQuick 2.12
import QtQuick.Controls 2.12

Column {
    spacing: 0
    
    Text {
        id: dateLabel

        anchors.right: parent.right

        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.DateFontSize
        font.bold: true
        opacity: 0.8
        color: "white"

        function updateDate() {
            text = new Date().toLocaleDateString(Qt.locale(), config.DateFormat)
        }
    }

    Text {
        id: timeLabel

        anchors.right: parent.right

        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.TimeFontSize
        font.bold: true
        opacity: 0.8
        color: "white"

        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(), config.TimeFormat)
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

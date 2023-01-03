import QtQuick 2.12
import QtQuick.Controls 2.12

Column {
    spacing: -30
    
    Text {
        id: dateLabel

        anchors.right: parent.right

        renderType: Text.NativeRendering
        font.family: "Cartograph CF"
        font.pointSize: 48

        function updateDate() {
            text = new Date().toLocaleDateString(Qt.locale(), "dddd, MMMM d")
        }
    }

    Text {
        id: timeLabel

        anchors.right: parent.right

        renderType: Text.NativeRendering
        font.family: "Cartograph CF"
        font.pointSize: 64

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

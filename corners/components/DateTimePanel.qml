import QtQuick 2.12
import QtQuick.Controls 2.12

Column {
    spacing: 0
    Component.onCompleted: {
        timeLabel.updateTime();
        dateLabel.updateDate();
    }

    Text {
        id: dateLabel

        function updateDate() {
            text = new Date().toLocaleDateString(Qt.locale(), config.DateFormat);
        }

        anchors.right: parent.right
        opacity: config.DateOpacity
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.DateSize
        font.bold: config.DateIsBold == "true" ? true : false
        color: config.DateColor
    }

    Text {
        id: timeLabel

        function updateTime() {
            text = new Date().toLocaleTimeString(Qt.locale(), config.TimeFormat);
        }

        anchors.right: parent.right
        opacity: config.TimeOpacity
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.TimeSize
        font.bold: config.TimeIsBold == "true" ? true : false
        color: config.TimeColor
    }

    Timer {
        interval: 1000
        repeat: true
        running: true
        onTriggered: {
            timeLabel.updateTime();
            dateLabel.updateDate();
        }
    }

}

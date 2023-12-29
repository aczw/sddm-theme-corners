import QtQuick 2.15
import QtQuick.Controls 2.15

Column {
    spacing: config.DateTimeSpacing

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
        font.family: config.FontFamily
        font.pointSize: config.DateSize
        font.bold: config.DateIsBold === "true"
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
        font.family: config.FontFamily
        font.pointSize: config.TimeSize
        font.bold: config.TimeIsBold == "true"
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

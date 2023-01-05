import QtQuick 2.12
import QtQuick.Controls 2.12

ComboBox {
    model: sessionModel
    currentIndex: model.lastIndex
    textRole: "name"

    indicator.visible: true
    hoverEnabled: true
    
    contentItem: Text {
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.LoginFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: "Session: " + parent.currentText
    }

    delegate: ItemDelegate {
        id: sessionEntry
        
        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        
        contentItem: Text {
            renderType: Text.NativeRendering
            font.family: config.Font
            font.pointSize: config.LoginFontSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            text: model.name
        }
    }

    indicator {

    }

    background: Rectangle {
        color: "transparent"
        border.color: "transparent"
    }

    onActivated: print(currentIndex)
}

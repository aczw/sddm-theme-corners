import QtQuick 2.12
import QtQuick.Controls 2.12

ComboBox {
    model: userModel
    currentIndex: model.lastIndex
    textRole: "name"

    indicator.visible: false
    hoverEnabled: true

    contentItem: Text {
        renderType: Text.NativeRendering
        font.family: config.Font
        font.pointSize: config.LoginFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        text: parent.currentText
    }

    delegate: ItemDelegate {
        id: userEntry

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
    
    onActivated: print(currentText)
}

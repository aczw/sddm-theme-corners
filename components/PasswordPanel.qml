import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    focus: true
    selectByMouse: true
    echoMode: TextInput.Normal
    
    renderType: Text.NativeRendering
    font.family: config.Font
    font.pointSize: config.LoginFontSize
    horizontalAlignment: TextInput.AlignHCenter

    placeholderText: "Enter Password"
}

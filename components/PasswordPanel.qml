import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: passwordField

    height: 50
    width: 300
    horizontalAlignment: TextInput.AlignHCenter

    focus: true
    selectByMouse: true
    echoMode: TextInput.Normal
    
    renderType: Text.NativeRendering
    font.family: "Atkinson Hyperlegible"
    font.pointSize: 13

    placeholderText: "Enter Password"
}

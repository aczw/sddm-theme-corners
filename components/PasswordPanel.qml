import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: passwordField

    height: 50
    width: 300
    horizontalAlignment: TextInput.AlignHCenter
    anchors.horizontalCenter: parent.horizontalCenter

    focus: true
    selectByMouse: true
    echoMode: TextInput.Normal

    placeholderText: "Enter Password"
    renderType: Text.QtRendering
}

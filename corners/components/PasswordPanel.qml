import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: passwordField

    focus: true
    selectByMouse: true
    placeholderText: config.PassPlaceholderText
    echoMode: config.HidePassword === "true" ? TextInput.Password : TextInput.Normal
    passwordCharacter: "•"
    selectionColor: config.InputTextColor
    renderType: Text.NativeRendering
    font.family: config.FontFamily
    font.pointSize: config.FontSize
    font.bold: true
    color: config.InputTextColor
    horizontalAlignment: TextInput.AlignHCenter
    states: [
        State {
            name: "focused"
            when: passwordField.activeFocus

            PropertyChanges {
                target: passFieldBg
                color: Qt.darker(config.InputColor, 1.2)
                border.width: config.InputBorderWidth
            }

        },
        State {
            name: "hovered"
            when: passwordField.hovered

            PropertyChanges {
                target: passFieldBg
                color: Qt.darker(config.InputColor, 1.2)
            }

        }
    ]

    background: Rectangle {
        id: passFieldBg

        color: config.InputColor
        border.color: config.InputBorderColor
        border.width: 0
        radius: config.Radius
    }

    transitions: Transition {
        PropertyAnimation {
            properties: "color, border.width"
            duration: 150
        }

    }

}

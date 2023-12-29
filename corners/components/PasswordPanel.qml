import QtQuick 2.15
import QtQuick.Controls 2.15

TextField {
    id: passwordField

    focus: true
    selectByMouse: true
    echoMode: config.HidePassword === "true" ? TextInput.Password : TextInput.Normal
    passwordCharacter: "•"
    
    font {
        family: config.FontFamily
        pointSize: config.FontSize
        bold: true
    }

    placeholderText: config.PassPlaceholderText
    horizontalAlignment: TextInput.AlignHCenter

    color: config.InputTextColor
    selectionColor: config.InputTextColor
    renderType: Text.NativeRendering

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

        border {
            color: config.InputBorderColor
            width: 0
        }

        color: config.InputColor
        radius: config.Radius
    }

    transitions: Transition {
        PropertyAnimation {
            properties: "color, border.width"
            duration: 150
        }
    }
}

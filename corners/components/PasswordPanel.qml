import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: passwordField

    focus: true
    selectByMouse: true
    placeholderText: config.PassFieldBgText
    echoMode: TextInput.Password
    passwordCharacter: "•"
    passwordMaskDelay: 1000
    selectionColor: config.FieldText
    renderType: Text.NativeRendering
    font.family: config.Font
    font.pointSize: config.FontSize
    font.bold: true
    color: config.FieldText
    horizontalAlignment: TextInput.AlignHCenter
    states: [
        State {
            name: "focused"
            when: passwordField.activeFocus

            PropertyChanges {
                target: passFieldBg
                color: Qt.darker(config.FieldBackground, 1.2)
                border.width: config.FieldBorderWidth
            }

        },
        State {
            name: "hovered"
            when: passwordField.hovered

            PropertyChanges {
                target: passFieldBg
                color: Qt.darker(config.FieldBackground, 1.2)
            }

        }
    ]

    background: Rectangle {
        id: passFieldBg

        color: config.FieldBackground
        border.color: config.FieldBorderColor
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

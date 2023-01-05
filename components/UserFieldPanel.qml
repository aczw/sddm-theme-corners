import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

TextField {
    id: usernameField

    height: inputHeight
    width: inputWidth

    selectByMouse: true
    echoMode: TextInput.Normal

    renderType: Text.NativeRendering
    font.family: config.Font
    font.pointSize: config.LoginFontSize
    font.bold: true
    color: config.AccentText
    horizontalAlignment: Text.AlignHCenter

    placeholderText: "Username"
    text: userModel.lastUser

    background: Rectangle {
        id: userFieldBackground

        color: config.AccentDark
        border.color: config.AccentText
        border.width: 0
        radius: config.CornerRadius
    }

    states: [
        State {
            name: "focused"
            when: usernameField.activeFocus
            PropertyChanges {
                target: userFieldBackground
                color: Qt.darker(config.AccentDark, 1.2)
                border.width: 3
            }
        },
        State {
            name: "hovered"
            when: usernameField.hovered
            PropertyChanges {
                target: userFieldBackground
                color: Qt.darker(config.AccentDark, 1.2)
            }
        }
    ]

    transitions: Transition {
        PropertyAnimation {
            properties: "color, border.width"
            duration: 150
        }
    }
}


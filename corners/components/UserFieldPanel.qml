import QtGraphicalEffects 1.12
import QtQuick 2.12
import QtQuick.Controls 2.12

TextField {
    id: usernameField

    height: inputHeight
    width: inputWidth
    selectByMouse: true
    echoMode: TextInput.Normal
    selectionColor: config.FieldText
    renderType: Text.NativeRendering
    font.family: config.Font
    font.pointSize: config.FontSize
    font.bold: true
    color: config.FieldText
    horizontalAlignment: Text.AlignHCenter
    placeholderText: config.UserFieldBgText
    text: userModel.lastUser
    states: [
        State {
            name: "focused"
            when: usernameField.activeFocus

            PropertyChanges {
                target: userFieldBackground
                color: Qt.darker(config.FieldBackground, 1.2)
                border.width: config.FieldBorderWidth
            }

        },
        State {
            name: "hovered"
            when: usernameField.hovered

            PropertyChanges {
                target: userFieldBackground
                color: Qt.darker(config.FieldBackground, 1.2)
            }

        }
    ]

    background: Rectangle {
        id: userFieldBackground

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

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12

Item {
    property var user: "ash"
    property var password: passwordField.text
    property var session: sessionPanel.currentIndex
    property var inputHeight: Screen.height * config.LoginScale * 0.25
    property var inputWidth: Screen.width * config.LoginScale

    Column {
        spacing: 8

        width: inputWidth
        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    
        UserPanel {
            id: userPanel
        }

        PasswordPanel {
            id: passwordField

            height: inputHeight
            width: parent.width

            onAccepted: loginButton.clicked()
        }

        Button {
            id: loginButton
            
            height: inputHeight
            width: parent.width

            enabled: user != "" && password != "" ? true : false
            hoverEnabled: true
            text: "Login!!"

            contentItem: Text {
                id: buttonText

                renderType: Text.NativeRendering
                font.family: config.Font
                font.pointSize: config.LoginFontSize
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: config.AccentText
                opacity: 0.5

                text: "Login!!"
            }
        
            background: Rectangle {
                id: buttonBackground

                color: config.AccentLight
                opacity: 0.5
                radius: config.CornerRadius
            }

            states: [
                State {
                    name: "pressed"
                    when: loginButton.down
                    PropertyChanges {
                        target: buttonBackground
                        color: Qt.darker(config.AccentLight, 1.2)
                        opacity: 1
                    }
                    PropertyChanges {
                        target: buttonText
                        opacity: 1
                    }
                },
                State {
                    name: "hovered"
                    when: loginButton.hovered
                    PropertyChanges {
                        target: buttonBackground
                        color: Qt.lighter(config.AccentLight, 1.2)
                        opacity: 1
                    }
                    PropertyChanges {
                        target: buttonText
                        opacity: 1
                    }
                },
                State {
                    name: "enabled"
                    when: loginButton.enabled
                    PropertyChanges {
                        target: buttonBackground
                        color: config.AccentLight
                        opacity: 1
                    }
                    PropertyChanges {
                        target: buttonText
                        opacity: 1
                    }
                }
            ]

            transitions: Transition {
                PropertyAnimation {
                    properties: "color, opacity"
                    duration: 150
                }
            }

            onClicked: sddm.login(user, password, session)
        }
    }

    SessionPanel {
        id: sessionPanel

        height: inputHeight
        width: inputWidth
        anchors {
            bottom: parent.bottom
            left: parent.left
        }
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {}
        function onLoginFailed() {}
    } 
}

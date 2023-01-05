import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12

Column {
    property var selectedUserIndex: userList.currentIndex

    spacing: 30

    Image {
        id: avatar
        source: "/usr/share/sddm/faces/ash.face.icon"

        height: inputWidth / 1.5
        width: inputWidth / 1.5
        anchors.horizontalCenter: parent.horizontalCenter

        fillMode: Image.PreserveAspectCrop
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: mask
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: popup.open()
        }
    }

    Rectangle {
        id: mask

        height: inputWidth / 1.5
        width: inputWidth / 1.5
        radius: inputWidth / 3
        visible: false
    }

    Popup {
        id: popup

        width: inputWidth
        y: (inputWidth / 3) - padding - (inputHeight * userList.count * 0.5) - (userList.spacing * (userList.count - 1) * 0.5)
        padding: 15

        contentItem: ListView {
            id: userList

            implicitHeight: contentHeight
            spacing: 8

            model: userModel
            currentIndex: model.lastIndex
            clip: true
            
            // TODO: highlight currently selected item + make text bold
            delegate: ItemDelegate {
                id: userEntry
                
                height: inputHeight
                width: parent.width
                anchors.horizontalCenter: parent.horizontalCenter

                highlighted: parent.highlightedIndex === index
        
                contentItem: Text {
                    renderType: Text.NativeRendering
                    font.family: config.Font
                    font.pointSize: config.LoginFontSize
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: config.AccentText

                    text: model.name
                }

                background: Rectangle {
                    id: userEntryBackground

                    color: config.AccentLight
                    radius: config.CornerRadius
                }

                states: [
                    State {
                        name: "hovered"
                        when: userEntry.hovered
                        PropertyChanges {
                            target: userEntryBackground
                            color: Qt.lighter(config.AccentLight, 1.2)
                        }
                    }
                ]

                transitions: Transition {
                    PropertyAnimation {
                        property: "color"
                        duration: 150
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        userList.currentIndex = index
                        usernameField.text = userList.currentIndex
                        popup.close()
                        print(userList.currentIndex)
                    }
                }
            }
        }

        background: Rectangle {
            radius: config.CornerRadius * 1.8
            color: config.AccentText
        }

        enter: Transition {
            NumberAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 150
            }
        }

        exit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 150
            }
        }
    }

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
}



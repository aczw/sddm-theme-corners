import QtQuick 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.12
import QtQml.Models 2.12

Column {
    property var username: usernameField.text

    spacing: 30

    DelegateModel {
        id: delegateModel

        model: userModel

        delegate: ItemDelegate {
            id: userEntry
                
            height: inputHeight
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter

            contentItem: Text {
                renderType: Text.NativeRendering
                font.family: config.Font
                font.pointSize: config.LoginFontSize
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: config.AccentText

                text: name
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
                    usernameField.text = delegateModel.items.get(index).model.name
                    userPicture.source = delegateModel.items.get(index).model.icon
                    popup.close()
                }
            }
        }
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

            model: delegateModel

            currentIndex: userModel.lastIndex
            clip: true
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

    Item {
        width: inputWidth
        implicitHeight: pictureBorder.height

        Rectangle {
            id: pictureBorder

            anchors.centerIn: userPicture
            height: inputWidth / 1.5 + (border.width * 2)
            width: inputWidth / 1.5 + (border.width * 2)
            radius: height / 2
            border.width: config.LoginUserPictureBorderWidth
            border.color: config.AccentText
            color: config.AccentLight

            MouseArea {
                id: roundMouseArea

                anchors.fill: parent
                hoverEnabled: true

                onClicked: popup.open()
                onHoveredChanged: {
                    if (containsMouse) {
                        pictureBorder.state = "hovered"
                    } else {
                        pictureBorder.state = "unhovered"
                    }
                }
                onPressedChanged: {
                    if (containsPress) {
                        pictureBorder.state = "pressed"
                    } else if (containsMouse) {
                        pictureBorder.state = "hovered"
                    } else {
                        pictureBorder.state = "unhovered"
                    }
                }
            }

            states: [
                State {
                    name: "pressed"
                    PropertyChanges {
                        target: pictureBorder
                        border.color: Qt.darker(config.AccentText, 1.5)
                        color: Qt.darker(config.AccentLight, 1.5)
                    }
                },
                State {
                    name: "hovered"
                    PropertyChanges {
                        target: pictureBorder
                        border.color: Qt.darker(config.AccentText, 1.2)
                        color: Qt.darker(config.AccentLight, 1.2)
                    }
                },
                State {
                    name: "unhovered"
                    PropertyChanges {
                        target: pictureBorder
                        border.color: config.AccentText
                        color: config.AccentLight
                    }
                }
            ]

transitions: Transition {
            PropertyAnimation {
                properties: "border.color, color"
                duration: 150
            }
        }

        }

        Image {
            id: userPicture
            source: ""

            height: inputWidth / 1.5
            width: inputWidth / 1.5
            anchors.horizontalCenter: parent.horizontalCenter

            fillMode: Image.PreserveAspectCrop
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: mask
            }

            Rectangle {
                id: mask

                anchors.fill: parent
                radius: inputWidth / 3
                visible: false
            }
        }
        
            }

    UserFieldPanel {
        id: usernameField

        height: inputHeight
        width: inputWidth
    }

    Component.onCompleted: userPicture.source = delegateModel.items.get(userList.currentIndex).model.icon
}

import QtQml.Models 2.15
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    property var session: sessionList.currentIndex

    implicitHeight: sessionButton.height
    implicitWidth: sessionButton.width

    DelegateModel {
        id: sessionWrapper

        model: sessionModel

        delegate: ItemDelegate {
            id: sessionEntry

            height: inputHeight
            width: parent.width
            highlighted: sessionList.currentIndex == index
            states: [
                State {
                    name: "hovered"
                    when: sessionEntry.hovered

                    PropertyChanges {
                        target: sessionEntryBg
                        color: highlighted ? Qt.darker(config.PopupHighlight, 1.2) : Qt.darker(config.PopupBackground, 1.2)
                    }

                }
            ]

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    sessionList.currentIndex = index;
                    sessionPopup.close();
                }
            }

            contentItem: Text {
                renderType: Text.NativeRendering
                font.family: config.Font
                font.pointSize: config.FontSize
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: highlighted ? config.PopupHighlightText : config.PopupHighlight
                text: name
            }

            background: Rectangle {
                id: sessionEntryBg

                color: highlighted ? config.PopupHighlight : config.PopupBackground
                radius: config.Radius
            }

            transitions: Transition {
                PropertyAnimation {
                    property: "color"
                    duration: 150
                }

            }

        }

    }

    Button {
        id: sessionButton

        height: inputHeight
        width: inputHeight
        hoverEnabled: true
        icon.source: Qt.resolvedUrl("../icons/settings.svg")
        icon.height: height * 0.6
        icon.width: width * 0.6
        icon.color: config.SessionIconColor
        onClicked: {
            sessionPopup.visible ? sessionPopup.close() : sessionPopup.open();
            sessionButton.state = "pressed";
        }
        states: [
            State {
                name: "pressed"
                when: sessionButton.down

                PropertyChanges {
                    target: sessionButtonBg
                    color: Qt.darker(config.SessionButtonBg, 1.2)
                }

            },
            State {
                name: "hovered"
                when: sessionButton.hovered

                PropertyChanges {
                    target: sessionButtonBg
                    color: Qt.darker(config.SessionButtonBg, 1.2)
                }

            },
            State {
                name: "selection"
                when: sessionPopup.visible

                PropertyChanges {
                    target: sessionButtonBg
                    color: Qt.darker(config.SessionButtonBg, 1.2)
                }

            }
        ]

        background: Rectangle {
            id: sessionButtonBg

            color: config.SessionButtonBg
            radius: config.Radius
        }

        transitions: Transition {
            PropertyAnimation {
                properties: "color"
                duration: 150
            }

        }

    }

    Popup {
        id: sessionPopup

        width: inputWidth + padding * 2
        x: sessionButton.width + sessionList.spacing
        y: -(contentHeight + padding * 2) + sessionButton.height
        padding: 15

        background: Rectangle {
            radius: config.Radius * 1.8
            color: config.PopupBackground
        }

        contentItem: ListView {
            id: sessionList

            implicitHeight: contentHeight
            spacing: 8
            model: sessionWrapper
            currentIndex: sessionModel.lastIndex
            clip: true
        }

        enter: Transition {
            ParallelAnimation {
                NumberAnimation {
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 400
                    easing.type: Easing.OutExpo
                }

                NumberAnimation {
                    property: "x"
                    from: sessionPopup.x - (inputWidth * 0.1)
                    to: sessionPopup.x
                    duration: 500
                    easing.type: Easing.OutExpo
                }

            }

        }

        exit: Transition {
            NumberAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 300
                easing.type: Easing.OutExpo
            }

        }

    }

}

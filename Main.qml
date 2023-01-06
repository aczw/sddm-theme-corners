import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "components"

Item {
    id: root

    height: Screen.height
    width: Screen.width
    
    Image {
        id: background
        
        anchors.fill: parent
        height: parent.height
        width: parent.width
        fillMode: Image.PreserveAspectCrop

        source: config.Background

        asynchronous: false
        cache: true
        mipmap: true
        clip: true
    }

    Item {
        id: contentPanel

        anchors {
            fill: parent
            topMargin: config.Padding
            rightMargin: config.Padding
            bottomMargin:config.Padding
            leftMargin: config.Padding
        }

        DateTimePanel {
            id: dateTimePanel

            anchors {
                top: parent.top
                right: parent.right
            }
        }
        
        LoginPanel {
            id: loginPanel
            
            anchors.fill: parent
        }
    }

    Rectangle {
        id: loginAnim

        radius: parent.width / 2
        anchors.centerIn: root

        color: "black"
        opacity: 1

        NumberAnimation {
            id: coverScreen

            target: loginAnim
            properties: "height, width"
            from: 0
            to: root.width * 2
            duration: 1000
            easing.type: Easing.InExpo
        }
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {
            coverScreen.start()
        }
        function onLoginFailed() {}
    }
}

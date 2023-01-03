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

        source: "backgrounds/69.jpg"

        asynchronous: true
        cache: true
        mipmap: true
        clip: true
    }

    Item {
        id: contentPanel

        anchors {
            fill: parent
            topMargin: 50
            rightMargin: 50
            bottomMargin: 50
            leftMargin: 50
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

            anchors {
                bottom: parent.bottom
                left: parent.left
            }
        }
    }
}

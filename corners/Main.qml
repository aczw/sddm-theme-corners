import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects

import "./components"

Rectangle {
    id: root

    height: Screen.height
    width: Screen.width

    Image {
        id: backgroundImage

        anchors { fill: parent }

        source: config.BgSource
        fillMode: Image.PreserveAspectCrop
        clip: true
    }

   ShaderEffectSource {
        id: blurMask

        sourceItem: backgroundImage
        width: parent.width
        height: parent.height
        anchors.centerIn: backgroundImage
        sourceRect: Qt.rect(x,y,width,height)
        visible: config.Blur == "true" ? true : false
    }

    GaussianBlur {
        id: blur

        height: parent.height
        width: parent.width
        source: backgroundImage
        radius: config.BlurRadius
        samples: config.BlurRadius * 2 + 1
        cached: true
        anchors.centerIn: parent
        visible: config.Blur == "true" ? true : false
    }

    Item {
        anchors {
            fill: parent
            margins: config.Padding
        }

        DateTimePanel {
            anchors {
                top: parent.top
                right: parent.right
            }
        }

        LoginPanel {
            anchors { fill: parent }
        }
    }
}

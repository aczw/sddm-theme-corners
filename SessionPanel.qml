import QtQuick 2.12
import QtQuick.Controls 2.12

ComboBox {
    height: 50
    width: 300

    model: sessionModel
    currentIndex: model.lastIndex
    textRole: "name"
    editable: true

    delegate: ItemDelegate {
        id: sessionEntry

        width: parent.width
        anchors.horizontalCenter: parent.horizontalCenter
        
        contentItem: Text {
            text: model.name
        }
        
        /*
        highlighted: parent.highlightedIndex === index
        background: Rectangle {
            color: parent.highlightedIndex === index ? "blue" : "white"
        }
        */
    }

    indicator.visible: true

    /*
    contentItem: Text {
        id: displayedItem

        verticalAlignment: Text.AlignVCenter
        anchors.left: parent.left

        text: "Session: " + parent.currentText
        font.family: "Cartograph CF"
        font.pointSize: 12
        color: "black"
    }

    background: Rectangle {
        height: 50
        width: displayedItem.implicitWidth
        anchors.bottom: parent.top
        anchors.left: parent.left

        border.width: parent.visualFocus ? 1 : 0
        border.color: "black"
        color: "white"
    }
    */

    onActivated: print(currentIndex)
}

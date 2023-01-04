import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    property var user: userPanel.currentText
    property var password: passwordField.text
    property var session: sessionPanel.currentIndex

    Column {
        spacing: 10

        anchors {
            bottom: parent.bottom
            right: parent.right
        }
    
        UserPanel {
            id: userPanel

                    }

        PasswordPanel {
            id: passwordField

            

            onAccepted: loginButton.clicked()
        }

        Button {
            id: loginButton
            
            height: 50
            width: parent.width
                
            text: "Login!!"

            enabled: user != "" && password != "" ? true : false

            contentItem: Text {
                renderType: Text.NativeRendering
                font.family: config.Font
                font.pointSize: config.LoginFontSize
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "white"

                text: "Login!!"
            }
        
            background: Rectangle {
                color: "black"
            }

            onClicked: sddm.login(user, password, session)
        }
    }

    SessionPanel {
        id: sessionPanel

        

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

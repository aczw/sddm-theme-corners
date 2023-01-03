import QtQuick 2.12
import QtQuick.Controls 2.12

Column {
    property var user: userPanel.currentText
    property var password: passwordField.text
    property var session: sessionPanel.currentIndex

    spacing: 10

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
            text: parent.text
            color: "white"
        }
        
        background: Rectangle {
            color: "blue"
        }

        onClicked: sddm.login(user, password, session)
    }

    SessionPanel {
        id: sessionPanel
    }

    Connections {
        target: sddm
        function onLoginSucceeded() {}
        function onLoginFailed() {}
    }
}



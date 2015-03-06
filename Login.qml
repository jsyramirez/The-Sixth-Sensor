import QtQuick 2.4
<<<<<<< HEAD
import QtQuick.Dialogs 1.2

Rectangle {
    width: 500
    height: 300
    color:"lightgray"
    radius: 0
    border.width: 0
    visible: true
    anchors.horizontalCenter: parent.horizontalCenter

    TextEdit {
        id: textEdit1
        x: 210
        y: 97
        width: 80
        height: 20
        text: qsTr("")
        font.pixelSize: 12
    }

    TextEdit {
        id: textEdit2
        x: 210
        y: 140
        width: 80
        height: 20
        text: qsTr("")
        font.pixelSize: 12
    }

    Text {
        id: text1
        x: 147
        y: 100
        text: qsTr("Username")
        font.pixelSize: 12
    }

    Text {
        id: text2
        x: 147
        y: 143
        text: qsTr("Password")
        font.pixelSize: 12
    }

    Button1 {
        id: but1
        x: 165
        y: 175
        width: 135
        height: 42
        z: 100
        butText: "Log in"
        visible: true
        MouseArea.onClicked: messageDialog.show(qsTr("Login Successful"));
    }

    MessageDialog {
        id: messageDialog2
        title: qsTr("Dialog Window")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
=======
import QtQuick.Controls 1.3

Rectangle {
    id: loginPageContainer
    width: 1000
    height: 800
    color: "darkgray"
    state: "visible"
    opacity: 1
    anchors.horizontalCenter: parent.horizontalCenter

    signal inputEntered(string u, string p)
    property alias stateStatus: loginPageContainer.state
    property alias loginMouseArea: loginButton.buttonMouseArea
    property alias usernameTemplate: usernameInput.text
    property alias passwordTemplate: passwordInput.text


    //States used for animation to move between GUI pages
    states: [
        State { name: "visible";
            PropertyChanges {target: loginPageContainer; opacity: 1.0}
        },
        State { name: "notVisible";
            PropertyChanges { target: loginPageContainer; opacity: 0.0}
        }
    ]
    transitions: [
        Transition { from: "visible"; to: "notVisible"
            NumberAnimation { target: loginPageContainer; property: "opacity"; duration: 200}},
        Transition { from: "notVisible"; to: "visible"
            NumberAnimation { target: loginPageContainer; property: "opacity"; duration: 200}}
    ]
    Image {
        id: flirLogo
        source: "flir.png"
        width: 80; height: 120
        anchors.top: parent.top
        anchors.topMargin: 150
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.Stretch
        smooth: true
    }
    Grid {
        id: inputFields
        columns: 2; rows: 2
        width: 400
        height: 40
        spacing: 5
        anchors.top: flirLogo.bottom; anchors.topMargin: 35
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: usernameText
            width: 75
            height: 20
            text: "Username:"
            font.pixelSize: 12
        }
        Rectangle {
            id: usernameRect
            color: "white"
            width: 300
            height: 20
            TextInput {
                id: usernameInput
                anchors.fill: parent
                text: ""
                cursorVisible: true
                maximumLength: 20
                selectByMouse: true
            }
        }
        Text {
            id: passwordText
            width: 75
            height: 20
            text: "Password:"
            font.pixelSize: 12
        }
        Rectangle {
            id: pswRect
            color: "white"
            width: 300
            height: 20
            TextInput {
                id: passwordInput
                echoMode: TextInput.Password
                text: ""
                anchors.fill: parent
                maximumLength: 20
                selectByMouse: true

            }
        }
    }
    ButtonGeneral {
        id: loginButton
        width: 100
        height: 50
        anchors.top: inputFields.bottom
        anchors.topMargin: 25
        anchors.right: inputFields.right
        buttonText: "Login"
        buttonMouseArea {
            onClicked: {
                inputEntered(usernameInput.text, passwordInput.text);
            }
        }
    }
}

>>>>>>> origin/GUI

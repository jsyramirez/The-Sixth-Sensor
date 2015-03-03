import QtQuick 2.4
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

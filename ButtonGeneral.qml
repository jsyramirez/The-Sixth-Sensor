import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: buttonGeneral
    property alias buttonText: bText.text
    property alias buttonMouseArea: buttonArea
    property alias buttonVisible: buttonGeneral.visible

    width: 100
    height: 50
    color: "lightsteelblue"

    Text {
        id: bText
        text: "Add"
        anchors.centerIn: parent
        font.pointSize: 12; font.bold: true; color: "white"
    }
    MouseArea {
        id: buttonArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onPressed: {
            parent.color =  "darkcyan"
        }
        onReleased: {
            parent.color = "lightsteelblue"
        }
    }
}


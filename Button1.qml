import QtQuick 2.4

Rectangle {
    property alias butText: buttonText.text
    property alias butArea: buttonArea
    width: 100
    height: 30
    color: "blue"
    radius: 12
    visible: true

    MouseArea {
        id: buttonArea
        x: 0
        y: -30
        width: 100
        height: 30
        anchors.leftMargin: 51
        anchors.topMargin: 0
        anchors.fill: parent
    }

    Text {
        id: buttonText
        x: 26
        y: 8
        text: "Password"
        color: "white"
        font.pixelSize: 12
    }
}

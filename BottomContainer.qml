import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: buttonContainer
    width: parent.width
    color: "darkgray"
    anchors.bottom: parent.bottom
    state: "notVisible"
    opacity: 0
    property alias stateStatus: buttonContainer.state
    property alias button1Text: button1.buttonText
    property alias button2Text: button2.buttonText
    property alias button3Text: button3.buttonText
    property alias buttonRvis: returnButton.visible
    property alias button1MouseArea: button1.buttonMouseArea
    property alias button2MouseArea: button2.buttonMouseArea
    property alias button3MouseArea: button3.buttonMouseArea
    property alias buttonRMouseArea: returnButton.buttonMouseArea

    //States used for animation to move between GUI pages
    states: [
        State { name: "visible";
            PropertyChanges {target: buttonContainer; opacity: 1.0}
        },
        State { name: "notVisible";
            PropertyChanges { target: buttonContainer; opacity: 0.0}
        }
    ]
    transitions: [
        Transition { from: "visible"; to: "notVisible"
            NumberAnimation { target: buttonContainer; property: "opacity"; duration: 200}},
        Transition { from: "notVisible"; to: "visible"
            NumberAnimation { target: buttonContainer; property: "opacity"; duration: 200}}
    ]


    Grid{
        rows: 1
        columns: 3
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 15
        spacing: 5
        ButtonGeneral{
            id: button1
            buttonText: "logout"
            buttonMouseArea {}
        }
        ButtonGeneral{
            id: button2
            buttonText: "add"
            buttonMouseArea {}
        }
        ButtonGeneral{
            id: button3
            buttonText: "continue"
            buttonMouseArea {}
        }
    }
    ButtonGeneral {
        id: returnButton
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 15
        buttonText: "return"
        buttonVisible: false
        buttonMouseArea {}
    }
}


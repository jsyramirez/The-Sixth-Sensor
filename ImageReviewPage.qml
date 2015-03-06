import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: imageReviewer
    width: 1000
    height: 800
    color: "gray"
    opacity: 0
    anchors.horizontalCenter: parent.horizontalCenter
    state: "notVisible"
    property alias stateStatus: imageReviewer.state

    states: [
        State { name: "visible";
            PropertyChanges {target: imageReviewer; opacity: 1.0}
        },
        State { name: "notVisible";
            PropertyChanges { target: imageReviewer; opacity: 0.0}
        }
    ]
    transitions: [
        Transition { from: "visible"; to: "notVisible"
            NumberAnimation { target: imageReviewer; property: "opacity"; duration: 200}},
        Transition { from: "notVisible"; to: "visible"
            NumberAnimation { target: imageReviewer; property: "opacity"; duration: 200}}
    ]

    //Holds the thumbnails of the images in the stack
    Rectangle {
        id: imageMenu
        width: 220
        height: 525
        anchors.left: parent.left
        color: "black"; opacity: .75
        border.width: 10; border.color: "lightsteelblue";
    }

    //This needs to link w/ IRFranView code
    Rectangle {
        id: imageContainer
        width: 750; height: 525
        anchors.right: parent.right
        color: "transparent"
        border.width: 10; border.color: "lightsteelblue"

    }
    //Holds the tools availble for the user to annotate/analyze the image
    Rectangle {
        id: imageToolBox
        width: 1000; height: 100
        anchors.top: imageContainer.bottom; anchors.topMargin: 25;
        anchors.right: parent.right; opacity: .75
        color: "black"; border.width: 10; border.color: "lightsteelblue"
    }
}

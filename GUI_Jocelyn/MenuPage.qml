import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    width: 1000
    height: 800
    color: "darkgray"
    anchors.horizontalCenter: parent.horizontalCenter

    property alias menuModel: imageStackModel
    //This grid holds the tabs of the Image Stack Menu
    Grid {
        id: imageStackGrid
        width: 1000
        height: 30
        rows: 1; columns: 3
        spacing: 2
        anchors.top: parent.top
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.Center
        Rectangle {
            color: "lightsteelblue"; width: 260; height: 30
            Text{
                anchors.centerIn: parent
                text: "Image Stack"
                font.pointSize: 12; font.bold: true; color: "white"
            }
        }
        Rectangle {
            color: "lightsteelblue"; width: 225; height: 30
            Text{
                anchors.centerIn: parent
                text: "Upload Date"
                font.pointSize: 12; font.bold: true; color: "white"
            }
        }
        Rectangle { color: "lightsteelblue"; width: 510; height: 30 }
    }

    Rectangle{
        id: imageStackContainer
        anchors.horizontalCenter: parent.Center
        anchors.top: imageStackGrid.bottom
        width: 1000; height: 600
        color: "gray"
        //This will set the mold for what data can be placed in the menu
        ListModel {
            id: imageStackModel
            ListElement{
                stackName: "Image Stack 1"
                uploadDate: "02-07-2015"
                stackComments: "None."
            }
            ListElement{
                stackName: "Image Stack 2"
                uploadDate: "02-07-2015"
                stackComments: "None."
            }
        }
        Component {
            id: imageStackDelegate
            Grid {
                id: imageStackDelegateItem
                rows: 1
                columns: 3
                spacing: 10
                Rectangle {
                    color: "transparent"
                    width: 240
                    height: 75
                    Text {
                        id: imageStackInfo1t
                        anchors.centerIn: parent
                        text: '  '+stackName
                        font.pointSize: 12; font.bold: true; color: "white"
                    }
                }
                Rectangle {
                    color: "transparent"
                    width: 215
                    height: 75
                    Text {
                        id: imageStackInfo2
                        anchors.centerIn: parent
                        text: uploadDate
                        font.pointSize: 12; font.bold: true; color: "white"
                    }
                }
                Rectangle {
                    color: "transparent"
                    width: 495
                    height: 75
                    Text {
                        id: imageStackInfo3
                        anchors.centerIn: parent
                        text: stackComments
                        font.pointSize: 12; font.bold: true; color: "white"
                    }
                }
            }
        }
        //This sets up the actual display of the menu
        ScrollView {
            id: imageStackViewScroll
            anchors.fill: parent
            focus: true
            highlightOnFocus: true
            flickableItem.interactive: true
            //Display the image stacks
            ListView {
                id: imageStackView
                anchors.fill: parent
                anchors.margins: 15; spacing: 5
                model: imageStackModel
                delegate: imageStackDelegate
                highlight: Rectangle { id: barParent; color: "lightsteelblue"; radius: 5 }
                focus: true
                keyNavigationWraps: true
                MouseArea {
                    anchors.fill: parent;
                    acceptedButtons: Qt.LeftButton
                    hoverEnabled: true
                    onClicked: {
                        imageStackView.currentIndex = imageStackView.indexAt(mouseX, mouseY)
                    }
                }
            }
        }
    }

}

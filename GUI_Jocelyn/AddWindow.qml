import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Dialog {
    id: addWindowDialog
    signal inputEntered (string name, string date, string comments)
    width: 500
    height: 400
    title: "New Image Stack"
    contentItem: Rectangle {
        color: "gray"
        anchors.fill: parent
        Grid {
            columns: 2
            rows: 4
            spacing: 25
            Rectangle{color: "gray"; height: 15; width: 100}
            Rectangle{color: "gray"; height: 15; width: 100}
            Text {
                width: 100
                height: 20
                text: "Image Stack Name:"
                font.pointSize: 12
                id: imageStackNameText
            }
            Rectangle {
                color: "white"
                width: 300
                height: 20
                TextInput {
                    id: imageStackNameInput
                    anchors.fill: parent
                    text: "write name"
                    cursorVisible: true
                    maximumLength: 25
                    selectByMouse: true
                }
            }
            Text {
                id: imageStackCommentsText
                width: 100
                height: 100
                text: "Comments:"
                font.pointSize: 12
            }
            Rectangle {
                color: "white"
                width: 300
                height: 100
                TextInput {
                    id: imageStackCommentsInput
                    text: "write comments"
                    anchors.fill: parent
                    cursorVisible: true
                    maximumLength: 150
                    selectByMouse: true
                }
            }
            ButtonGeneral {
                buttonText: "done"
                buttonMouseArea {
                    onClicked: {
                        var stackName_input = imageStackNameInput.displayText
                        var comments_input = imageStackCommentsInput.displayText
                        var upload_date = Qt.formatDateTime(new Date(), "MM-dd-yyyy")
                        addWindowDialog.visible = false
                        inputEntered(stackName_input, upload_date, comments_input)
                    }
                }
            }
            ButtonGeneral {
                buttonText: "Cancel"
                buttonMouseArea {
                    onClicked: {
                        addWindowDialog.visible = false
                    }
                }
            }
        }
    }
}


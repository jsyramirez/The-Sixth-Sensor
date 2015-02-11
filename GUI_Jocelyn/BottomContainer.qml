import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    width: parent.width
    color: "darkgray"
    anchors.bottom: parent.bottom
    signal imageStackInputEntered (string name, string date, string comments)
    Grid{
        rows: 1
        columns: 3
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 15
        spacing: 5
        ButtonGeneral{
            id: logoutButton
            buttonText: "logout"
            buttonMouseArea {
                onClicked: {
                    logoutPopUp.visible = "true"
                }
            }
        }
        ButtonGeneral{
            id: addButton
            buttonText: "add"
            buttonMouseArea {
                onClicked: {
                    addWindowPopUp.visible = "true"
                }
            }
        }
        ButtonGeneral{
            id: continueButton
            buttonText: "continue"
        }
    }
    LogoutPopUp {
        id: logoutPopUp
    }
    AddWindow {
        id: addWindowPopUp
        onInputEntered:{
           imageStackInputEntered(name, date, comments)
        }
    }
}


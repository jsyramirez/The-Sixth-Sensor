import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.1

//Set up the pop up window for an incorrect login

MessageDialog {
    id: loginErrorWindow
    title: "Login Error"
    icon: StandardIcon.Critical
    text: "Invalid Login"
    standardButtons: StandardButton.Ok
    onAccepted: {
        loginErrorWindow.visible = false
    }
}

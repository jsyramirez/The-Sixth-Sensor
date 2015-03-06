import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.1

//Set up the pop up window for logging out

MessageDialog {
    id: logoutWindow
    signal logoutConfirmed ()
    title: "Confirm Logout"
    icon: StandardIcon.Question
    text: "Are you sure you want to logout"
    standardButtons: StandardButton.Yes | StandardButton.No
    onYes: {
        logoutWindow.visible = false
        logoutConfirmed()
    }
    onNo: logoutWindow.visible = false
}

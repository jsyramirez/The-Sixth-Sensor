import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: mainApplicationWindow
    title: qsTr("The Sixth Sensor")
    width:  1200
    height: 800
    visible: true
    color: "darkgray"

    //Container for the Login Page
    Login {
        id: loginPage
        opacity: 1
        stateStatus: "visible"
        loginMouseArea {
            onClicked: {
                loginPage.stateStatus = "notVisible"
                imageStackMenuPage.stateStatus = "visible"
                imageStackMenuPage.z =  0
                bottomButtonContainer.stateStatus = "visible"
                usernameTemplate = ""; passwordTemplate = ""
            }
        }
    }
    //Container for the Image Stack Menu
    MenuPage {
        id: imageStackMenuPage
        opacity: 0
        z: -10000
    }
    ImageReviewPage {
        id: imageReviewPage
        opacity: 0
    }
    //Container for the bottom buttons
    BottomContainer{
        id: bottomButtonContainer
        height: 100; opacity: 0
        stateStatus: "notVisible"
        button1Text: "logout"
        button1MouseArea {
            onClicked: {
               if (button1Text == "logout"){logoutPopUp.visible = true}
            }
        }
        button2Text: "add"
        button2MouseArea {
            onClicked: {
               if (button2Text == "add"){addWindowPopUp.visible = true}
            }
        }
        button3Text: "continue"
        button3MouseArea {
            onClicked: {
                if (button2Text == "add" && button3Text == "continue"){
                    button2Text = "save"
                    button3Text = "capture"
                    buttonRvis = true
                    imageStackMenuPage.stateStatus = "notVisible"
                    imageReviewPage.stateStatus = "visible"
                }
            }
        }
        buttonRMouseArea {
            onClicked: {
                bottomButtonContainer.button2Text = "add"
                bottomButtonContainer.button3Text = "continue"
                bottomButtonContainer.buttonRvis = false
                imageStackMenuPage.stateStatus = "visible"
                imageReviewPage.stateStatus = "notVisible"
            }
        }
    }
    //Container for the logout pop up
    LogoutPopUp {
        id: logoutPopUp
        onLogoutConfirmed: {
            imageStackMenuPage.stateStatus = "notVisible"
            imageStackMenuPage.z =  -1000
            bottomButtonContainer.stateStatus = "notVisible"
            loginPage.stateStatus = "visible"
            imageReviewPage.stateStatus = "notVisible"
            bottomButtonContainer.button2Text = "add"
            bottomButtonContainer.button3Text = "continue"
            bottomButtonContainer.buttonRvis = false
        }
    }
    //Container for the add pop up
    AddWindow {
        id: addWindowPopUp
        onInputEntered:{
            imageStackMenuPage.menuModel.append(
                           {stackName: name, uploadDate: date, stackComments: comments})
            nameTextTemplate = "Image stack name"
            commentsTextTemplate = "Write image stack comments"
        }
    }
}

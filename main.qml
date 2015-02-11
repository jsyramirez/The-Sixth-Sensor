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
    signal placeInput(string name, string date, string comments)

    MenuPage {
        id: imageStackMenuPage       
    }
    BottomContainer{
        id: bottomButtonContainer
        height: 100
        onImageStackInputEntered:{
            imageStackMenuPage.menuModel.append(
                           {stackName: name, uploadDate: date, stackComments: comments})
        }
    }
}

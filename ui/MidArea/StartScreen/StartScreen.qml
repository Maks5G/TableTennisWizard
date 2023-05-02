import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../MidArea"

Page {
    id: mainPage
    anchors.fill: parent
    background: Rectangle{color: lightColor}
    property real relativeMainTextHeight: 22.375 // for proper scaling
    property real relativeSecondTextHeight: 51.14// for proper scaling
    property real relativeImgWidth: 8.95// for proper scaling

    ScrollView{
        id: scrlView
        anchors.fill: parent
        contentWidth: 1790
        contentHeight: 1080
        clip: true
        Text {
            id: mainText
            text: qsTr("Hello!") + mytrans.emptyString
            font.family: "ScriptS"
            font.pointSize: 80
            color: textColor
            anchors.bottom: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

        }
        Text {
            id: secondText
            text: qsTr("Welcome to Table Tennis Wizard!!!") + mytrans.emptyString + "<br>" +
                  qsTr("Click on the tabbar to start") + mytrans.emptyString
            font.family: "ScriptS"
            font.pointSize: 35
            color: textColor
            anchors.top: mainText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
        //arrow to help user start using program
        Image {
            id: img
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: 150
            anchors.leftMargin: 50
            source: "qrc:/ui/assets/arrow.png"
            width: 200
            height: 200
        }
    }

    MidZoom {
        id: zoom
        spacing: 10
        mouseAreaIn.onClicked: {
            img.width *= 1.1
            img.height *= 1.1
            scrlView.contentHeight *= 1.1
        }
        mouseAreaOut.onClicked: {
            img.width /= 1.1
            img.height /= 1.1
            scrlView.contentHeight /= 1.1
        }
    }

    //without this handler I have issues with ScrollView in MidArea qml files
    onWidthChanged: {
        if(scrlView.contentWidth <= mainPage.width || scrlView.contentHeight <= mainPage.height){
            scrlView.contentWidth = mainPage.width * 1.1
            scrlView.contentHeight = mainPage.height * 1.1
            mainText.font.pointSize = mainPage.width / relativeMainTextHeight
            secondText.font.pointSize = mainPage.width / relativeSecondTextHeight
            img.width = mainPage.width / relativeImgWidth
            img.height = img.width
        }
        zoom.mouseAreaOut.visible = true;
    }
}

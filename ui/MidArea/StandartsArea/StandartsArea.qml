import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import NeloAngelo 1.0
import "../"
import "../../TabBar"

Page{
    property real relativeMainTextHeight: 35.8 // for proper scaling
    property real relativeSecondTextHeight: 89.5 // for proper scaling
    property real relativeImgWidth: 1.12 // for proper scaling

    //proper scaling when tab button changes
    function tabChanged(){
        mainText.font.pointSize = mainPage.width / relativeMainTextHeight * 0.8
        secondText.font.pointSize = mainPage.width / relativeSecondTextHeight * 0.8
        img.width = mainPage.width / relativeImgWidth * 0.8
        img.height = img.width * 0.5625
        scrlView.contentHeight = (img.height + mainText.height + secondText.height) + 250
        scrlView.contentWidth = secondText.width * 1.5
    }

    id: mainPage
    anchors.fill: parent
    background: Rectangle{color: lightColor}
    header: Rectangle {
        id: topRect
        color: mediumColor
        anchors {
            top: parent.top
            right: parent.right
            left: parent.left
        }
        height: 65

        ListModel{
            id: lModel
            ListElement {title: qsTr("Table");}
            ListElement {title: qsTr("Room");}
            ListElement {title: qsTr("Racket");}
            ListElement {title: qsTr("Ball");}
        }

        BallParticles{
            id: whiteBalls
            anchors{
                left: cmbx.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            img.source: "qrc:/ui/assets/white-ball.png"
            direct.angleVariation: 0
            emitter.lifeSpan: 10000
            emitter.emitRate: 1
            gravity.enabled: false
        }

        BallParticles{
            id: orangeBalls
            anchors{
                left: cmbx.right
                right: parent.right
                top: parent.top
                bottom: parent.bottom
            }
            img.source: "qrc:/ui/assets/orange-ball.png"
            direct.angleVariation: 0
            emitter.lifeSpan: 10000
            emitter.emitRate: 1
            gravity.enabled: false
        }
        //choosing a chapter
        ComboBox{
            id: cmbx
            textRole: "title"
            x: 10
            width: 100
            model: lModel
            anchors.verticalCenter: parent.verticalCenter

            FileIO{
                id: myFile
                onError: console.log(msg)
            }

            onCurrentTextChanged: {
                mainText.text = qsTr(currentIndex + 1 + " - " + currentText);
                img.source = "StandartsAssets/" + currentText + ".jpg";
                myFile.setSource(":/ui/MidArea/StandartsArea/StandartsTexts/" + currentText + ".txt"); // FileIO .cpp and .h are not in this directory
                secondText.text = qsTr(myFile.read());

                scrlView.contentHeight = (img.height + mainText.height + secondText.height) + 250
                scrlView.contentWidth = secondText.width * 1.5
            }
        }
    }

    ScrollView{
        id: scrlView
        anchors.fill: parent
        clip: true
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        contentHeight: (img.height + mainText.height + secondText.height) + 250
        contentWidth: secondText.width * 1.5

        Image {
            id: img;
            anchors.top: mainText.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 50
            width: 1600
            height: 900
        }

        Text{
            id: mainText
            color: textColor
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.margins: 100
            font{
                pointSize: 50
                family: "Impact"
            }
        }

        Text {
            id: secondText
            color: textColor
            anchors.left: img.left
            anchors.top: img.bottom
            anchors.topMargin: 50
            font.family: "Berlin Sans FB Demi"
            font.pointSize: 20
            width: img.width
        }
    }

    MidZoom{
        id: zoom
        spacing: 10
        mouseAreaIn.onClicked: {
            img.width *= 1.1
            img.height *= 1.1
            scrlView.contentHeight = (img.height + mainText.height + secondText.height) + 250
            scrlView.contentWidth = secondText.width * 1.5
        }
        mouseAreaOut.onClicked: {
            img.width /= 1.1
            img.height /= 1.1
            scrlView.contentHeight = (img.height + mainText.height + secondText.height) + 250
            scrlView.contentWidth = secondText.width * 1.5
        }
    }

    //without this handler I have issues with ScrollView in MidArea qml files
    onWidthChanged: {
        if(scrlView.contentWidth <= mainPage.width || scrlView.contentHeight <= mainPage.height){
            mainText.font.pointSize = mainPage.width / relativeMainTextHeight * 0.8
            secondText.font.pointSize = mainPage.width / relativeSecondTextHeight * 0.8
            img.width = mainPage.width / relativeImgWidth * 0.8
            img.height = img.width * 0.5625
            scrlView.contentHeight = (img.height + mainText.height + secondText.height) + 250
            scrlView.contentWidth = secondText.width * 1.5
        }
        zoom.mouseAreaOut.visible = true;
    }

}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../TabBar"

Row{
    property alias mouseAreaOut: mouseAreaOut
    property alias mouseAreaIn: mouseAreaIn

    id: zoom
    anchors {left: parent.left; bottom: parent.bottom; leftMargin: 10; bottomMargin: 10}
    Rectangle {
        id: zoomIn
        height: 50; width: 50;
        color: !mouseAreaIn.visible ? activeFocusColor : mouseAreaIn.containsPress ? darkColor : mediumColor // activeFocusColor is used in MyTabs
        radius: 10
        Image {
            id: zoomInIcon
            anchors.fill: parent
            scale: 0.8
            source: "StartScreen/StartScreenAssets/zoom-in.png"
        }
        MouseArea {
            id: mouseAreaIn
            anchors.fill: parent
            onClicked: {
                scrlView.contentWidth *= 1.1
                mainText.font.pointSize *= 1.1
                secondText.font.pointSize *= 1.1
                //prohibition of using the button multiple times
                if(scrlView.contentWidth > mainPage.width * 3 || scrlView.contentHeight > mainPage.height * 3){
                    visible = false;
                } else{
                    visible = true;
                    mouseAreaOut.visible = true;
                }
            }
        }
    }
    Rectangle {
        id: zoomOut
        height: 50; width: 50;
        color: !mouseAreaOut.visible ? activeFocusColor : mouseAreaOut.containsPress ? darkColor : mediumColor // activeFocusColor is used in MyTabs
        radius: 10
        Image {
            id: zoomOutIcon
            anchors.fill: parent
            scale: 0.8
            source: "StartScreen/StartScreenAssets/zoom-out.png"
        }
        MouseArea {
            id: mouseAreaOut
            anchors.fill: parent
            onClicked: {
                scrlView.contentWidth /= 1.1
                mainText.font.pointSize /= 1.1
                secondText.font.pointSize /= 1.1
                //prohibition of using the button multiple times
                if(scrlView.contentWidth <= mainPage.width || scrlView.contentHeight <= mainPage.height){
                    visible = false;
                } else{
                    visible = true;
                    mouseAreaIn.visible = true;
                }
            }
        }
    }
}

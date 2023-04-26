import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../MidArea"

Rectangle {
    property alias bar: bar
    width: bar.width
    height: bar.height
    //Made TabButtons vertical
    TabBar {

        id: bar
        width: servesButton.width
        background: Rectangle {
            color: mediumColor
        }
        height: servesButton.height * 3
        currentIndex: 3

        TabButton {
            anchors.top: parent.top
            id: servesButton
            Image {
                id: serveIcon
                source: "qrc:/ui/assets/serve.png"
                scale: servesButton.height/tabWidth
                anchors.centerIn: parent
            }

            Text {
                id: serveText
                anchors.horizontalCenter: serveIcon.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                text: qsTr("Serves") + mytrans.emptyString
                color: "white"
                font.pixelSize: 20
                font.family: "Impact"
            }

            anchors.horizontalCenter: parent.horizontalCenter
            width: tabWidth
            height: tabButtonHeight
            background: Rectangle {
                color: servesButton.focus ? activeFocusColor : servesButton.hovered ? darkColor : mediumColor
            }
        }

        TabButton {
            anchors.top: servesButton.bottom
            id: rulesButton

            Image {
                id: ruleIcon
                source: "qrc:/ui/assets/rules.png"
                anchors.centerIn: parent
                scale: rulesButton.height/tabWidth
            }

            Text {
                id: ruleText
                anchors.horizontalCenter: ruleIcon.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                text: qsTr("Rules") + mytrans.emptyString
                color: "white"
                font.pixelSize: 20
                font.family: "Impact"
            }

            anchors.horizontalCenter: parent.horizontalCenter
            width: tabWidth
            height: tabButtonHeight
            background: Rectangle {
                color: rulesButton.focus ? activeFocusColor : rulesButton.hovered ? darkColor : mediumColor
            }
        }

        TabButton {
            anchors.top: rulesButton.bottom
            id: standartsButton

            Image {
                id: standartsIcon
                source: "qrc:/ui/assets/licensing.png"
                anchors.centerIn: parent
                scale: standartsButton.height/tabWidth
            }

            Text {
                id: standartsText
                anchors.horizontalCenter: standartsIcon.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                text: qsTr("Standarts") + mytrans.emptyString
                color: "white"
                font.pixelSize: 20
                font.family: "Impact"
            }

            anchors.horizontalCenter: parent.horizontalCenter
            width: tabWidth
            height: tabButtonHeight
            background: Rectangle {
                color: standartsButton.focus ? activeFocusColor : standartsButton.hovered ? darkColor : mediumColor
            }
        }

        onCurrentIndexChanged: {
            switch (currentIndex)
            {
            case 0:
                loader.source = "qrc:/ui/MidArea/ServeArea/ServeArea.qml"
                break;
            case 1:
                loader.source = "qrc:/ui/MidArea/RulesArea/RulesArea.qml"
                break;
            case 2:
                loader.source = "qrc:/ui/MidArea/StandartsArea/StandartsArea.qml"
                break;
            }
            //signal for program to change window objects' sizes
            loader.item.tabChanged();
        }
    }
}

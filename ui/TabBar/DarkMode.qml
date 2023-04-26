import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle{

    anchors{
        right: parent.right
        left: parent.left
    }
    height: darkModeColumn.height + 10
    color: mediumColor

    RowLayout{
        spacing: -5

        ColumnLayout{
            id: darkModeColumn
            spacing: 10

            Switch {
                id: darkMode
                onCheckedChanged: {
                    if(checked){
                        lightColor = "#373737"
                        mediumColor = "#272727"
                        darkColor = "#101314"
                        activeFocusColor = "#101010"
                        textColor = "white"
                        darkOn = !darkOn
                    } else {
                        lightColor = "#FFF1D7"
                        mediumColor = "#F5883F"
                        darkColor = "#DD571C"
                        activeFocusColor = "#C04000"
                        textColor = "black"
                        darkOn = !darkOn
                    }
                }
            }
            Text {
                id: txt
                text: qsTr("Dark Mode")
                color: "white"
                Layout.alignment: Qt.AlignHCenter
                font.family: "Impact"
            }
        }
        Image {
            source: "qrc:/ui/assets/moon2.png"
            fillMode: Image.PreserveAspectFit
            scale: 0.8
        }
    }
}



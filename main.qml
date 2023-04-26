import QtQuick 2.15
import QtQuick.Window 2.15

import "ui/TabBar"
import "ui/MidArea"

Window {
    property string lightColor: "#FFF1D7"
    property string mediumColor: "#F5883F"
    property string darkColor: "#DD571C"
    property string textColor: "black"
    property string activeFocusColor: "#C04000"
    property bool darkOn: true // for color animation
    property bool ukrainianOn: false // for DarkMode image

    id: mainWindow
    width: 1600
    height: 900
    minimumWidth: 320
    minimumHeight: 400
    visible: true
    title: qsTr("Table Tennis Wizard")

    MyTabBar {
        id: tabBar
    }

    MidArea {
        id: midArea
        Loader {
            id: loader
            anchors.fill: parent
            source: "qrc:/ui/MidArea/StartScreen/StartScreen.qml"
        }
    }

    ChangeLanguage {
        id: language
    }

    //Animating theme changing
    Behavior on lightColor {
        ColorAnimation{
            from: lightColor
            to: darkOn ? "#373737" : "#FFF1D7"
            duration: 200
        }
    }

    Behavior on mediumColor {
        ColorAnimation{
            from: mediumColor
            to: darkOn ? "#272727" : "#F5883F"
            duration: 200
        }
    }

    Behavior on darkColor {
        ColorAnimation{
            from: darkColor
            to: darkOn ? "#101314" : "#DD571C"
            duration: 200
        }
    }

    Behavior on textColor {
        ColorAnimation{
            from: textColor
            to: darkOn ? "white" : "black"
            duration: 200
        }
    }

    Behavior on activeFocusColor {
        ColorAnimation{
            from: activeFocusColor
            to: darkOn ? "#101010" : "#C04000"
            duration: 200
        }
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Rectangle {
    property int tabWidth: 130
    property int tabButtonHeight: 130

    id: tabBar
    anchors {
        left: parent.left
        bottom: parent.bottom
        top: parent.top
    }
    width: tabWidth
    color: mediumColor

    BallParticles{
        id: whiteBalls
        anchors{
            left: parent.left
            right: parent.right
            top: bar.bottom
            bottom: darkMode.top
        }
        img.source: "qrc:/ui/assets/white-ball.png"
    }

    BallParticles{
        id: orangeBalls
        anchors{
            left: parent.left
            right: parent.right
            top: aboutUs.bottom
            bottom: darkMode.top
        }
        img.source: "qrc:/ui/assets/orange-ball.png"
    }

    // Tab bar with 3 options
    MyTabs{
        id: bar
    }
    // About Us button
    AboutUs{
        id: aboutUs
        anchors.top: bar.bottom
        anchors.horizontalCenter: bar.horizontalCenter
    }
    // DarkMode Switch
    DarkMode {
        anchors.bottom: parent.bottom
        id: darkMode
    }
    //Response to window change. I struggled to do it like qt left tabbar (Welcome, Edit, Design, etc)
    onHeightChanged: {
        if(height < 590){
            tabButtonHeight = (tabBar.height - darkMode.height)/4
            whiteBalls.visible = false
            orangeBalls.visible = false
        } else {
            tabButtonHeight = 130
            whiteBalls.visible = true
            orangeBalls.visible = true
        }
    }
}

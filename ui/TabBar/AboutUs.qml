import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Particles 2.0

Rectangle{
    id: about
    width: tabWidth
    height: tabButtonHeight
    color: aboutMouseArea.containsPress ? activeFocusColor : aboutMouseArea.containsMouse ? darkColor : mediumColor

    Image {
        id: aboutUsIcon
        source: "qrc:/ui/assets/about.png"
        anchors.centerIn: parent
        scale: about.height/tabWidth
    }

    Text {
        id: aboutUsText
        anchors.horizontalCenter: aboutUsIcon.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        text: "About Us"
        color: "white"
        font.pixelSize: 20
        font.family: "Impact"
    }

    MouseArea {
        id: aboutMouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
                aboutUs.show()
            particles.visible = true
        }
    }
    //Window AboutUs (I wanted Dialog Window but it has only a few properties)
    Window{
        id: aboutUs
        title: "About Us"
        color: "#feccd9"
        height: 900
        width: 1280
        minimumHeight: 900
        minimumWidth: 1280
        maximumHeight: 900
        maximumWidth: 1280
        modality: Qt.WindowModal

        flags: Qt.SplashScreen

        // background white petals
        Rectangle {
            id: particles
            visible: false
            color: "transparent"
            height: 900
            width: 1280

            ParticleSystem {
                anchors.fill: parent

                ImageParticle {
                    source: "qrc:/ui/assets/white single petal.png"
                    rotationVelocity: 30
                }

                Emitter {
                    width: parent.width
                    height: parent.height * 1.5
                    anchors.bottom: parent.bottom
                    lifeSpan: 10000
                    sizeVariation: 16
                    emitRate: 20
                    velocity:
                        AngleDirection {
                            angle: 90
                            angleVariation: 20
                            magnitude: 70
                        }
                }
            }
        }
        //Our image (pixelized on purpose)
        Image {
            id: ourImage
            source: "qrc:/ui/assets/AboutUs.jpg"
            anchors.centerIn: parent
            width: 640
            height: 630
        }

        Text {
            id: dialogText
            text: qsTr("My first application is devoted to my dear friends <br>with whom I learned to play table tennis!")
            anchors.top: ourImage.bottom
            anchors.horizontalCenter: ourImage.horizontalCenter
            font.family: "Viner Hand ITC"
            font.pointSize: 19
            anchors.margins: 10
        }

        Button{
            id: buttonOk
            text: "Ok"
            anchors{
                right: parent.right
                bottom: parent.bottom
                margins: 10
            }
            width: 100
            height: 30
            background: Rectangle {
                color: buttonOk.hovered ? "lightGray" : buttonOk.pressed ? "gray" : "white"
                border.color: "black"
                border.width: 2
                radius: 10
            }

            onClicked: {
                aboutUs.close()
            }
        }
        // just for fun
        Button{
            id: notOk
            text: "Not Ok"
            anchors{
                left: parent.left
                bottom: parent.bottom
                margins: 10
            }
            width: 100
            height: 30
            background: Rectangle {
                color: notOk.hovered ? "lightGray" : notOk.pressed ? "gray" : "white"
                border.color: "black"
                border.width: 2
                radius: 10
            }

            onClicked: {
                aboutUs.close()
            }
        }

    }

}

import QtQuick 2.15
import QtQuick.Particles 2.15

Rectangle {
    property alias img: img
    property alias emitter: emitter
    property alias direct: direct
    property alias gravity: gravity

    id: particles
    color: "transparent"

    ParticleSystem {
        anchors.fill: parent

        ImageParticle {
            id: img
            source: "qrc:/ui/assets/white-ball.png"
            rotationVelocity: 90 // the only way(I suppose) I can rotate particles
        }

        Emitter {
            id: emitter
            x: -width * 3
            width: 50
            height: parent.height
            anchors.bottom: parent.bottom
            lifeSpan: 10000
            sizeVariation: 16
            emitRate: 5
            velocity:
                AngleDirection {
                    id: direct
                    angle: 0
                    angleVariation: 10
                    magnitude: 200
                }
        }
        // returning ball

        Gravity {
            id: gravity
            x: width
            width: parent.width
            height: parent.height
            angle: 180
            magnitude: 500
        }
    }
}

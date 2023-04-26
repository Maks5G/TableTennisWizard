import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import MyLang 1.0

Row {
    anchors{
        right: parent.right
        bottom: parent.bottom
        rightMargin: 10
        bottomMargin: 10
    }
    spacing: 10
    Image {
        id: ukrainianIcon
        width: 50
        height: 50
        source: "qrc:/ui/assets/ukraine-icon.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                mytrans.updateLanguage(MyLang.UKR)
                ukrainianOn = true
            }
        }
    }
    Image {
        id: englishIcon
        width: 50
        height: 50
        source: "qrc:/ui/assets/uk-icon.png"

        MouseArea{
            anchors.fill: parent
            onClicked: {
                mytrans.updateLanguage(MyLang.ENG)
                ukrainianOn = false
            }
        }
    }
}

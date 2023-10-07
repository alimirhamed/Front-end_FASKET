import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import "../Utiles"
import KAST.Logic 1.0


Popup {
    id: popupMessage
    property Logic obj

    property string messageText:"value"

    topMargin: 0
    bottomMargin: 0
    x: 0
    width: parent.width
    height: parent.height
    focus: false

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background:
        Rectangle {
        id:rectContainer
        anchors.fill: parent
        color: "#191641"
        opacity: 0.5
//        Image {
//            id: imgCertificate
//            source: "../../Assets/Certificate.png"
//            x:260
//            y:36
//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    obj.shoppage.bypassClicked()
//                }
//            }
//        }
    }

    contentItem: Item {
        Rectangle{
            width: 640
            height: 230
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 15
            Image {
                source: "../../Assets/Warning.png"
                width: 72
                height: 77
                y:24
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label{
                text: messageText
                font.family: viewset.danaFuNumFont
                font.bold: true
                font.pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                y:125
                width: parent.width - 50
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}

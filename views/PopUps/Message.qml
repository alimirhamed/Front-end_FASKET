import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import "../Utiles"


Popup {
    id: popupMessage
    signal cerClicked()

    property string messageText:"value"
    
    topMargin: 0
    bottomMargin: 0
    x: 0
    width: 1024
    height: parent.height
    focus: false
    
    
    
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background:
        Item{
        anchors.fill: parent
        id:rectContainer
        Rectangle {
            id:rectContainer1
            anchors.fill: parent
            color: "#191641"
            opacity: 0.5   
        }
//        Image {
//            id: imgCertificate
//            width: 40
//            height: 40
//            source: "../../Assets/Certificate.png"
//            x:960
//            y:24
//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    popupMessage.cerClicked()
//                }
//            }
//        }
    }
    
    contentItem: Item {
        Rectangle{
            width: 720
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
                width: parent.width
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }
}

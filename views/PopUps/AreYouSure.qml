import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import "../Utiles"
import "../Components"
//import KAST.Logic 1.0


Popup {
    id: popupMessage
    signal ok();
    signal cancell();

    property string messageText:"آیا مطمین هستید؟"

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
 }

    contentItem: Item {
        Rectangle{
            width: 640
            height: 300
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
                id:lblMessageText
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
            KButton{
                anchors.top: lblMessageText.bottom
                anchors.topMargin: 20
                width: 245
                height: 50
                borderRadius: 15
                text: "تایید"
                x:350
                y:355
                onClicked: {
                    popupMessage.ok()
                }
            }
            KBorderButton{
                anchors.top: lblMessageText.bottom
                anchors.topMargin: 20
                width: 245
                height: 50
                radius: 15
                pixelSize: 20
                text: "انصراف"
                x:50
                y:355
                mouseField.onClicked: {
                    popupMessage.cancell()
                    popupMessage.close()
                }
            }
        }
    }
}

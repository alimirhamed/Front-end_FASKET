import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import "../Utiles"
import "../Components"
import KAST.Logic 1.0



Popup {
    id: popUpSettingpageOnShop
    property Logic obj

    onOpened: {

    }

    property string messageText:"value"

    topMargin: 0
    bottomMargin: 0
    x: 0
    width: parent.width
    height: parent.height
    focus: false

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background:Rectangle {
        id:rectContainer
        anchors.fill: parent
        color: "#191641"
        opacity: 0.5
    }

    contentItem:Item {
        Rectangle{
            width: 500
            height: 300
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 15
            KSettingButton{
                x:(parent.width /2) - width - 50
                y:24
                buttonBackColor: "#ffC5CE80"
                imagesource : "../../Assets/power.png"
                text: "شروع مجدد خرید"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        obj.shoppage.resetShop()
                    }
                }
            }
            KSettingButton{
                x:(parent.width /2) + 50
                y:24
                imagesource : "../../Assets/wifi.svg"
                text: "اتصال به شبکه"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                    }
                }

            }
            Label{
                text: "متصل به : " + "etiket1"
                font.family: viewset.danaFont
                font.pixelSize: 18
                y:180
                anchors.horizontalCenter: parent.horizontalCenter
            }
            KButton{
                text: "خروج"
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                height: 50
                width: 100
                anchors.bottomMargin: 20
                onClicked: {
                    popUpSettingpageOnShop.close()
                }
            }
        }
    }
}

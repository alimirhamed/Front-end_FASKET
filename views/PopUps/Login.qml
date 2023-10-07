import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import "../Utiles"
import "../Components"
import KAST.Logic 1.0


Popup {
    id: popupMessage
    property Logic tanzimat



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
    }

    contentItem: Item {

        Image {
            width: 548
            height: 425
            source: "../../Assets/RedBox.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            Label{
                text: "لطفا شماره کاربری را وارد کنید"
                color: "#FFF4B5"
                font.family: viewset.danaFuNumBoldFont
                font.pixelSize: 24
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                y:20
            }
            Numpad{
                id:numpad
                x:20
                y:89
            }
            Image {
                source: "../../Assets/LoginUser.png"
                width: 115
                height: 80
                x:348
                y:106
            }
            Rectangle{
                x:283
                y:219
                width: 245
                height: 55
                color: "#E9E9E9"
                radius: 15
                TextInput{
                    id:txt_ManualBarcodeInput
                    anchors.fill: parent
                    font.pixelSize: 18
                    layer.enabled: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment:  TextInput.AlignVCenter
                    font.family: viewset.danaFuNumFont
                    property string placeholderText: "شماره کاربری"
                    echoMode: TextInput.Password

                    onFocusChanged: {
                        numpad.inputtext = txt_ManualBarcodeInput
                    }
                    Text {
                        text: txt_ManualBarcodeInput.placeholderText
                        color: "#C6C5CE"
                        visible: !txt_ManualBarcodeInput.text
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: viewset.danaFuNumFont


                    }
                }

            }
            KButton{
                width: 245
                height: 50
                borderRadius: 15
                text: "ورود"
                x:283
                y:355
                onClicked: {
                    tanzimat.loginSetting(txt_ManualBarcodeInput.text)
                }
            }
            KBorderButton{
                width: 245
                height: 50
                radius: 15
                pixelSize: 20
                text: "انصراف"
                x:20
                y:355
                mouseField.onClicked: {
                    popupMessage.close()
                }
            }
        }
    }
}

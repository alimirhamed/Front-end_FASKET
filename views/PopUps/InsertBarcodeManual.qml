import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "../Components"
import KAST.Logic 1.0

Popup {
    property Logic tanzimatobj

    id: popup_manualbarcode
    x: 206
    y: 62
    width: 600
    height: 225+ numpad.height
    modal: true
    focus: true

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent | Popup.CloseOnPressOutside| Popup.CloseOnPressOutsideParent
    background: Rectangle {
        implicitWidth: 600
        implicitHeight: 348
        radius:10

    }
    contentItem: Item {
        Label{
            x:234
            y:20

            height: 28
            width: 132
            text: "لطفا بارکد محصول مورد نظر را وارد کنید."
            font.family: viewset.danaFuNumFont
            horizontalAlignment: Text.Center
            verticalAlignment: Text.Center
            font.pixelSize: 18
        }


        Rectangle{
            id:txt_DiscountCode
            width: 420
            height: 50
            x:90
            y:75
            color: "transparent"
            radius: 8
            border {
                color: "#2979ff"
                width: 1
            }

            TextInput{
                id:txt_ManualBarcodeInput
                anchors {
                    fill: parent
                }
                font.pixelSize: 18
                selectByMouse: true
                layer.enabled: true
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment:  TextInput.AlignVCenter
                font.family: viewset.danaFuNumFont
                property string placeholderText: "برای وارد کردن لمس کنید"
                onFocusChanged: {
                    numpad.inputtext = txt_ManualBarcodeInput
                }
                Text {
                    text: txt_ManualBarcodeInput.placeholderText
                    color: "#aaa"
                    visible: !txt_ManualBarcodeInput.text
                    font.pixelSize: 18
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: viewset.danaFuNumFont


                }
            }

        }

        Numpad{
            id:numpad
            x:(parent.width / 2) - (width / 2)
            anchors.top: txt_DiscountCode.bottom
        }

        Button {
            id: control
            text: qsTr("انصراف")
            x:310
            y:150+ numpad.height
            onClicked: popup_manualbarcode.close()
            contentItem: Text {
                text: control.text
                font.family: viewset.danaFuNumFont
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.pixelSize: 20
                font.weight: Font.Bold
            }

            background: Rectangle {
                implicitWidth: 150
                implicitHeight: 50
                opacity: enabled ? 1 : 0.3
                border.color: "#ff5353"
                border.width: 1
                radius: 8
                color:"#ff5353"
            }
        }
        Button {
            id: control1
            text: qsTr("ثبت")
            x:140
            y:150+ numpad.height
            onClicked: tanzimatobj.insertData.insertBarcodeManual(txt_ManualBarcodeInput.text)
            contentItem: Text {
                text: control1.text
                font.family: viewset.danaFuNumFont
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                font.pixelSize: 20
                font.weight: Font.Bold
            }

            background: Rectangle {
                implicitWidth: 150
                implicitHeight: 50
                opacity: enabled ? 1 : 0.3
                border.color: "#2979ff"
                border.width: 1
                radius: 8
                color:"#2979ff"
            }
        }
    }

}


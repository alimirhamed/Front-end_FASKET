import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Utiles"
import "../Components"
import KAST.Logic 1.0

Item {
    id:lstFactor

    signal cancle();
    signal ok();
    property bool showlastproduct: false


    property Logic tanzimat

    //anchors.fill: parent

    Component.onCompleted: {
        txt_ManualBarcodeInput.forceActiveFocus()
        numpad.inputtext = txt_ManualBarcodeInput
        if(showlastproduct == true){
            barcodeImg.visible = false
            lastproductManualInserted.visible = true
        }
    }

    Rectangle
    {
        id:rect1
        y:35
        width: 640
        height: 70
        radius: 15
        color: "#E45F2B"
        Label{
            text: "لطفا بارکد محصول مورد نظر را وارد کنید"
            anchors.horizontalCenter: parent.horizontalCenter
            y:15
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            font.pixelSize: 24
            color: "white"
        }
    }
    Rectangle{
        id:rect2
        anchors.top: rect1.bottom
        anchors.topMargin: 12
        width: 640
        height: 270
        radius: 15

        Image {
            id:barcodeImg
            x:326
            y:19
            source: "../../Assets/barcode.png"
            visible: true
        }
        Rectangle{
            id:lastproductManualInserted
            visible: false
            color: "white"
            width: 105
            height: 105
            x:395
            y:19
            radius: 20
            border.width: 1
            border.color: "#B4B4BB"
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    txt_ManualBarcodeInput.text =  tanzimat.shoppage.lastManualBarcodeProduct.QRCode
                }
            }
            Image {
                source: tanzimat.shoppage.lastManualBarcodeProduct.pic
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: 90
                height: 90
            }
            Image{
                width: 36
                height: 36
                source: "../../Assets/PluseBtn.png"
                x:parent.width - 25
                y:parent.height - 25
            }
        }

        Numpad
        {
            id:numpad
            x:20
            y:15
        }
        Rectangle{
            x:280
            y:143
            width: 340
            height: 55
            color: "#F1F1F1"
            radius: 15
            TextInput{
                id:txt_ManualBarcodeInput
                anchors.fill: parent
                font.pixelSize: 18
                layer.enabled: true
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment:  TextInput.AlignVCenter
                font.family: viewset.danaFuNumFont
                property string placeholderText: "بارکد13 یا 16 رقمی"

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
            borderRadius: 15
            text: "ثبت بارکد"
            width: 164
            height: 50
            x:456
            y:210
            onClicked: {
                tanzimat.shoppage.insertManualBarcodeClicked(txt_ManualBarcodeInput.text)
                lstFactor.ok()

            }
        }
        KBorderButton{
            radius: 15
            text: "انصراف"
            width: 164
            height: 50
            x:280
            y:210
            pixelSize: 20
            mouseField.onClicked: {
                lstFactor.cancle()
                tanzimat.shoppage.clearStackView()
            }
        }
    }
    DropShadow {
        id: rectshadow1
        anchors.fill: rect1
        cached: true
        radius: 16.0
        samples: 30
        color: "#19000000"
        smooth: true
        source: rect1
        verticalOffset:  5

    }
    DropShadow {
        id: rectshadow2
        anchors.fill: rect2
        cached: true
        radius: 16.0
        samples: 30
        color: "#19000000"
        smooth: true
        source: rect2
        verticalOffset:  5 
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "Components"
import "Utiles"
import "PopUps"
import "Containers"
import KAST.Logic 1.0


Item {
    property Logic obj_LogicContainer

    signal pageloaded()
    Component.onCompleted: {
        pageloaded()
    }
    Rectangle{
        id:rootContainer
        anchors.fill: parent
        color: viewset.backgroundColor
        x:320
        Image {
            id: imgMethod
            source: "../Assets/PaymentMethods.png"
            x:600
            y:138
            Rectangle{
                id:rectbag
                x:148
                y:94
                width: 80
                height: 80
                color: viewset.primaryColor
                radius: 15
                Image {
                    source: "../Assets/Bag.png"
                    width: 48
                    height: 36
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label{
                    text: "صندوق"
                    font.family: viewset.danaFuNumFont
                    font.pixelSize: 16
                    y:90
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle{
                id:rectInternet
                x:36
                y:94
                width: 80
                height: 80
                color: "#CEDCF7"
                radius: 15
                Image {
                    source: "../Assets/Internet.png"
                    width: 40
                    height: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label{
                    text: "اینترنتی"
                    font.family: viewset.danaFuNumFont
                    font.pixelSize: 16
                    y:90
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle{
                id:rectMobile
                x:148
                y:221
                width: 80
                height: 80
                color: "#B4B4BBB2"
                radius: 15
                Image {
                    source: "../Assets/Mobile.png"
                    width: 30
                    height: 45
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label{
                    text: "موبایل"
                    font.family: viewset.danaFuNumFont
                    font.pixelSize: 16
                    y:90
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle{
                id:rectBack
                x:36
                y:221
                width: 80
                height: 80
                color: "#F2C335"
                opacity: 0.6
                radius: 15
                Image {
                    source: "../Assets/BackFinalVector.png"
                    width: 35
                    height: 28
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                Label{
                    text: "بازگشت"
                    font.family: viewset.danaFuNumFont
                    font.pixelSize: 16
                    y:90
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        surePopUp.open()
                    }
                }
            }
        }
        Image {
            id: imgQRBox
            source: "../Assets/RedBox.png"
            width: 416
            height: 352
            x:160
            y:138
            Label{
                text: "لطفا بارکد را به متصدی صندوق ارائه دهید!"
                color: "white"
                font.family: viewset.danaFuNumBoldFont
                font.pixelSize: 20
                font.bold: true
                anchors.horizontalCenter: parent.horizontalCenter
                y:20
            }
            Image{
                id:img_qr
                x:0
                y:104
                source:"image://KBarcodeProvider/" + obj_LogicContainer.shoppage.suspendedFactorID
                width: parent.width
                height: 192
            }
            Label{
                text: obj_LogicContainer.shoppage.suspendedFactorID
                font.pixelSize: 30
                anchors.top: img_qr.bottom
                anchors.horizontalCenter:  img_qr.horizontalCenter
            }
        }

        DropShadow {
            id: imgMethodshadow
            anchors.fill: source
            cached: true
            radius: 16.0
            samples: 30
            color: "#10000000"
            smooth: true
            source: imgMethod
        }
        DropShadow {
            id: imgQRBoxshadow
            anchors.fill: source
            cached: true
            radius: 16.0
            samples: 30
            color: "#10000000"
            smooth: true
            source: imgQRBox
        }

    }
    Rectangle{
        id:menuContainer
        width: 1024
        height: 83
        color: "white"
        FasketProto{
            x:160
            y:20
        }

//        Image {
//            id: imgCertificate
//            source: "../Assets/Certificate.png"
//            x:824
//            y:21
//        }
    }
    DropShadow {
        id: menushadow
        anchors.fill: source
        cached: true
        radius: 16.0
        samples: 30
        color: "#10000000"
        smooth: true
        source: menuContainer

    }
    Component{
        id:afterpaymentpage
        AfterPayment{
            tanzimat : obj_LogicContainer
        }
    }

    Connections{
        target: obj_LogicContainer.shoppage
        function onShowAfterPayment(){
            stackview.push(afterpaymentpage)
        }
    }
    AreYouSure{
        id:surePopUp
        onOk: {
            obj_LogicContainer.shoppage.cancelPayment()
            stackview.pop()
            surePopUp.close()
        }
    }
}

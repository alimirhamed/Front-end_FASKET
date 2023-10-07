import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "Components"
import "Utiles"
import "PopUps"
import "Containers"
import KAST.Logic 1.0


Item {
    property Logic tanzimat

    Rectangle{
        id:rootContainer
        anchors.fill: parent
        color: viewset.backgroundColor
        x:320
        Rectangle
        {
            id:rect1
            x:352
            y:115
            width: 640
            height: 70
            radius: 15
            color: "#E45F2B"
            Label{
                text: "لطفا به صندوق اختصاصی سبد هوشمند مراجعه کنید!"
                anchors.horizontalCenter: parent.horizontalCenter
                y:15
                font.family: viewset.danaFuNumBoldFont
                font.bold: true
                font.pixelSize: 24
                color: "white"
            }
        }
        Image {
            id:imgroot
            width: 665
            height: 280
            x:340
            y:197
            source: "../Assets/Chekcup.png"
            Label{
                text: tanzimat.shoppage.productsmodel.totalcount + " عدد"
                x:342
                y:34
                font.family: viewset.danaFuNumFont
                font.pixelSize: 16
            }
            Label{
                text: qsTr("%L1").arg(tanzimat.shoppage.productsmodel.sood) + " ریال"
                x:342
                y:81
                font.family: viewset.danaFuNumFont
                font.pixelSize: 16
            }
            Label{
                text: qsTr("%L1").arg(tanzimat.shoppage.productsmodel.finalprice) + " ریال"
                x:342
                y:130
                font.family: viewset.danaFuNumFont
                font.pixelSize: 16
            }
            KBorderButton{
                text:"بازگشت به لیست خرید"
                width: 268
                height: 50
                x:30
                y:198
                radius: 50
                pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                mouseField.onClicked: {
                    tanzimat.shoppage.btnCancelPaymentClicked()
                    stackview.pop()
                }
            }
        }
        DropShadow {
            id: rootshadow
            anchors.fill: source
            cached: true
            radius: 16.0
            samples: 30
            color: "#10000000"
            smooth: true
            source: imgroot

        }

    }
    Rectangle{
        id:menuContainer
        width: 320
        height: parent.height
        color: "white"
        Image {
            id: img_logo
            source: "../Assets/FASKET.svg"
            x:32
            y:40
            width: 120
            height: 35
        }
        ColorOverlay{
            anchors.fill: img_logo
            source:img_logo
            color:"#2979ff"
            transform:rotation
            antialiasing: false
            width: 600
            height: 600

            SequentialAnimation on color {
                loops: Animation.Infinite
                ColorAnimation { from: viewset.primaryColor; to: viewset.focusColor; duration: 1200 }
                ColorAnimation { from: viewset.focusColor; to: viewset.primaryColor; duration: 1200 }
            }

        }
        Label{
            text: "Designed by KAST"
            font.pixelSize: 10
            font.family: viewset.danaFuNumFont
            x:73
            y:79
            color: "#DADAE1"
            font.letterSpacing: 0.5
        }

        Image {
            id: imgCertificate
            source: "../Assets/Certificate.png"
            x:260
            y:36
        }
        Component{
            id:factorDelegate

            Item {
                id: itemFactorItem
                x:5
                width: 280
                height: 60
                Rectangle{
                    id:rectFactorItem
                    anchors.fill: parent
                    Label {
                        id: factorItemName
                        text: model.name
                        font.family: viewset.danaFuNumFont
                        font.pixelSize: 12
                        anchors.right: rectFactorItem.right
                        anchors.rightMargin: 10
                        y:22.5
                        width: 230
                        height: 15

                        elide: Text.ElideRight
                    }

                    Rectangle {
                        id: rectFactorItemCount
                        anchors.left:  parent.left
                        y:20
                        anchors.rightMargin: 9
                        color: "#F2C335"
                        width: 25
                        height: 25
                        radius: 50
                        Label {
                            text: model.tedad
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: viewset.danaFuNumBoldFont
                            y:3
                            font.pixelSize: 14
                            font.bold: true
                            elide: Text.ElideRight
                            color: "white"
                        }
                    }
                    Rectangle{
                        anchors.bottom: parent.bottom
                        width: 280
                        height: 1
                        color: "#DADAE1"
                    }
                }

            }
        }

        Image {
            id:rectchecklist
            width: 310
            height: 461
            x:5
            y:115
            source: "../Assets/CheckList.png"
            ListView {
                id:lst_prd
                y:39
                x:15
                height: 400
                width: 280
                focus: true
                model: tanzimat.shoppage.productsmodel
                delegate: factorDelegate
                clip: true
                currentIndex: -1
                cacheBuffer: 10000
                smooth: true
                antialiasing: true
                snapMode: ListView.SnapOneItem
            }
        }

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
        id:generateQRCode
        PaymentMethod{
            obj_LogicContainer: tanzimat
            onPageloaded: busyIndicate.visible = false
        }
    }
    KBusyIndicator{
        id:busyIndicate
        visible: false
        mtext: "در حال تبادل اطلاعات با سرور مرکزی"
    }
    
    
    Timer {
           id: gotoTimer
           interval: 200
           onTriggered:
           {
                tanzimat.shoppage.qRmethodPay()
                stackview.push(generateQRCode)
           }

           repeat: false
           running: false
    }
    Connections{
        target: tanzimat.shoppage
        function onPaymentCartScanned(){
            busyIndicate.visible = true
            gotoTimer.start()
        }
    }
}


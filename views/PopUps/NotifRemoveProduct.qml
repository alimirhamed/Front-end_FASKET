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
    
    onOpened: {
        rectAlert.visible = true
        rectlst.visible = false
    }
    
    topMargin: 0
    bottomMargin: 0
    x: 0
    width: 1024
    height: parent.height
    focus: false

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background:Item {
        anchors.fill: parent
        id:rectContainer
        Rectangle {
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
//                    tanzimat.shoppage.bypassClicked()
//                }
//            }
//        }
        KImageRightButton{
            id:btn_manbarcode
            color: "#E9E9E9"
            imagesource: ""
            width: 150
            height: 40
            radius: 50
            text: "وارد کردن بارکد"
            textColor: "black"
            pixelSize: 18
            x:786
            y:24
            imagewidth: 16
            imageheight: 16
            imageX: 139
            textY:6
            animate: false
            mouseField.onClicked: {
                insertManualbarcode.open()
            }
        }

    }

    contentItem: Item {
        Rectangle{
            id:rectAlert
            width: 720
            //height: 530
            height: 150
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 15
            Image {
                id:imgAlert
                source: "../../Assets/Warning.png"
                width: 72
                height: 77
                y:2
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Label{
                id:lbl_message
                text: "لطفا محصول برداشته شده از سبد را مقابل بارکدخوان بگیرید!"
                anchors.top: imgAlert.bottom
                font.family: viewset.danaFuNumFont
                font.bold: true
                font.pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
            }
        }
        Rectangle{
            id:rectlst
            visible: false
            width: 640
            height: 410
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 15
            clip: true

            Rectangle
            {
                width: parent.width
                height: 70
                color: "#E45F2B"
                radius:15
                Label
                {
                    text: "لطفا محصول برداشته شده از سبد را مقابل بارکدخوان بگیرید!"
                    font.family: viewset.danaFuNumBoldFont
                    font.pixelSize: 24
                    font.bold: true
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "white"
                }
            }
            Component{
                id:removeProdDelegate
                
                Item {
                    id: itemFactorItem
                    x:5
                    width: 640
                    height: 90
                    Rectangle{
                        id:rectFactorItem
                        anchors.fill: parent
                        radius: 20
                        Image {
                            id: factorItemPic
                            source: model.pic
                            anchors.right: parent.right
                            anchors.top: parent.top
                            width: 75
                            height: 75
                            anchors.topMargin: 7
                            anchors.rightMargin: 20
                        }
                        Label {
                            id: factorItemName
                            text: model.name
                            font.family: viewset.danaFuNumFont
                            font.pixelSize: 16
                            anchors.right: factorItemPic.left
                            anchors.top: parent.top
                            width: 277
                            height: 75
                            anchors.topMargin: 22
                            anchors.rightMargin: 20
                            elide: Text.ElideRight
                        }
                        Rectangle {
                            id: rectFactorItemPercentage
                            anchors.left: parent.left
                            y:31
                            anchors.leftMargin: 55
                            color: "#F2C335"
                            width: 32
                            height: 32
                            radius: 50
                            Label {
                                text: model.tedad
                                anchors.horizontalCenter: parent.horizontalCenter
                                font.family: viewset.danaFuNumBoldFont
                                y:3
                                font.pixelSize: 18
                                font.bold: true
                                //anchors.right:  factorItemPrice.left
                                elide: Text.ElideRight
                                color: "white"
                            }
                            Label{
                                text: "عدد"
                                font.family: viewset.danaFuNumFont
                                font.pixelSize: 16
                                anchors.right: parent.left
                                y:3
                                anchors.rightMargin: 5
                            }
                        }
                        
                    }
                }
            }

            ListView {
                id:lst_prd
                spacing: 5
                anchors.fill: parent
                anchors.topMargin: 70
                anchors.bottomMargin: 70
                focus: true
                model: tanzimat.shoppage.maybeDeletedProducts
                delegate: removeProdDelegate
                clip: true
                currentIndex: -1
                cacheBuffer: 10000
            }

            KButton{
                width: 160
                height: 50
                borderRadius: 15
                text: "تایید"
                y:340
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    tanzimat.shoppage.productRemoveCliced()
                }
            }
        }
    }
    InsertManualBarcodePopUp{
        id:insertManualbarcode
        obj:tanzimat
    }
    Connections{
        target:tanzimat.shoppage
        function onVisibleProductListDelete(){
            rectAlert.visible = false
            rectlst.visible = true
        }
    }
    onClosed: {
        insertManualbarcode.close()
    }
}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "Components"



Item {
    signal ok();
    property var i : 1

    Rectangle{
        width: parent.width
        height: 83
        color: "#0A51D7"
        Label{
            text: "فرآیند اضافه کردن محصول به سبد خرید"
            font.family: viewset.danaFuNumBoldFont
            font.pixelSize: 28
            color: "white"
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Rectangle{
        x:460
        y:176
        width: 482
        height: 40
        Rectangle{
            id:tip1
            width: 48
            height: width
            color: "#F2C335"
            radius: 50
            anchors.left: lbl1.right
            anchors.leftMargin: 15
            y:5
            anchors.verticalCenter: parent.verticalCenter
            Label{
                id:counter1
                text: "1"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: viewset.danaFuNumBoldFont
                font.pixelSize: 28
                font.bold: true
                y:5
                visible: true
            }
        }
        Label{
            id:lbl1
            text: "ابتدا بارکد محصول انتخابی را جلوی بارکدخوان بگیرید."
            font.family: viewset.danaFuNumFont
            font.pixelSize: 20
            color: "black"
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right

        }
    }
    Rectangle{
        x:460
        y:282
        width: 482
        height: 40
        Rectangle{
            id:tip2
            width: 18
            height: width
            color: "#F2C335"
            radius: 50
            anchors.left: lbl2.right
            anchors.leftMargin: 15
            y:5
            anchors.verticalCenter: parent.verticalCenter
            Label{
                id:counter2
                text: "2"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: viewset.danaFuNumBoldFont
                font.pixelSize: 28
                font.bold: true
                y:5
                visible: false
            }
        }
        Label{
            id:lbl2
            text: "با دیدن اطلاعات محصول 7 ثانیه فرصت دارید
تا آن را درون سبد قرار دهید."
            font.family: viewset.danaFuNumFont
            font.pixelSize: 20
            color: "black"
            font.bold: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right

        }
    }
    Rectangle{
        x:460
        y:378
        width: 482
        height: 40
        Rectangle{
            id:tip3
            width: 18
            height: width
            color: "#F2C335"
            radius: 50
            anchors.left: lbl3.right
            anchors.leftMargin: 15
            y:5
            anchors.verticalCenter: parent.verticalCenter
            Label{
                id:counter3
                text: "3"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: viewset.danaFuNumBoldFont
                font.pixelSize: 28
                font.bold: true
                y:5
                visible: false
            }
        }
        Label{
            id:lbl3
            text: "پس از شنیدن صدای اعلان به حرکت خود ادامه دهید."
            font.family: viewset.danaFuNumFont
            font.pixelSize: 20
            color: "black"
            font.bold: false
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
        }
    }



    Image {
        id: imgHelpContainer
        source: "../Assets/HELP/Add/1.jpg"
        width: 400
        height: 400
        x:58
        y:141
        Image {
            id: imgBarcodeGroup
            source: "../Assets/HELP/barcodeGroup.png"
            width: 200
            height: 85
            x:200
            y:60
            visible: false
        }
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: imgHelpContainer.width
                height: imgHelpContainer.height
                Rectangle {
                    //anchors.centerIn: imgHelpContainer
                    width: imgHelpContainer.width
                    height: imgHelpContainer.width
                    radius: 15
                }
            }
        }
    }
    Timer {
        id: changeImageTimer
        interval: 2000
        onTriggered:
        {
            imgBarcodeGroup.visible = false
            if(i == 2){
                imgBarcodeGroup.visible = true

                interval = 800
            }
            if(i == 3){
                tip1.width = 18
                lbl1.font.bold = false
                counter1.visible=false


                tip2.width = 48
                lbl2.font.bold = true
                counter2.visible=true
                interval = 1000
            }
            if(i == 8){
                tip2.width = 18
                lbl2.font.bold = false
                counter2.visible=false


                lbl3.visible = true
                tip3.width = 48
                lbl3.font.bold = true
                counter3.visible=true
                interval = 3000
            }

            if(i != 9){
                i = i+1
            }
            else{
                i=1

                tip3.width = 18
                lbl3.font.bold = false
                counter3.visible = false

                tip1.width = 48
                lbl1.font.bold = true
                counter1.visible = true

                btnnext.opacity = 1
                btnnext.enabled = true

            }
            imgHelpContainer.source = "../Assets/HELP/Add/"+i+".jpg"


        }

        repeat: true
        running: true
    }


    property bool isRead : false
    KImageButton{
        id:btnnext
        enabled: true
        opacity: 1
        imagesource: ""
        width: 184
        height: 50
        radius: 50
        text: "مطالعه کردم"
        x:494
        y:491
        MouseArea{
            anchors.fill: parent
            onClicked: {
                // if(isRead == false)
                // {
                //     tip1.width = 48
                //     lbl1.font.bold = true
                //     counter1.visible = true

                //     tip2.width = 48
                //     lbl2.font.bold = true
                //     counter2.visible = true

                //     tip3.width = 48
                //     lbl3.font.bold = true
                //     counter3.visible = true

                //     parent.imagesource = "../../Assets/backVector.png"
                //     parent.text = "بعدی"
                //     isRead = true
                //     parent.width = 140
                //     changeImageTimer.running = false
                // }
                // else{
                    busyIndicate.visible = true
                    gotoTimer.start()
                //}

            }
            SequentialAnimation{
            running:true
            loops: Animation.Infinite
            PropertyAnimation{
                target: btnnext
                property: "color"
                to:"#191641"
                duration: 1000
            }
            PropertyAnimation{
                target: btnnext
                property: "color"
                to:"#2979FF"
                duration: 1000
            }
        }
        }
    }
    KBusyIndicator{
        id:busyIndicate
        visible: false
    }
    Timer {
        id: gotoTimer
        interval: 200
        onTriggered:
        {
            parent.ok()
        }

        repeat: false
        running: false
    }
}




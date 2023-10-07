import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../Components"
import "../PopUps"
import "../Utiles"
import KAST.Logic 1.0


Rectangle{
    id:root
    property Logic tanzimat

    anchors.fill: parent
    color:viewset.backgroundColor

    Rectangle{
        id:menuContainer
        width: 1024
        height: 83
        color: "white"
          Timer{
            id : tm3
            interval: 200
            onTriggered: {
                stackview.pop()
            }
        }
        KBackButton {
            id:backbutton
            x:883
            y:22
            text: "بازگشت"
            anchors.right: parent.right
            anchors.rightMargin: 64
            fontsize: 18
            fontfamily: viewset.danaFuNumFont
            shadow: true
            onClicked: {
                tm3.running = true
            }
        }
        FasketProto{
            x:450
            y:20
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

    Rectangle{
        width: parent.width
        height: parent.height - menuContainer.height
        anchors.top:menuContainer.bottom
        color: viewset.backgroundColor
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent"; }
            GradientStop { position: 1.0; color: viewset.primaryColor; }
        }

        Rectangle{
            id:rect_data
            color: "white"
            x:400
            y:10
            width: 500
            height: 280
            radius: 10
            Image{
                anchors.horizontalCenter: parent.horizontalCenter
                id: image
                x: 127
                y: 10
                width: 120
                height: 121
                source: tanzimat.settingPage.insertData.product.pic
                fillMode: Image.PreserveAspectFit
            }
            Label {
                id: labelName
                anchors.top: image.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 30
                text: "نام : " + tanzimat.settingPage.insertData.product.name
                font.family: viewset.danaFuNumFont
            }
            Label {
                id: labelbarcode
                anchors.top: labelName.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                text: "بارکد : " + tanzimat.settingPage.insertData.product.QRCode
                font.family: viewset.danaFuNumFont
            }
            Label {
                id: labeliranbarcode
                anchors.top: labelbarcode.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                text: "ایران بارکد : " + tanzimat.settingPage.insertData.product.Irancode
                font.family: viewset.danaFuNumFont
            }
            KButton{
                text: "پاک کردن ایران بارکد"
                anchors.left: rect_data.left
                anchors.top: rect_data.bottom
                height: 50
                width: 125
                fontsize: 12
                onClicked:{
                    tanzimat.settingPage.insertData.deleteIranBarcode()
                }
            }
            KButton{
                text: "بارکد دستی"
                anchors.right: rect_data.right
                anchors.top: rect_data.bottom
                height: 50
                width: 125
                fontsize: 14
                onClicked: {
                    popup_manualbarcode.open()
                }
            }

        }
        Rectangle{
            id:rect_currentweight
            anchors.top: rect_data.bottom
            width: 200
            x:rect_data.x + (rect_data.width / 2) - (width / 2)
            height: 50
            Label {
                id: labelWeight
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
                text: qsTr("وزن : " + (tanzimat.settingPage.insertData.weight.currentweight - tanzimat.settingPage.insertData.startweight) + " گرم ")
                font.bold: true
                font.family: viewset.danaFuNumFont
            }
        }

        Rectangle{
            id:rect_resetweight
            anchors.right: rect_data.left
            anchors.rightMargin: 24
            color: "white"
            y:10
            width: 250
            height: 113
            radius: 10
            Label {
                id: labelName1
                anchors.horizontalCenter: parent.horizontalCenter
                topPadding:  10
                text: "وزن اولیه"
                font.family: viewset.danaFuNumFont

            }
            Label {
                id: labelName2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:labelName1.bottom
                anchors.topMargin: 15
                text: tanzimat.settingPage.insertData.startweight
            }
            KButton
            {
                anchors.top:labelName2.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 10
                width: 100
                height: 30
                text: "set"
                isBold: false
                onClicked: {
                    tanzimat.settingPage.insertData.setStartweight()
                }
            }
        }
        Rectangle{
            id:rect_meanweight
            anchors.top: rect_resetweight.bottom
            anchors.topMargin: 10
            anchors.right: rect_data.left
            anchors.rightMargin: 24
            color: "white"
            y:10
            width: 250
            height: 100
            radius: 10
            Label {
                id: labelName3
                anchors.horizontalCenter: parent.horizontalCenter
                topPadding:  10
                font.family: viewset.danaFuNumFont
                text: "میانگین اوزان"
            }
            Label {
                id: labelName4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:labelName3.bottom
                anchors.topMargin: 20
                text: tanzimat.settingPage.insertData.product.avgWeight
                font.family: viewset.danaFuNumFont
            }
        }
        Rectangle{

            anchors.top: rect_meanweight.bottom
            anchors.topMargin: 10
            anchors.right: rect_data.left
            anchors.rightMargin: 24
            color: "white"
            y:10
            width: 250
            height: 100
            radius: 10
            Label {
                id: labelName5
                anchors.horizontalCenter: parent.horizontalCenter
                topPadding:  10
                font.family: viewset.danaFuNumFont
                text: "تلورانس"
            }
            Label {
                id: labelName6
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top:labelName5.bottom
                anchors.topMargin: 20
                text: tanzimat.settingPage.insertData.product.tolerance
            }
        }
        Grid {
            anchors.top: rect_currentweight.bottom
            anchors.topMargin: 5
            x:(parent.width / 2) - width / 2
            y:350
            columns: 5
            spacing: 10
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 1) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  tanzimat.settingPage.insertData.product.w1 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 1)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(1)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 2) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: tanzimat.settingPage.insertData.product.w2 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 2)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(2)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 3) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  tanzimat.settingPage.insertData.product.w3 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 3)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(3)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 4) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  tanzimat.settingPage.insertData.product.w4 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 4)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(4)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 5) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  tanzimat.settingPage.insertData.product.w5 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 5)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(5)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 6) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:tanzimat.settingPage.insertData.product.w6 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 6)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(6)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 7) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  tanzimat.settingPage.insertData.product.w7 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 7)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(7)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 8) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: tanzimat.settingPage.insertData.product.w8 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 8)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(8)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 9) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: tanzimat.settingPage.insertData.product.w9 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {

                        if(tanzimat.settingPage.insertData.selectedWeight !== 9)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(9)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                    }
                }
            }
            Rectangle {
                radius: 10
                color: (tanzimat.settingPage.insertData.selectedWeight == 10) ? "red": "white"
                width: 150;
                height: 75
                Label{
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:  tanzimat.settingPage.insertData.product.w10 + " گرم "
                    font.pixelSize: 20
                    font.bold: true
                    font.family: viewset.danaFuNumFont

                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked: {
                        console.log(tanzimat.settingPage.insertData.selectedWeight)
                        if(tanzimat.settingPage.insertData.selectedWeight !== 10)
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(10)
                            // parent.color = "red"
                        }
                        else
                        {
                            tanzimat.settingPage.insertData.setSelectedWeightClicked(0)
                            // parent.color = "white"
                        }
                    }
                }
            }
        }
    }
    InsertBarcodeManual{
        id:popup_manualbarcode
        tanzimatobj:tanzimat
    }
}





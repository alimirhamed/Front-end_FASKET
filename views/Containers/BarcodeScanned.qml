import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Utiles"
import "../Components"
import KAST.Logic 1.0



Item {
    id:newProd
    property Logic tanzimat

    //anchors.fill: parent

    Rectangle
    {
        id:rect1
        y:35
        width: 640
        height: 70
        radius: 15
        color: "#E45F2B"
        Label{
            text: "لطفا کالا را درون سبد قرار دهید"
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
            id: imgProdPic
            source: tanzimat.shoppage.newProduct.pic 
            width: 120
            height: 120
            y:30
            x:380
        }
        Rectangle{
            width: 54
            height: 26
            color: "#E45F2B"
            radius: 50
            x:500
            y:121
            Label {
                text: (100-((tanzimat.shoppage.newProduct.finalprice * 100)/tanzimat.shoppage.newProduct.Price)).toFixed(0) + "%"
                anchors.horizontalCenter: parent.horizontalCenter
                font.family: viewset.danaFuNumBoldFont
                y:3
                font.pixelSize: 14
                font.bold: true
                //anchors.right:  factorItemPrice.left
                elide: Text.ElideRight
                color: "white"
            }
        }
        Label{
            text: tanzimat.shoppage.newProduct.name
            font.family: viewset.danaFuNumBoldFont
            font.pixelSize: 16
            width: 352
            height: 60
            wrapMode: Text.Wrap
            elide: Text.ElideRight
            x:264
            y:168
        }
        KProgress{
            width: 112
            height: 112
            x:56
            y:29
            title: (tanzimat.shoppage.countdownTimer - 3 >= 0) ? (tanzimat.shoppage.countdownTimer - 3) : "0"
        }
        
        Label{
            id:lblWaiting
            text: "7 ثانیه فرصت دارید
کالا را درون سبد قرار دهید"
            x:37
            y:161
            font.family: viewset.danaFuNumBoldFont
            font.pixelSize: 14
            font.bold: true
            horizontalAlignment:"AlignHCenter"
            color: "#C6C5CE"
        }
        Label{
            id:lblSpo2FinalPrice
            font.pixelSize: 18
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            text: qsTr("%L1").arg(tanzimat.shoppage.newProduct.finalprice) + " ریال"
            x:264
            y:224
            color: viewset.primaryColor
        }
        Label{
            id:lblSpo2Price
            font.pixelSize: 16
            font.bold: true
            font.family: viewset.danaFuNumFont
            text: qsTr("%L1").arg(tanzimat.shoppage.newProduct.Price)
            font.strikeout: true
            //anchors.horizontalCenter: lblSpo1FinalPrice.horizontalCenter
            color: "#DADAE1"
            x:397
            y:227
        }
        KProgressButton{
            x:30
            y:223
            width: 164
            height: 33
            level: tanzimat.shoppage.countdownTimer - 3
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    tanzimat.shoppage.onClickHideNewProduct()
                }
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

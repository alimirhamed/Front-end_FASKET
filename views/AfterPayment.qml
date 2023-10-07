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

    Image {
        source: "../Assets/AfterPayment.png"
    }
    
    Label{
        text: "تجربه خرید‍‌تان با سبد هوشمند فسکت چگونه بود؟"
        font.family: viewset.danaFuNumFont
        font.pixelSize: 20
        x:595
        y:425
    }
    Image {
        width: 60
        height: 103
        x:900
        y:488
        source: "../Assets/Rate/bad.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                messageSaveComment.visible = true
                tanzimat.shoppage.saveComment(0)
            }
        }
    }
    Image {
        width: 60
        height: 103
        x:790
        y:488
        source: "../Assets/Rate/medium.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                messageSaveComment.visible = true
                tanzimat.shoppage.saveComment(1)
            }
        }
    }
    Image {
        width: 60
        height: 103
        x:680
        y:488
        source: "../Assets/Rate/good.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                messageSaveComment.visible = true
                tanzimat.shoppage.saveComment(2)
            }
        }
    }
    Image {
        width: 60
        height: 103
        x:570
        y:488
        source: "../Assets/Rate/woow.png"
        MouseArea{
            anchors.fill: parent
            onClicked: {
                messageSaveComment.visible = true
                tanzimat.shoppage.saveComment(3)
            }
        }
    }
    Rectangle{
        id:messageSaveComment
        visible: false
        x:570
        y:488
        width: 390
        height: 103
        Text {
            text: qsTr("بازخورد شما با موفقیت ثبت شد")
            font.family: viewset.danaBoldFont
            font.pixelSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Timer {
        id: closetimer
        interval: 300000
        onTriggered:{
            tanzimat.shoppage.resetShop()
        }
        repeat: false
        running: true
    }
    
}

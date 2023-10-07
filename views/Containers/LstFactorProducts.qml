import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Components"
import KAST.Logic 1.0


Item {
    id:lstFactor
    property Logic tanzimat

    //anchors.fill: parent

    Component{
        id:factorDelegate

        Item {
            id: itemFactorItem
            x:5
            width: 640
            height: 90
            Rectangle{
                id:rectFactorItem
                anchors.fill: parent
                radius: 20
                border.width:2
                border.color:"transparent"
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
                Label {
                    id: factorItemPrice
                    text: " هرعدد " + qsTr("%L1").arg(model.price) + " ریال" 
                    font.family: viewset.danaFuNumFont
                    font.pixelSize: 16
                    anchors.right: factorItemPic.left
                    y:54
                    anchors.rightMargin: 20
                    elide: Text.ElideRight
                    color: "#A3A2B3"
                }
                Rectangle{
                    width: 1
                    height: 12
                    color: "#A3A2B3"
                    anchors.right: factorItemPrice.left
                    y:58
                    anchors.rightMargin: 6
                }
                Label {
                    id: lblFactorItemCount
                    text: "تعداد"
                    font.family: viewset.danaFuNumFont
                    font.pixelSize: 16
                    anchors.right:  factorItemPrice.left
                    y:54
                    anchors.rightMargin: 17
                    elide: Text.ElideRight
                    color: "#A3A2B3"
                }
                Rectangle {
                    id: rectFactorItemPercentage
                    anchors.right:  lblFactorItemCount.left
                    y:54
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
                        //anchors.right:  factorItemPrice.left
                        elide: Text.ElideRight
                        color: "white"
                    }
                }
                Rectangle{
                    width: 54
                    height: 26
                    color: "#E45F2B"
                    radius: 50
                    x:150
                    y:31
                    Label {
                        text: (100-((model.finalprice*100)/model.price)).toFixed(0) + "%"
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: viewset.danaFuNumBoldFont
                        y:3
                        font.pixelSize: 14
                        font.bold: true
                        //anchors.right: factorItemPrice.left
                        elide: Text.ElideRight
                        color: "white"
                    }
                }
                Label {
                    id: factorItemTotalPrice
                    text: qsTr("%L1").arg(model.finalprice) + " ریال"
                    font.family: viewset.danaFuNumFont
                    font.pixelSize: 18
                    x:20
                    y:30
                    elide: Text.ElideRight
                }
            }
            DropShadow {
                id: rectFactorItemshadow
                anchors.fill: source
                cached: true
                radius: 16.0
                samples: 30
                color: "#19000000"
                smooth: true
                source: rectFactorItem
                verticalOffset:  5

            }
        }
    }

    ListView {
        id:lst_prd
        spacing: 5
        anchors.fill: parent
        focus: true
        model: tanzimat.shoppage.productsmodel
        delegate: factorDelegate
        clip: true
        currentIndex: -1
        cacheBuffer: 10000
        smooth: true
        antialiasing: true
        snapMode: ListView.SnapOneItem
        
        add: Transition {
            SequentialAnimation{
                PauseAnimation{
                    duration: 500
                }
                ParallelAnimation{
                    NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 700 }
                    NumberAnimation { property: "scale"; from: 0; to: 1.0; duration: 700 }
                }
            }
        }

        displaced: Transition {
            SequentialAnimation{
                PauseAnimation{
                    duration: 500
                }
            NumberAnimation { properties: "x,y"; duration: 700; easing.type: Easing.Linear }
            }
        }
    }
}



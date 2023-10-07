import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../Components"
import KAST.Logic 1.0

Rectangle{
    id:root
    property Logic tanzimat
    //anchors.fill: parent

    color:viewset.backgroundColor

    Rectangle{
        id:menuContainer
        width: 1024
        height: 83
        color: "white"
        Timer{
            id : tm2
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
                tm2.running = true
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
    ProgressBar{
        id:prog1
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        value: 0
        height: 50
        from: 0
        to: 100

    }
    KButton{
        id:btn1
        text: "بروز رسانی"
        anchors.top: prog1.bottom
        anchors.horizontalCenter: prog1.horizontalCenter
        anchors.topMargin: 30
        width: 150
        height: 50
        onClicked: {
            tanzimat.settingPage.updater.startDownload()
        }
    }
    Connections{
        target: tanzimat.settingPage.updater
        function onSetCurrentProgress(v){
            prog1.value = v
        }
        function onSucceeded(){
            btn1.enabled = true
            btn1.opacity = 1
        }
    }
}

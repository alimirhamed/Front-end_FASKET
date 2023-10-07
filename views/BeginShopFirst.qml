import QtQuick 2.15
import QtQuick.Controls 2.15
import "Components"



Item {

    signal ok();
    Rectangle{
        width: parent.width
        height: 83
        color: "#191641"
        Label{
            text: "نکات مهم"
            font.family: viewset.danaFuNumBoldFont
            font.pixelSize: 28
            color: "white"
            font.bold: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
    Image {
        source: "../Assets/HELP/Notif1.png"
        x:151
        y:172
        Image {
            id: lb1
            source: "../Assets/HELP/lb1.png"
            x:282
            y:280
        }


        Image {
            id: lb2
            source: "../Assets/HELP/lb2.png"
            x:1000
            y:120
        }
        Image {
            id: lb3
            source: "../Assets/HELP/lb3.png"
            x:179
            y:500
        }
        SequentialAnimation{
            id:anim
            running: true
            PropertyAnimation{
                target: lb1
                properties: "y"
                from: 2800
                to:20
                easing.type: Easing.InOutQuad
                duration: 800
                // running: true
            }
            PropertyAnimation{
                target: lb2
                properties: "x"
                from: 1000
                to:170
                easing.type: Easing.InOutQuad
                duration: 1000
                // running: true
            }
            PropertyAnimation{
                target: lb3
                properties: "y"
                from: 500
                to:245
                easing.type: Easing.InOutQuad
                duration: 800
                //running: true
            }
            onFinished: {
                btnnext.opacity = 1
                btnnext.enabled = true
            }
        }
    }

    //property bool isRead : false
    KImageButton{
        id:btnnext
        enabled: true
        opacity: 1
        imagesource: ""
        width: 184
        height: 50
        radius: 50
        text: "مطالعه کردم"
        x:96
        y:486
        MouseArea{
            anchors.fill: parent
            onClicked: {
       
                    anim.destroy()
                    busyIndicate.visible = true
                    gotoTimer.start()
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
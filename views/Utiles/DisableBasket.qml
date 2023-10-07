import QtQuick 2.15

Item {
    Image {
        id: background
        source: "../Assets/BackgrandBulor.png"
        Image{
            id: sadface
            source: "../Assets/SadFace.png"
            width: 138
            height: 138
            anchors.top: parent.top
            anchors.topMargin: 135
            x:443
        }
            Rectangle{
                id: box_txt
                color: "transparent"
                width: 656
                height: 94
                anchors.top: sadface.bottom
                anchors.topMargin: 43
                x: 184
                radius: 80
                border.color: "white"
                Text{
                text: "سبد خرید غیـر فعال است"
                color: "#FFFFFF"
                font.family: viewset.danaFuNumBoldFont
                font.pixelSize: 40
                anchors.centerIn: parent
                font.bold: true
                opacity: 0.7

                }
            }
            Text{
                text: "لطفا از سبد خرید دیگری استفاده کنید"
                color: "#F2C335"
                font.family: viewset.danaFuNumFont
                font.pixelSize: 32
                anchors.top: box_txt.bottom
                anchors.topMargin: 23
                x: 298
            }
            Image{
            source: "../Assets/logo.png"
            opacity: 0.6
            anchors.left: parent.left
            anchors.leftMargin: 24
            y:524
            }

        }
    }


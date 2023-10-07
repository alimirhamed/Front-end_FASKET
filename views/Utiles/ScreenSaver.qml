import QtQuick 2.15

Item {
    Image {
        id: background
        source: "../Assets/BackgrandBulor.png"
        Image{
            id: kasticon
            source: "../Assets/logo white Kast.png"
            width: 216
            height: 189
            anchors.top: parent.top
            anchors.topMargin: 162
            x: 301
        }
        Image{
            id:kasttxt
            source: "../Assets/FASKET.png"
            anchors.top: parent.top
            anchors.topMargin: 247
            x: 476

        }
        Text{
            text: "برای شروع خرید روی صفحه کلیک کنید."
            color: "#F2C335"
            font.family: viewset.danaFuNumFont
            font.pixelSize: 32
            anchors.top: kasticon.bottom
            anchors.topMargin: 49
            x: 301
        }

    }
}


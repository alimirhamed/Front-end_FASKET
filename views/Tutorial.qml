import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "Utiles"
import "Containers"

Item {
    anchors.fill: parent
    Image {
        id:backbutton
        source: "../Assets/backbutton.png"
        x:764
        y:90
        MouseArea{
            anchors.fill: parent
            onClicked: {
                stackview.pop()
            }
        }
    }
    Image {
        source: "../Assets/Secondarylogo.png"
        width: 120
        height: 40
        x:140
        y:90
    }

    Rectangle{
        id:navigation
        x:333
        y:90
        width: 358
        height: 40
        radius: 50
        border.color: "#2979ff"
        border.width: 1
        clip: true

        property string color1: "#2979ff"
        property string color2: "transparent"
        property string tcolor1: "white"
        property string tcolor2: "#78889e"

        Button
        {
            clip: true
            width: 0
            height: parent.height
            text: "ویدیوی راهنما"
            background: Rectangle{
                color: parent.parent.color1
                radius: parent.parent.radius
            }

            onClicked: {
                loader.sourceComponent = videohelp
                handlebuttonColor(1)
            }

            contentItem: Text {

                text: parent.text
                font.family: viewset.danaFuNumFont
                opacity: enabled ? 1.0 : 0.3
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                color: parent.parent.tcolor1
                font.pixelSize: 18

            }

        }
        Button
        {
            clip: true
            width: parent.width
            x: 0

            height: parent.height
            text: "سوالات متداول"
            background: Rectangle{
                color: "#2979ff"
                radius: parent.parent.radius
            }
//            onClicked: {
//                loader.source = "Containers/HelpList.qml"
//                handlebuttonColor(2)
//            }

            contentItem: Text {

                text: parent.text
                font.family: viewset.danaFuNumFont
                opacity: enabled ? 1.0 : 0.3
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
                color: "white"
                font.pixelSize: 18

            }

        }


    }

    function handlebuttonColor(btn)
    {
        if(btn === 1)
        {
            navigation.color1= "#2979ff"
            navigation.color2= "transparent"
            navigation.tcolor1= "white"
            navigation.tcolor2= "#78889e"
        }
        else if(btn === 2)
        {
            navigation.color1= "transparent"
            navigation.color2= "#2979ff"
            navigation.tcolor1= "#78889e"
            navigation.tcolor2= "white"
        }
    }


    Loader
    {
        id:loader
        width: 744
        height: 340
        x:140
        y:200
        sourceComponent: questionohelp
        asynchronous: true
    }
    Component{
        id:questionohelp
        HelpList{

        }
    }
}

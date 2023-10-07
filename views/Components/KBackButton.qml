import QtQuick 2.15
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.15


Button {
    id: controlBt

    property string fontfamily: viewset.danaFuNumFont
    property bool ishover: true
    property int fontsize: 20
    property bool isBold: true
    property bool shadow: false
    property string btn_color:ishover? viewset.primaryColor:viewset.opacityColor
    property int borderRadius : 50
    property int tripleWidth: width * 3


    contentItem: Label {
        text: parent.text
        font.family: fontfamily
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: "white"
        font.pixelSize: fontsize
        font.bold: isBold?true:false
    }

    background: Rectangle {
        id:primaryButton
        color: btn_color
        implicitWidth: 120
        implicitHeight: 40
        opacity: enabled ? 1.0 : 0.2
        radius: borderRadius
        clip: true
        Rectangle{
            id:efectbtn
            property int diameter: 0
            property int pressX: 0
            property int pressY: 0
            x: pressX - radius
            y: pressY - radius
            color: "white"
            radius: diameter / 2
            width: diameter
            height: diameter
            opacity: 1 - diameter / controlBt.tripleWidth
            function animate(x, y, size) {
                pressX = x
                pressY = y
                diameter = size
            }
            Behavior on diameter {
                PropertyAnimation {
                    duration: 200
                    onRunningChanged: {
                        if(!running) {
                            duration = 0;
                            efectbtn.diameter = 0;
                            duration = 200;
                        }
                    }
                }
            }
        }
    }
    onClicked: {
        efectbtn.animate(pressX, pressY, controlBt.tripleWidth)
    }
}




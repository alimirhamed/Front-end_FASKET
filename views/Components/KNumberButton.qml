import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../Utiles"

Button {
    width: 75
    height: 55
    font.pixelSize: 36

    property int textY:36
    contentItem: Label {
        text: parent.text
        font.family: viewset.danaFont
        font.bold: false
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        color: "black"
        font.pixelSize: parent.font.pixelSize
    }

    background: Rectangle {
        id:primaryButton
        color:parent.pressed ? "#F2C335" : "#E9E9E9"
        radius: 15
    }
}

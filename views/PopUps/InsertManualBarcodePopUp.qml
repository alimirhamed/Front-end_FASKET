import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import "../Utiles"
import "../Components"
import "../Containers"
import KAST.Logic 1.0


Popup {
    id: popupMessage
    property Logic obj


    topMargin: 0
    bottomMargin: 0
    x: -20
    width: 1100
    height: 640
    focus: false



    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background:
        Item{
        anchors.fill: parent
        id:rectContainer
        Rectangle {
            id:rectContainer1
            anchors.fill: parent
            color: "#191641"
            opacity: 0.5
        }
    }

    contentItem: Item {
        Rectangle{
            id:rectAlert
            width: 720
            height: 400
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            radius: 15
            Rectangle{
                id:manbarcode
                x:45
                //anchors.top:lbl_message.bottom

                ManualBarcode{
                    tanzimat:obj
                    onCancle: {
                        popupMessage.close()
                    }
                    onOk: {
                        popupMessage.close()
                    }
                }
            }
        }
    }
}

import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.15
import "../Utiles"
import "../Components"


Popup {
    id: popupMessage



    topMargin: 0
    bottomMargin: 0
    x: 0
    width: parent.width
    height: parent.height
    focus: false

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
    background:
        Rectangle {
        id:rectContainer
        anchors.fill: parent
        color: "#191641"
        opacity: 0.5
    }

    contentItem: Item {

        Image {
            width: 548
            height: 299
            source: "../../Assets/masterLogin.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter

            Rectangle{
                x:283
                y:93
                width: 245
                height: 55
                color: "white"
                radius: 15
                border.color: "#C6C5CE"
                TextEdit{
                    id:txt_username
                    anchors.fill: parent

                    font.pixelSize: 18
                    layer.enabled: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment:  TextInput.AlignVCenter
                    font.family: viewset.danaFuNumFont
                    property string placeholderText: "نام کاربری"
                    onFocusChanged: {
                        numpad.inputtext = txt_username
                    }
                    Text {
                        text: txt_username.placeholderText
                        color: "#C6C5CE"
                        visible: !txt_username.text
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: viewset.danaFuNumFont


                    }
                }

            }
            Rectangle{
                x:283
                y:167
                width: 245
                height: 55
                color: "white"
                radius: 15
                border.color: "#C6C5CE"
                TextEdit{
                    id:txt_password
                    anchors.fill: parent
                    font.pixelSize: 18
                    layer.enabled: true
                    horizontalAlignment: TextInput.AlignHCenter
                    verticalAlignment:  TextInput.AlignVCenter
                    font.family: viewset.danaFuNumFont
                    property string placeholderText: "شناسه کاربری"

                    onFocusChanged: {
                        numpad.inputtext = txt_password
                    }
                    Text {
                        text: txt_password.placeholderText
                        color: "#C6C5CE"
                        visible: !txt_password.text
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.family: viewset.danaFuNumFont


                    }
                }

            }

            KButton{
                width: 245
                height: 50
                borderRadius: 15
                text: "ورود"
                x:283
                y:229
                onClicked: {
                    if(txt_ManualBarcodeInput.text === "1202"){
                        lstfBypass.visible = true
                    }
                }
            }
            KBorderButton{
                width: 245
                height: 50
                radius: 15
                pixelSize: 20
                text: "انصراف"
                x:20
                y:229
                mouseField.onClicked: {
                    popupMessage.close()
                }
            }
        }


    }
}

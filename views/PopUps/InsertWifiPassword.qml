import QtQuick 2.12
import QtGraphicalEffects 1.0
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "../Utiles"
import "../Components"
import KAST.Logic 1.0

Popup {
    id: popup_SetPasssword
    property Logic setting_obj



    x: 206
    y: 62
    width: 600
    height: 225
    modal: true
    focus: true

    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    background: Rectangle {
        implicitWidth: 600
        implicitHeight: 348
        radius:10

    }
    contentItem: Item {
        id:container
        property var dynamicObject
        Label{
            x:234
            y:20

            height: 28
            width: 132
            text: "پسورد را وارد کنید"
            horizontalAlignment: Text.Center
            verticalAlignment: Text.Center
            font.family: viewset.danaFuNumFont
            font.pixelSize: 20
        }


        Rectangle{
            id:txt_DiscountCode
            width: 420
            height: 50
            x:90
            y:75
            color: "transparent"
            radius: 8
            border {
                color: "#2979ff"
                width: 1
            }

            TextEdit{
                id:txt_inpupassword
                anchors {
                    fill: parent
                }
                font.pixelSize: 18
                font.family: viewset.danaFuNumFont
                selectByMouse: true
                layer.enabled: true
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment:  TextInput.AlignVCenter
                property string placeholderText: "برای وارد کردن لمس کنید"
                Text {
                    text: txt_inpupassword.placeholderText
                    color: "#aaa"
                    visible: !txt_inpupassword.text
                    font.pixelSize: 18
                    font.family: viewset.danaFuNumFont
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter


                }
                onFocusChanged: {
                    if(focus===true)
                    {
                        container.dynamicObject =  Qt.createQmlObject(
                                    'import QtQuick 2.15
                                 import "../Components"

                                         KKeyboard{
                                             id:keyboard
                                             inputtext : txt_inpupassword
                                             leftpad:206
                                             toppad:80
                                       }',
                                    container,'firstObject')
                    }
                }
            }

        }

        KBorderButton {
            id: control
            text: qsTr("انصراف")
            x:140
            y:150
            width: 150
            height: 50
            pixelSize: 18
            radius:  15
            mouseField.onClicked: {
                popup_SetPasssword.close()
            }
        }
        KButton {
            id: control1
            text: qsTr("ثبت")
            x:310
            y:150
            width: 150
            height: 50
            borderRadius: 15
            onClicked: setting_obj.settingPage.wifimodel.wifiConfig(txt_inpupassword.text)
        }
    }
}


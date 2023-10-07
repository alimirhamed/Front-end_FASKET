import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../Components"
import "../PopUps"
import "../Utiles"

import KAST.Logic 1.0



Item {
    property Logic tanzimat

    Rectangle{
        id:root
        anchors.fill: parent
        color :viewset.backgroundColor

        Rectangle{
            id:menuContainer
            width: 1024
            height: 83
            color: "white"
            Timer{
            id : tm2
            interval: 200
            onTriggered: {
                    tanzimat.settingPage.backFromWifiSettigs()
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



        Label{
            text: "متصل به : "+ tanzimat.settingPage.wifimodel.SSID
            x:50
            anchors.top: menuContainer.bottom
            anchors.topMargin: 20
            horizontalAlignment: Text.AlignRight
            font.family: viewset.danaFuNumFont
            font.bold: true
            font.pixelSize: 16
        }
        Label{
            text: "IP : " + tanzimat.settingPage.wifimodel.IP
            anchors.top: menuContainer.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: menuContainer.horizontalCenter
            horizontalAlignment: Text.AlignRight
            font.family: viewset.danaFuNumFont
            font.bold: true
            font.pixelSize: 16
        }
        Component {
            id: appDelegate
            Item {
                height:100
                width:924
                Rectangle{
                    anchors.fill: parent
                    color: "transparent"
                    Label{
                        id:txt_data
                        anchors.verticalCenter: parent.verticalCenter
                        text: model.ESSID
                        font.family: viewset.danaFuNumFont
                        font.bold: true
                        font.pixelSize: 16
                    }
                    Label{
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: "کیفیت : "+model.Quality+"  | سیگنال لول : "+model.Signallevel+""
                        font.family: viewset.danaFuNumFont
                        font.pixelSize: 16
                    }
                    KButton{
                        x:0
                        y:0
                        width: 140
                        height: 50
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right : parent.right
                        text: "وصل شدن"
                        onClicked: {
                            tanzimat.settingPage.wifimodel.selectedWifi(index);
                            popup_SetPasssword.open();
                        }
                    }
                    Rectangle{
                        width: parent.width
                        height: 2
                        color: "#2979ff"
                        anchors.bottom: parent.bottom
                    }
                }

            }
        }


        ListView{
            id:lst_wifis
            width: parent.width - 100
            height: parent.height -150
            spacing: 5
            x:50
            y:150
            focus: true
            model: tanzimat.settingPage.wifimodel
            delegate: appDelegate
            clip: true
            currentIndex: -1
            //onCurrentIndexChanged: console.log( "Current Index: "+currentIndex )
        }
    }

    InsertWifiPassword{
        id:popup_SetPasssword
        setting_obj:tanzimat
    }

}


import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Layouts 1.15
import "../Components"
import "../Utiles"
import "../PopUps"
import KAST.Logic 1.0



Item {
    //model
    property Logic tanzimatMaster


    Rectangle{
        anchors.fill: parent
        color: viewset.backgroundColor
        Rectangle{
            id:menuContainer
            width: 1024
            height: 83
            color: "white"
              Timer{
            id : tm3
            interval: 200
            onTriggered: {
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
                tm3.running = true
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
        GridLayout {
            id: grid
            columns: 5
            anchors.top: menuContainer.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: 900
            height: parent.height - 83
            columnSpacing: 30
            KSettingButton{
                imagesource: "../../Assets/SensorVazn.png"
                text: "سنسور وزن"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
            KSettingButton{
                x:464
                y:155
                imagesource: "../../Assets/recive and upload.png"
                text: "ارسال و دریافت اطلاعات به سرور"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        stackview.push(syncWithServer)
                    }
                }
                Component{
                    id:syncWithServer
                    MasterSyncWithServer{
                        tanzimat : tanzimatMaster
                    }
                }
            }
            KSettingButton{
                x:672
                y:155
                imagesource: ""
                text: "نور سبز"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        //tanzimatMaster.settingPage.gotoWifiSettings()
                    }
                }
            }
            KSettingButton{
                x:256
                y:348
                imagesource: ""
                text: "نور ابی"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
            KSettingButton{
                x:464
                y:348
                imagesource: ""
                text: "صدا"
            }
            KSettingButton{
                x:672
                y:348
                imagesource: ""
                text: "ثبت سریال سبد"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
            KSettingButton{
                x:672
                y:348
                imagesource: ""
                text: "پایگاه داده"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
            KSettingButton{
                x:672
                y:348
                imagesource: ""
                text: "بارکد خوان"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
            KSettingButton{
                x:672
                y:348
                imagesource: ""
                text: "لاگ ها"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }

            KSettingButton{
                x:672
                y:348
                imagesource: ""
                text: "یوزر ها"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {

                    }
                }
            }
        }
    }
}

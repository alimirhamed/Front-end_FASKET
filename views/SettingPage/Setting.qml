import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "../Components"
import "../Utiles"
import "../PopUps"
import KAST.Logic 1.0


Item {
    //model
    property Logic obj_LogicContainer

    Rectangle{
        anchors.fill: parent
        color: viewset.backgroundColor
        Rectangle{
            id:menuContainer
            width: 1024
            height: 83
            color: "white"
             Timer{
                id : tm2
                interval: 500
                onTriggered: {
                    stackview.pop()
                    obj_LogicContainer.deleteSettingPage()
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
        KSettingButton{
            x:256
            y:155
            text: "همگام سازی با سرور"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackview.push(syncwithserverEtka)
                }
            }

            Component{
                id:syncwithserverEtka
                SyncWithStore{
                    tanzimat: obj_LogicContainer
                }
            }
        }
        KSettingButton{
            x:464
            y:155
            imagesource : "../../Assets/database.svg"
            text: "وارد کردن دیتا"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackview.push(dataInsert)
                }
            }
            Component{
                id:dataInsert
                InsertData{
                    tanzimat: obj_LogicContainer
                }
            }
        }
        KSettingButton{
            x:672
            y:155
            imagesource : "../../Assets/wifi.svg"
            text: "اتصال به شبکه"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    obj_LogicContainer.settingPage.gotoWifiSettings()
                    stackview.push(wifipage)
                }
            }
            Component{
                id:wifipage
                WifiSetting{
                    tanzimat: obj_LogicContainer
                }
            }
        }
        KSettingButton{
            x:156
            y:348
            buttonBackColor: "#ffC5CE80"
            imagesource : "../../Assets/power.png"
            text: "خاموش کردن"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    obj_LogicContainer.settingPage.shutDown()
                }
            }
        }
        KSettingButton{
            x:364
            y:348
            imagesource : "../../Assets/maintenance.svg"
            text: "تست سبد"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    obj_LogicContainer.settingPage.prepareMasterPage()
                    masterLogin.open()
                }
            }
        }
        KSettingButton{
            x:564
            y:348
            imagesource : "../../Assets/maintenance.svg"
            text: "بروز رسانی سبد"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackview.push(updatepage)
                }
            }
            Component{
                id:updatepage
                UpdateApp{
                    tanzimat: obj_LogicContainer
                }
            }
        }
        KSettingButton{
            x:772
            y:348
            imagesource : "../../Assets/calibrate.svg"
            text: "کالیبره کردن"
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    stackview.push(calibrationpage)
                }
            }

            Component{
                id:calibrationpage
                WeightSensorCalibration{
                    tanzimat: obj_LogicContainer
                }
            }
        }
    }

    Label{
        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        text: "v2.0.0"
    }
    
    Component{
        id:masterpage
        MasterSetting{
            tanzimatMaster : obj_LogicContainer
        }
    }

    MasterLogin{
        id:masterLogin
    }

    Connections{
        target: obj_LogicContainer.settingPage
        function onMasterLoginned(){
            masterLogin.close()
            stackview.push(masterpage)
        }
    }
}

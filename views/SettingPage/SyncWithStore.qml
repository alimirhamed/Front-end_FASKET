import QtQuick 2.15
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../Components"
import KAST.Logic 1.0

Rectangle{
    id:root
    property Logic tanzimat
    anchors.fill: parent


    color:viewset.backgroundColor

    Rectangle{
        id:menuContainer
        width: 1024
        height: 83
        color: "white"
        Timer{
            id : tm2
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

    Rectangle {
        anchors.top: menuContainer.bottom

        width: 1024
        height: parent.height - menuContainer.height

        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent"; }
            GradientStop { position: 1.0; color: viewset.primaryColor; }
        }

        Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            width: 450
            height:400
            x:50
            y:64
            radius: 10
            KProgress{
                id:progressUploadedToServer
                width: 300
                height: 300
                from: 0
                to: tanzimat.settingPage.etkaApiHandler.tedadToUpload
                value: 0
                x:(parent.width/2) - (width/2)

            }
            Label{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text:tanzimat.settingPage.etkaApiHandler.tedadUploaded + " از " + tanzimat.settingPage.etkaApiHandler.tedadToUpload
                font.pixelSize: 25
                font.family: viewset.danaFuNumFont
            }

            KButton{
                text: "آپلود اطلاعات به سرور"
                anchors.bottom: parent.bottom

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 10
                onClicked: {
                    tanzimat.settingPage.etkaApiHandler.startUploadToServer();
                }
            }
        }
        Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            color: "white"
            width: 450
            height:400
            y:64
            radius: 10
            x:524
            KProgress{
                id:progressDownloadFromServer
                width: 300
                height: 300
                x:(parent.width/2) - (width/2)
                from: 0
                to:tanzimat.settingPage.etkaApiHandler.tedadToDownload
                value: 0

            }
            Label{
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text:tanzimat.settingPage.etkaApiHandler.tedadDownloaded + " از " + tanzimat.settingPage.etkaApiHandler.tedadToDownload
                font.pixelSize: 25
                font.family: viewset.danaFuNumFont
            }
            KButton{
                text: "واکشی اطلاعات از سرور"
                anchors.bottom: parent.bottom

                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 10
                onClicked: {
                    opacity = 0.5
                    enabled = false
                    tanzimat.settingPage.etkaApiHandler.startDownloadFromServer();
                }
            }
        }
    }
    // Connections{
    //     target: tanzimat.settingPage.etkaApiHandler
    //     onUpdateUploadedToServerValue:{
    //         // progressUploadedToServer.update(value);
    //     }
    //     onUpdateDownloadedFromServerValue:{
    //         // progressDownloadFromServer.update(value);
    //     }
    // }
}


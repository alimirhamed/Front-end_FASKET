import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import "../Components"
import "../Utiles"
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
        id:container
        anchors.top: menuContainer.bottom
        readonly property real size: Math.min(control.width, control.height)

        width: 1024
        height: parent.height - menuContainer.height
        gradient: Gradient {
            GradientStop { position: 0.0; color: "transparent"; }
            GradientStop { position: 1.0; color: viewset.primaryColor; }
        }



        KDelayButton{
            width: 200
            height: 200
            y:10
            x:800
            content.contentItem: Rectangle{
                width: 100
                height: 100
                color: "transparent"
                Label{
                    y:parent.height / 3.5
                    anchors.horizontalCenter: parent.horizontalCenter

                    text:"سبد خالی"
                }

            }
            content.onActivated: {
                tanzimat.settingPage.weightsensor.setWeightZero();
            }
        }

        KDelayButton{
            width: 200
            height: 200
            y:10
            x:550
            content.contentItem: Rectangle{
                width: 100
                height: 100
                color: "transparent"
                Label{
                    y:parent.height / 3.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"وزن اول"
                    font.family: viewset.danaFuNumFont
                }
                Rectangle{
                    id:txt_w1
                    width: 100
                    height: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    y:100
                    color: "white"
                    radius: 8
                    border {
                        color: "#2979ff"
                        width: 2
                    }

                    TextEdit{
                        inputMethodHints: Qt.ImhFormattedNumbersOnly
                        id:txt_w1Input
                        anchors {
                            fill: parent
                        }
                        font.pixelSize: 18
                        selectByMouse: true
                        layer.enabled: true
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment:  TextInput.AlignVCenter
                        font.family: viewset.danaFuNumFont
                        property string placeholderText: "وزن اول"
                        Text {

                            text: txt_w1Input.placeholderText
                            color: "#aaa"
                            visible: !txt_w1Input.text
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: viewset.danaFuNumFont


                        }
                        onFocusChanged:{
                            if(focus===true)
                            {
                                root.dynamicObject =  Qt.createQmlObject(
                                            'import QtQuick 2.15
                                             import "../Components"
                                                                     KKeyboard{
                                                                         id:keyboard
                                                                         inputtext : txt_w1Input
                                                                   }',
                                            root,'firstObject')
                            }
                        }
                    }

                }
            }
            content.onActivated: {
                tanzimat.settingPage.weightsensor.setWeightW1(txt_w1Input.text);
                console.log(txt_w1Input.text)

            }
        }
        KDelayButton{
            width: 200
            height: 200
            y:10
            x:300
            content.contentItem: Rectangle{
                width: 100
                height: 100
                color: "transparent"
                Label{
                    y:parent.height / 3.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"وزن دوم"
                }
                Rectangle{
                    id:txt_w2
                    width: 100
                    height: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    y:100
                    color: "white"
                    radius: 8
                    border {
                        color: "#2979ff"
                        width: 2
                    }

                    TextEdit{
                        inputMethodHints: Qt.ImhFormattedNumbersOnly
                        id:txt_w2Input
                        anchors {
                            fill: parent
                        }
                        font.pixelSize: 18
                        selectByMouse: true
                        layer.enabled: true
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment:  TextInput.AlignVCenter
                        font.family: viewset.danaFuNumFont
                        property string placeholderText: "وزن دوم"
                        Text {

                            text: txt_w2Input.placeholderText
                            color: "#aaa"
                            visible: !txt_w2Input.text
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: viewset.danaFuNumFont


                        }
                        onFocusChanged:{
                            if(focus===true)
                            {
                                root.dynamicObject =  Qt.createQmlObject(
                                            'import QtQuick 2.15
                                             import "../Components"

                                                                     KKeyboard{
                                                                         id:keyboard
                                                                         inputtext : txt_w2Input
                                                                   }',
                                            root,'firstObject')
                            }
                        }
                    }

                }
            }
            content.onActivated: {
                tanzimat.settingPage.weightsensor.setWeightW2(txt_w2Input.text);
            }
        }

        KDelayButton{
            width: 200
            height: 200
            y:10
            x:50
            content.contentItem: Rectangle{
                width: 100
                height: 100
                color: "transparent"
                Label{
                    y:parent.height / 3.5
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"وزن سوم"
                    font.family: viewset.danaFuNumFont
                }
                Rectangle{
                    id:txt_w3
                    width: 100
                    height: 50
                    anchors.horizontalCenter: parent.horizontalCenter
                    y:100
                    color: "white"
                    radius: 8
                    border {
                        color: "#2979ff"
                        width: 2
                    }

                    TextEdit{
                        inputMethodHints: Qt.ImhFormattedNumbersOnly
                        id:txt_w3Input
                        anchors {
                            fill: parent
                        }
                        font.pixelSize: 18
                        selectByMouse: true
                        layer.enabled: true
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment:  TextInput.AlignVCenter
                        font.family: viewset.danaFuNumFont
                        property string placeholderText: "وزن سوم"
                        Text {

                            text: txt_w3Input.placeholderText
                            color: "#aaa"
                            visible: !txt_w3Input.text
                            font.pixelSize: 18
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: viewset.danaFuNumFont


                        }
                        onFocusChanged:{
                            if(focus===true)
                            {
                                root.dynamicObject =  Qt.createQmlObject(
                                            'import QtQuick 2.15
                                             import "../Components"
                                                                     KKeyboard{
                                                                         id:keyboard
                                                                         inputtext : txt_w3Input
                                                                   }',
                                            root,'firstObject')
                            }
                        }
                    }

                }
            }
            content.onActivated: {
                tanzimat.settingPage.weightsensor.setWeightW3(txt_w3Input.text);
            }
        }

        Rectangle{
            radius: 8
            width: 200
            height: 200
            y:235
            x:300
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "وزن سبد"
                y:30
                font.family: viewset.danaFuNumFont
            }
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: ""+tanzimat.settingPage.weightsensor.currentweight+" گرم"
                font.family: viewset.danaFuNumFont

            }
            KButton{
                width: parent.width
                height: 50
                text: "ثبت"
                x:0
                anchors.bottom: parent.bottom
                onClicked: {
                    tanzimat.settingPage.weightsensor.saveCalibration();
                }
            }
        }
        Rectangle{

            radius: 8
            width: 200
            height: 200
            y:235
            x:524
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Offset"
                y:30
                font.family: viewset.danaFuNumFont

            }
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                text: tanzimat.settingPage.weightsensor.offset
                y:70
                font.family: viewset.danaFuNumFont

            }
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Scale"
                y:110
                font.family: viewset.danaFuNumFont

            }
            Label{
                anchors.horizontalCenter: parent.horizontalCenter
                text: tanzimat.settingPage.weightsensor.scale
                y:150
                font.family: viewset.danaFuNumFont

            }
        }
    }
}

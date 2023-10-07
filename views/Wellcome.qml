import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "Components"
import "Utiles"
import "PopUps"
import "SettingPage"
import KAST.Logic 1.0
import KAST.Battery 1.0


Item {
       Logic{
            id:obj_logic
        }
        Battery{
            id:cls_battery
        }
    
    Image {
        id: background
        source: "../Assets/wellcome-backgound.png"
        anchors.fill: parent
        ShaderEffectSource{
            id: shader
            sourceItem: background
            width: 408
            height: parent.height
            x:616
            sourceRect: Qt.rect(x,y, width, height)
        }
        FastBlur {
            anchors.fill: shader
            source: shader
            radius: 10
        }
    }
    KBattery{
        x:24
        y:16
        battery_level : cls_battery.batterylevel
    }
    Image {
        x:24
        y:477
        id: img_logo
        source: "../Assets/logo.png"
        width: 60
        height: 52.41
        
    }
    //    ColorOverlay{
    //        anchors.fill: img_logo
    //        source:img_logo
    //        color:"white"
    //        transform:rotation
    //        antialiasing: true
    
    //    }
    Image {
        x:24
        y:545.41
        id: img_logoEtka
        source: "../Assets/etkaLogo.png"
        width: 60
        height: 30.51
        sourceSize: Qt.size(width, height)
        
    }
    Image {
        id: img_BtnSetting
        source: "../Assets/SettingButton.png"
        x:556
        y:540
        width: 36
        height: 36
        MouseArea{
            anchors.fill: parent
            onClicked: {
                popUpLogin.open()
            }
        }
    }
    
    Rectangle{
        id:rect
        color: "white"
        opacity: 0.85
        width: 408
        height: parent.height
        x:616
        
        Label{
            id:lbl_1
            color:"#161616"
            font.family: viewset.danaUltraBoldFont
            font.bold: true
            font.pixelSize: 48
            text: "خـوش آمـدیـد"
            font.letterSpacing: -0.5
            anchors.horizontalCenter: parent.horizontalCenter
            layer.enabled: true
            y: 82
            //            layer.effect: DropShadow {
            //                verticalOffset: 4
            //                color: "#80000000"
            //                radius: 2
            //                samples: 4
            //            }
        }
        Label{
            color:"#161616"
            anchors.top: lbl_1.bottom
            anchors.right: lbl_1.right
            anchors.left: lbl_1.left
            font.bold: true
            font.letterSpacing: -1
            font.wordSpacing: -2
            text: "با سبد خـرید هوشمند کست
سـریـع تـر خـریـد کنید!"
            font.family: viewset.danaFuNumBoldFont
            font.pixelSize: 28
        }
        KButton{
            id:btn_start
            y:372
            text: "شـروع خـریـد"
            anchors.horizontalCenter: parent.horizontalCenter
            fontsize: 32
            fontfamily: viewset.danaFuNumBoldFont
            isBold: true
            shadow: true
            onClicked: {
                stackview.push(shoppagefirst)
            }
            Component{
                id:shoppagefirst
                BeginShopFirst{
                    onOk: {
                        stackview.replace(shoppagesecond)
                    }
                }
            }
            Component{
                id:shoppagesecond
                BeginShopSecond{
                    onOk: {
                        stackview.replace(shoppagethird)
                    }
                }
            }
            Component{
                id:shoppagethird
                BeginShopThird{
                    onOk: {
                        obj_logic.gotoShopping();
                        stackview.replace(shoppage);
                    }
                }
            }
            Component{
                id:shoppage
                Shop{
                    obj_LogicContainer: obj_logic
                }
            }
        }
        KButton{
            id:btn_help
            anchors.top:btn_start.bottom
            anchors.topMargin: 24
            text: "مشـاهـده راهـنـمـا"
            anchors.horizontalCenter: parent.horizontalCenter
            fontsize: 24
            ishover: false
            shadow: false
            isBold: false
            onClicked: {
                stackview.push("Tutorial.qml")
            }
        }   
    }
    
    Login{
        id:popUpLogin
        tanzimat:obj_logic
    }
    Component{
        id:settingpage
        Setting{
            obj_LogicContainer:obj_logic
        }
    }
    
    Connections{
        target: obj_logic
        function onLoginned(){
            popUpLogin.close()
            stackview.push(settingpage)           
        }
    }
}

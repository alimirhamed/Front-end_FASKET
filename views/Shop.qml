import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "Components"
import "Utiles"
import "PopUps"
import "Containers"
import KAST.Logic 1.0


Item {
    property Logic obj_LogicContainer

    Component.onCompleted:{
        obj_LogicContainer.shoppage.modelInited()
    }

    Rectangle{
        id:rootContainer
        anchors.fill: parent
        color: viewset.backgroundColor
        x:320

        Image {
            id: imgBasketNotStarted
            source: "../Assets/StartShopIcon.png"
            x:374
            y:251
        }
        Label{
            text: "سبد خرید من"
            x:864
            y:32
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            font.pixelSize: 24
            font.letterSpacing: -1.4
            color: viewset.focusColor
        }

        KImageRightButton{
            color: viewset.focusColor
            imagesource: "../../Assets/plus.png"
            width: 175
            height: 40
            radius: 50
            text: "وارد کردن بارکد"
            pixelSize: 18
            x:352
            y:36
            imagewidth: 16
            imageheight: 16
            imageX: 139
            textY:6
            animate: false
            mouseField.onClicked: {
                obj_LogicContainer.shoppage.showManualBarcodeClicked()
            }
        }
        property alias stackviewContainer: stackviewContainer
        StackView
        {
            id:stackviewContainer
            width: 650
            height: 433
            x:352
            y:90
            initialItem: lstProductHandler
            onDepthChanged: {
                obj_LogicContainer.shoppage.stackviewDepthChanged(stackviewContainer.depth)
            }
        }

        Rectangle{
            id:splitter
            height: 25
            width: 660
            x:342
            y:501
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 1.0; color: viewset.backgroundColor }
            }
        }

        Timer{
            id : tm10
            interval: 200
            onTriggered: {
                obj_LogicContainer.shoppage.btnEndShopClicked()
            }
        }
        KButton{
            id:btnEndShop
            x:850
            y:526
            width: 144
            height: 50
            text: "اتمام خرید"
            onClicked: {
                tm10.running = true
            }
        }
        Label{
            id:lblFinalPrice
            anchors.right: btnEndShop.left
            anchors.rightMargin: 38
            y:527
            text: "مبلغ قابل پرداخت"
            font.family: viewset.danaFuNumBoldFont
            font.bold: false
            font.pixelSize: 12
            color: viewset.primaryColor
        }
        Label{
            id:lblFinalPriceBind
            anchors.horizontalCenter: lblFinalPrice.horizontalCenter
            y:551
            text : qsTr("%L1").arg(obj_LogicContainer.shoppage.productsmodel.finalprice) + " ریال"
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            font.pixelSize: 16
            color: viewset.focusColor
        }
        Rectangle{
            width: 2
            height: 26
            color: "#DADAE1"
            x:700
            y:550
        }
        Label{
            id:lblPrice
            anchors.right: lblFinalPrice.left
            anchors.rightMargin: 50
            y:527
            text: "مبلغ بدون تخفیف"
            font.family: viewset.danaFuNumBoldFont
            font.bold: false
            font.pixelSize: 12
            color: viewset.primaryColor
        }
        Label{
            id:lblPriceBind
            anchors.horizontalCenter: lblPrice.horizontalCenter
            y:551
            text : qsTr("%L1").arg(obj_LogicContainer.shoppage.productsmodel.pricenodiscount) + " ریال"
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            font.pixelSize: 16
            color: "#A3A2B3"

        }
        Rectangle{
            width: 1
            height: 26
            color: "#DADAE1"
            x:565
            y:550
        }
        Label{
            id:lblProfitPrice
            anchors.right: lblPrice.left
            anchors.rightMargin: 50
            y:527
            text: "سود شما از خرید"
            font.family: viewset.danaFuNumBoldFont
            font.bold: false
            font.pixelSize: 12
            color: viewset.primaryColor
        }
        Label{
            id:lblProfitPriceBind
            anchors.horizontalCenter: lblProfitPrice.horizontalCenter
            y:551
            text : qsTr("%L1").arg(obj_LogicContainer.shoppage.productsmodel.sood) + " ریال"
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            font.pixelSize: 16
            color: "#A3A2B3"

        }
        Rectangle{
            width: 2
            height: 26
            color: "#DADAE1"
            x:435
            y:550
        }
        Label{
            id:lblCountFactor
            anchors.right: lblProfitPrice.left
            anchors.rightMargin: 50
            y:527
            text: "تعداد کالا"
            font.family: viewset.danaFuNumBoldFont
            font.bold: false
            font.pixelSize: 12
            color: viewset.primaryColor
        }
        Label{
            id:lblCountFactorBind
            anchors.horizontalCenter: lblCountFactor.horizontalCenter
            y:551
            text: obj_LogicContainer.shoppage.productsmodel.totalcount
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            font.pixelSize: 16
            color: "#A3A2B3"
        }
    }
    Rectangle{
        id:specialOfferContainer
        anchors.fill: parent
        color: viewset.backgroundColor
        visible: false
        x:320
        Image {
            source: "../Assets/backbutton.png"
            x:883
            y:38
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    rootContainer.visible = true
                    specialOfferContainer.visible = false
                }
            }
        }
        Label{
            text:"تخفـیفات ویـژه"
            x:574
            y:34
            font.family: viewset.danaFuNumBoldFont
            font.bold: true
            font.pixelSize: 32
        }
        Rectangle{
            id:rectSpecialOffers
            x:352
            y:115
            radius: 15
            width: 640
            height: parent.height - 130
            clip: true

            GridView {
                width: 640
                height: parent.height - 130
                anchors.fill: parent
                cellWidth: 207
                cellHeight: 197
                model: obj_LogicContainer.shoppage.specialOffer

                delegate: Item {
                    width: 207
                    height: 197
                    Rectangle {
                        anchors.fill: parent
                        color: "transparent"
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle{
                            width: 180
                            height: 197
                            anchors.horizontalCenter: parent.horizontalCenter
                            Rectangle{
                                width: 46
                                height: 23
                                color: "#E45F2B"
                                radius: 50
                                x:140
                                y:10
                                z:10
                                Label {
                                    text: (100-((model.finalprice*100)/model.price)).toFixed(0) + "%"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.family: viewset.danaFuNumBoldFont
                                    y:3
                                    font.pixelSize: 14
                                    font.bold: true
                                    //anchors.right: factorItemPrice.left
                                    elide: Text.ElideRight
                                    color: "white"
                                }
                            }
                            Image {
                                source: model.pic
                                width: 120
                                height: 120
                                asynchronous: true 
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                            Label{
                                text: model.name
                                font.family: viewset.danaFuNumFont
                                font.pixelSize: 10
                                width: parent.width
                                height: 32
                                wrapMode: Text.Wrap
                                elide: Text.ElideRight
                                y:134
                            }
                            Label{
                                text:qsTr("%L1").arg(model.finalprice) + " ریال "
                                font.family: viewset.danaFuNumFont
                                font.pixelSize: 10
                                wrapMode: Text.Wrap
                                y:170
                                x:12
                            }

                        }

                        Rectangle{
                            id:rightLineSplitter
                            anchors.right: parent.right
                            width: 1
                            height: parent.height - 34
                            anchors.verticalCenter: parent.verticalCenter
                            color: viewset.backgroundColor
                            Image {
                                source: "../Assets/Discount.png"
                                anchors.top: rightLineSplitter.bottom
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.topMargin: 2
                            }
                        }
                        Rectangle{
                            id:bottomLineSplitter
                            anchors.bottom: parent.bottom
                            width: parent.width - 34
                            height: 1
                            anchors.horizontalCenter: parent.horizontalCenter
                            color: viewset.backgroundColor
                        }
                    }

                }
            }
        }
        DropShadow {
            id: specualShadow
            anchors.fill: source
            cached: true
            radius: 16.0
            samples: 30
            color: "#10000000"
            smooth: true
            source: rectSpecialOffers

        }
    }
    Rectangle{
        id:menuContainer
        width: 320
        height: parent.height
        color: "white"
        FasketProto{

        }
//        Image {
//            id: imgCertificate
//            source: "../Assets/Certificate.png"
//            x:260
//            y:36
//            MouseArea{
//                anchors.fill: parent
//                onClicked: {
//                    obj_LogicContainer.shoppage.bypassClicked()
//                }
//            }
//        }
        Image {
            id: imgSetting
            source: "../Assets/setting.png"
            x:208
            y:36
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //obj_LogicContainer.shoppage.bypassClicked()
                }
            }
        } 
        Rectangle{
            id:stopAlert
            color: "#191641"
            width: 280
            height: 140
            radius: 15
            x:20
            y:-69
            //y:115
            visible: false
            Image {
                width: 37
                height: 48
                source: "../Assets/handStop.png"
                anchors.verticalCenter: parent.verticalCenter
                x:212
            }
            Label{
                text: "لطفا حرکت نکنید!"
                color: "white"
                anchors.verticalCenter: parent.verticalCenter
                font.family: viewset.danaFuNumBoldFont
                x:31
                font.pixelSize: 24
                font.bold: true
            }
        }
        PropertyAnimation{
            id:stopAnimation
            target: stopAlert
            properties: "y"
            duration: 500
            from:-69
            to:115
        }
        PropertyAnimation{
            id:stopAnimationInvis
            target: stopAlert
            properties: "y"
            duration: 500
            from:115
            to:-69
        }

        Rectangle{
            id:rectSpetialOffers
            color: "white"
            width: 280
            height: 235
            radius: 15
            x:20
            z:100
            anchors.top:stopAlert.bottom
            anchors.topMargin: 40

            Image {
                height: 245
                x: -15
                source: "../Assets/Recommended.png"

                ListView {
                    id:slideshow
                    anchors.fill: parent
                    clip: true
                    spacing: 0
                    model: obj_LogicContainer.shoppage.specialOffer
                    orientation: ListView.Horizontal
                    delegate:
                        Item {
                        width: 150
                        height: 230
                        Rectangle{
                            id:spo1
                            width: 110
                            height: 165
                            x:14
                            y:53
                            Image {
                                source: model.pic
                                width: parent.width
                                height: 100
                                asynchronous: true 
                            }
                            Label{
                                text: model.name
                                font.family: viewset.danaFuNumFont
                                font.pixelSize: 12
                                width: parent.width
                                height: 50
                                wrapMode: Text.Wrap
                                elide: Text.ElideRight
                                y:100
                            }
                            Rectangle{
                                width: 37
                                height: 19
                                color: "#E45F2B"
                                radius: 50
                                x:80
                                y:0
                                Label {
                                    text: (100-((model.finalprice*100)/model.price)).toFixed(0) + "%"
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.family: viewset.danaFuNumBoldFont
                                    y:3
                                    font.pixelSize: 11
                                    font.bold: true
                                    elide: Text.ElideRight
                                    color: "white"
                                }
                            }
                            Label{
                                id:lblSpo1FinalPrice
                                font.pixelSize: 16
                                font.bold: true
                                font.family: viewset.danaFuNumBoldFont
                                text:qsTr("%L1").arg(model.finalprice) + " ریال "
                                color: viewset.primaryColor
                                y:140
                                anchors.horizontalCenter: parent.horizontalCenter
                            }
                        }
                        Rectangle{
                            width: 1
                            height: 153
                            x:140
                            y:58
                            color: "#DADAE1"
                        }
                    }
                    preferredHighlightBegin: width / 2
                    preferredHighlightEnd: width / 2
                    highlightRangeMode: ListView.StrictlyEnforceRange
                    //Component.onCompleted: currentIndex = count / 2
                }
            }
            Timer {
                running: true
                repeat: true
                interval: 2000
                onTriggered: {
                    //console.log(slideshow.currentIndex)
                    var nextIndex = (slideshow.currentIndex + 1) % slideshow.count
                    //console.log("NEXT: "+nextIndex)
                    slideshow.currentIndex = nextIndex
                }
            }
        }
        Rectangle{
            id:rectAds

            width: 280
            height: 140
            x:20
            y:367
            radius: 15


            Image
            {
                id:imgAds
                source: "../Assets/adbanner.png"
                property bool rounded: true
                property bool adapt: true

                layer.enabled: rounded
                layer.effect: OpacityMask
                {
                    maskSource: Item {
                        width: imgAds.width
                        height: imgAds.height
                        Rectangle {
                            anchors.centerIn: parent
                            width: imgAds.adapt ? imgAds.width : Math.min(imgAds.width, imgAds.height)
                            height: imgAds.adapt ? imgAds.height : width
                            radius: 15
                        }
                    }
                }
            }
        }

        DropShadow {
            id: rectAdshadow
            anchors.fill: source
            cached: true
            radius: 16.0
            samples: 30
            color: "#19000000"
            smooth: true
            source: rectAds
            verticalOffset:  5

        }

        KImageRightButton{
            imagesource: "../../Assets/QuestionIcon.png"
            width: 135
            height: 45
            radius: 15
            text: "راهنمای خرید"
            pixelSize: 14
            x:165
            y:531
            imagewidth: 19
            imageheight: 19
            imageX: 100
            mouseField.onClicked: {
                stackview.push(tutrial)
            }
        }
        KImageRightButton{
            imagesource: "../../Assets/Discounticon2.png"
            width: 135
            height: 45
            radius: 15
            text: "تخفیفات ویژه"
            pixelSize: 14
            x:20
            y:531
            imagewidth: 19
            imageheight: 19
            imageX: 103
            mouseField.onClicked:{
                rootContainer.visible = false
                specialOfferContainer.visible = true
            }
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
    Image {
        id: blur
        source: "../Assets/blur.png"
        visible: false
        anchors.fill: parent
    }
    // ShaderEffectSource {
    //     id: effectSource
    //     sourceItem: parent
    //     anchors.fill: parent
    //     sourceRect: Qt.rect(x,y, width, height)
    // }
    // FastBlur{
    //     id: blur
    //     anchors.fill: effectSource
    //     visible: false
    //     cached: true
    //     source: effectSource
    //     radius: 50
    // }
    Component{
        id:tutrial
        Tutorial{

        }
    }

    Component{
        id:newProductHandler
        BarcodeScanned{
            tanzimat:obj_LogicContainer
        }
    }
    Component{
        id:lstProductHandler
        LstFactorProducts{
            tanzimat:obj_LogicContainer
        }
    }
    property bool showlastManualBarcode: false
    Component{
        id:manualBarcodeHandler
        ManualBarcode{
            id:mb
            tanzimat: obj_LogicContainer
            showlastproduct: showlastManualBarcode
        }
    }
    Component{
        id:checklisthandler
        CheckList{
            tanzimat: obj_LogicContainer
        }
    }

    Message{
        id:popUpMessage
        onCerClicked:{
            obj_LogicContainer.shoppage.bypassClicked()
        }
    }
    Message{
        id:popUpMessageNotBarcodedProduct
        messageText: "لطفا محصولی را که مقابل بارکدخوان گرفتید، داخل سبد بگذارید!"
        onCerClicked: {
            obj_LogicContainer.shoppage.bypassClicked()
        }
    }
    Message{
        id:popUpMessageNoBarcodeScanned
        messageText: "ابتدا بارکد محصول را مقابل بارکدخوان بگیرید، سپس در سبد قرار دهید!"
        onCerClicked: {
            obj_LogicContainer.shoppage.bypassClicked()
        }
    }
    FullMessage{
        id:popUpMessageNotAllowedChangeWeight
        messageText: "در مرحله پرداخت نمی توانید محصولی به سبد اضافه یا کم کنید!"
        obj:obj_LogicContainer
    }
    FullMessage{
        id:popUpMessageNotAllowedToAddProduct
        messageText: "در این مرحله نمیتوانید محصولی به سبد اضافه کنید. لطفا محصولات جدید را از  سبد خارج کنید."
        obj:obj_LogicContainer
    }
    NotifRemoveProduct{
        id:popUpRemoveProduct
        tanzimat: obj_LogicContainer
    }
    MessageTimer{
        id:popUpMessageTimer
        onWhenClose: {
            blur.visible = false
        }
        onCerClicked: {
            obj_LogicContainer.shoppage.bypassClicked()
        }
    }

    FullMessageTimer{
        id:popUpFullMessageTimer
    }

    Timer {
        id: accetedByPass
        interval: 500
        onTriggered:
        {
            obj_LogicContainer.shoppage.bypassAcceptClicked()
        }

        repeat: false
        running: false
    }

    Bypass{
        id:popUpBypass
        tanzimat : obj_LogicContainer
        onOk:{
            busyIndicator.visible = true
            accetedByPass.running = true
            //popUpBypass.close()
        }
    }
    KBusyIndicator{
        id:busyIndicator
        visible:false
    }
    AreYouSure{
        id:popUpSureToPay
        messageText: "آیا خریدتان تمام شده است؟"
        onOk: {
            stackview.push(checklisthandler)
            popUpSureToPay.close()
        }
        onCancell:{
            obj_LogicContainer.shoppage.btnCancelEndShopClicked()
        }
    }

    Connections{
        target: obj_LogicContainer.shoppage
        function onShowStartUpShoppingLabel(v){
            imgBasketNotStarted.visible = v
        }
        function onShowNewProductHandler(){
            stackviewContainer.push(newProductHandler)
            stopAlert.visible = true
            stopAnimation.running = true
        }
        function onCloseNewStackViewtHandler(){
            stackviewContainer.pop()
            stopAlert.visible = false
            stopAnimationInvis.running = true
        }
        function onOpenPopupMessage(text){
            popUpMessage.messageText = text
            popUpMessage.open()
            blur.visible = true
        }
        function onClosePopupMessage(){
            popUpMessage.close()
            blur.visible = false
        }
        function onOpenPopupDeleteProduct(){
            popUpRemoveProduct.open()
            blur.visible = true
        }
        function onClosePopupDeleteProduct(){
            popUpRemoveProduct.close()
            blur.visible = false
        }
        function onOpenPopupMessageTimer(text){
            popUpMessageTimer.messageText = text
            popUpMessageTimer.open()
            blur.visible = true
        }
        function onOpenPopupFullMessageTimer(text){
            popUpFullMessageTimer.messageText = text
            popUpFullMessageTimer.open()
        }
        function onClosePopupMessageTimer(){
            popUpMessageTimer.close()
            blur.visible = false
        }
        function onOpenPopupNotbarcodedProduct(){
            popUpMessageNotBarcodedProduct.open()
            blur.visible = true
        }
        function onClosePopupNotbarcodedProduct(){
            popUpMessageNotBarcodedProduct.close()
            blur.visible = false
        }
        function onOpenPopUpMessageNotAllowedToAddProduct(){
            popUpMessageNotAllowedToAddProduct.open()
        }
        function onClosePopUpMessageNotAllowedToAddProduct(){
            popUpMessageNotAllowedToAddProduct.close()
        }
        function onOpenPopUpMessageNotAllowedChangeWeight(){
            popUpMessageNotAllowedChangeWeight.open()
            blur.visible = true
        }
        function onClosePopUpMessageNotAllowedChangeWeight(){
            popUpMessageNotAllowedChangeWeight.close()
            blur.visible = false
        }
        function onOpenPopupNoBarcodeScanned(){
            popUpMessageNoBarcodeScanned.open()
            blur.visible = true
        }
        function onClosePopupNoBarcodeScanned(){
            popUpMessageNoBarcodeScanned.close()
            blur.visible = false
        }
        function onShowManualBarcode(){
            if(obj_LogicContainer.shoppage.lastManualBarcodeProduct.finalprice > 0)
            {
                showlastManualBarcode = true
            }
            stackviewContainer.push(manualBarcodeHandler)
        }
        function onOpenPopupByPass(){

            popUpBypass.open()
        }
        function onClosePopupByPass(){
            popUpBypass.close()
            busyIndicator.visible = false
        }
        function onHideSpecialOffers(){
            specialOfferContainer.visible = false
            rootContainer.visible = true
        }
        function onGotoCheckList(){
            popUpSureToPay.open()
        }

        function onOpenIndicator(){
            busyIndicator.visible = true
        }
        function onCloseIndicator(){
            busyIndicator.visible = false
        }
        function onCloseAllPopUps(){
            popUpMessage.close()
            popUpRemoveProduct.close()
            popUpMessageTimer.close()
            popUpMessageNotBarcodedProduct.close()
            popUpMessageNotAllowedToAddProduct.close()
            popUpMessageNotAllowedChangeWeight.close()
            popUpMessageNoBarcodeScanned.close()
            popUpBypass.close()
            busyIndicator.visible = false
            blur.visible = false
        }
    }
}

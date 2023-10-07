import QtQuick 2.0
import QtQuick.Controls 2.15
import "../Utiles"


ScrollView {


    anchors.fill: parent
    clip: true
    contentHeight: questionContainer.height+questionContainer2.height+questionContainer3.height+questionContainer4.height+questionContainer5.height+100

    Rectangle {
        id: questionContainer
        color: viewset.primaryColor
        height: 57
        width: 744
        radius: 20
        clip: true

        property bool colapsed: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:{
                colapsHandler()
            }

            Text {
                id:question
                text: "چگونه محصول را در سبد قرار دهم؟"
                anchors.verticalCenter: parent.right
                anchors.rightMargin: 24.6
                font.pixelSize: 16
                anchors.right:  parent.right
                y:15
                color: "white"
                font.family: viewset.danaFuNumFont
            }

            Image {
                id:img1
                source: "../../Assets/Down.png"
                width: 17
                height: 14
                anchors.left: parent.left
                anchors.leftMargin: 24.6
                y: 21.4
            }

            Text {
                id:answer
                width: parent.width - 20
                anchors.verticalCenter: parent.right
                y: 57
                font.pixelSize: 16
                text:"ابتدا محصول را جلوی بارکدخوان بگیرید و سپس هر تعداد از محصول را که قصد خرید دارید، در سبد قرار دهید."
                wrapMode: Text.Wrap
                anchors.right:  parent.right
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 16
                font.family: viewset.danaFuNumFont
            }

        }
    }

    Rectangle {
        id: questionContainer2
        color: viewset.primaryColor
        height: 57
        width: 744
        radius: 20
        clip: true
        y:20+questionContainer.height

        property bool colapsed: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:{
                colapsHandler2()
            }

            Text {
                id:question2
                text: "آیا میتوانم سوابق خرید خود را مشاهده کنم؟"
                anchors.verticalCenter: parent.right
                anchors.rightMargin: 24.6
                font.pixelSize: 16
                anchors.right:  parent.right
                y:15
                color: "white"
                font.family: viewset.danaFuNumFont
            }

            Image {
                id:img2
                source: "../../Assets/Down.png"
                width: 17
                height: 14
                anchors.left: parent.left
                anchors.leftMargin: 24.6
                y: 21.4
            }

            Text {
                id:answer2
                width: parent.width - 20
                anchors.verticalCenter: parent.right
                y: 57
                font.pixelSize: 16
                text: "در صورتی که با شماره همراه خود وارد شوید، می‌توانید در خرید بعدی سوابق خرید خود را مشاهده کنید."

                wrapMode: Text.Wrap
                anchors.right:  parent.right
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 16
                font.family: viewset.danaFuNumFont
            }

        }
    }
    Rectangle {
        id: questionContainer3
        color: viewset.primaryColor
        height: 57
        width: 744
        radius: 20
        clip: true
        y:20+questionContainer2.height+questionContainer2.y

        property bool colapsed: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:{
                colapsHandler3()
            }

            Text {
                id:question3
                text: "چگونه پرداخت خود را انجام دهم؟"
                anchors.verticalCenter: parent.right
                anchors.rightMargin: 24.6
                font.pixelSize: 16
                anchors.right:  parent.right
                y:15
                color: "white"
                font.family: viewset.danaFuNumFont
            }

            Image {
                id:img3
                source: "../../Assets/Down.png"
                width: 17
                height: 14
                anchors.left: parent.left
                anchors.leftMargin: 24.6
                y: 21.4
            }

            Text {
                id:answer3
                width: parent.width - 20
                anchors.verticalCenter: parent.right
                y: 57
                font.pixelSize: 16
                text: "۱. می‌توانید در درگاه آنلاین پرداخت، هزینه فاکتور خود را بپردازید.\n
                       ۲. در زمان پرداخت یک کد اختصاصی به شما نمایش داده می‌شود که کافی است آن را به صندوق‌دار ارائه نمائید."
                wrapMode: Text.Wrap
                anchors.right:  parent.right
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 16
                font.family: viewset.danaFuNumFont
            }

        }
    }
    Rectangle {
        id: questionContainer4
        color: viewset.primaryColor
        height: 57
        width: 744
        radius: 20
        clip: true
        y:20+questionContainer3.height+questionContainer3.y

        property bool colapsed: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:{
                colapsHandler4()
            }

            Text {
                id:question4
                text: "با سبد هوشمند به چه میزان، میتوانم خرید کنم؟"
                anchors.verticalCenter: parent.right
                anchors.rightMargin: 24.6
                font.pixelSize: 16
                anchors.right:  parent.right
                y:15
                color: "white"
                font.family: viewset.danaFuNumFont
            }

            Image {
                id:img4
                source: "../../Assets/Down.png"
                width: 17
                height: 14
                anchors.left: parent.left
                anchors.leftMargin: 24.6
                y: 21.4
            }

            Text {
                id:answer4
                width: parent.width - 20
                anchors.verticalCenter: parent.right
                y: 57
                font.pixelSize: 16
                text: "در حال حاضر می‌توانید ۱۰ نوع محصول را خریداری نمائید."
                wrapMode: Text.Wrap
                anchors.right:  parent.right
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 16
                font.family: viewset.danaFuNumFont
            }

        }
    }
    Rectangle {
        id: questionContainer5
        color: viewset.primaryColor
        height: 57
        width: 744
        radius: 20
        clip: true
        y:20+questionContainer4.height+questionContainer4.y

        property bool colapsed: false

        MouseArea
        {
            anchors.fill: parent
            onClicked:{
                colapsHandler5()
            }

            Text {
                id:question5
                text: "آیا ورود به صفحه کاربری الزامی است؟"
                anchors.verticalCenter: parent.right
                anchors.rightMargin: 24.6
                font.pixelSize: 16
                anchors.right:  parent.right
                y:15
                color: "white"
                font.family: viewset.danaFuNumFont
            }

            Image {
                id:img5
                source: "../../Assets/Down.png"
                width: 17
                height: 14
                anchors.left: parent.left
                anchors.leftMargin: 24.6
                y: 21.4
            }

            Text {
                id:answer5
                width: parent.width - 20
                anchors.verticalCenter: parent.right
                y: 57
                font.pixelSize: 16
                text: " خیر، ولی مشتریانی که به صفحه کاربری خود وارد شوند،  علاوه بر مشاهده سابقه خرید خود، می‌توانند هزینه‌ های خود را کنترل کنند و مدیریت بیشتری بر روی مصرف خود داشته باشند."
                wrapMode: Text.Wrap
                anchors.right:  parent.right
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.topMargin: 16
                font.family: viewset.danaFuNumFont
            }

        }
    }

    function colapsHandler(){
        if(questionContainer.colapsed === false)
        {
            img1.rotation =180
            questionContainer.height = answer.height +65
            questionContainer.colapsed = true
        }
        else if(questionContainer.colapsed === true)
        {
            img1.rotation =0
            questionContainer.height=60
            questionContainer.colapsed =false
        }
    }
    function colapsHandler2(){
        if(questionContainer2.colapsed === false)
        {
            img2.rotation =180
            questionContainer2.height = answer.height +65
            questionContainer2.colapsed = true
        }
        else if(questionContainer2.colapsed === true)
        {
            img2.rotation =0
            questionContainer2.height=60
            questionContainer2.colapsed =false
        }
    }
    function colapsHandler3(){
        if(questionContainer3.colapsed === false)
        {
            img3.rotation =180
            questionContainer3.height = answer.height +65
            questionContainer3.colapsed = true
        }
        else if(questionContainer3.colapsed === true)
        {
            img3.rotation =0
            questionContainer3.height=60
            questionContainer3.colapsed =false
        }
    }
    function colapsHandler4(){
        if(questionContainer4.colapsed === false)
        {
            img4.rotation =180
            questionContainer4.height = answer.height +65
            questionContainer4.colapsed = true
        }
        else if(questionContainer4.colapsed === true)
        {
            img4.rotation =0
            questionContainer4.height=60
            questionContainer4.colapsed =false
        }
    }
    function colapsHandler5(){
        if(questionContainer5.colapsed === false)
        {
            img5.rotation =180
            questionContainer5.height = answer.height +150
            questionContainer5.colapsed = true
        }
        else if(questionContainer5.colapsed === true)
        {
            img5.rotation =0
            questionContainer5.height=60
            questionContainer5.colapsed =false
        }
    }



}

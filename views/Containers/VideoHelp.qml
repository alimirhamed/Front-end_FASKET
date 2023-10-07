import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtMultimedia 5.15

// import QtWebView 1.1


Item {
    anchors.fill: parent

    Component.onCompleted: {
        video.play()
    }



    Rectangle
    {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        width: 560
        height: 315
        radius: 15


        // WebView {
        //         id: webView
        //         anchors.fill: parent
        //         url: "https://www.google.com/"
        //         onLoadingChanged: {
        //             if (loadRequest.errorString)
        //                 console.error(loadRequest.errorString);
        //         }
        //     }
        Video
        {
            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: parent
            }
            width: parent.width
            height: parent.height
            id:video
            source: "file:/home/kast/help.mp4"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    video.play()
                    //parent.parent.color="yellow"
                }
                onDoubleClicked: {
                    video.playbackState === MediaPlayer.PlayingState ? video.pause() : video.play()
                }
            }
            volume: 1
            focus: true
            Keys.onSpacePressed: video.playbackState === MediaPlayer.PlayingState ? video.pause() : video.play()
            Keys.onLeftPressed: video.seek(video.position - 5000)
            Keys.onRightPressed: video.seek(video.position + 5000)
        }
    }
}

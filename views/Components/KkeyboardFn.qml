import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle{
    signal shiftClicked(state:int);
    signal input(key:string);
    signal close();
    signal enter();
    signal backspace();
    anchors.horizontalCenter: parent.horizontalCenter
    width: 950
    height: 230
    color: "white"
    Grid {

        anchors.horizontalCenter: parent.horizontalCenter
        rows: 5
        columns: 1
        spacing: 2
        Row{
            spacing: 2
            Button{

                width: 56
                text: "1"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "2"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "3"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "4"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "5"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "6"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "7"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "8"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "9"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "0"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "-"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "="
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 114
                text: "<--"
                onClicked: {
                    parent.parent.parent.backspace()
                }
            }
        }
        Row{
            spacing: 2
            Button{
                width: 56
                text: "@"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "#"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "$"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "%"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "^"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "&"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "\&"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "*"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "("
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: ")"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "["
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "]"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 114
                text: "\\"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
        }
        Row{
            spacing: 2
            Button{
                width: 56
                text: "!"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "\""
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "<"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: ">"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: ":"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "."
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "?"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: ";"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "ddd"
                opacity: 0
            }
            Button{
                width: 56
                text: "ddd"
                opacity: 0
            }
            Button{
                width: 56
                text: "'"
                opacity: 0
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 172
                text: "enter"
                onClicked: {
                    parent.parent.parent.enter()
                }
            }
        }

        Row{
            spacing: 2
            Button{
                width: 114
                text: "123 ..."
                onClicked: {
                    parent.parent.parent.shiftClicked(3);
                }
            }
            Button{
                width: 56
                text: "fn"
                onClicked: {
                    parent.parent.parent.shiftClicked(2);
                }
            }
            Button{
                width: 462
                text: "space"
                onClicked: {
                    parent.parent.parent.input(" ")
                }
            }
            Button{
                width: 56
                text: "fn"

                onClicked: {
                    parent.parent.parent.shiftClicked(2)
                }
            }
            Button{
                width: 114
                text: "close"
                onClicked: {
                    parent.parent.parent.close();
                }
            }
        }
    }
}

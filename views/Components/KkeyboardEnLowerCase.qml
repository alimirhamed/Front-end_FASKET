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
                text: "q"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "w"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "e"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "r"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "t"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "y"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "u"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "i"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "o"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "p"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "{"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "}"
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
                text: "a"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "s"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "d"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "f"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "g"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "h"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "j"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "k"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "l"
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
                text: "'"
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
                text: "shift"
                onClicked: {
                    parent.parent.parent.shiftClicked(1)
                }
            }
            Button{
                width: 56
                text: "z"

                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "x"

                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "c"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "v"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "b"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "n"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: "m"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 56
                text: ","
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
                text: "/"
                onClicked: {
                    parent.parent.parent.input(this.text)
                }
            }
            Button{
                width: 114
                text: "shift"
                onClicked: {
                    parent.parent.parent.shiftClicked(1)
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
                    parent.parent.parent.shiftClicked(3)
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
                    parent.parent.parent.shiftClicked(3)
                }
            }
            Button{
                width: 114
                text: "close"

                onClicked: {
                    parent.parent.parent.close()
                }
            }
        }
    }
}

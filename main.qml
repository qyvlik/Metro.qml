import QtQuick 2.3
import "./Component"

MetroWindow {
    id:window;
    title:"SmartQQ"
    content: Rectangle {
        border.width: 1;
        border.color:"#ccc";
        Row{
            anchors.centerIn: parent;
            Image{
                id:image;
                source:"./Image/me.png";
                width: 64;
                height: 64;
            }
            spacing: 10;
            Column {
                MetroTextField{
                    placeholderText:"Input QQ";
                }
                MetroTextField{
                    placeholderText:"Input password";
                    echoMode:TextInput.Password ;
                    MetroTooltip{
                        id:tip;
                        text:"大写锁定键开启";
                        width: 150;
                        height: 60;
                        anchors.bottom: parent.top;
                        anchors.bottomMargin: -25
                        anchors.left: parent.right;
                        anchors.leftMargin: width / 2;
                    }
                }

                MetroCheckBox{
                    text:"remenber password";
                }
                MetroButton{
                    text:"Login...";
                    width: 90;
                    height: 40;
                }
                spacing: 10;
                id:t;
            }
        }
    }
}

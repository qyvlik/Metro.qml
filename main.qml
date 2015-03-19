import QtQuick 2.3
import QtQuick.Controls 1.3
import "./Component"
import "./resources" as Resources;

MetroWindow {
    id:window;
    title:"Metro UI";
    Resources.MetroFontLoader{
        id:fontLoader;
    }

    content:
        /*
        Rectangle {
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
    //*/

    //*/
    MetroTabView{
        Tab{
            title:"MetroButton";
            Item{
                MetroButton{
                    text:"MetroButton";
                    anchors.centerIn: parent;
                }
            }
        }
        Tab{
            title:"MetroCheckBox";
            Item{
                MetroCheckBox{
                    text:"MetroCheckBox";
                    anchors.centerIn: parent;
                }
            }
        }
        Tab{
            title:"MetroProgressBar";
            Item{
                Text{
                    font.family: fontLoader.name;
                    text:progressBar.value +"%";
                    anchors.bottom: progressBar.top;
                    anchors.left: progressBar.left;
                }

                MetroProgressBar{
                    id:progressBar;
                    value:0;
                    anchors.centerIn: parent;
                    Timer{
                        id:t;
                        interval: 100;
                        running: true;
                        repeat: true;
                        onTriggered: {
                            if(parent.value++ >= parent.maximumValue){
                                parent.value=0;
                            }
                        }
                    }
                }
            }
        }
        Tab{
            title:"MetroTextField";
            Item{
                MetroTextField{
                    placeholderText:"MetroTextField";
                    anchors.centerIn: parent;
                }
            }
        }
    }
    //*/
}

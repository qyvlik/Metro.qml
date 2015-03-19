import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0

import "../resources" as Resources;

ApplicationWindow {
    id:window;
    title: qsTr("Hello World");
    width: 640
    height: 480
    flags: Qt.FramelessWindowHint| Qt.WindowSystemMenuHint| Qt.WindowMinimizeButtonHint| Qt.Window;

    readonly property alias fondLoder: titleFont;
    Resources.MetroFontLoader{
        id: titleFont
    }

    property alias content : contentMetroWindow.sourceComponent;
    Loader {
        id: contentMetroWindow
        anchors{
            fill:parent; // don't use window id
            topMargin: toolbarWindow.height;
        }
        width: window.width
        height: window.height - toolbarWindow.height;
    }

    Image {
        //! have a bug !!
        //! window's width and height will to be zero!!
        id:scale;
        source: "../resources/icons/scale.png"
        width: 10;
        height: 10;
        anchors{
            bottom: parent.bottom;
            right: parent.right;
        }
        MouseArea {
            // 鼠标拖拽窗口大小
            anchors.fill: parent
            property variant previousPosition
            onPressed: {
                previousPosition = Qt.point(mouseX, mouseY);
            }
            onPositionChanged: {
                if (pressedButtons == Qt.LeftButton) {
                    var dx = mouseX - previousPosition.x;
                    var dy = mouseY - previousPosition.y;
                    if( !(-dx >= window.width || -dy >= window.height) ) {
                        window.width += dx;
                        window.height += dy;
                    }
                }
            }
        }
    }

    style: ApplicationWindowStyle {
        id: styleWindow;
        background: Rectangle{
            color: "white"
        }
    }

    readonly property int normalShow : 1;
    readonly property int fullShow : 2;
    readonly property int maxShow : 3;
    readonly property int minShow : 4;

    property int showState: 0; // 0,1,2,3,4 show, showNormal, showFullScreen, showMaxmized, showMinmized



    toolBar :
        Rectangle{
        id: toolbarWindow;
        width: window.width;
        height: 30;
        property alias fontLoder:window.fondLoder;
        MouseArea {
            // 鼠标拖拽窗口移动
            anchors.fill: parent
            property variant previousPosition
            onPressed: {
                previousPosition = Qt.point(mouseX, mouseY);
            }
            onPositionChanged: {
                if (pressedButtons == Qt.LeftButton) {
                    var dx = mouseX - previousPosition.x
                    var dy = mouseY - previousPosition.y
                    window.x = window.x + dx
                    window.y = window.y + dy
                }
            }
            onDoubleClicked: {
                if(window.showState != 3) {
                    window.showMaximized();
                    window.showState = 3;
                } else {
                    window.showNormal();
                    window.showState = 1;
                }
            }
        }

        GridLayout{
            id: windowTitle

            anchors.left: toolbarWindow.left
            anchors.verticalCenter: toolbarWindow.verticalCenter
            anchors.leftMargin: 10

            Text {
                id: textTitle
                text:window.title;
                font.pixelSize: 16
                font.weight: Font.DemiBold
                font.family: toolbarWindow.fontLoder.name
                color: "black"
            }
        }

        GridLayout {
            id: windowButtonSystem

            anchors.right: toolbarWindow.right
            anchors.verticalCenter: toolbarWindow.verticalCenter
            columns: 3

            focus:true;
            Keys.onPressed: {
                if(event.key == Qt.Key_F12) {
                    if(window.showState != 2) {
                        window.showFullScreen();
                        window.showState = 2;
                    } else {
                        window.showNormal();
                        window.showState = 1;
                    }
                }
            }

            Button {
                id: minimizeButton
                iconSource: "../resources/icons/Minimize.png"

                style: ButtonStyle{
                    background: Rectangle{
                        color: "transparent"
                    }
                }
                MouseArea{
                    anchors.fill: minimizeButton
                    hoverEnabled: true
                    onClicked: {
                        window.showMinimized();
                        window.showState = 4;
                    }
                    onEntered: {
                        minimizeButton.iconSource = "../resources/icons/MinimizeHover.png"
                    }
                    onExited: {
                        minimizeButton.iconSource = "../resources/icons/Minimize.png"
                    }
                }
            }
            Button {
                id: maximizeButton
                iconSource: "../resources/icons/Maximize.png"

                style: ButtonStyle{
                    background: Rectangle{
                        color: "transparent"
                    }
                }
                MouseArea{
                    anchors.fill: maximizeButton
                    hoverEnabled: true
                    onClicked: {
                        maximizeButton.iconSource = maximizeButton.iconSource == "../resources/icons/Maximize.png" ?
                                    "../resources/icons/Maximize.png" : "../resources/icons/Restore.png";
                        if(window.showState != 3) {
                            window.showMaximized();
                            window.showState = 3;
                        } else {
                            window.showNormal();
                            window.showState = 1;
                        }
                    }
                    onEntered: {
                        maximizeButton.iconSource = maximizeButton.iconSource == "../resources/icons/MaximizeHover.png" ?"../resources/icons/RestoreHover.png" : "../resources/icons/MaximizeHover.png"
                    }
                    onExited: {
                        maximizeButton.iconSource = maximizeButton.iconSource == "../resources/icons/Maximize.png" ?
                                    "../resources/icons/Restore.png" : "../resources/icons/Maximize.png"
                    }
                }
            }
            Button {
                id: closeButton
                iconSource: "../resources/icons/Close.png"

                style: ButtonStyle{
                    background: Rectangle{
                        color: "transparent"
                    }
                }
                MouseArea{
                    anchors.fill: closeButton
                    hoverEnabled: true
                    onClicked: { window.close() }
                    onEntered: {
                        closeButton.iconSource = "../resources/icons/CloseHover.png"
                    }
                    onExited: {
                        closeButton.iconSource = "../resources/icons/Close.png"
                    }
                }
            }
        }
    }
}

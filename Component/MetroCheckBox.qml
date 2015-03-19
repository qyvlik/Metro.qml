import QtQuick 2.0
import QtQuick.Controls.Styles 1.3
import QtQuick.Controls 1.3
import "../resources" as Resources;

CheckBox {
    id:checkBox;
    text:"Metro check box"
    Resources.MetroFontLoader{
        id:fontLoder;
    }
    style: CheckBoxStyle {
        indicator: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
            radius: 0;

            border.color: control.activeFocus ? "black" : "gray"
            border.width: 2
            Rectangle {
                visible: control.checked
                color: "#1cbc9c"
                border.color: "#333"
                radius:0;
                anchors.margins: 4
                anchors.fill: parent
            }
        }
        label: Text{
            id:showText;
            text:checkBox.text;
            font.family: fontLoder.name;
            font.pixelSize: fontLoder.fontSize;
        }
    }
}

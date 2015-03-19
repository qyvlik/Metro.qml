import QtQuick 2.0
import "../resources" as Resources;

Item {
    id:root;
    height: 62;
    width: 100
    property alias text: t.text;
    MouseArea{
        anchors.fill: parent;
        drag.target: parent
        drag.axis: Drag.XAndYAxis
    }

    Resources.MetroFontLoader{
        id:fontLoder;
    }

    Rectangle{
        height: root.height - 25;
        width: root.width;
        color: "#537394";
        Text{
            id:t;
            anchors.fill: parent;
            color:"white";
            font.family: fontLoder.name;
            wrapMode: Text.WrapAnywhere;
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: fontLoder.fontSize - 3;
        }
        Rectangle{
            id:d;
            height: 25;
            width: 25
            rotation: 45;
            color: "#537394";
            z:parent.z - 1;
            transformOrigin:Item.Center;
            anchors.bottom: parent.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
        }
    }
}


import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import "../resources" as Resources;

TabView {
    id: frame
    anchors.fill: parent;
    anchors.margins: 4;
    Resources.MetroFontLoader{ id:fontLoder }

    style: TabViewStyle {
        frameOverlap: 10;
        tab: Rectangle {
            color: styleData.selected ? "#1bbc9c" :"#34495e";
            border.color: "#34495e";
            border.width: 1
            implicitWidth: Math.max(text.width + 4, 80);
            implicitHeight: 34
            Text {
                id: text
                anchors.centerIn: parent
                text: styleData.title
                color: "white";
                font.family: fontLoder.name;
                font.pixelSize: fontLoder.fontSize;
                font.bold: true;
            }
        }
        frame: Rectangle { color: "#34495e" }
        tabsMovable:true;
        tabBar:Rectangle{ color:"#1BA1E2"; }
    }
}

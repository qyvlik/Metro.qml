import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import "../resources" as Resources;

Button{
    id: button;

    readonly property alias fondLoder: titleFont;
    Resources.MetroFontLoader{
        id: titleFont
    }

    property color backgroundColor: pressed ? "#1e1e1e" : "#d8d8d8";
    property color fontgroundColor: pressed ? "white" : "black" ;

    style: ButtonStyle{
        background: Rectangle {
            color: button.backgroundColor
        }
        label: Component {
            Text {
                text: button.text
                font.weight: Font.DemiBold
                font.family: fondLoder.name
                font.pixelSize: 15
                color: button.fontgroundColor
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.fill: parent
            }
        }
    }
}


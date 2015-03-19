import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Slider {
    anchors.centerIn: parent
    style: SliderStyle {
        groove: Rectangle {
            implicitWidth: 200
            implicitHeight: 8
            color: "lightgray"
        }
        handle: Rectangle {
            anchors.centerIn: parent
            color: control.pressed ? "#1BA1E2" : "#00ABA9"
            implicitWidth: 25
            implicitHeight: 25
        }
    }
}

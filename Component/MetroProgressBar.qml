import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.3
import QtQuick 2.3

ProgressBar {

    maximumValue: 100
    minimumValue: 0

    style: ProgressBarStyle {
        background: Rectangle {
            radius: 2
            color: "#eaeaea"
            implicitWidth: 200
            implicitHeight: 10
        }
        progress: Rectangle {

            color: "#00b3ef"
            border.color: "#00b3ef"
        }
    }
}

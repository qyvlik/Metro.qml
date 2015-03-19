import QtQuick.Controls.Styles 1.2
import QtQuick.Controls 1.2
import QtQuick 2.3
import "../resources" as Resources;

TextField {
    id:textField;
    Resources.MetroFontLoader{ id:fontLoder; }
    placeholderText: qsTr("Metro text field");
    property color rightColor:(echoMode == TextInput.Password) ?"red":"#00ABA9"; // "#00ABA9"

    echoMode:TextInput.Normal;

    Keys.onPressed: {
        if(event.key == Qt.Key_Escape) {
            event.accepted = true;
            textField.focus = false;
        }
        if(event.key == Qt.Key_CapsLock) {
            event.accepted = true;
            console.debug("Caps Lock !");
        }
    }

    Text{
        id:text;
        font{
            family:fontLoder.name;
            pixelSize: fontLoder.fontSize;
            bold:false;
            //capitalization
            //italic:false;
            //letterSpacing
            //pixelSize
            //pointSize
            //strikeout
            //underline
            //weight
        }
    }

    style: TextFieldStyle {
        textColor: "black"
        background: Rectangle {
            Rectangle{
                id:rColor;
                height: parent.height;
                width: 5;
                color:rightColor;
            }

            implicitWidth: 200
            implicitHeight: 36
            border.color: "#ccc"
            border.width: 1
        }
        font:text.font;
    }
}

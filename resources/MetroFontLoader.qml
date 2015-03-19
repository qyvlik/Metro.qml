import QtQuick 2.4

FontLoader{
    id: titleFont;
    name: "Open Sans Light";
    source: "./fonts/OpenSans-Light.ttf";
    readonly property int fontSize: 20;
    /*
    property Text __t : Text{
        font{
            family: titleFont.name;
            bold: false;
        }
    }
    //*/
}

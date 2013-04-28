import QtQuick 2.0
import "./view/BarGraph"

Rectangle {
    width: 800
    height: 800
    color: "black"
    BarGraph{
        anchors.fill: parent
    }
}

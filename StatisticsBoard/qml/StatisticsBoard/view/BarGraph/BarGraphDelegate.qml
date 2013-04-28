import QtQuick 2.0

Item{
    id: container
    width: (ListView.view.width-ListView.view.spacing*(ListView.view.model.count-1))/ListView.view.model.count
    height: ListView.view.height

    Rectangle {
        height: datapointsValue/maxValue*(container.height-50)
        width: parent.width
        color: barColor
        radius: 3
        anchors.bottom: caption.top
    }

    Text {
        id: caption
        text: datapointsTitle
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
    }
}

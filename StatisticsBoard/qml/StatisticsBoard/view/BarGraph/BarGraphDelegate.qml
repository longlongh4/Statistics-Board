import QtQuick 2.0

Item{
    id: container
    width: (ListView.view.width-ListView.view.spacing*(ListView.view.model.count-1))/ListView.view.model.count
    height: ListView.view.height

    Text {
        id: valueText
        text: datapointsValue
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: barItem.top
        anchors.bottomMargin: 15
        color: "white"
    }

    Rectangle {
        id: barItem
        height: datapointsValue/maxValue*(container.height-100)
        width: parent.width
        color: barColor
        radius: 3
        anchors.bottom: caption.top
        Behavior on height {
             NumberAnimation { duration: 1000 }
        }
    }

    Text {
        id: caption
        text: datapointsTitle
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: "white"
    }
}

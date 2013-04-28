import QtQuick 2.0

Item{
    id: container

    Rectangle{
        id: titleArea
        anchors.left: parent.left
        anchors.right: parent.right
        height: 40
        Text {
            id: title
            text: dataModel.title
            anchors.centerIn: parent
        }
    }

    ListView{
        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: titleArea.bottom
        anchors.bottom: parent.bottom
        Rectangle{
            anchors.fill: parent
            color: "green"
            z:-1
        }

        delegate: Rectangle{
            width: 50
            height: 20
            color: "yellow"
        }
        BarGraphModel{
            id: dataModel
        }
        model:dataModel.listModel
    }
}

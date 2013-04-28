import QtQuick 2.0

Item{
    id: container

    Rectangle{
        id: titleArea
        anchors.left: parent.left
        anchors.right: parent.right
        height: 40
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#646464" }
            GradientStop { position: 1.0; color: "black" }
        }
        Text {
            id: title
            text: dataModel.title
            anchors.centerIn: parent
            color: "white"
            font.pointSize: 20
        }
    }

    ListView{
        id: listView
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: titleArea.bottom
        anchors.bottom: parent.bottom
        orientation: ListView.Horizontal
        spacing: 10
        Rectangle{
            anchors.fill: parent
            color: "black"
            z:-1
        }

        delegate: BarGraphDelegate{}
        BarGraphModel{
            id: dataModel
            listView: listView
        }
        model:dataModel.listModel
    }
}

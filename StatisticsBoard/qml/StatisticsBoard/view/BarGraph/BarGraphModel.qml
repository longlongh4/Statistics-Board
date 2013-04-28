import QtQuick 2.0
import "../../model"

Item{
    id: container
    property string title: ""
    property int refreshEveryNSeconds: 10
    property string url: "http://hackatus.herokuapp.com/summary.json"
    property alias listModel: listModel
    UrlGrabber{
        id: urlGrabber
        onDataReady: refreshData(result)
    }

    Timer{
        interval: refreshEveryNSeconds*1000; running: true; repeat: true
        triggeredOnStart: true
        onTriggered: urlGrabber.grabUrl(url)
    }

    function refreshData(data)
    {
        var jsonObject = JSON.parse(data)
        container.title = jsonObject.graph.title;
        var dataArray = jsonObject.graph.datasequences
        for(var i=0;i<dataArray.length;i++)
        {
            listModel.append({"barTitle":dataArray[i]["title"],"barColor":dataArray[i]["color"],"datapointsTitle":dataArray[i]["datapoints"][0]["title"],"datapointsValue":dataArray[i]["datapoints"][0]["value"]});
        }
    }
    ListModel {
        id: listModel
    }
}

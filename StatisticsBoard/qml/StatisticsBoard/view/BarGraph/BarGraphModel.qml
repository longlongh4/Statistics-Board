import QtQuick 2.0
import "../../model"

Item{
    id: container
    property string title: ""
    property int refreshEveryNSeconds: 1000
    property string url: "http://hackatus.herokuapp.com/summary.json"
    property alias listModel: listModel
    property Item listView: null
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
        var barWidth = (listView.width-(dataArray.length-1)*dataArray.spacing)/dataArray.length
        var maxValue = getMaxValue(dataArray);
        for(var i =0;i<dataArray.length;i++)
        {
            listModel.append({"maxValue":maxValue,"barWidth":barWidth,"barTitle":dataArray[i]["title"],"barColor":dataArray[i]["color"],"datapointsTitle":dataArray[i]["title"],"datapointsValue":dataArray[i]["datapoints"][0]["value"]});
        }
    }


    ListModel {
        id: listModel
    }

    function getMaxValue(dataArray)
    {
        var maxValue = 0;
        for(var i=0;i<dataArray.length;i++)
        {
            if(maxValue<dataArray[i]["datapoints"][0]["value"])
            {
                maxValue = dataArray[i]["datapoints"][0]["value"];
            }
            return maxValue;
        }
    }
}

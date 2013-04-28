import QtQuick 2.0
import "../../model"

Item{
    id: container
    property string title: ""
    property int refreshEveryNSeconds: 5
    property string url: "http://hackatus.herokuapp.com/summary.json"
    property alias listModel: listModel
    property Item listView: null
    property int maxValue: 0
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
        maxValue = getMaxValue(dataArray);
        var dataMap = {};
        for(var i =0;i<dataArray.length;i++)
        {
            dataMap[dataArray[i]["title"]] = dataArray[i];
        }
        updateItemInModel(dataMap);
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

    function updateItemInModel(dataMap)
    {
        for(var i=(listModel.count-1);i>=0;i--)
        {
            if(!dataMap[listModel.get(i).datapointsTitle])
            {
                listModel.remove(i,1);
            }
            else
            {
                var data = dataMap[listModel.get(i).datapointsTitle];
                listModel.setProperty(i,"maxValue",maxValue);
                listModel.setProperty(i,"datapointsValue",data["datapoints"][0]["value"])
                listModel.setProperty(i,"portraitUrl",data["datapoints"][0]["portait"])
                delete dataMap[listModel.get(i).datapointsTitle];
            }
        }
        for(var key in dataMap)
        {
            listModel.append({"maxValue":maxValue,"barTitle":dataMap[key]["title"],"barColor":dataMap[key]["color"],"datapointsTitle":dataMap[key]["title"],"datapointsValue":dataMap[key]["datapoints"][0]["value"],"portraitUrl":dataMap[key]["datapoints"][0]["portait"]});
        }
    }
}

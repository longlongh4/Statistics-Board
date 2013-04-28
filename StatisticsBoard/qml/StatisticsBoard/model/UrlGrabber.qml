import QtQuick 2.0

Item {
    signal dataReady(string result)
    function grabUrl(url)
    {
        var req = new XMLHttpRequest()
        req.onreadystatechange = function (){
            if (req.readyState == XMLHttpRequest.HEADERS_RECEIVED)
            {

            }
            else if (req.readyState == XMLHttpRequest.DONE)
            {
                dataReady(req.responseText)
            }
        }
        req.open("GET",url,true);
        req.send();
    }

    Component.onCompleted: {
        grabUrl("http://hackatus.herokuapp.com/summary.json")
    }


}

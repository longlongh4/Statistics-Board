import QtQuick 2.0

QtObject {
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
}

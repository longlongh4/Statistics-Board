import QtQuick 2.0
import "./model"

Rectangle {
    width: 360
    height: 360
    UrlGrabber{
        onDataReady: {
            console.log(result)
        }
    }
}

import QtQuick 2.0
import QtQuick.Particles 2.0

Item{
    id: container
    width: (ListView.view.width-ListView.view.spacing*(ListView.view.model.count-1))/ListView.view.model.count
    height: ListView.view.height

    property int abc: datapointsValue
    property int animationCount: 0
    onAbcChanged: {
        if(animationCount===0)
        {
            animationCount++;
        }
        else
        {
            playPortraitAnimation();
        }
    }

    function playPortraitAnimation(){
        animationList[Math.floor(Math.random() * 3)].start();
    }

    property var animationList: [portraitAnimation1,portraitAnimation2,portraitAnimation3]

    SequentialAnimation{id:portraitAnimation1;
        loops: 5
        NumberAnimation {  target: portrait; property: "anchors.bottomMargin"; from: 5; to:35; duration: 800; easing.type: Easing.InOutQuad }
        NumberAnimation {  target: portrait; property: "anchors.bottomMargin"; from: 35; to:5; duration: 800; easing.type: Easing.InOutQuad }
    }

    NumberAnimation { id:portraitAnimation2; target: portrait; property: "rotation"; from: 0; to:1800; duration: 8000; easing.type: Easing.InOutQuad }

    SequentialAnimation{id:portraitAnimation3;
        loops: 5
        NumberAnimation {  target: portrait; property: "scale"; from: 1; to:1.5; duration: 800; easing.type: Easing.InOutQuad }
        NumberAnimation {  target: portrait; property: "scale"; from: 1.5; to:1; duration: 800; easing.type: Easing.InOutQuad }
    }

    Image {
        id: portrait
        source: portraitUrl
        width: barItem.width/4*3
        height: width
        anchors.bottom: valueText.top
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
    }

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
        height: datapointsValue/maxValue*(container.height-160)
        width: parent.width
        color: barColor
        radius: 3
        anchors.bottom: caption.top
        Behavior on height {
            NumberAnimation { duration: 1000 ; easing.type: Easing.OutBack}
        }

        // Stars effect
        ParticleSystem {
            id: particleSystem
            anchors.fill: barItem
            paused: datapointsValue!==maxValue
            visible: !paused
            ImageParticle {
                source: "../../img/star.png"
                rotationVariation: 180
                color:barColor==="yellow"?"red":"white"
            }
            Emitter {
                id: particleEmitter
                anchors.fill: parent
                emitRate: 16
                lifeSpan: 2000
                size: 50
                sizeVariation: 16
                endSize: 8
                acceleration: PointDirection { y: 80; xVariation: 10 }
            }
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

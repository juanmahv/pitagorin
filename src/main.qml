/*
This file is part of Pitagorin.

    Pitagorin is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Foobar is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3

Window {
    id:mainRoot

    width:1700
    height: 900
    property real progress: 0.0
    property bool correct: operation.isCorrect
    property int currentImg: 0
    property bool done: bar.value === bar.maximumValue
    property int lowestCounter:10000
    onDoneChanged:{
        if (correct && (mytimer.counter < lowestCounter)){
            lowestCounter = mytimer.counter;
        }
    }

    property var picVisible: [
        false,
        false,
        false,
        false,
        false
    ]

    function setVisible(n)
    {
        var tmp = mainRoot.picVisible
        tmp[n] = true
        mainRoot.picVisible = tmp
    }

    function reset() {
        mainRoot.progress = 0.0
        operation.reload()
        bar.value = mainRoot.progress
        setVisible(currentImg)
        mainRoot.currentImg = (currentImg +1) % 5
        mytimer.counter = 0;
    }

    Connections {
        target: operation
        onPressed:{
            (correct) ? bar.increase() : bar.decrease();
        }
    }

    visible: true

    ImgRow {
        id: pics
        y:40
        anchors.horizontalCenter: parent.horizontalCenter
        z:2
    }

    OpForm {
          id:operation
          anchors.top: pics.bottom
          anchors.horizontalCenter:parent.horizontalCenter
    }

    Item {
        id:mytimer
        y:24
        width: 200
        anchors.top: operation.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        property int counter: 0

        Timer {
            interval: 1000; running: true; repeat: true
            onTriggered: { mytimer.counter++ }
        }

        Text {
            id: time
            font.pixelSize: 20
            text:"Segundos: "+mytimer.counter.toString()
        }

        Text {
            id: time2
            y:30
            font.pixelSize: 20
            visible: mainRoot.lowestCounter < 10000
            text:"Mejor Tiempo: "+mainRoot.lowestCounter.toString()+" segundos"
        }
    }

    ProgressBar {
        id:bar
        property int nquestions: 10
        width: parent.width-10
        height: 40

        x:5
        y:3

        function increase(){
            value += 1
        }

        function decrease(){
            value -= 1
        }

        anchors.horizontalCenterOffset: 6
        minimumValue: 0.0
        maximumValue: nquestions
        value:mainRoot.progress
    }

    Image {
        id: congrat

        property string fileName: { "qrc:/res/pics/"+mainRoot.currentImg.toString()+".jpg" }
        anchors.fill: parent
        visible:mainRoot.done
        source: fileName
        z:10


        MouseArea {
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.fill: parent
            onClicked:  { mainRoot.reset() }
        }
    }

}

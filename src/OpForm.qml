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

import QtQuick 2.3
import "OpForm.js" as Operations

Rectangle {
    id: root

    property int n1
    property int n2
    property int solution
    property string operation
    property bool isCorrect: true

    signal pressed()

    width: 800
    height: 299
    radius: 3

    Component.onCompleted: root.reload()

    function reload(){
        resultInput.text = "";
        var op = Operations.randomOperation();
        n1 = op.n1;
        n2 = op.n2;
        solution = op.solution;
        operation = op.operation;
    }


    Rectangle {
        id: rectangle1
        x: 49
        y: 99
        width: 153
        height: 145
        border.color: "green"
        radius: 5
        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: text1
            text: {n1.toString()}
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.fill: parent
            font.pointSize: 30
        }
    }

    Rectangle {
        id: rectangle2
        x: 313
        y: 99
        width: 140
        height: 145
        border.color: "green"
        radius: 5
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter

        Text {
            id: text2
            text:{ n2.toString() }
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pointSize: 30
        }
    }

    Rectangle {
        id: rectangle3
        x: 539
        y: 99
        width: 136
        height: 145
        border.color: "green"
        radius: 5
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: {
                resultInput.focus= true;
                Qt.inputMethod.show()
            }
        }

        TextInput{
            id:resultInput
            font.pointSize: 30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            validator: IntValidator{}
            inputMethodHints: Qt.ImhDigitsOnly
            activeFocusOnPress: true
            cursorVisible:  true
        }
    }

    Rectangle {
        id: rectangle5
        x: 734
        y: 101
        width: 144
        height: 145
        radius: 100
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        visible:resultInput.text.length > 0

        Image {
            id: qmark
            source: "qrc:/res/qmark.jpg"
            anchors.centerIn: parent
            anchors.fill: parent
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onClicked: {
                var res = parseInt(resultInput.text)
                root.isCorrect = (root.solution === res)
                resultInput.text=""
                root.reload()
                root.pressed()
            }
        }
    }

    Text {
        id: text3
        x: 233
        y: 127
        width: 30
        height: 46
        text: root.operation
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 40
    }

    Text {
        id: text4
        x: 494
        y: 127
        text: qsTr("=")
        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 40
    }
}


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

import QtQuick 2.0

Rectangle {
    id:rimg1
    x: maximize? 0:posX
    y: maximize? 0:posY
    width: maximize? 300:150
    height: maximize? 300:150
    radius: 100
    color: mainRoot.correct?"white":"red"


    property int posX
    property int posY

    property string fileName
    property bool maximize: false
    property bool  picVisible:true

    Image {
        id: img1
        source: { "qrc:/pics/"+rimg1.fileName }
        anchors.fill: parent
        visible: rimg1.picVisible
    }

    Image {
        id: imgDefault
        source: { "qrc:/qmark.png" }
        anchors.fill: parent
        visible: !rimg1.picVisible
    }

    MouseArea {
        anchors.fill: parent
        visible: img1.visible
        onClicked: {
           // rimg1.maximize = !rimg1.maximize
        }
    }
}

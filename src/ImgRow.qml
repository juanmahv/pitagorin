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

Row {
    spacing: 20

    SequentialAnimation on spacing {
            running: !mainRoot.correct
            loops: 4
            PropertyAnimation { to: 70 }
            PropertyAnimation { to: 20 }
        }

    Pic {
        id:pic1
        posX:10;posY:10
        fileName: "0.jpg"
        picVisible: { mainRoot.picVisible[0] }
    }

    Pic {
        posX:180;posY:10
        fileName: "1.jpg"
        picVisible: mainRoot.picVisible[1]
    }

    Pic {
        posX:350;posY:10
        fileName: "2.jpg"
        picVisible: mainRoot.picVisible[2]
    }

    Pic {
        x: 532
        y: 10
        posX:10;posY:210
        fileName: "3.jpg"
        picVisible: mainRoot.picVisible[3]
    }

    Pic {
        x: 714
        y: 10
        posX:180;posY:210
        fileName: "4.jpg"
        picVisible: mainRoot.picVisible[4]
    }
}



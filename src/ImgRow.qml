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

    Repeater {
        model:  mainRoot.listOfFiles
        Pic {
            fileName:modelData
            picVisible: { mainRoot.picVisible[index] }
        }
    }

}



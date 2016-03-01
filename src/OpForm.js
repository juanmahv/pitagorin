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

.pragma library


function OpUnit(n1,n2,solution,operation) {
    this.n1 = n1;
    this.n2 = n2;
    this.solution = solution;
    this.operation = operation;
}

function randomOperation(){
    var functions = [randomBasicSum, randomBasicSubst,randomBasicMult,randomBasicDiv];
    var opunit = callAFunctionRandomly(functions);
    return opunit;
}

function callAFunctionRandomly(functionList) {
    var f = randomNrUpTo(functionList.length);
    var op = functionList[f]();
    return op;
}

function basicSum() {
    return new OpUnit(23,12,35,"+");
}

function randomBasicSum(){

    var seed = 100;
    var n1 = Math.floor((Math.random() * seed) + 1);
    var dec2 = Math.floor((Math.random() * 10) ); // [0 - 9]

    var unit1 = n1 % 10;
    var limit = 10 - unit1;
    var unit2 = Math.floor((Math.random() * limit) ); // [0 - limit)
    var n2 = 10 * dec2 + unit2;
    return new OpUnit(n1,n2,n1+n2,"+");
}

function randomBasicSubst(){
    var seed = 100
    var n1 = Math.floor((Math.random() * seed) + 1);
    var n2 = Math.floor((Math.random() * n1) + 1); // avoid n2 > n1
    return new OpUnit(n1,n2,n1-n2,"-");
}

function randomNrUpTo(n){
    return Math.floor((Math.random() * n));
}

function randomBasicMult(){
    var n1 = randomNrUpTo(11);
    var n2 = randomNrUpTo(11);
    return new OpUnit(n1,n2,n1*n2,"*");
}

function randomBasicDiv(){
    var n1 = randomNrUpTo(100);
    var n2 = randomNrUpTo(11);
    return new OpUnit(n1,n2,n1/n2,":");
}

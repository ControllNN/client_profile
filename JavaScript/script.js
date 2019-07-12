"use strict";
console.log('Numbers 10 to 20')
for(var i = 10; i <= 20;i++ ){
    console.log(i);
}
console.log('Squares numbers from 10 to 20')
for(var i = 10; i <= 20;i++ ){
    console.log(i*i);
}
var sum = 0;
for(var i = 10; i <= 20;i++ ){
    sum += i;
}
console.log("Sum numbers from 10 to 20 = " + sum);



function isNumber(a, b) { //проверка на НЕчисло
    if (a && isNaN(parseInt(a)) || b && isNaN(parseInt(b))) {
        alert("В полях х1 и х2 должны быть введены числовые значения.");
    } else return true;
}

function isNotVoid(a, b) { //проверка на пустые поля
    if (!a || !b ) {
        alert("Поля x1 и x2 должны быть заполнены.");
        return false
    } else
        return true;
}

function sumAllNumbers(a, b) {//ссумма всеъ чисел от х1 до х2
    var total = 0;
    for (var i = +a; i <= +b; i++) {
        total +=  i
    }
    return total;
}

function primeNumber(a,b) {//вывести все простые числа в диапазоне х1 - х2
    var arrPrime = []
    for (var i = a; i <= b; i++) {
        var isPrime ;
        for (var j = 2; j < i; j++) {
            if (!(i % j)) {
                isPrime = 0;
                break;
            } else {
                isPrime = 1;
            }
        }
        if(isPrime || i===2){
            arrPrime.push(" " + i)
        }
    }
    return arrPrime;
}


function multiplyAllNumbers(a, b) {// перемножить все числа от х1 до х2
    var total = a;
    for (var i = +a + 1; i <= +b; i++) {
        total *= i;
    }
    return total;
}

function buttonClick() {
    var x1 = document.getElementById('x1').value;
    var x2 = document.getElementById('x2').value;
    var radio = document.querySelector('input[name="r1"]:checked').value; //массив
    var resultDiv = document.getElementById('result');

    if (isNotVoid(x1, x2) && isNumber(x1, x2)) { //если проверки по полям успешны, проверяем кнопку radio
    } else {
        return null;
    }

    var result;
    switch(radio) {
        case 'sum':
            result = sumAllNumbers(x1, x2);
            break;
        case 'mul':
            result = multiplyAllNumbers(x1, x2);
            break;
        case 'prime':
            result = primeNumber(x1, x2);
            break;
    }

    resultDiv.innerText = result.toString()
}

function clearValue() {
    var x1 = document.getElementById('x1');
    var x2 = document.getElementById('x2');
    var resultDiv = document.getElementById('result');
    x1.value = '';
    x2.value = '';
    resultDiv.innerText = '';
}

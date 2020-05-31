 import Foundation
 
 //1. Решить квадратное уравнение.
 
 print("1. Решение квадратного уровнения\nax\u{00B2} + bx + c = 0\n")
 
 //значения в уровнении
 let a: Double = 1
 let b: Double = 6
 let c: Double = 9
 
 print("Ваше уровнение:\n" + String(a) + "x\u{00B2} + " + String(b) + "x + " + String(c) + " = 0\n")
 
 let d = b * b - 4 * a * c
 
 print("Вычислим дискриминант:\nD = b\u{00B2} - 4ac\nD = " + String(b) + "\u{00B2} - 4 * " + String(a) + " * " + String(c) + " = " + String(d))
 
 if (d > 0) {
    print("D > 0, следовательно это квадратное уравнение имеет 2 вещественных корня:")
    print("x\u{2081}\u{2082} = (−b ± \u{221A}D)\u{2044}2a")
     
    let x1 = (-b + sqrt(d)) / (2 * a)
     
    print("x\u{2081} = (-b + \u{221A}D)\u{2044}2a = (-" + String(b) + " + \u{221A}" + String(d) + ")\u{2044}2*" + String(a) + " = " + String(x1))
     
    let x2 = (-b - sqrt(d)) / (2 * a)
      
     print("x\u{2082} = (-b - \u{221A}D)\u{2044}2a = (-" + String(b) + " - \u{221A}" + String(d) + ")\u{2044}2*" + String(a) + " = " + String(x2))
     print("Ответ: x\u{2081} = " + String(x1) + "; x\u{2082} = " + String(x2))
 } else if (d == 0) {
    print("D = 0, следовательно это квадратное уравнение имеет 1 вещественный корень:")
    print("x\u{2081} = x\u{2082} = −b\u{2044}2a")
    
    let x = -b / (2 * a)
    
    print("x = -" + String(b) + "\u{2044}(2 * " + String(a) + ") = " + String(x))
    print("Ответ: x = " + String(x))
    
 } else {
   print("D < 0, следовательно решений нет\nОтвет: нет решений")
 }
 

 
 
//2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
 
 let cat1: Double = 2
 let cat2: Double = 3

 print("\n\n\n2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника\n")
 print("Дано:\nКатет1 = " + String(cat1) + "\nКатет2 = " + String(cat2) + "\n")
 print("Формула нахождения площади прямоугольного треугольника через катеты:\nS = \u{00BD} * a * b\na, b - катеты треугольника\n")
 let s = 1/2 * cat1 * cat2
 
 print("S = \u{00BD} * " + String(a) + " * " + String(b) + " = " + String(s) + "\n")
 print("Формула нахождения гипотенузы прямоугольного треугольника:\nc = \u{221A}(a\u{00B2} + b\u{00B2})")
 
 let hyp = sqrt(cat1 * cat1 + cat2 * cat2)
 
 print("c = \u{221A}(" + String(cat1) + "\u{00B2} + " + String(cat2) + "\u{00B2}) = " + String(hyp) + "\n")
 
 print("Формула нахождения периметра прямоугольного треугольника:\nP = a + b + c")
 
 let p = cat1 + cat2 + hyp
 
 print("P = " + String(cat1) + " + " + String(cat2) + " + " + String(hyp) + " = " + String(p))

 
 
 
//3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

 print("\n\n\n3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.\n")
 
 //данные по вкладу
 var sum: Double = 100000
 let percent: Double = 10
 let year = 5
 
 print("Дано:")
 print("Размер вклада = " + String(sum))
 print("Процентная ставка на год = " + String(percent) + "%")
 print("Количество лет = " + String(year) + " лет\n")
 
 for item in 1...year {
    sum += sum * (percent / 100)
    print("За " + String(item) + " год размер вклада составит " + String(sum))
 }

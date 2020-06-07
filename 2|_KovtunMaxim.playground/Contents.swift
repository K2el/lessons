import UIKit
import PlaygroundSupport

//1. Написать функцию, которая определяет, четное число или нет.

func numEven (num: Int) -> Bool {
    let answer = num % 2 == 0 ? true : false
    return answer
}


//2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func numDivThree (num: Int) -> Bool {
    let answer = num % 3 == 0 ? true : false
    return answer
}


//3. Создать возрастающий массив из 100 чисел.

func arrayIncrease (numStart: Int, arrCount: Int) -> [Int] {
    var arr: [Int] = []
    for i in 0..<arrCount {
        arr.append(numStart + i)
    }
    return arr
}

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

var arr: [Int] = arrayIncrease(numStart: 1, arrCount: 100)
for index in stride(from: arr.count - 1, through: 0, by: -1) {
    if numDivThree(num: arr[index]) || numEven(num: arr[index]) {
        arr.remove(at: index)
    }
}
//print(arr)

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func arrayFibonacciHundred () -> [Double] {
    var arr: [Double] = [0, 1, 1]
    for i in 2...100 {
        arr.append(arr[i] + arr[i - 1])
    }
    return arr
}

//print(arrayFibonacciHundred())

/*6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.*/



// Функция создает последовательность чисел от 2 до N, затем в этой последовательности оставляет только простые числа
func primeNumInArray(arrCount: Int) -> [Int] {
    var arr = arrayIncrease(numStart: 2, arrCount: arrCount)
    var p: Int = 2
    while arr.firstIndex(of: p)! != arr.count - 1 {
        for index in stride(from: arr.count - 1, through: 0, by: -1) {
            if arr[index] % p == 0 && arr[index] != p {
                arr.remove(at: index)
            }
        }
    
        p = arr[arr.firstIndex(of: p)! + 1]
        
    }
    return arr
}
//print(primeNumInArray(arrCount: 1000))

// Функция генерирует последовательность из N простых чисел
func primeHundred(primeCount: Int) -> [Int] {
    var arr: [Int] = [2]
    var num: Int = arr.last! + 1
    var prime: Bool = true
    while arr.count != primeCount {
        for index in arr {
            if num % index  == 0 {
                prime = false
            }
        }
        if prime == true {
            arr.append(num)
        }
        num += 1
        prime = true
    }
    return arr
}

print(primeHundred(primeCount: 100))




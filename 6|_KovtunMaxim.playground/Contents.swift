//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

import UIKit
import PlaygroundSupport

protocol CalculatedArea {
    var area: Double { get }
}

class Rectangle {
    var sideA: Double
    var sideB: Double
    
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}

extension Rectangle: CalculatedArea {
    var area: Double {
        get {
            self.sideA * self.sideB
        }
    }
}

struct Queue<T: CalculatedArea> {
    private var elements: [T] = []
    
    mutating func enQueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func deQueue() -> T? {
        guard elements.count != 0 else {
            return nil
        }
        return elements.removeFirst()
    }
    
    func filterIndex(_ closure: (Int) -> Bool) -> [T] {
        var tmpArray: [T] = []
        for (i, value) in elements.enumerated() {
            if closure(i) {
                tmpArray.append(value)
            }
        }
        return tmpArray
        
    }
    
    func filterArea(_ closure: (Double) -> Bool) -> [T] {
        var tmpArray: [T] = []
        for element in elements {
            if closure(element.area) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
    subscript(index: Int) -> T? {
        guard index < elements.count else {
            return nil
        }
        return elements[index]
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        return "[ Прямоугольник: sideA = \(sideA), sideB = \(sideB) ]"
    }
}



var queueRectangle = Queue<Rectangle>()

queueRectangle.enQueue(Rectangle(sideA: 10, sideB: 10))
queueRectangle.enQueue(Rectangle(sideA: 20, sideB: 20))
queueRectangle.enQueue(Rectangle(sideA: 30, sideB: 30))
queueRectangle.enQueue(Rectangle(sideA: 40, sideB: 40))
queueRectangle.enQueue(Rectangle(sideA: 50, sideB: 50))

print(queueRectangle.deQueue())


print(queueRectangle.filterIndex() { $0 % 2 == 0 })
print(queueRectangle.filterIndex() { $0 % 2 != 0 })
print(queueRectangle.filterIndex() { $0 < 2 })

print(queueRectangle.filterArea() { $0 > 500 })

print(queueRectangle[3])
print(queueRectangle[5])

/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
 */

  
import UIKit
import PlaygroundSupport

enum Manufacturing {
    case cadillac, bmw, opel, gazel
}

enum Action {
    case trunkLoad(weight: Int)
    case trunkUnload(weight: Int)
    case speedUp(speed: Int)
}

class Car {
    let color: UIColor
    let manufacturing: Manufacturing
    let yearManufacture: Int
    
    func action(action: Action) {
       
    }
    
    func printProperties() {
        print("Свойства обьекта\ncolor: \(color)\nmanufacturing: \(manufacturing)\nyearManufacture: \(yearManufacture)")
    }
    
    init(color: UIColor, manufacturing: Manufacturing, yearManufacture: Int) {
        self.color = color
        self.manufacturing = manufacturing
        self.yearManufacture = yearManufacture
    }
}

class TrunkCar: Car {
    let trunkValueMax: Int
    var trunkValue: Int = 0
    
    init(color: UIColor, manufacturing: Manufacturing, yearManufacture: Int, trunkValueMax: Int) {
        self.trunkValueMax = trunkValueMax
        super.init(color: color, manufacturing: manufacturing, yearManufacture: yearManufacture)
    }
    
    override func action(action: Action) {
        switch action {
        case let .trunkLoad(weight) :
            if trunkValueMax < trunkValue + weight {
                print("ошибка погрузки, осталось лишь \(trunkValueMax - trunkValue)")
            }
            else {
                trunkValue += weight
                print("успешно погружены \(trunkValue)")
            }
        case let .trunkUnload(weight) :
            if trunkValue - weight < 0 {
                print("ошибка выгрузки, в багажнике сейчас лишь \(trunkValue)")
            }
            else {
                trunkValue -= weight
                print("успешно выгружены \(trunkValue)")
            }
        default :
            print("данное действие недоступно")
        }
    }
    
    override func printProperties() {
        super.printProperties()
        print("trunkValueMax: \(trunkValueMax)\ntrunkValue: \(trunkValue)")
    }
    
    
}

class SportCar: Car {
    var speed: Int
    
    init(color: UIColor, manufacturing: Manufacturing, yearManufacture: Int, speed: Int) {
        self.speed = speed
        super.init(color: color, manufacturing: manufacturing, yearManufacture: yearManufacture)
    }
    
    override func action(action: Action) {
        switch action {
        case let .speedUp(speed) :
            self.speed += speed
            print("текущая скорость \(self.speed)")
        default :
            print("данное действие недоступно")
        }
    }
    
    override func printProperties() {
        super.printProperties()
        print("speed: \(speed)")
    }
    
}

var trunkCar: TrunkCar = TrunkCar(color: .black, manufacturing: .gazel, yearManufacture: 1990, trunkValueMax: 100)
var sportCar: SportCar = SportCar(color: .white, manufacturing: .cadillac, yearManufacture: 2010, speed: 100)

trunkCar.action(action: .speedUp(speed: 10))
trunkCar.action(action: .trunkLoad(weight: 50))
trunkCar.action(action: .trunkLoad(weight: 100))

sportCar.action(action: .trunkLoad(weight: 10))
sportCar.action(action: .speedUp(speed: 50))

trunkCar.printProperties()
sportCar.printProperties()

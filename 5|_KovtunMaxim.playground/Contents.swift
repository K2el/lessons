//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

import UIKit
import PlaygroundSupport

enum CarManufacturing {
    case bmw, opel
}

enum CarAction {
    case windowOpen, windowClose, engineOn, engineOff
}

protocol CarActionExecution {
    var isWindowOpen: Bool {get set}
    var isEngineOn: Bool {get set}
}

extension CarActionExecution {
    mutating func carActionExecution(action: CarAction) {
        switch action {
        case .windowOpen :
            guard !isWindowOpen else {
                print("Ошибка, окна уже открыты")
                break
            }
            isWindowOpen = true
            print("Окна открыты")
        case .windowClose :
            guard isWindowOpen else {
                print("Ошибка, окна уже закрыты")
                break
            }
            isWindowOpen = false
            print("Окна закрыты")
        case .engineOn :
            guard !isEngineOn else {
            print("Ошибка, двигатель уже работает")
            break
        }
            isEngineOn = true
            print("Двигатель работает")
        case .engineOff :
            guard isEngineOn else {
            print("Ошибка, двигатель уже остановлен")
            break
        }
            isEngineOn = false
            print("Двигатель остановлен")
        }
    }
}

enum SportCarAction {
    case speedUp(speed: Int)
}

protocol SportCarActionExecution {
    var speed: Int {get set}
}

extension SportCarActionExecution {
    mutating func sportCarActionExecution(action: SportCarAction) {
        switch action {
        case let .speedUp(speed) :
            self.speed += speed
            print("Текущая скорость \(self.speed)")
        }
    }
}

enum TrunkCarAction {
    case trunkLoad(weight: Int)
    case trunkUnload(weight: Int)
}

protocol TrunkCarActionExecution {
    var trunkValueMax: Int {get set}
    var trunkValue: Int {get set}
}

extension TrunkCarActionExecution {
    mutating func trunkCarActionExecution(action: TrunkCarAction) {
        switch action {
        case let .trunkLoad(weight) :
            guard trunkValueMax > trunkValue + weight else {
                print("Ошибка погрузки, осталось лишь \(trunkValueMax - trunkValue)")
                break
            }
            trunkValue += weight
            print("Успешно погружены \(trunkValue)")
        case let .trunkUnload(weight) :
            guard trunkValue - weight > 0 else {
                print("Ошибка выгрузки, в багажнике сейчас лишь \(trunkValue)")
                break
            }
            trunkValue -= weight
            print("Успешно выгружены \(trunkValue)")
        }
    }
}

class SportCar: CarActionExecution, SportCarActionExecution {
    var isWindowOpen: Bool = false
    var isEngineOn: Bool = false
    var speed: Int = 0
    let manufacturing: CarManufacturing
    init(manufacturing: CarManufacturing) {
        self.manufacturing = manufacturing
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\nСвойства\nСостояние двигателя: \(isEngineOn)\nСостояние окон: \(isWindowOpen)\nТекущая скорость: \(speed)\nПроизводитель: \(manufacturing)\n"
    }
}

class TrunkCar: CarActionExecution, TrunkCarActionExecution {
    var isWindowOpen: Bool = false
    var isEngineOn: Bool = false
    var trunkValueMax: Int
    var trunkValue: Int = 0
    let manufacturing: CarManufacturing
    init(manufacturing: CarManufacturing, trunkValueMax: Int) {
        self.manufacturing = manufacturing
        self.trunkValueMax = trunkValueMax
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "\nСвойства\nСостояние двигателя: \(isEngineOn)\nСостояние окон: \(isWindowOpen)\nМаксимальный обьем багажника: \(trunkValueMax)\nЗаполненный обьем багажника: \(trunkValue)\nПроизводитель: \(manufacturing)\n"
    }
}

var sportCar: SportCar = SportCar(manufacturing: .bmw)
sportCar.carActionExecution(action: .engineOn)
sportCar.sportCarActionExecution(action: .speedUp(speed: 20))
print(sportCar)

var trunkCar: TrunkCar = TrunkCar(manufacturing: .opel, trunkValueMax: 100)
trunkCar.carActionExecution(action: .engineOff)
trunkCar.trunkCarActionExecution(action: .trunkLoad(weight: 50))
print(trunkCar)

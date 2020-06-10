/*1. Описать несколько структур – любой легковой автомобиль и любой грузовик.

2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.*/


import UIKit
import PlaygroundSupport

enum Manufacturing {
    case cadillac, bmw, opel, gazel
}

enum CarActions {
    case engineOn, engineOff, windowsOpen, windowsClose
    case trunkLoad(weight: Int)
    case trunkUnload(weight: Int)
}

struct PassengerСar {
    let color: UIColor
    let manufacturing: Manufacturing
    let yearManufacture: Int
    var trunkVolume: Int
    let trunkVolumeMax: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    mutating func carAction(action: CarActions) {
        switch action {
        case .engineOn:
            engineRunning == true ? print("ошибка, двигатель уже запущен") : print("двигатель запущен")
            engineRunning = true
        case .engineOff:
            engineRunning == false ? print("ошибка, двигатель уже выключен") : print("двигатель выключен")
            engineRunning = false
        case .windowsOpen:
            windowsOpen == true ? print("ошибка, окна уже открыты") : print("окна открыты")
            windowsOpen = true
        case .windowsClose:
            windowsOpen == false ? print("ошибка, окна уже закрыты") : print("окна закрыты")
            windowsOpen = false
        case let .trunkLoad(weight) :
            if trunkVolumeMax < trunkVolume + weight {
                print("ошибка погрузки, осталось лишь \(trunkVolumeMax - trunkVolume)")
            }
            else {
                trunkVolume += weight
                print("успешно погружены \(trunkVolume)")
            }
        case let .trunkUnload(weight) :
            if trunkVolume - weight < 0 {
                print("ошибка выгрузки, в багажнике сейчас лишь \(trunkVolume)")
            }
            else {
                trunkVolume -= weight
                print("успешно выгружены \(trunkVolume)")
            }
        }
    }
    init(color: UIColor, manufacturing: Manufacturing, yearManufacture: Int, trunkVolumeMax: Int) {
        self.color = color
        self.manufacturing = manufacturing
        self.yearManufacture = yearManufacture
        self.trunkVolumeMax = trunkVolumeMax
        trunkVolume = 0
        engineRunning = false
        windowsOpen = false
    }
}

struct Truck {
    let color: UIColor
    let manufacturing: Manufacturing
    let yearManufacture: Int
    var trunkVolume: Int
    let trunkVolumeMax: Int
    var engineRunning: Bool
    var windowsOpen: Bool
    mutating func carAction(action: CarActions) {
        switch action {
        case .engineOn:
            engineRunning == true ? print("ошибка, двигатель уже запущен") : print("двигатель запущен")
            engineRunning = true
        case .engineOff:
            engineRunning == false ? print("ошибка, двигатель уже выключен") : print("двигатель выключен")
            engineRunning = false
        case .windowsOpen:
            windowsOpen == true ? print("ошибка, окна уже открыты") : print("окна открыты")
            windowsOpen = true
        case .windowsClose:
            windowsOpen == false ? print("ошибка, окна уже закрыты") : print("окна закрыты")
            windowsOpen = false
        case let .trunkLoad(weight) :
            if trunkVolumeMax < trunkVolume + weight {
                print("ошибка погрузки, осталось лишь \(trunkVolumeMax - trunkVolume)")
            }
            else {
                trunkVolume += weight
                print("успешно погружены \(trunkVolume)")
            }
        case let .trunkUnload(weight) :
            if trunkVolume - weight < 0 {
                print("ошибка выгрузки, в багажнике сейчас лишь \(trunkVolume)")
            }
            else {
                trunkVolume -= weight
                print("успешно выгружены \(trunkVolume)")
            }
        }
    }
    init(color: UIColor, manufacturing: Manufacturing, yearManufacture: Int, trunkVolumeMax: Int) {
        self.color = color
        self.manufacturing = manufacturing
        self.yearManufacture = yearManufacture
        self.trunkVolumeMax = trunkVolumeMax
        trunkVolume = 0
        engineRunning = false
        windowsOpen = false
    }
}

var passCar = PassengerСar(color: .black, manufacturing: .cadillac, yearManufacture: 2018, trunkVolumeMax: 50)

passCar.carAction(action: .engineOn)
passCar.carAction(action: .windowsClose)
passCar.carAction(action: .trunkLoad(weight: 65))
passCar.carAction(action: .trunkLoad(weight: 10))
passCar.carAction(action: .trunkUnload(weight: 55))

print(passCar)

var truck = Truck(color: .black, manufacturing: .gazel, yearManufacture: 2020, trunkVolumeMax: 1000)

truck.carAction(action: .engineOn)
truck.carAction(action: .windowsClose)
truck.carAction(action: .trunkLoad(weight: 500))
truck.carAction(action: .trunkLoad(weight: 600))
truck.carAction(action: .trunkUnload(weight: 1200))

print(truck)

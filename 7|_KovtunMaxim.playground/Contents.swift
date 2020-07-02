//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

import UIKit
import PlaygroundSupport

enum InternetMagazineError : Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Double)
}

enum ProductBrend {
    case noname, marvel
}

struct Product {
    var price: Double
    var count: UInt
    var productBrend: ProductBrend
}

class InternetMagazine {
    var product: [String: Product] = [
        "Toy": Product(price: 2.0, count: 0, productBrend: .marvel),
        "Car": Product(price: 15, count: 10, productBrend: .noname)
    ]
    
    var sumOfCoin: Double = 0
    
    private func tryBuy(_ item: String) throws -> Bool {
        guard var productItem = product[item] else {
            throw InternetMagazineError.invalidSelection
        }
        guard sumOfCoin >= productItem.price else {
            throw InternetMagazineError.insufficientFunds(coinsNeeded: productItem.price - sumOfCoin)
        }
        guard productItem.count > 0 else {
            throw InternetMagazineError.outOfStock
        }
        sumOfCoin -= productItem.price
        productItem.count -= 1
        
        return true
    }
    
    func buy(_ item: String) -> String {
        do {
            try magazine.tryBuy(item)
            return "Товар \(item) успешно куплен"
        } catch let InternetMagazineError.insufficientFunds(coinsNeeded) {
            return "Денег не хватает, требуется еще \(coinsNeeded)"
        } catch InternetMagazineError.outOfStock {
            return "Товар закончился"
        } catch InternetMagazineError.invalidSelection {
            return "Такого товара нет"
        } catch let error {
            return error.localizedDescription
        }
    }
}

var magazine: InternetMagazine = InternetMagazine()

magazine.sumOfCoin = 100

print(magazine.buy("Toy"))
print(magazine.buy("Toys"))
print(magazine.buy("Car"))

print("--------------------------")

class NewInternetMagazine {
    var product: [String: Product] = [
        "Toy": Product(price: 2.0, count: 0, productBrend: .marvel),
        "Car": Product(price: 15, count: 10, productBrend: .noname)
    ]
    
    var sumOfCoin: Double = 0
    
    func buy(_ item: String) -> (String?, InternetMagazineError?) {
        guard var productItem = product[item] else {
            return (nil, InternetMagazineError.invalidSelection)
        }
        guard sumOfCoin >= productItem.price else {
            return (nil, InternetMagazineError.insufficientFunds(coinsNeeded: productItem.price - sumOfCoin))
        }
        guard productItem.count > 0 else {
            return (nil, InternetMagazineError.outOfStock)
        }
        sumOfCoin -= productItem.price
        productItem.count -= 1
        
        return (item, nil)
    }
}

var newMagazine: NewInternetMagazine = NewInternetMagazine()

newMagazine.sumOfCoin = 100

let sell1 = newMagazine.buy("Toy")
let sell2 = newMagazine.buy("Toys")
let sell3 = newMagazine.buy("Car")

if let product = sell1.0 {
    print("Вы купили: \(product)")
} else if let error = sell1.1 {
    print("Произошла ошибка: \(error)")
}

if let product = sell2.0 {
    print("Вы купили: \(product)")
} else if let error = sell2.1 {
    print("Произошла ошибка: \(error)")
}

if let product = sell3.0 {
    print("Вы купили: \(product)")
} else if let error = sell3.1 {
    print("Произошла ошибка: \(error)")
}

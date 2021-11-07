//
//  main.swift
//  Kurs_1
//
//  Created by Ivan Bezgin on 19.10.2021.
//

import Foundation

enum CarSomeStatusError : Error {
    case error
}

struct Car {
    let name: String
    let productionYear: Int
    let maxCars: Int = 3
    
    init(name: String, productionYear: Int) {
        self.name = name
        self.productionYear = productionYear
    }
}

final class Cars {
    static var cars = ["Bmw": Car(name: "BMW", productionYear: 2006),
                       "Mazda": Car(name: "Mazda", productionYear: 2008),
                       "Honda": Car(name: "Honda", productionYear: 2010)]

 
    static func GetCar (name: String) throws -> Car {
        guard let car = cars[name] else { throw CarSomeStatusError.error }
        return car
    }
    
    static func removeCar (name: String) throws {
        guard cars[name] != nil else { throw CarSomeStatusError.error}
        cars.removeValue(forKey: name)
    }
    
    
}


do {
    _ = try Cars.GetCar(name: "Mazda")
} catch let error { print(error.localizedDescription)}

do {
    try Cars.removeCar(name: "Mazda")
} catch let error { print(error.localizedDescription)}

Cars.cars.forEach{ let car = $0
    print(car.key)}

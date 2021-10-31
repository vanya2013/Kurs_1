//
//  main.swift
//  Kurs_1
//
//  Created by Ivan Bezgin on 19.10.2021.
//

import Foundation


enum Actions {
    case loadingAllVolume
    case unloadingcAllVolume
    case stopEngine
    case startEngine
    case openWindow
    case closeWindow
}

enum EngineStatus {
    case running
    case stop
}

enum WindowsStatus {
    case open
    case close
}


class Car {
    private let name: String
    private let year: Int
    private let trunkVolume: Int
    private var windowsStatus = WindowsStatus.close
    private var engineStatus = EngineStatus.stop
    private var trunkLoad: Int = 0
    
    init(name: String, year: Int, trunkVolume: Int) {
        self.name = name
        self.year = year
        self.trunkVolume = trunkVolume
    }
    
    func OpenWindow() {
        switch self.windowsStatus {
        case .open:
            print("ошибка. окна уже открыты")
        case .close:
            print("окна открыты")
            windowsStatus = .open
        }
        
    }
    
    func closeWindow() {
        switch self.windowsStatus {
        case .open:
            print("окна закрыты")
            windowsStatus = .close
        case .close:
            print("ошибка. окна уже закрыты")
        }
        
    }
    
    func StartEngine () {
        switch self.engineStatus {
        case .running:
            print("ошибка. двигатель уже работает")
        case .stop:
            print("двигатель запущен")
            engineStatus = .running
        }
    }
    
    func StopEngien () {
        switch self.engineStatus {
        case.running:
            print("двигатель остановлен")
            engineStatus = .stop
        case .stop:
            print("ошибка. двигатель не работал")
        }
    }
    
    func GetTrunkLoad () -> Int {return trunkLoad}
    func GetTrunkVolume() -> Int {return trunkVolume}
    
    func LoadTrunk(value: Int) {
        trunkLoad + value < trunkVolume ? trunkLoad += value : print("недопустимый обьем")
    }
    
    func UnloadTrunk(value: Int) {
        trunkLoad - value > 0 ? trunkLoad -= value : print("недопустимый обьем")
    }
    
    
    
}


class SportCar : Car {
    private let maxSpeed: Int
    private let seets: Int
    
    
    init(name: String, year: Int, trunkVolume: Int, maxSpeed: Int, seets: Int){
        self.maxSpeed = maxSpeed
        self.seets = seets
        super.init(name: name, year: year, trunkVolume: trunkVolume)
    }
    
    func Actions(action: Actions) {
        switch action {
        case .loadingAllVolume:
            LoadTrunk(value: GetTrunkVolume() - GetTrunkLoad())
        case .unloadingcAllVolume:
            UnloadTrunk(value: GetTrunkLoad())
        case .stopEngine:
            StopEngien()
        case .startEngine:
            StopEngien()
        case .openWindow:
            OpenWindow()
        case .closeWindow:
            closeWindow()
        }
    }
    
}

let sportCar: SportCar = SportCar(name: "mazda", year: 2006, trunkVolume: 1000, maxSpeed: 180, seets: 4)
var action = Actions.openWindow
sportCar.Actions(action: action)

action = .closeWindow
sportCar.Actions(action: action)

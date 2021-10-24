//
//  main.swift
//  Kurs_1
//
//  Created by Ivan Bezgin on 19.10.2021.
//

import Foundation

var sportCarOne = SportCar(Name: "Mazda", Year:  2006, Volume: 500)
var sportCarTwo = SportCar(Name: "Subaru", Year:  2010, Volume: 400)

var trunkCarOne = TrunkCar(Name: "Isuzu", Year:  2012, Volume: 10000)
var trunkCarTwo = TrunkCar(Name: "Volvo", Year:  2018, Volume: 15000)

sportCarOne.openWindows()
sportCarOne.closeWindows()

sportCarTwo.startEngine()
sportCarTwo.stopEngine()

sportCarOne.trunkLoading(250)
sportCarOne.trunkUnloading(100)

let action = Actions.uploadingcAllVolume
sportCarOne.actionsWithCar(action)

sportCarOne.printAll()


enum Actions {
    case loadingAllVolume
    case uploadingcAllVolume
}

struct SportCar {
    private let name: String
    private let year: Int
    private let trunkVolume: Int
    private var isEngineRunnig: Bool = false
    private var isWindowsOpen: Bool = false
    private var trunkLoad: Int = 0
    
    init (Name name: String,Year year: Int,Volume trunkVolume: Int) {
        self.name = name
        self.year = year
        self.trunkVolume = trunkVolume
    }
    
    public mutating func startEngine() {
        if !isEngineRunnig {
            isEngineRunnig = true
            print("ок. двигатель запущен")
        }
        else {
            print("ошибка. двигатель уже запущен")
        }
    }
    
    mutating func stopEngine() {
        if isEngineRunnig {
            isEngineRunnig = false
            print("ок. двигатель заглушен")
        }
        else {
            print("ошибка. двигатель уже заглушен")
        }
    }
    
    mutating func openWindows() {
        if !isEngineRunnig {
            isEngineRunnig = true
            print("ок. окна открыты")
        }
        else {
            print("ошибка. окна уже открыты")
        }
    }
    
    mutating func closeWindows() {
        if isEngineRunnig {
            isEngineRunnig = false
            print("ок. окна закрыты")
        }
        else {
            print("ошибка. окна уже закрыты")
        }
    }
    
    mutating func trunkLoading(_ loadVolume: Int) {
        if trunkLoad + loadVolume < trunkVolume {
            trunkLoad += loadVolume
            print("ок. загружено")
        }
        else {
            print("ошибка. не влазит")
        }
    }
    
    mutating func trunkUnloading(_ loadVolume: Int) {
        if trunkLoad > loadVolume {
            trunkLoad -= loadVolume
            print("ок. выгружено")
        }
        else {
            print("ошибка. тут столько нет")
        }
    }
    
    func printAll () {
        print("Название: \(name)")
        print("Год: \(year)")
        print("Обьем: \(trunkVolume)")
        isEngineRunnig ? print("Двигатель работает") : print("Двигатель заглушен")
        isWindowsOpen ? print("Окна открыты") : print("Окна закрыты")
        print("Загрузка: \(trunkLoad)")
    }
    
    mutating func actionsWithCar(_ actions: Actions) {
        switch actions{
        case .loadingAllVolume:
               trunkLoad = trunkVolume
        case .uploadingcAllVolume:
                trunkLoad = 0
        }
    }
    
    
}

struct TrunkCar {
    private let name: String
    private let year: Int
    private let trunkVolume: Int
    private var isEngineRunnig: Bool = false
    private var isWindowsOpen: Bool = false
    private var trunkLoad: Int = 0
    
    init (Name name: String,Year year: Int,Volume trunkVolume: Int) {
        self.name = name
        self.year = year
        self.trunkVolume = trunkVolume
    }
    
    public mutating func startEngine() {
        if !isEngineRunnig {
            isEngineRunnig = true
            print("ок. двигатель запущен")
        }
        else {
            print("ошибка. двигатель уже запущен")
        }
    }
    
    mutating func stopEngine() {
        if isEngineRunnig {
            isEngineRunnig = false
            print("ок. двигатель заглушен")
        }
        else {
            print("ошибка. двигатель уже заглушен")
        }
    }
    
    mutating func openWindows() {
        if !isEngineRunnig {
            isEngineRunnig = true
            print("ок. окна открыты")
        }
        else {
            print("ошибка. окна уже открыты")
        }
    }
    
    mutating func closeWindows() {
        if isEngineRunnig {
            isEngineRunnig = false
            print("ок. окна закрыты")
        }
        else {
            print("ошибка. окна уже закрыты")
        }
    }
    
    mutating func trunkLoading(_ loadVolume: Int) {
        if trunkLoad + loadVolume < trunkVolume {
            trunkLoad += loadVolume
            print("ок. загружено")
        }
        else {
            print("ошибка. не влазит")
        }
    }
    
    mutating func trunkUnloading(_ loadVolume: Int) {
        if trunkLoad > loadVolume {
            trunkLoad -= loadVolume
            print("ок. выгружено")
        }
        else {
            print("ошибка. тут столько нет")
        }
    }
    
    func printAll () {
        print("Название: \(name)")
        print("Год: \(year)")
        print("Обьем: \(trunkVolume)")
        isEngineRunnig ? print("Двигатель работает") : print("Двигатель заглушен")
        isWindowsOpen ? print("Окна открыты") : print("Окна закрыты")
        print("Загрузка: \(trunkLoad)")
    }
    
    mutating func actionsWithCar(_ actions: Actions) {
        switch actions{
        case .loadingAllVolume:
               trunkLoad = trunkVolume
        case .uploadingcAllVolume:
                trunkLoad = 0
        }
    }
    
    
}


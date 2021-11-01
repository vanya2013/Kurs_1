//
//  main.swift
//  Kurs_1
//
//  Created by Ivan Bezgin on 19.10.2021.
//

import Foundation

enum WindowsStatus {
    case open
    case close
}

enum lightsStatus {
    case on
    case off
}

enum EngineStatus {
    case running
    case stop
}

enum WindowsChoose {
    case frontRight
    case frontLeft
    case rearRight
    case rearLeft
}

struct Windows {
    var frontRight: WindowsStatus
    var frontLeft: WindowsStatus
    var rearRight: WindowsStatus
    var rearLeft: WindowsStatus
    
    init() {
        frontLeft = .close
        frontRight = .close
        rearLeft = .close
        rearRight = .close
    }
}

protocol CarProtocol {
    var name: String { get set }
    var productionYear: Int { get set }
    var weight: Int { get set }
    var seats: Int { get set }
    var odometr: Int { get set }
    var trunkVolume: Int { get set }
    var trunkLoad: Int { get set }
    var windows: Windows { get set }
    var engineStatus: EngineStatus { get set}
    
    init (name: String,
          productionYear: Int,
          weight: Int,
          seats: Int,
          odometr: Int,
          trunkVolume: Int)
    func PrintCarInformation()
    func PrintWindowsStatus()
    func GetTrunkVolume() -> Int
}

extension CarProtocol {
    
    func PrintCarInformation()
    {
        print("name: \(name)",
              "production year: \(productionYear)",
              "weight: \(weight)",
              "seats: \(seats)",
              "odomentr: \(odometr)",
              "max trunk volume: \(GetTrunkVolume())",
              "trunk load: \(trunkLoad)")
        engineStatus == .stop ? print("engine runnig") : print("engine stop")
        PrintWindowsStatus()
        
    }
    
    func PrintWindowsStatus() {
        windows.frontLeft == .open ? print("front left window is open") : print("front left window is close")
        windows.frontRight == .open ? print("front right window is open") : print("front right window is close")
        windows.rearLeft == .open ? print("rear left window is open") : print("rear left window is close")
        windows.rearRight == .open ? print("rear right window is open") : print("rear right window is close")
    }
    
    func GetTrunkVolume() -> Int { return trunkVolume }
}

struct Struct: CustomStringConvertible {
    var description: String
}

extension CustomStringConvertible {
    func PrintCarsDescription () {
        print(description)
    }
}


final class Car: CarProtocol, CustomStringConvertible {
    
    var name: String
    var productionYear: Int
    var weight: Int
    var seats: Int
    var odometr: Int
    var trunkVolume: Int
    var trunkLoad: Int
    var windows: Windows
    var engineStatus: EngineStatus
    var description: String
    
    init (name: String,
          productionYear: Int,
          weight: Int,
          seats: Int,
          odometr: Int,
          trunkVolume: Int) {
        self.name = name
        self.productionYear = productionYear
        self.weight = weight
        self.seats = seats
        self.odometr = odometr
        self.trunkVolume = trunkVolume
        self.engineStatus = .stop
        self.trunkLoad = 0
        self.windows = Windows()
        self.description = ""
    }
    
    func loadTrunk(value: Int) { trunkLoad + value < trunkVolume ? trunkLoad += value : print("error") }
    
    func UnloadTrunk(value: Int) { trunkLoad - value > 0 ? trunkLoad -= value : print("error") }
    
    func WindowsAction(windows: WindowsChoose, windowsAction: WindowsStatus) {
        switch windows {
        case .frontRight:
            if windowsAction == .open { self.windows.frontRight = .open } else {self.windows.frontRight = .close }
        case  .frontLeft:
            if windowsAction == .open { self.windows.frontLeft = .open } else {self.windows.frontLeft = .close }
        case .rearRight:
            if windowsAction == .open { self.windows.rearRight = .open } else {self.windows.rearRight = .close }
        case .rearLeft:
            if windowsAction == .open { self.windows.rearLeft = .open } else {self.windows.rearLeft = .close }
        }
    }
   
    func StartEngine() { if engineStatus != .running { engineStatus = .running } else { print("error") } }
        
    func StopEngine() { if engineStatus != .stop { engineStatus = .stop } else { print("error") } }
    
}





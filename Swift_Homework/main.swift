//
//  main.swift
//  Swift_Homework
//
//  Created by Denis Molkov on 16.01.2021.
//

import Foundation

enum Engine: String {
    case start = "заведен"
    case stop = "заглушен"
}

enum Window: String {
    case open = "открыты"
    case close = "закрыты"
}

enum FillVolumCar: String {
    case full = "полностью"
    case threeQuarters = "на три четверти"
    case half = "на половину"
    case quarters = "на четверть"
    case empty = "не"
}

enum TypeCar: String {
    case Truck = "грузовик"
    case Sport = "спортивный автомобиль"
}

struct Car {
    let typeCar: TypeCar
    let model: String
    let year: UInt
    var volume: FillVolumCar
    var engine: Engine
    var window: Window
    var filledVolume: FillVolumCar
    var locationCargo: String {
        get {
            if typeCar == .Sport {
                return "багажник"
            }
            return "кузов"
        }
    }
    
    init(typeCar: TypeCar, model: String, year: UInt) {
        self.typeCar = typeCar
        self.model = model
        self.year = year
        volume = .full
        engine = .stop
        window = .close
        filledVolume = .empty
    }
    
    mutating func changeCargo(_ newFillVolume: FillVolumCar) {
        self.filledVolume = newFillVolume
        
        switch newFillVolume {
        case .full:
            self.volume = .empty
        case .quarters:
            self.volume = .threeQuarters
        case .half:
            self.volume = .half
        case .threeQuarters:
            self.volume = .quarters
        case .empty:
            self.volume = .full
        }
    }
    
    func printCar() {
        print("------------------------------------")
        print("Автомобиль: \(model) \(year) года")
        print("Тип автомобиля: \(typeCar.rawValue)")
        print("В данный момент:")
        print("двигатель \(engine.rawValue)")
        print("окна \(window.rawValue)")
        print("\(locationCargo) \(volume.rawValue) пустой")
        print("------------------------------------")
    }
}

var car1 = Car(typeCar: .Sport, model: "Ford Mustang V", year: 2018)
var car2 = Car(typeCar: .Truck, model: "DAF XF", year: 2020)

car1.engine = .start
car1.changeCargo(.threeQuarters)

car2.window = .open
car2.changeCargo(.full)

car1.printCar()
car2.printCar()

car1.window = .open
car2.changeCargo(.empty)

car1.printCar()
car2.printCar()



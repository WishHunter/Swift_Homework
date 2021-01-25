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

enum DoingCargo {
    case load
    case unload
}

enum TypeCar: String {
    case Truck = "грузовик"
    case Sport = "спортивный автомобиль"
}

struct Car {
    let typeCar: TypeCar
    let model: String
    let year: UInt
    let volume: Float
    private var engine: Engine
    private var window: Window
    private var filledVolume: Float
    var locationCargo: String {
        get {
            if typeCar == .Sport {
                return "багажник"
            }
            return "кузов"
        }
    }
    
    init(typeCar: TypeCar, model: String, year: UInt, volume: Float) {
        self.typeCar = typeCar
        self.model = model
        self.year = year
        self.volume = volume
        engine = .stop
        window = .close
        filledVolume = 0.0
    }
    
    mutating func changeCargo(doingCargo: DoingCargo, volumeCargo: Float) -> String {
        switch doingCargo {
        case .load:
            if volume < (filledVolume + volumeCargo) {
                return "Вы загружаете объем больше доступного, доступный объем \(locationCargo)а \(volume - filledVolume) литров"
            }
            filledVolume += volumeCargo
            return "Загрузка прошла успешно, доступный объем \(locationCargo)а \(volume - filledVolume) литров"
            
        case .unload:
            if (filledVolume - volumeCargo) < 0 {
                return "Вы выгружаете объем больше доступного, доступный объем \(locationCargo)а для выгрузки \(filledVolume) литров"
            }
            filledVolume -= volumeCargo
            return "Выгрузка прошла успешно, доступный объем \(locationCargo)а для выгрузки \(filledVolume) литров"
        }
    }
    
    mutating func changeWindow(_ doWindow: Window) {
        switch doWindow {
            case .close:
                if window == .open {
                    window = .close
                }
                
            case .open:
                if window == .close {
                    window = .open
                }
        }
    }
    
    mutating func changeEngine(_ doEngine: Engine) {
        switch doEngine {
            case .start:
                if engine == .stop {
                        engine = .start
                    }
                
            case .stop:
                if engine == .start {
                    engine = .stop
                }
        }
    }
    
    
    func printCar() {
        print("------------------------------------")
        print("Автомобиль: \(model) \(year) года")
        print("Тип автомобиля: \(typeCar.rawValue)")
        print("В данный момент:")
        print("двигатель \(engine.rawValue)")
        print("окна \(window.rawValue)")
        print("объем \(locationCargo)а \(volume) литров, загрузка в данный момент \(filledVolume) литров, свободно \(volume - filledVolume) литров")
        print("------------------------------------")
    }
}

var car1 = Car(typeCar: .Sport, model: "Ford Mustang V", year: 2018, volume: 340.0)
var car2 = Car(typeCar: .Truck, model: "DAF XF", year: 2020, volume: 92000.0)

car1.changeEngine(.start)
print(car1.changeCargo(doingCargo: .load, volumeCargo: 160.0))

car2.changeWindow(.open)
print(car2.changeCargo(doingCargo: .load, volumeCargo: 62000.0))

car1.printCar()
car2.printCar()

car1.changeWindow(.open)
print(car1.changeCargo(doingCargo: .load, volumeCargo: 350.0))
print(car2.changeCargo(doingCargo: .unload, volumeCargo: 60001.0))
print(car2.changeCargo(doingCargo: .unload, volumeCargo: 80000.0))

car1.printCar()
car2.printCar()



//
//  main.swift
//  Swift_Homework
//
//  Created by Denis Molkov on 16.01.2021.
//

import Foundation

class Car {
    enum Door {
        case open, close
    }
    
    enum Windows {
        case open, close
    }
    
    enum Transmission {
        case manual, automatic, CVT, semiAutomatic
    }
    
    enum Doing {
        case openDoor, closeDoor, openWindows, closeWindows
    }
    
    enum Brand {
        case any
    }
    
    enum Engine: String {
        case start, stop
    }
    
    var model: String
    var year: Int
    var transmission: Transmission
    var doors: Door = .close
    var windows: Windows = .close
    var engine: Engine = .stop
    
    init( model: String, year: Int, transmission: Transmission) {
        self.model = model
        self.year = year
        self.transmission = transmission
    }
    
    func checkCar() {
        print("Engine \(engine)")
        print("Doors \(doors)")
        print("Windows \(windows)")
    }
    
    func changeDoor(_ changeDoor: Door) {
        switch changeDoor {
        case .close:
            if doors == .open {
                doors = .close
            }
        case .open:
            if doors == .close {
                doors = .open
            }
        }
    }
    
    func changeEngine(_ changeEngine: Engine) {
        switch changeEngine {
        case .stop:
            if engine == .start {
                engine = .stop
            }
        case .start:
            if engine == .stop {
                engine = .start
            }
        }
    }
}

class SportCar: Car {
    
    enum Brand {
        case Ferrary, Porsche, BMW, Nissan, AlfaRomeo, AstonMartin
    }
    
    enum BodyType {
        case sedan, coupe, convertible
    }
    
    var brand: Brand
    var maxSpeed: Int
    var bodyType: BodyType
    var currentSpeed: Int {
        didSet {
            if (currentSpeed > maxSpeed) {
                print("You're blocked")
                print("===============================")
                self.currentSpeed = 0
                self.engine = .stop
            }
            
            if (currentSpeed > 60) {
                print("You drive dangerous, pls reduce your speed!")
                print("===============================")
            }
        }
    }
    
    init(brand: Brand, model: String, year: Int, transmission: Transmission, maxSpeed: Int, bodyType: BodyType) {
        self.brand = brand
        self.maxSpeed = maxSpeed
        self.bodyType = bodyType
        self.currentSpeed = 0
        super.init(model: model, year: year, transmission: transmission)
    }
    
    override func checkCar() {
        print("Car \(brand) \(model)")
        super.checkCar()
        print("Current Speed \(currentSpeed) km/h")
        print("===============================")
    }
    
    func changeWindows(_ changeWindows: Windows) {
        switch changeWindows {
        case .close:
            if windows == .open {
                doors = .close
            }
        case .open:
            if windows == .close {
                doors = .open
            }
        }
    }
}

class TruckCur: Car {
    
    enum Brand {
        case BAW, MAN, Volvo, MersedesBenz
    }
    
    enum ActionLoad {
        case load, unload
    }
    
    var brand: Brand
    var capacity: Int
    var currentLoad: Int {
        didSet {
            if currentLoad > capacity {
                print("load max, \(currentLoad - capacity) kg left")
                print("===============================")
                currentLoad = capacity
            }
            
            if currentLoad < 0 {
                currentLoad = 0
            }
        }
    }
    
    init(brand: Brand, model: String, year: Int, transmission: Transmission, capacity: Int) {
        self.brand = brand
        self.capacity = capacity
        self.currentLoad = 0
        super.init(model: model, year: year, transmission: transmission)
    }
    
    override func checkCar() {
        print("Car \(brand) \(model)")
        super.checkCar()
        print("Current Load \(currentLoad) kg")
        print("===============================")
    }
    
    func load(action: ActionLoad, weight: Int) {
        
        switch action {
        case .load:
            currentLoad += weight
        case .unload:
            currentLoad -= weight
        }
    }
}

var acros = TruckCur(brand: .MersedesBenz, model: "Arocs", year: 2020, transmission: .automatic, capacity: 44000)
var carrera = SportCar(brand: .Porsche, model: "Carrera 4 GTS", year: 2017, transmission: .CVT, maxSpeed: 306, bodyType: .convertible)


acros.load(action: .load, weight: 32500)
carrera.changeEngine(.start)

//Изменения скорости удаленно не предусмотренно в программе, данное действие выполнено исключительно для проверки системы предупреждений
carrera.currentSpeed = 95

acros.checkCar()
carrera.checkCar()

//Изменения скорости удаленно не предусмотренно в программе, данное действие выполнено исключительно для проверки системы предупреждений
carrera.currentSpeed = carrera.maxSpeed + 50

carrera.checkCar()

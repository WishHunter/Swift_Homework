//
//  main.swift
//  Swift_Homework
//
//  Created by Denis Molkov on 16.01.2021.
//

import Foundation

protocol Transport: class {
    var type: String { get }
    var brand: String { get }
    var model: String { get }
    var gasolineLevel: UInt { get set }
}

class Car: Transport {
    var type: String
    var brand: String
    var model: String
    var gasolineLevel: UInt
    
    init(brand: String, model: String) {
        type = "Car"
        self.brand = brand
        self.model = model
        self.gasolineLevel = 100
    }
    
    func setGasolineLevel(_ gasolineLevel: UInt) {
        self.gasolineLevel = gasolineLevel
    }
    
    func getGasolineLevel() -> UInt {
        return self.gasolineLevel
    }
}

class Motorcycle: Transport {
    var type: String
    var brand: String
    var model: String
    var gasolineLevel: UInt
    
    init(brand: String, model: String) {
        type = "Motorcycle"
        self.brand = brand
        self.model = model
        self.gasolineLevel = 100
    }
    
    func setGasolineLevel(_ gasolineLevel: UInt) {
        self.gasolineLevel = gasolineLevel
    }
    
    func getGasolineLevel() -> UInt {
        return self.gasolineLevel
    }
}

extension Car: CustomStringConvertible {
    var description: String {
        return "\(self.brand) \(self.model)"
    }
}

extension Motorcycle: CustomStringConvertible {
    var description: String {
        return "\(self.brand) \(self.model)"
    }
}

struct Queue<T> {
    private var queueArray: [T] = []
    
    mutating func push(_ elem: T) {
        queueArray.append(elem)
    }
    
    mutating func pop() -> T {
        return queueArray.removeFirst()
    }
}

extension Queue {
    func filterQueue(customFilter: (T) -> Bool) -> [T] {
        let tmpArray: [T] = queueArray
        return tmpArray.filter(customFilter)
    }
}

var car1 = Car(brand: "KIA", model: "RIO")
var car2 = Car(brand: "Mercedes", model: "E200")
var car3 = Car(brand: "Chevrolet", model: "Cruze")
var car4 = Car(brand: "MINI", model: "Countryman")
var moto1 = Motorcycle(brand: "Honda", model: "CBR 600F")
var moto2 = Motorcycle(brand: "Yamaha", model: "XVS 1100")
var moto3 = Motorcycle(brand: "BMW", model: "F 800 R")
var moto4 = Motorcycle(brand: "Suzuki", model: "GSX-R 600")

var queueTransports = Queue<Transport>()

queueTransports.push(car1)
queueTransports.push(moto1)
queueTransports.push(car2)
queueTransports.push(moto2)
queueTransports.push(car3)
queueTransports.push(moto3)
queueTransports.push(car4)
queueTransports.push(moto4)

car2.setGasolineLevel(20)
moto3.setGasolineLevel(55)
car3.setGasolineLevel(5)
car4.setGasolineLevel(0)
moto4.setGasolineLevel(8)

func checkEmptyGasoline() {
    let filterGasolineLevel: (Transport) -> Bool = {return $0.gasolineLevel < 30}
    let emptyGasoline: [Transport] = queueTransports.filterQueue(customFilter: filterGasolineLevel)
    
    print("These transports need to refueling:")
    
    for elem in emptyGasoline {
        print(elem)
    }
}

checkEmptyGasoline()

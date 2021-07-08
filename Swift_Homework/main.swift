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
    var decommissioned: Bool { get set }
    var residualValue: Double { get set }
    
    func getGasolineLevel() -> UInt
}

class Car: Transport {
    var type: String
    var brand: String
    var model: String
    var gasolineLevel: UInt
    var decommissioned: Bool
    var residualValue: Double {
        didSet {
            if residualValue <= 0 && !decommissioned {
                decommissioned = true
            }
        }
    }
    
    init(brand: String, model: String, price: Double) {
        self.type = "Car"
        self.brand = brand
        self.model = model
        self.gasolineLevel = 100
        self.decommissioned = false
        self.residualValue = price
    }
    
    func setGasolineLevel(_ gasolineLevel: UInt) {
        self.gasolineLevel = gasolineLevel
    }
    
    func getGasolineLevel() -> UInt {
        return self.gasolineLevel
    }
    
    func setDecomissioned(_ decommissioned: Bool) {
        self.decommissioned = decommissioned
    }
}

class Motorcycle: Transport {
    var type: String
    var brand: String
    var model: String
    var gasolineLevel: UInt
    var decommissioned: Bool
    var residualValue: Double {
        didSet {
            if residualValue <= 0 && !decommissioned {
                decommissioned = true
            }
        }
    }
    
    init(brand: String, model: String, price: Double) {
        self.type = "Motorcycle"
        self.brand = brand
        self.model = model
        self.gasolineLevel = 100
        self.decommissioned = false
        self.residualValue = price
    }
    
    func setGasolineLevel(_ gasolineLevel: UInt) {
        self.gasolineLevel = gasolineLevel
    }
    
    func getGasolineLevel() -> UInt {
        return self.gasolineLevel
    }
    
    func setDecomissioned(_ decommissioned: Bool) {
        self.decommissioned = decommissioned
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
    
    mutating func pop() -> T? {
        guard queueArray.count > 0 else {
            return nil
        }
        return queueArray.removeFirst()
    }
}

extension Queue {
    func filterQueue(customFilter: (T) -> Bool) -> [T] {
        let tmpArray: [T] = queueArray
        return tmpArray.filter(customFilter)
    }
    
    mutating func deleteDecommissioned(customDelete: (T) -> Bool) -> [T] {
        queueArray.removeAll(where: customDelete)
        return queueArray
    }
}

var car1 = Car(brand: "KIA", model: "RIO", price: 120000)
var car2 = Car(brand: "Mercedes", model: "E200", price: 120000)
var car3 = Car(brand: "Chevrolet", model: "Cruze", price: 120000)
var car4 = Car(brand: "MINI", model: "Countryman", price: 120000)
var moto1 = Motorcycle(brand: "Honda", model: "CBR 600F", price: 120000)
var moto2 = Motorcycle(brand: "Yamaha", model: "XVS 1100", price: 120000)
var moto3 = Motorcycle(brand: "BMW", model: "F 800 R", price: 120000)
var moto4 = Motorcycle(brand: "Suzuki", model: "GSX-R 600", price: 120000)

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

moto3.residualValue = 0

func checkEmptyGasoline() {
    let filterGasolineLevel: (Transport) -> Bool = {return $0.getGasolineLevel() < 30}
    let emptyGasoline: [Transport] = queueTransports.filterQueue(customFilter: filterGasolineLevel)
    
    print("These transports need to refueling:")
    
    for elem in emptyGasoline {
        print(elem)
    }
}

let newQueue = queueTransports.deleteDecommissioned(customDelete: {$0.decommissioned})
print(newQueue)

checkEmptyGasoline()



struct Queue2<T: Transport> {
    private var queueArray: [T] = []
    
    mutating func push(_ elem: T) {
        queueArray.append(elem)
    }
    
    subscript(indices: UInt ...) -> Double {
        var totalResidualValue: Double = 0.0
        
        for index in indices where index < self.queueArray.count {
            totalResidualValue += self.queueArray[Int(index)].residualValue
        }
        
        return totalResidualValue
    }
}


var queueTransports2 = Queue2<Motorcycle>()

queueTransports2.push(moto1)
queueTransports2.push(moto2)
queueTransports2.push(moto3)
queueTransports2.push(moto4)

print("=========================")
print(queueTransports2[0,1,2,3,4])

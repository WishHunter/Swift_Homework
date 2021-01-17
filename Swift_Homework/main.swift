//
//  main.swift
//  Swift_Homework
//
//  Created by Denis Molkov on 16.01.2021.
//

import Foundation

// Решить квадратное уравнение.
var a: Float = 1
var b: Float = 12
var c: Float = 36

print("Дано квадратное уравнение: " + String(a) + "x^2 + " + String(b) + "x + " + String(c) + " = 0")

let discriminant: Float = Float(pow(b, 2) - 4 * a * c)

print ("\nОтвет: ")

if discriminant > 0 {
    let x1: Float = Float((-b + sqrt(discriminant)) / 2 * a)
    let x2: Float = Float((-b - sqrt(discriminant)) / 2 * a)
    
    print("x1 = " + String(x1) + "\nx2 = " + String(x2))
}

if discriminant == 0 {
    let x: Float = Float((-b + sqrt(discriminant)) / 2 * a)
    
    print("x = " + String(x))
}

if discriminant < 0 {
    print("Квадратное уравнение с данными значениями не имеет корней")
}

print("\n ")

// Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

var c1: Float = 5
var c2: Float = 10

print("Даны катеты прямоугольного треугольника: " + String(c1) + " и " + String(c2) + "\n")

let hypotenuse: Float = Float(sqrt(pow(c1, 2) + pow(c2, 2)))

print("Гипотенуза треугольника = " + String(hypotenuse))

let square: Float = Float(c1 * c2 / 2)

print("Площадь треугольника = " + String(square))

let perimeter: Float = Float(hypotenuse + c1 + c2)

print("Периметр треугольника = " + String(perimeter))


print("\n ")

// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
var firstDeposit: UInt = 100000
var persent: Float = 4
var years: UInt = 5

var finalDeposit: UInt = firstDeposit

for _ in 1...years {
    finalDeposit += UInt(Float(finalDeposit) / 100 * persent)
}

print("При сумме вклада в размере " + String(firstDeposit) + " рублей и процентной ставке " + String(persent) + "% на срок " + String(years) + " лет, итоговая сумма вклада будет в размере " + String(finalDeposit) + " рублей")

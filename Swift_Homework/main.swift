//
//  main.swift
//  Swift_Homework
//
//  Created by Denis Molkov on 16.01.2021.
//

import Foundation

let number = 9
let divider = 3

// 1. Написать функцию, которая определяет, четное число или нет.
func checkEven(_ number: Int) -> Bool {
    return (number % 2) == 0
}

//print(checkEven(number) ? "Число \(number) четное" : "Число \(number) не четное")


// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func multiplicity(number: Int, divider: Int) -> (Bool, Int) {
    return (number % divider) == 0 ? (true, 0) : (false, number % divider)
}

let multiplicityResult = multiplicity(number: number, divider: divider)

//print(multiplicityResult.0 ? "Число \(number) делится на \(divider) без остатка" : "Число \(number) не делится на \(divider) без остатка, остаток от деления \(multiplicityResult.1)")


// 3. Создать возрастающий массив из 100 чисел.
func increase(maxNumber: Int) -> [Int] {
    var arr: [Int] = []
    
    for index in 1...maxNumber {
        arr.append(index)
    }
    return arr
}

var arr = increase(maxNumber: 100)


// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func filterArr(array: [Int]) -> [Int] {
    var newArray: [Int] = []
    
    for number in array {
        if (!checkEven(number) && (multiplicity(number: number, divider: 3)).0) {
            newArray.append(number)
        }
    }
    return newArray
}
var newArray = filterArr(array: arr)


//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func numberFibonachi(array: [Decimal]) -> [Decimal] {
    var newArray: [Decimal] = []
    
    if array.count > 1 {
        newArray = array
    } else if (array.count == 1 && (array[0] == 0 || array[0] == 1)) {
        newArray.append(array[0])
        newArray.append(1)
    } else {
        newArray.append(0)
        newArray.append(1)
    }
    newArray.append(newArray[newArray.count-1] + newArray[newArray.count-2]);
    
    return newArray
}

var arrFibonachi: [Decimal] = []
var count = 100

repeat {
    arrFibonachi = numberFibonachi(array: arrFibonachi)
    count -= 1
} while count >= 0

print(arrFibonachi.count)

// 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:

func eratosfen(count: Int) -> [Int] {
    var arr: [Int] = []
    
    for i in 2...count {
        arr.append(i)
    }
    
    var newArr = arr
    var indexPowNumber: Int = 0
    
    var powNumber, startNumber: Int

    repeat {
        powNumber = newArr[indexPowNumber]
        startNumber = Int(pow(Double(powNumber), 2))
        
        for index in stride(from: startNumber, to: arr.count + powNumber, by: powNumber) {
            if newArr.firstIndex(of: index) != nil {
                newArr.remove(at: newArr.firstIndex(of: index)!)
            }
        }
        
        indexPowNumber += 1
        
    } while startNumber < arr.count

    return newArr
}

//print(eratosfen(count: 545))

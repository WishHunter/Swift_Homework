//
//  main.swift
//  Swift_Homework
//
//  Created by Denis Molkov on 16.01.2021.
//

import Foundation

enum SafeMoneyError: Error {
    case notHaveMoney
    case notHaveWallet
}

//если бы не условия задачи, я бы ввел перечисление доступных вариантов хранения денег, дабы избежать ошибок при выборе варианта хранения))

//enum Wallets {
//    case cash;
//    case deposit;
//    case debetCard;
//}

class SafeMoney {
//    var wallets: [Wallets: UInt] = [
//        .cash: 0,
//        .debetCard: 0,
//        .deposit: 0,
//    ]
    
    var wallets: [String: UInt] = [
        "cash": 0,
        "debetCard": 0,
        "deposit": 0,
    ]
    
    func transferMoney(ofWallet: String, toWallet: String, count: UInt) -> (String?, SafeMoneyError?) {
        guard var walletOf = wallets[ofWallet], var walletTo = wallets[toWallet] else {
            return (nil, SafeMoneyError.notHaveWallet)
        }
        
        guard walletOf >= count else {
            return (nil, SafeMoneyError.notHaveMoney)
        }
        
        walletOf -= count
        walletTo += count
        return ("Changed of \(ofWallet) to \(toWallet) \(count) $", nil)
    }
}

func checkOperation(_ operation: (String?, SafeMoneyError?)) {
    if let result = operation.0 {
        print(result)
    } else if operation.1 == SafeMoneyError.notHaveMoney {
        print("In this wallet you don't have money")
    } else if operation.1 == SafeMoneyError.notHaveWallet {
        print("You don't have this wallet")
    } else {
        print("An error occured, please try later")
    }
}

let myWallet = SafeMoney()

myWallet.wallets["cash"] = 2000

checkOperation(myWallet.transferMoney(ofWallet: "debetCard", toWallet: "cash", count: 5000))
checkOperation(myWallet.transferMoney(ofWallet: "cash", toWallet: "deposid", count: 1000))
checkOperation(myWallet.transferMoney(ofWallet: "cash", toWallet: "deposit", count: 1000))


print("==================================")


class SafeMoney2 {
    var wallets: [String: UInt] = [
        "cash": 0,
        "debetCard": 0,
        "deposit": 0,
    ]
    
    func transferMoney(ofWallet: String, toWallet: String, count: UInt) throws -> String {
        guard var walletOf = wallets[ofWallet], var walletTo = wallets[toWallet] else {
            throw SafeMoneyError.notHaveWallet
        }
        
        guard walletOf >= count else {
            throw SafeMoneyError.notHaveMoney
        }
        
        walletOf -= count
        walletTo += count
        return ("Changed of \(ofWallet) to \(toWallet) \(count) $")
    }
}

func checkOperation2(ofWallet: String, toWallet: String, count: UInt) {
    do {
        print(try myWallet2.transferMoney(ofWallet: ofWallet, toWallet: toWallet, count: count))
    } catch SafeMoneyError.notHaveMoney {
        print("In this wallet you don't have money")
    } catch SafeMoneyError.notHaveWallet {
        print("You don't have this wallet")
    } catch {
        print("An error occured, please try later")
    }
}

let myWallet2 = SafeMoney2()

myWallet2.wallets["cash"] = 2000

checkOperation2(ofWallet: "debetCard", toWallet: "cash", count: 5000)
checkOperation2(ofWallet: "cash", toWallet: "deposid", count: 1000)
checkOperation2(ofWallet: "cash", toWallet: "deposit", count: 1000)


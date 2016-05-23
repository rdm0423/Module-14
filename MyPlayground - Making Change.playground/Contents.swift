//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Make a function that takes in a given amount of money i.e. 2.15 and returns a string of the amount of dollars, quarters, dimes, nickels, and pennies needed to make that amount of money. Return something like : Your change is 1 quarter, 2 dimes, 0 nickels, and 1 penny


func howManyCoins(amount: Double) -> String {
    
    let amountInCents = Int(amount*100)
    let dollars = amountInCents/100
    let quarters = (amountInCents - (dollars*100))/25
    let dimes = (amountInCents - (dollars*100) - (quarters*25))/10
    let nickels = (amountInCents - (dollars*100) - (quarters*25) - (dimes*10))/5
    let pennies = amountInCents - (dollars*100) - (quarters*25) - (dimes*10) - (nickels*5)
    
    let dollarString = dollars == 1 ? "1 dollar":"\(dollars) dollars"
    let quarterString = quarters == 1 ? "1 quarter":"\(quarters) quarters"
    let dimeString = dimes == 1 ? "1 dime":"\(dimes) dimes"
    let nickelString = nickels == 1 ? "1 nickel":"\(nickels) nickels"
    let pennyString = pennies == 1 ? "1 penny":"\(pennies) pennies"
    let amountString = "Your change is \(dollarString), \(quarterString), \(dimeString), \(nickelString), and \(pennyString)"
    
    return amountString
    
}

howManyCoins(2.75)

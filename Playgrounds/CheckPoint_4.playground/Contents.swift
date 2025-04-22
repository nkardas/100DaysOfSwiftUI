// Exercise: Integer Square Root Challenge
// Your task is to write a function that:
// 1. Accepts an integer from 1 through 10,000.
// 2. Returns the integer square root of that number.
//
// Constraints:
// - You cannot use Swift’s built-in sqrt() function or similar.
// - If the number is less than 1 or greater than 10,000, throw an “out of bounds” error.
// - Only consider integer square roots (e.g., ignore that the square root of 3 is 1.732).
// - If you can’t find the square root, throw a “no root” error.
//
// Reminder: The square root of a number X is another number that, when multiplied by itself, gives X.
// For example, the square root of 9 is 3 because 3x3 is 9, and the square root of 25 is 5 because 5x5 is 25.


import UIKit


enum error : Error {
    case outOfBound
}

func root (_ int: Int) throws  -> Int {
    if int < 1 || int > 10_000 {
        throw error.outOfBound
    }
    var i = 0
    while i*i <= int {
        if i*i == int {
            return i
        }
        i += 1
    }
    return 0
}

do {
    let root = try root(9_990)
    if root == 0 {
        print("Pas de racine entière")
    } else {
        print("La racine est \(root)")
    }
} catch {
    print("Out of Bounds")
}

// Exercise: Optionals Challenge
// Your task is to write a function that accepts an optional array of integers and returns one randomly.
// If the array is missing or empty, return a random number in the range 1 through 100.
//
// The challenge is to write this function in a single line of code.


import UIKit


func rand (_ list : [Int]?) -> Int {
    return (list?.randomElement() ?? Int.random(in: 1...100))
}

print(rand([]))

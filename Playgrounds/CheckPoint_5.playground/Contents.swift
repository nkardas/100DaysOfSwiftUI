// Exercise: Closure Challenge with sorted(), filter(), and map()
// Your task is to use closures to process an array of numbers:
// 1. Filter out any numbers that are even.
// 2. Sort the array in ascending order.
// 3. Map them to strings in the format “<number> is a lucky number”.
// 4. Print the resulting array, one item per line.
//
// Input:
// let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
//
// Expected Output:
// 7 is a lucky number
// 15 is a lucky number
// 21 is a lucky number
// 31 is a lucky number
// 33 is a lucky number
// 49 is a lucky number


import UIKit


let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

func intToString (_ int : Int) -> String {
    return "\(int) is a lucky number"
}

func luckyNumbers (_ lN : [Int]) -> Void {
    var list = lN.filter { !$0.isMultiple(of: 2) }
    list = list.sorted()
    var stringList = list.map { intToString($0) }
    for i in stringList {
        print(i)
    }
}

luckyNumbers(luckyNumbers)

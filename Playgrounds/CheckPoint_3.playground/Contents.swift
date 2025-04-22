// Exercise: Fizz Buzz Challenge
// Your task is to loop from 1 through 100 and for each number:
// 1. If it’s a multiple of 3, print “Fizz”.
// 2. If it’s a multiple of 5, print “Buzz”.
// 3. If it’s a multiple of both 3 and 5, print “FizzBuzz”.
// 4. Otherwise, just print the number.
//
// Example outputs:
// - 1 should print “1”
// - 2 should print “2”
// - 3 should print “Fizz”
// - 4 should print “4”
// - 5 should print “Buzz”
// - 6 should print “Fizz”
// - ...
// - 15 should print “FizzBuzz”
// - ...
// - 100 should print “Buzz”


import UIKit


for i in 1...100 {
    if i.isMultiple(of: 3) {
        if i.isMultiple(of: 5) {
            print("FizzBuzz")
            continue
        }
        print("Fizz")
    } else if i.isMultiple(of: 5) {
        print("Buzz")
    } else {
        print(i)
    }
}

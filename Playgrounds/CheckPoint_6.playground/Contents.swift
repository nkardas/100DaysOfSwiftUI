// Exercise: Structs and Methods Challenge
// Your task is to create a struct to store information about a car, including:
// 1. Model (String)
// 2. Number of seats (Int)
// 3. Current gear (Int)
//
// Additionally, add a method to change gears up or down.
// Consider the following:
// - Which properties should be constants and which should be variables?
// - What data should be exposed publicly?
// - Should the gear-changing method validate its input to ensure it stays within a valid range?


import UIKit


struct Car {
    
    let model : String
    let seats : Int
    
    var gear : Int = 0
    
    func printInfo () {
        if gear == 0 {
            print("La voiture \(model) comprenant \(seats) places est actuellement en position recul")
        } else {
            print("La voiture \(model) comprenant \(seats) places est actuellement en position \(gear)")
        }
    }
    
    mutating func gearUp () {
        gear += 1
    }
    mutating func gearDown () {
        gear -= 1
    }
    
}

var C = Car(model: "Fiat 500", seats: 3)
C.printInfo()
C.gearUp()
C.printInfo()

// Exercise: Protocols and Extensions Challenge
// Your task is to create a protocol that describes a building with the following requirements:
// 1. A property storing how many rooms it has.
// 2. A property storing the cost as an integer (e.g., 500,000 for a building costing $500,000).
// 3. A property storing the name of the estate agent responsible for selling the building.
// 4. A method for printing the sales summary of the building, describing what it is along with its other properties.
//
// Then, create two structs, House and Office, that conform to this protocol.


import UIKit


protocol Building {
    
    var numberRoom : Int { get }
    var cost : Int { get }
    var estateAgent : String { get }
    
    func printInfo () -> Void
    
}

struct House : Building{
    let numberRoom : Int = 0
    let cost : Int
    let estateAgent : String
    
    func printInfo() {
        print("La maison contient \(numberRoom) pièces, coûte \(cost)€ et est vendue par \(estateAgent).")
    }
}

struct Office : Building{
    let numberRoom : Int
    let cost : Int
    let estateAgent : String
    
    func printInfo() {
        print("Le bureau contient \(numberRoom) pièces, coûte \(cost)€ et est vendue par \(estateAgent).")
    }
}

let O = Office(numberRoom: 4, cost: 200_000, estateAgent: "Moi")
O.printInfo()

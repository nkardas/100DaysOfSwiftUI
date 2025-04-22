// Exercise: Class Hierarchy Challenge
// Your task is to create a class hierarchy for animals with the following structure:
// 1. Create an Animal class at the top with an integer property `legs` to track the number of legs.
// 2. Create Dog and Cat subclasses of Animal.
// 3. Create Corgi and Poodle subclasses of Dog.
// 4. Create Persian and Lion subclasses of Cat.
//
// Additional requirements:
// - The Dog class should have a `speak()` method that prints a generic dog barking string,
//   but each subclass should print something slightly different.
// - The Cat class should have a matching `speak()` method, with each subclass printing something different.
// - The Cat class should have an `isTame` Boolean property, provided using an initializer.


import UIKit


class Animal {
    var legs : Int
    
    init (legs : Int) {
        self.legs = legs
    }
    
    deinit {}
}

class Dog : Animal {
    var bark : String
    
    func speak () {
        print(bark)
    }
    
    init (bark : String) {
        self.bark = bark
        super.init(legs: 4)
    }
    
    deinit {}
}

class Cat : Animal {
    var meow : String
    var isTame : Bool
    
    func speak () {
        print(meow)
    }
    
    init (meow : String, isTame : Bool) {
        self.meow = meow
        self.isTame = isTame
        super.init(legs: 4)
    }
    
    deinit {}
}

class Corgi : Dog {
    
    init () {
        super.init(bark: "wouif")
    }
    
    deinit {}
}

class Poodle : Dog {
    
    init () {
        super.init(bark: "Woof")
    }
    
    deinit {}
}

class Lion : Cat {
    
    init (isTame : Bool) {
        super.init(meow: "Wraouh", isTame: isTame)
    }
    
    deinit {}
}

class Persian : Cat {
    
    init (isTame : Bool) {
        super.init(meow: "Miaouh", isTame: isTame)
    }
    
    deinit {}
}

let P = Lion(isTame: true)
P.speak()

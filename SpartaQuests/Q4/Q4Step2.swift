//
//  Q4Step2.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/5/25.
//

import Foundation

enum Q4Step2 {
    /// 1. 동물 클래스 설계
    class Animal {
        var name: String
        
        func makeSound() {
            print("\(name)!")
        }
        
        init(name: String) {
            self.name = name
        }
    }
    
    class Dog: Animal {
        override func makeSound() {
            print("Bark!")
        }
    }
    
    class Cat: Animal {
        override func makeSound() {
            print("Meow!")
        }
    }
}


func q4Step2() {
    typealias T = Q4Step2
    
    var animals: [T.Animal] = [T.Dog(name: "dog"), T.Cat(name: "cat")]
    
    for animal in animals {
        animal.makeSound()
    }
}

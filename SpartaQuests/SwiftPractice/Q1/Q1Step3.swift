//
//  Q1Step3.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/7/25.
//

import Foundation

enum Q1Step3 {
    protocol greetable {
        func greet()
    }

    struct Person: greetable {
        var name: String
        
        func greet() {
            print("\(name) Hello")
        }
    }
    
    class Robot: greetable {
        let id: UUID = UUID()
        
        func greet() {
            print("\(id) Hello")
        }
    }
}

func q1Step3() {
    typealias ns = Q1Step3
    
    let person = ns.Person(name: "john doe")
    let robot = ns.Robot()

    person.greet()
    robot.greet()
}

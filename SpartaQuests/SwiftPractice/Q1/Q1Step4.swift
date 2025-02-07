//
//  Q1Step4.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/7/25.
//

import Foundation

enum Q1Step4 {
    protocol greetable {
        func greet() -> String
    }

    struct Alian: greetable {
        var name: String
    }
}

extension Q1Step4.greetable {
    func greet() -> String {
        return "hello!"
    }
}

func q1Step4() {
    var alien = Q1Step4.Alian(name: "Al")
    print(alien.greet())
}

//
//  Q1Step2.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/7/25.
//

import Foundation

enum Q1Step2 {
    class User {
        var name: String
        
        init(name: String) {
            self.name = name
        }
    }
}

func q1Step2() {
    let A = Q1Step2.User(name: "A")
    let B = A

    A.name = "changed A"

    print(A.name, B.name)
}

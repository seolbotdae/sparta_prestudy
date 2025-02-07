//
//  Q1Step1.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/7/25.
//

import Foundation

enum Q1Step1 {
    struct User {
        var name: String
        var age: Int
    }
}

func q1Step1() {
    var A = Q1Step1.User(name: "A", age: 10)
    var B = Q1Step1.User(name: "B", age: 20)

    print(A, B)

    A.age = 100

    print(A, B)
}

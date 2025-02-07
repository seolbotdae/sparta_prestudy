//
//  Q4Step2.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/5/25.
//

import Foundation

enum Q4Step2 {
    /// 2. 제네릭 스택 구현
    struct Stack<T> {
        var elements: [T] = []
        
        mutating func push(_ element: T) {
            elements.append(element)
        }
        
        mutating func pop() -> T? {
            return elements.isEmpty ? nil : elements.popLast()
        }
        
        func show() {
            print("현재 스택의 상태: \(elements)")
        }
    }
}

func q4Step2() {
    /// 1. 제네릭 함수 작성
    func swapValues<T>(_ a: inout T, _ b: inout T) {
        var temp: T
        
        temp = a
        a = b
        b = temp
    }
    
    var a = 10
    var b = 20
    swapValues(&a, &b)
    print(a, b)
    
    /// 2. 제네릭 스택 구현
    var intStack = Q4Step2.Stack<Int>()
    intStack.push(1)
    intStack.push(2)
    print(intStack.pop() ?? "empty")
}

//
//  Queue.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/4/25.
//
//
//import Foundation
//
// 왜 struct 인가
struct Queue<T> {
    private var elements: [T] = []
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
}

func runQueue() {
    var q = Queue<Int>()
    
    q.enqueue(1)
    q.enqueue(2)
    
    print(q)
    
    q.dequeue()
    
    print(q)
}

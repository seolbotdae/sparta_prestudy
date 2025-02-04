//
//  Q2Step1.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/4/25.
//

import Foundation

/// xcode cli 환경에서 작성하다 보니 가끔 이름이 겹치는 경우가 있습니다.
/// namespace 대용으로 enum 사용
enum Q2Step1 {
    struct Queue {
        private var elements: [Int] = []
        
        mutating func enqueue(_ element: Int) {
            elements.append(element)
        }
        
        mutating func dequeue() -> Int? {
            elements.isEmpty ? nil : elements.removeFirst()
        }
        
        func current() {
            print("큐의 현재 상태: \(elements)")
        }
    }
    
    struct Stack {
        private var elements: [String] = []
        
        mutating func push(_ element: String) {
            elements.append(element)
        }
        
        mutating func pop() -> String? {
            elements.isEmpty ? nil : elements.popLast()
        }
        
        mutating func top() -> String? {
            elements.isEmpty ? nil : elements.last
        }
    }
}

func q2step1() {
    /// 큐 사용코드
    var q: Q2Step1.Queue = Q2Step1.Queue()
    
    q.enqueue(1)
    q.enqueue(2)
    q.enqueue(3)
    
    q.current()
    
    q.dequeue()
    
    q.current()
    
    /// 스택 사용코드
    var st: Q2Step1.Stack = Q2Step1.Stack()
    
    st.push("a")
    st.push("b")
    st.push("c")
    st.push("d")
    
    print(st.top() ?? "empty")
    
    st.pop()
    
    print(st.top() ?? "empty")
}

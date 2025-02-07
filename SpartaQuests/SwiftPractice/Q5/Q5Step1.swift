//
//  Q5Step1.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/6/25.
//

import Foundation
import Combine

func q5Step1() {
    // 1. 간단한 Publisher와 Subscriber 만들기
    let numbers = [10, 20, 30, 40, 50].publisher
    
    numbers
        .map { $0 * 2 }
        .sink { print($0) }
    
    // 2. Just Publisher 사용
    let publisher = Just(100)
    
    publisher
        .map { $0 + 50 }
        .sink { print($0) }
}

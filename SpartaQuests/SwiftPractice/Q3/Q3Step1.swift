//
//  Q3Step1.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/5/25.
//

import Foundation

func q3Step1() {
    // 1. 간단한 클로저 구현
    let arr = [1, 2, 3, 4, 5]
    let double = arr.map { $0 * 2 }

    print(double)

    // 2. 클로저 캡처 이해
    var counter = 0
    let incrementCounter = {
        counter += 1
    }

    counter = 5

    incrementCounter()

    counter = 0

    incrementCounter()

    print(counter) // 출력: ?
}

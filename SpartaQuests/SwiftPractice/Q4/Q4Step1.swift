//
//  Q4Step1.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/5/25.
//

import Foundation

func q4Step1() {
    /// 1. 비동기 데이터 처리
    let group = DispatchGroup()
    
    group.enter()
    
    DispatchQueue.global().async {
        for i in 1...5 {
            print(i)
        }
        group.leave()
    }
    
    group.notify(queue: DispatchQueue.main) {
        print("UI 업데이트 완료")
    }
    
    /// 2. 네트워크 시뮬레이션
    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        print("데이터 로드 완료")
    }
    
    dispatchMain()
}

//
//  WorkLoop.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/5/25.
//

import Foundation

import Dispatch

//let networkWorkloop = DispatchWorkloop()
//let dispatchGroup = DispatchGroup()
//
//// Workloop에서 실행할 최종 데이터 처리 작업
//let processData = DispatchWorkItem {
//    print("✅ 모든 네트워크 요청이 완료됨! 데이터 처리 시작...")
//}
//networkWorkloop.perform(processData)
//
//func fetchData(taskName: String, delay: Int) {
//    dispatchGroup.enter()  // 👈 직접 enter() 호출
//    DispatchQueue.global().async {
//        print("📡 \(taskName) 요청 시작...")
//        sleep(UInt32(delay))
//        print("✅ \(taskName) 요청 완료!")
//        dispatchGroup.leave()  // 👈 작업이 끝난 후 leave() 호출
//    }
//}
//
//// 여러 개의 네트워크 요청 시작
//fetchData(taskName: "API 요청 1", delay: 2)
//fetchData(taskName: "API 요청 2", delay: 3)
//fetchData(taskName: "API 요청 3", delay: 1)
//
//// 모든 네트워크 요청이 끝나면 Workloop 실행
//dispatchGroup.notify(queue: DispatchQueue.global()) {
//    print("🌍 모든 네트워크 작업 완료! Workloop 실행")
//    networkWorkloop.wake()
//}

//
//  GDC.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/5/25.
//

import Foundation

/// DispatchQueue 클래스를 통한 관리를 실행
///
/// 스레드를 먼저 알아야 할 듯
/// 스레드는 프로세스의 작은 실행 단위
///
/// 프로세스 안에는 여러 스레드가 존재할 수 있고
/// 각 스레드는 독립적인 CPU에서 실행 -> iOS 칩은 여러 CPU 코어로 이루어짐
///
/// 스레드 풀은 미리 일정 수의 스레드를 만들어두고 재사용하여 여러 작업을 처리하는 기법
/// 스레드들은 풀에 있다가 작업이 들어오면 주워서 작업하고 다하면 다시 풀로 들어감
///
/// 메인 큐와 글로벌 큐의 차이
/// 메인큐에서 async를 하는 것은 메인 스레드와 연결되어있기 때문에 UI에 문제 없음
/// 하지만 글로벌 큐는 백그라운드에서 동작하기 때문에 UI와 관련없는 작업에 적합

func runGCD() {
    let item = DispatchWorkItem {
        print("hello")
    }
    
    DispatchQueue.main.async(execute: item)
}

func runSync() {
    let item = DispatchWorkItem {
        print("sync hello")
    }
    
    DispatchQueue.global().sync {
        print("global sync")
    }
}

func showDispatchQueue() {
    print(DispatchQueue.main.label)
    print(DispatchQueue.global().label)
}

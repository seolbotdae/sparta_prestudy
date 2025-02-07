//
//  EnumPractice.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/4/25.
//

import Foundation

enum EnumPractice {
    enum Weekday: String, CaseIterable {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
    }
    
    enum Message {
        case text(String)
        case image(String, size: Int)
        case video(url: String, duration: Int)
    }
}

// 원시값은 rawValue 참조를 통해 변수처럼 사용이 가능
//func showToday() {
//    let today: EnumPractice.Weekday = .sunday
//
//    print(today.rawValue)
//}


// 연관값이 문제인데..
// 연관값.. 이름에서 무엇을 하는넘인지 알수없다..
// 이 상태 그대로는 바보다..

//enum Maindish {
//    case pasta(taste: String)
//    case pizza(dough: String, topping: String)
//}
//
//func enumPractice() {
//    var dinner: Maindish = .pasta(taste: "hello")
//    print(dinner)
//    // 될거같은데 안되는 표현..
//    // print(dinner.taste)
//}


// 순환열거형의 사용예시

//indirect enum BinaryTree<T> {
//    case empty
//    case node(value: T, left: BinaryTree<T>, right: BinaryTree<T>)
//}
//
//let leafNode = BinaryTree.node(value: 3, left: .empty, right: .empty)
//let rootNode = BinaryTree.node(value: 5, left: leafNode, right: .empty)


// compare 가능한 열거형

// 위에서 아래로 값이 커진다.
//enum Condition: Comparable {
//    case terrible
//    case bad
//    case good
//    case great
//}


// enum 은 switch랑 써야 제맛이다.

/// 1.  allcases 사용
//func allCasesExample() {
//    // 전부 순회하면서 한꺼번에 처리 가능
//    for day in EnumPractice.Weekday.allCases {
//        switch day {
//        case .monday:
//            print("으윽 월요일")
//        case .friday:
//            print("불금!")
//        default:
//            print("다른 날..")
//        }
//    }
//}

/// 2. Associated Values (연관값) 활용

//func associatedValuesExample() {
//    func handleMessage(_ message: EnumPractice.Message) {
//        switch message {
//            // 이런 식으로 내부로 값을 보낼 수 있음
//        case .text(let content):
//            print("텍스트 메시지: \(content)")
//        case .image(let url, let size):
//            print("이미지 URL: \(url), 크기: \(size)KB")
//        case .video(let url, let duration):
//            print("비디오 URL: \(url), 길이: \(duration)초")
//        }
//    }
//    
//    // 원하는 값만을 보내도록 강제할 수 있음
//    handleMessage(.text("안녕"))
//}

/// 3. 네트워크 처리 예시
//
//extension EnumPractice {
//    enum APIResponse {
//        case success(data: String, statusCode: Int)
//        case failure(error: String, statusCode: Int)
//        // 요청 중 상태
//        case loading
//    }
//}
//
//func handleResponse(_ response: EnumPractice.APIResponse) {
//    switch response {
//    case .success(let data, let statusCode) where statusCode == 200:
//        print("요청 성공! 데이터: \(data)")
//    case .success(_, let statusCode) where statusCode == 201:
//        print("새 리소스 생성")
//    case .failure(let error, let statusCode) where statusCode == 404:
//        print("오류: \(error) 리소스 찾을 수 없음")
//    case .failure(let error, let statusCode) where statusCode >= 500:
//        print("서버 오류 발생 \(error) code: \(statusCode)")
//    case .loading:
//        print("로딩 중")
//    default:
//        print("처리되지 않은 예외")
//    }
//}

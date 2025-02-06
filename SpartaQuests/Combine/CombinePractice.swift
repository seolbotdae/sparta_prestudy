//
//  CombinePractice.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/6/25.
//

import Foundation
import Combine

func combinePractice1() {
    // publisher 생성
    let numbers = [10, 20, 30, 40, 50].publisher
    
    numbers
        .map { $0 * 2 }
        .sink { print($0) }
}

func combinePractice2() {
    let publisher = Just(100)
    
    publisher
        .map { $0 + 50 }
        .sink { print($0) }
}

/*
 {
   "userId": 1,
   "id": 1,
   "title": "delectus aut autem",
   "completed": false
 }
 */

struct Response: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

func combinePractice3() {
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    
    let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)
    
    var cancellable: AnyCancellable?
    
    cancellable = session
        .dataTaskPublisher(for: url)
        .tryMap() { element -> Data in
            guard let httpResponse = element.response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            print(element.data)
            return element.data
        }
        .decode(type: Response.self, decoder: JSONDecoder())
        .sink(receiveCompletion: { print("receiveCompletion: \($0)")} ) { response in
            print(response.title)
        }
    
    sleep(10)
}

func combinePractice4() {
    // 1초마다 현재 시간을 출력하는 Combine 타이머
    var cancellable: AnyCancellable?
    
    cancellable = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
        .sink() { _ in
            print("현재 시간: \(Date.now.formatted(date: .omitted, time: .standard))")
        }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        cancellable?.cancel()
    }
    
    CFRunLoopRun()
}

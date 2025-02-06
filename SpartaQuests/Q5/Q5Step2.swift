//
//  Q5Step2.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/6/25.
//

import Foundation
import Combine

func q5Step2() {
    // 1. URLSession과 Combine 사용
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
    
    let configuration = URLSessionConfiguration.default
    let session = URLSession(configuration: configuration)
    
    var sessionCancellable: AnyCancellable?
    
    sessionCancellable = session
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
    
    // 2. Timer Publisher 사용
    var timerCancellable: AnyCancellable?
    
    timerCancellable = Timer.publish(every: 1, on: .main, in: .common)
        .autoconnect()
        .sink() { _ in
            print("현재 시간: \(Date.now.formatted(date: .omitted, time: .standard))")
        }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        timerCancellable?.cancel()
    }
    
    CFRunLoopRun()
}

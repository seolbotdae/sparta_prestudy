//
//  ARC.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/4/25.
//

import Foundation

//class Person {
//    let name: String
//    
//    var pet: Pet?
//    
//    init(name: String, pet: Pet? = nil) {
//        self.name = name
//        self.pet = pet
//    }
//    
//    deinit {
//        print("person finish")
//    }
//}
//
//class Pet {
//    let name: String
//    
//    var owner: Person?
//    
//    init(name: String, owner: Person? = nil) {
//        self.name = name
//        self.owner = owner
//    }
//    
//    deinit {
//        print("pet finish")
//    }
//}
//func runARC() {
//    var human: Person? = Person(name: "Seol")
//    var cat: Pet? = Pet(name: "Cat")
//    
//    human?.pet = cat
//    cat?.owner = human
//    
//    human = nil
//    cat = nil
//}

// 강참순 약참으로 해결

//class Person {
//    let name: String
//    // 약한 참조
//    weak var pet: Pet?
//
//    init(name: String, pet: Pet? = nil) {
//        self.name = name
//        self.pet = pet
//    }
//
//    deinit {
//        print("person finish")
//    }
//}
//
//class Pet {
//    let name: String
//    var owner: Person?
//
//    init(name: String, owner: Person? = nil) {
//        self.name = name
//        self.owner = owner
//    }
//
//    deinit {
//        print("pet finish")
//    }
//}
//
//func runARC() {
//    var human: Person? = Person(name: "Seol")
//    var cat: Pet? = Pet(name: "Cat") // h: 1 c: 1
//
//    human?.pet = cat // h:1 c:1
//    cat?.owner = human // h:2, c:1
//
//    cat = nil // h:1 c:0
//    human = nil // h:0 c:0
//}


/// 미소유참조
/// 참조 카운트를 올리지 않지만
/// 하지만 언제나 메모리에 남아있을 것이라는 것을 전제로 한다.
///
/// ... 카드 객체는 주인 객체가 반드시 있긴 하다이기 때문에 사용할 수 있다.

/// 클로저의 강참순
///
/// 클로저는 자기자신 객체를 살려두려 하기 때문에 카운트가 올라간다.

//class Person {
//    let name: String
//    let hobby: String?
//    
//    lazy var indroduce: () -> String = {
//        var introduction: String = "My name is \(self.name)"
//        
//        guard let hobby = self.hobby else {
//            return introduction
//        }
//        
//        introduction += ", I like \(hobby)."
//        return introduction
//    }
//    
//    init(name: String, hobby: String?) {
//        self.name = name
//        self.hobby = hobby
//    }
//    
//    deinit {
//        print("\(name) is being deinitialized...")
//    }
//}
//
//func runARC() {
//    var p: Person? = Person(name: "Seol", hobby: "Swift")
//    print(p?.indroduce())
//    p = nil
//}

/// 클로저의 획득목록
/// 참조할 변수를 직접 지정할 수 있다.
///

//func runARC() {
//    var a = 0
//    var b = 0
//    
//    // a 는 내부에서 상수가 된다.
//    let closure = { [a] in
//        print(a, b)
//        b = 20
//        print(a, b)
//    }
//    
//    a = 10
//    b = 10
//    
//    closure()
//    
//    print(a, b)
//}

/// 하지만 참조타입을 획득한다면?
///

//class Test {
//    var test: String
//    
//    init(test: String) {
//        self.test = test
//    }
//}
//
//func runARC() {
//    var test1: Test? = Test(test: "test1")
//    var test2 = Test(test: "test2")
//    
//    let closure = { [weak test1, unowned test2] in
//        print(test1?.test, test2.test)
//    }
//}
//

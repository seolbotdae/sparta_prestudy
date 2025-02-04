//
//  Q2Step2.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/4/25.
//

import Foundation

enum Q2Step2 {
    class Person {
        var name: String
        var pet: Pet?
        
        init(name: String, pet: Pet? = nil) {
            self.name = name
            self.pet = pet
        }
        
        deinit {
            print("Person 인스턴스 종료")
        }
    }
    
    class Pet {
        var owner: Person?
        
        init(owner: Person? = nil) {
            self.owner = owner
        }
        
        deinit {
            print("Pet 인스턴스 종료")
        }
    }
    
    class ResolvePerson {
        var name: String
        
        weak var pet: ResolvePet?
        
        init(name: String, pet: ResolvePet? = nil) {
            self.name = name
            self.pet = pet
        }
        
        deinit {
            print("ResolvePerson 인스턴스 종료")
        }
    }
    
    class ResolvePet {
        var owner: ResolvePerson?
        
        init(owner: ResolvePerson? = nil) {
            self.owner = owner
        }
        
        deinit {
            print("ResolvePet 인스턴스 종료")
        }
    }
}

func q2step2() {
    typealias nsp = Q2Step2
    
    /// 강한 순환참조 확인
    var person: nsp.Person? = nsp.Person(name: "Seol") // person: 1, pet: 0
    var pet: nsp.Pet? = nsp.Pet() // person: 1, pet: 1
    
    person?.pet = pet // person: 1, pet: 2
    pet?.owner = person // person: 2, pet: 2
    
    person = nil // person: 1, pet: 2
    pet = nil // person: 1, pet: 1
    
    /// 순환 참조 해결 확인
    var resolvePerson: nsp.ResolvePerson? = nsp.ResolvePerson(name: "Seol") // rsvperson: 1, rsvpet: 0
    var resolvePet: nsp.ResolvePet? = nsp.ResolvePet() // rsvperson: 1, rsvpet: 1
    
    resolvePerson?.pet = resolvePet // rsvperson: 1, rsvpet: 1
    resolvePet?.owner = resolvePerson // rsvperson: 2, rsvpet: 1
    
    resolvePerson = nil // rsvperson: 1, rsvpet: 1
    /// Pet이 먼저 count가 0이 되며 deinit 실행 후 삭제되면서 참조하고있던 rsvperson 을 nil로 만듦
    /// ResolvePet 이 먼저 종료됩니다.
    resolvePet = nil // rsvperson: 0, rsvpet: 0
    
//    resolvePet = nil // rsvperson: 1, rsvpet: 0
//    resolvePerson = nil // rsvperson: 0, rsvpet: 0
}

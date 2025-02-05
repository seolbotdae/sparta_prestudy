//
//  GenericPractice.swift
//  SpartaQuests
//
//  Created by Seol WooHyeok on 2/5/25.
//

import Foundation

/// 제네릭에서 조건을 거는 방법
///

// 두 컬렉션에서 공통 요소를 찾아 반환하는 함수
func findCommonElements<C1: Collection, C2: Collection>(
    in first: C1,
    and second: C2
) -> [C1.Element] where C1.Element: Hashable, C1.Element == C2.Element {
    let set1 = Set(first)   // C1의 요소가 Hashable해야 Set 생성 가능
    let set2 = Set(second)
    let commonSet = set1.intersection(set2)
    return Array(commonSet)
}

func runWhereGeneric() {
    // 사용 예시
    let array1 = [1, 2, 3, 4, 5]
    let array2 = [3, 4, 5, 6, 7]
    let commonNumbers = findCommonElements(in: array1, and: array2)
    print(commonNumbers)  // 출력 예: [3, 4, 5] (순서는 보장되지 않음)
}

/// 프로토콜의 연관 타입
/// 연관.. 이라는 말이 진짜 별로다.
/// 프로토콜에서 제네릭터럼 타입을 지정하는 방법
/// 이후 자동추론이 들어간다.

protocol Container {
    // associatedtype은 이 프로토콜을 채택하는 타입에서 구체적으로 결정할 타입을 의미합니다.
    associatedtype Item

    // 컨테이너에 요소를 추가하는 메서드
    mutating func append(_ item: Item)
    
    // 컨테이너에 저장된 요소의 개수를 반환하는 프로퍼티
    var count: Int { get }
    
    // 인덱스를 통해 컨테이너의 요소에 접근하는 서브스크립트
    subscript(index: Int) -> Item { get }
}


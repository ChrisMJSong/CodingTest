//
//  Task2_1_Swift.swift
//  CodingTest
//
//  Created by Moojong Song on 18/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit

class Task2_1_Swift: Task {
    
    override init() {
        super.init()
        
        question = """
        A non-empty array A consisting of N integers is given. The array contains an odd number of elements, and each element of the array can be paired with another element that has the same value, except for one element that is left unpaired.
        
        For example, in array A such that:
        
            A[0] = 9  A[1] = 3  A[2] = 9
            A[3] = 3  A[4] = 9  A[5] = 7
            A[6] = 9
                * the elements at indexes 0 and 2 have value 9,
                * the elements at indexes 1 and 3 have value 3,
                * the elements at indexes 4 and 6 have value 9,
                * the element at index 5 has value 7 and is unpaired.
        Write a function:
        
            public func solution(_ A : inout [Int]) -> Int
        
        that, given an array A consisting of N integers fulfilling the above conditions, returns the value of the unpaired element.
        
        For example, given array A such that:
        
            A[0] = 9  A[1] = 3  A[2] = 9
            A[3] = 3  A[4] = 9  A[5] = 7
            A[6] = 9
        the function should return 7, as explained in the example above.
        
        Write an efficient algorithm for the following assumptions:
        
            * N is an odd integer within the range [1..1,000,000];
            * each element of array A is an integer within the range [1..1,000,000,000];
            * all but one of the values in A occur an even number of times.
        """
    }
    
    public override func compile() {
        super.compile()
        
        tests = [("Example tests", [[9, 3, 9, 3, 9, 7, 9]]), ("Correctness tests", [42])]
        for test in tests {
            print(test.type)
            for exam in test.cases {
                if var v = exam as? [Int] {
                    _ = solution(&v)
                }
            }
        }
    }
    
    /// 위의 조건을 충족하는 N개의 정수로 구성된 배열이 주어질 경우, 짝이 맞지 않는 원소를 반환하라.
    ///
    /// - Parameter A: 정수의 배열
    /// - Returns: 짝이 맞지 않는 원소의 값
    public func solution(_ A : inout [Int]) -> Int {
        // write your code in Swift 4.2.1 (Linux)
        
        // 임시로 갯수 값을 담을 딕셔너리 생성
        var tuple: [Int: Int] = [:]
        
        for i in A {
            tuple[i] = (tuple[i] ?? 0) + 1
        }
        
        // 튜플 검사
        for t in tuple {
            if t.value % 2 == 1 {
                return t.key
            }
        }
        
        return 0    // 값을 못 찾음.
    }
}

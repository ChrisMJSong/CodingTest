//
//  Task1_1_Swift.swift
//  CodingTest
//
//  Created by Moojong Song on 10/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit

class Task1_1_Swift: Task {
    
    override init() {
        super.init()
        
        question = """
        A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.
        
        For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps. The number 32 has binary representation 100000 and has no binary gaps.
        
        Write a function:
        
            public func solution(_ N : Int) -> Int
        
        that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.
        
        For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5. Given N = 32 the function should return 0, because N has binary representation '100000' and thus no binary gaps.
        
        Write an efficient algorithm for the following assumptions:
        
            * N is an integer within the range [1..2,147,483,647].
        """
    }

    public override func compile() {
        super.compile()
        
        tests = [("Example tests", [1041, 15, 32]), ("Correctness tests", [1, 5, 2147483647])]
        for test in tests {
            print(test.type)
            for exam in test.cases {
                if let v = exam as? Int {
                    _ = solution(v)
                }
            }
        }
    }
    
    /// 정수 N이 주어질때, 가장 긴 바이너리 갭의 길이를 반환하라.
    /// 함수는 N이 바이너리 갭을 포함하지 않았을 경우 0을 반환해야 한다.
    ///
    /// - Parameter N: 양의 정수
    /// - Returns: 바이너리 갭의 길이를 반환한다.
    public func solution(_ N : Int) -> Int {
        // write your code in Swift 4.2.1 (Linux)
        let startTime = CFAbsoluteTimeGetCurrent()
        
        // 이진 문자열로 만든다.
        let biString = String(N, radix: 2)
        
        // 첫 문자열을 가져온다. (무조건 1)
        let fs = biString[biString.startIndex]
        
        var maxCount = 0
        var count = 0
        
        // 루프를 돌며 첫 문자열과 다른 문자열(0)의 갯수를 센다.
        for i in 1..<biString.count {
            let cha = biString[biString.index(biString.startIndex, offsetBy: i)]
            if cha != fs {
                count += 1
            }else {
                maxCount = max(count, maxCount) // 큰 값을 저장함.
                count = 0   // 초기화
            }
        }
        
        _ = timeStamp(startTime)
        print("n=\(N)=\(biString)_\(maxCount)")
        return maxCount
    }
}

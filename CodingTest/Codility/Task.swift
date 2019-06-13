//
//  Task.swift
//  CodingTest
//
//  Created by Moojong Song on 10/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit

class Task: NSObject {
    var question: String    = ""  // 질문
    var result: String      = ""  // 답
    var tests: [(type: String, cases: [Any])] = []  // 테스트 케이스
    
    /// 클래스를 실행한다.
    public func compile(){
        // 컴파일은 자식 클래스에서 수행한다.
    }
    
    /// 경과시간을 계산하여 포맷에 맞추어 반환한다.
    ///
    /// - Parameter startTime: 시작시간
    /// - Returns: 반환할 타임스탬프 문자열
    func timeStamp(_ startTime: CFAbsoluteTime) -> String{
        let time = CFAbsoluteTimeGetCurrent() - startTime
        let result = String(format: "%1.3fs\t%@", CFAbsoluteTimeGetCurrent() - startTime, time < 6.0 ? "OK" : "TIME OUT")
        print(result)
        
        return result
    }
}

//
//  TaskModel.swift
//  CodingTest
//
//  Created by Moojong Song on 11/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit

struct TaskModel {
    enum Difficulty: Int {
        case easy = 0, medium, hard
        
        /// 난이도 문자열을 반납함
        ///
        /// - Returns: 난이도에 따른 단어을 반환한다.
        func string() -> String {
            var result = ""
            switch self {
            case .easy:     result = "PAINLESS"
            case .medium:   result = "RESPECTABLE"
            case .hard:     result = "AMBITIOUS"
            }
            
            return result
        }
    }
    
    enum TaskScore: Int {
        case poor = 30, partial = 80, good = 100
        
        func string() -> String {
            var result = ""
            switch self {
            case .poor:     result = "POOR"
            case .partial:  result = "PARTIAL"
            case .good:     result = "GOOD"
            }
            
            return result
        }
    }
    
    var level: Int              = 1
    var difficulty: Difficulty  = .easy // Difficulty
    var title: String           = ""    // Task Title
    var description: String     = ""    // Task Description
    var score: Int              = 0     // Current Score
    var maxScore: Int           = 100   // Max score
    var object: Task?
    var link: String?                   // 정답 링크 URL
    // 정답 수준 출력
    var scoreLevel: TaskScore {
        get {
            switch score {
            case 0...TaskScore.poor.rawValue:
                return .poor
            case 31...TaskScore.partial.rawValue:
                return .partial
            case 81...TaskScore.good.rawValue:
                return .good
            default:
                return .poor
            }
        }
    }
    
    init(level: Int, title: String) {
        self.level = level
        self.title = title
    }
    init(level: Int, title: String, description: String) {
        self.level  = level
        self.title  = title
        self.description = description
    }
}

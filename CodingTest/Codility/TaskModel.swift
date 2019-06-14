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
        case elementary = 0, easy, medium, hard
        
        /// 난이도 문자열을 반환함
        ///
        /// - Returns: 난이도에 따른 문제의 단어을 반환한다.
        func string() -> String {
            var result = ""
            switch self {
            case .elementary:   result = "EFFORTLESS"
            case .easy:         result = "PAINLESS"
            case .medium:       result = "RESPECTABLE"
            case .hard:         result = "AMBITIOUS"
            }
            
            return result
        }
        
        /// 결과 화면의 문자열을 반환함.
        ///
        /// - Returns: 난이도에 따른 결과의 단어를 반환한다.
        func resultString() -> String {
            var result = ""
            switch self {
            case .elementary:   result = "ELEMENTARY"
            case .easy:         result = "EASY"
            case .medium:       result = "MEDIUM"
            case .hard:         result = "HARD"
            }
            
            return result
        }
        
        func color() -> UIColor {
            var result = UIColor()
            switch self {
            case .elementary:   result = UIColor(red:0.57, green:0.78, blue:0.34, alpha:1.00)
            case .easy:         result = UIColor(red:0.11, green:0.61, blue:0.09, alpha:1.00)
            case .medium:       result = UIColor(red:1.00, green:0.64, blue:0.15, alpha:1.00)
            case .hard:         result = UIColor(red:0.67, green:0.00, blue:0.01, alpha:1.00)
            }
//            // type-own
//            result = UIColor(red:0.03, green:0.38, blue:0.60, alpha:1.00)
            
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
        
        func color() -> UIColor {
            var result = UIColor()
            switch self {
            case .poor:     result = UIColor(red:1.00, green:0.30, blue:0.37, alpha:1.00)
            case .partial:  result = UIColor(red:1.00, green:0.64, blue:0.15, alpha:1.00)
            case .good:     result = UIColor(red:0.11, green:0.61, blue:0.09, alpha:1.00)
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
            case TaskScore.partial.rawValue...TaskScore.good.rawValue:
                return .good
            case TaskScore.poor.rawValue...TaskScore.partial.rawValue:
                return .partial
            case 0...TaskScore.poor.rawValue:
                return .poor
            default :
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

//
//  CodilityContent.swift
//  CodingTest
//
//  Created by Moojong Song on 12/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit

class CodilityContent: NSObject {
    static func loadContent( lessons: inout [LessonModel], tasks: inout [[TaskModel]]) {
        // LESSON 1
        let lesson1 = LessonModel(level: 1, title: "Iterations")
        lessons.append(lesson1)
        
        var task1_1 = TaskModel(level: 1, title: "BinaryGap", description: "Find longest sequence of zeros in binary representation of an integer.")
        task1_1.score = 100
        task1_1.link = "https://app.codility.com/demo/results/trainingKB3ANA-WT8"
        task1_1.object = Task1_1_Swift()
        tasks.append([task1_1])
        
        // LESSON 2
        let lesson2 = LessonModel(level: 2, title: "Array")
        lessons.append(lesson2)
        
        var task2_1 = TaskModel(level: 1, title: "OddOccurrencesInArray", description: "Find value that occurs in odd number of elements.")
        task2_1.score = 100
        task2_1.link = "https://app.codility.com/demo/results/trainingX6JYHQ-2SX"
        task2_1.object = Task1_1_Swift()
        tasks.append([task2_1])
    }
}

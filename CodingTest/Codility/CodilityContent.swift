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
    }
}

//
//  LessonModel.swift
//  CodingTest
//
//  Created by Moojong Song on 11/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit

struct LessonModel {
    var level: Int      = 1     // 레벨
    var title: String    = ""    // Lesson Title
    
    func titleString() -> String {
        return String.init(format: "Lesson %d. %@", level, title)
    }
}

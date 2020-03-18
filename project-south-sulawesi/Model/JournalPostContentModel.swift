//
//  JournalPostContentModel.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 18/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import Foundation

struct JournalPostContentModel {
    var contents = [
        JournalPostModel(date: "Wednesday 16th, 2020", post: "I'm so happy today", sentiment: "positive"),
        JournalPostModel(date: "Wednesday 17th, 2020", post: "I'm so angry today", sentiment: "negative"),
        JournalPostModel(date: "Wednesday 18th, 2020", post: "I'm a horse", sentiment: "neutral")
    ]
}

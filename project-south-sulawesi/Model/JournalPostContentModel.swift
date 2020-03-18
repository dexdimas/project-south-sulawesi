//
//  JournalPostContentModel.swift
//  project-south-sulawesi
//
//  Created by Andimas Bagaswara on 18/03/20.
//  Copyright © 2020 Andimas Bagaswara. All rights reserved.
//

import UIKit

struct JournalPostContentModel {
    
    var contents = [JournalPostModel]()
    
    mutating func add(_ newPost: JournalPostModel) {
        contents.append(newPost)
    }
}

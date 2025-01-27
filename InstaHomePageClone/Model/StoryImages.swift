//
//  StoryImages.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//


struct StoryImages : Hashable {
    var title : String
    var avatarPath : String
    
    init(title: String, avatarPath: String) {
        self.title = title
        self.avatarPath = avatarPath
    }
}

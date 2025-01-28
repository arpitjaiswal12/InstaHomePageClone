//
//  UserPostModel.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import Foundation

struct userPost : Hashable {
    var postAvatar : String
    var username : String
    var location : String
    var posts : [String]
    var isliked : Bool
    var description : String
    var likeCount : Int
    
    init(postAvatar: String, username: String, location: String, Posts: [String], isliked: Bool, description: String, likeCount : Int) {
        self.postAvatar = postAvatar
        self.username = username
        self.location = location
        self.posts = Posts
        self.isliked = isliked
        self.description = description
        self.likeCount = likeCount
    }
}

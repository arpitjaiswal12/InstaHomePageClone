//
//  UserPostModel.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import Foundation

struct userPost  {
    var userPostId : String
    var postAvatar : String
    var username : String
    var location : String
    var posts : [String]
    var isliked : Bool
    var description : String
    var likeCount : Int
    
    init(userPostId: String, postAvatar: String, username: String, location: String, posts: [String], isliked: Bool, description: String, likeCount: Int) {
        self.userPostId = userPostId
        self.postAvatar = postAvatar
        self.username = username
        self.location = location
        self.posts = posts
        self.isliked = isliked
        self.description = description
        self.likeCount = likeCount
    }
}

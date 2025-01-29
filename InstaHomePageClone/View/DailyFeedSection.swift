//
//  DailyFeedSection.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

enum Keys: String {
    case storedLikes
}

extension UserDefaults {
    var storedLikes: [String: Bool] {
        get {
            let dict = self.dictionary(forKey: Keys.storedLikes.rawValue) as? [String : Bool] ?? [:]
            print(dict)
            return dict
        } set {
            self.set(newValue, forKey: Keys.storedLikes.rawValue)
            print(newValue)
        }
    }
}

struct DailyFeedSection: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(feeds, id: \.userPostId) { obj in
                    FeedPost(
                        userPostId : obj.userPostId,
                        postAvatar: obj.postAvatar,
                        username: obj.username,
                        location: obj.location,
                        posts: obj.posts,
                        likeCount: obj.likeCount,
                        description: obj.description
                        
                    )
                }
            }
        }
    }
}

extension DailyFeedSection {
    var feeds: [userPost] {
        [
            userPost(
                userPostId : "101",
                postAvatar: "userimg1",
                username: "Jenny",
                location: "Indore, India",
                posts: [
                    "instaImage1",
                    "instaImage2",
                    "instaImage3"
                ],
                isliked: false,
                description: "Dream big, work hard, and make it happen. Sharing moments from my journey through life, one step at a time. Stay tuned for more stories ahead.",
                likeCount : 250
            ),
            
            userPost(
                userPostId : "102",
                postAvatar: "instaImage3",
                username: "Jon",
                location: "Indore, India",
                posts: [
                    "instaImage5",
                    "instaImage4"
                ],
                isliked: false,
                description: "Lover of sunsets, good books, and spontaneous adventures. Life’s a collection of moments, and I’m here to capture them all. Grateful for the little things.",
                likeCount : 520
            ),
            
            userPost(
                userPostId : "103",
                postAvatar: "instaImage4",
                username: "Zackjohn",
                location: "Indore, India",
                posts: [
                    "instaImage4",
                    "instaImage2",
                    "instaImage5"
                ],
                isliked: false,
                description: "Exploring the beauty of everyday life, one photo at a time. Passionate about creativity, learning, and connecting with like-minded souls. Welcome to my corner of the internet.",
                likeCount: 639
            ),
            
            userPost(
                userPostId : "104",
                postAvatar: "instaImage1",
                username: "Alex",
                location: "Indore, India",
                posts: [
                    "alex-1",
                    "alex-2",
                    "alex-3"
                ],
                isliked: false,
                description: "Navigating life’s twists and turns with curiosity and courage. Sharing glimpses of my world, full of dreams, challenges, and endless inspiration. Follow for stories worth sharing.",
                likeCount: 6930
            ),
            
            userPost(
                userPostId : "105",
                postAvatar: "instaImage2",
                username: "Craig",
                location: "Indore, India",
                posts: [
                    "appleFruitImg",
                    "instaImage4",
                    "alex-3"
                ],
                isliked: false,
                description: "Just a soul with a camera and a story to tell. Obsessed with capturing fleeting moments and turning them into lasting memories. Let’s find beauty in everything.",
                likeCount:2300
            ),
            
            userPost(
                userPostId : "106",
                postAvatar: "instaImage5",
                username: "Craig",
                location: "Indore, India",
                posts: ["alex-3"],
                isliked: false,
                description: "Adventure seeker, storyteller, and life enthusiast. Embracing the chaos and celebrating the magic in every moment. Here’s to making each day count. Follow my journey.",
                likeCount: 3650
            )
        ]
    }
}


#Preview {
    DailyFeedSection()
}

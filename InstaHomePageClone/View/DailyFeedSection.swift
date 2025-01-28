//
//  DailyFeedSection.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct DailyFeedSection: View {
    
    var feeds = [
        userPost(postAvatar: "userimg1", username: "Jenny", location: "Indore, India", Posts: ["instaImage1","instaImage2","instaImage3"], isliked: false, description: "Dream big, work hard, and make it happen. Sharing moments from my journey through life, one step at a time. Stay tuned for more stories ahead.",likeCount : 250),
        
        userPost(postAvatar: "instaImage3", username: "Jon", location: "Indore, India", Posts: ["instaImage5","instaImage4"], isliked: false, description: "Lover of sunsets, good books, and spontaneous adventures. Life’s a collection of moments, and I’m here to capture them all. Grateful for the little things.",likeCount : 520),
        
        userPost(postAvatar: "instaImage4", username: "Zackjohn", location: "Indore, India", Posts: ["instaImage4","instaImage2","instaImage5"], isliked: false, description: "Exploring the beauty of everyday life, one photo at a time. Passionate about creativity, learning, and connecting with like-minded souls. Welcome to my corner of the internet.", likeCount: 639),
        
        userPost(postAvatar: "instaImage1", username: "Alex", location: "Indore, India", Posts: ["alex-1","alex-2","alex-3"], isliked: false, description: "Navigating life’s twists and turns with curiosity and courage. Sharing glimpses of my world, full of dreams, challenges, and endless inspiration. Follow for stories worth sharing.", likeCount: 6930),
        
        userPost(postAvatar: "instaImage2", username: "Craig", location: "Indore, India", Posts: ["appleFruitImg","instaImage4","alex-3"], isliked: false, description: "Just a soul with a camera and a story to tell. Obsessed with capturing fleeting moments and turning them into lasting memories. Let’s find beauty in everything.", likeCount:2300),
        
        userPost(postAvatar: "instaImage5", username: "Craig", location: "Indore, India", Posts: ["alex-3"], isliked: false, description: "Adventure seeker, storyteller, and life enthusiast. Embracing the chaos and celebrating the magic in every moment. Here’s to making each day count. Follow my journey.", likeCount: 3650)
    ]
    
    var body: some View {
        VStack{
            ScrollView {
                ForEach(feeds, id: \.self) { obj in
                    FeedPost(postAvatar: obj.postAvatar, username: obj.username, location: obj.location, Posts: obj.posts, isliked: obj.isliked, description: obj.description, likeCount: obj.likeCount)
                }
                
            }
        }
    }
}

#Preview {
    DailyFeedSection()
}

//
//  StorySection.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct StorySection: View {
    var userStory = [
        StoryImages(title: "Your Story", avatarPath: "instaImage1"),
        StoryImages(title: "Jenny", avatarPath: "instaImage2"),
        StoryImages(title: "Jon", avatarPath: "instaImage3"),
        StoryImages(title: "Zackjohn", avatarPath: "instaImage4"),
        StoryImages(title: "Joshu", avatarPath: "instaImage5"),
        StoryImages(title: "Craig", avatarPath: "userimg1"),
    ]
    var body: some View {
        VStack {
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(userStory, id : \.self) { obj in
                        UserStory(imageUrl: obj.avatarPath, userName: obj.title)
                    }
                }
                .padding(.top,10)
                
            }
        }
    }
}

#Preview {
    StorySection()
}

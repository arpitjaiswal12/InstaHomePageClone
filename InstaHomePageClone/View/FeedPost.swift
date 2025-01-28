//
//  FeedPost.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct FeedPost: View {
    @State var showheart : Bool = true
    var postAvatar : String
    var username : String
    var location : String
    var Posts : [String]
    @State private var isliked : Bool
    var description : String
    @State private var likeCount : Int
    
    func disappearHeart() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                showheart = false
            }
        }
    }
    
    init(postAvatar: String, username: String, location: String, Posts: [String], isliked: Bool, description: String, likeCount : Int) {
        self.postAvatar = postAvatar
        self.username = username
        self.location = location
        self.Posts = Posts
        self.isliked = isliked
        self.description = description
        self.likeCount = likeCount
        
    }
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(postAvatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading,spacing:0){
                        HStack {
                            Text(username)
                            Image(.blueTicklRemovebgPreview)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        Text(location)
                    }
                }
                Spacer()
                HStack(alignment: .center){
                    Text("...")
                        .font(.largeTitle)
                        .padding(.bottom)
                    
                }
            }
            .padding([.leading,.trailing],20)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Posts, id:\.self) { e in
                        Image(e)
                            .resizable()
                            .frame(width: 400, height: 400)
                            .onTapGesture(count: 2, perform: {
                                if isliked {
                                    showheart = true
                                    disappearHeart()
                                }
                                else {
                                    isliked = true
                                    likeCount += 1
                                }
                                
                            })
                        
                    }
                }
            }
            .overlay {
                if isliked {
                    
                    VStack {
                        if showheart {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 100, height: 90)
                                .foregroundColor(.white)
                        }
                    }
                    .onAppear(perform: {
                        disappearHeart()
                        showheart = true
                    })
                    
                }
            }
            VStack {
                FeedBottomBar(isLike: $isliked, likeCount: $likeCount)
            }
            VStack {
                DescriptionBox(likeCount: $likeCount, isLiked: $isliked, description: description)
            }
        }
    }
}

#Preview {
    FeedPost(postAvatar: "instaImage5", username: "Craig", location: "Indore, India", Posts: ["alex-3","alex-1"], isliked: false, description: "Adventure seeker, storyteller, and life enthusiast. Embracing the chaos and celebrating the magic in every moment. Here’s to making each day count. Follow my journey.",likeCount : 150)
}

//
//  FeedPost.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct FeedPost: View {
    @State var showheart : Bool = false
    var userPostId : String
    var postAvatar : String
    var username : String
    var location : String
    var posts : [String]
    @State private var isliked : Bool = false {
        didSet {
            print("IS LIKED KA DID SET CHALRA - \(userPostId) : \(isliked)")
            UserDefaults.standard.storedLikes[userPostId] = isliked
            showheart = true
            disappearHeart()
        }
    }
    @State var likeCount : Int
    var description : String
    
    @State var currImage : Bool = false
    
    func disappearHeart() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation {
                showheart = false
            }
        }
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
            
            /*Button("Click Me") {
                isliked.toggle()
            }
            VStack{
                if isliked {
                    Image(systemName: "heart.fill")
                }
                else {
                    Image(systemName: "heart")
                }
            }*/
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(posts, id:\.self) { post in
                        Image(post)
                            .resizable()
                            .frame(width: 400, height: 400)
                            .onTapGesture(count: 2, perform: {
                                self.isliked = true
//                                likeCount += 1
//                                if self.isliked {
//                                    showheart = true
//                                    disappearHeart()
//                                } else {
//                                    self.isliked = true
//                                    likeCount += 1
//                                }
                            })
                            .onAppear(perform: {
                                print("i am appeared \(post) - \(currImage)")
                                currImage = true
                            })
                            .onDisappear(perform: {
                                currImage = false
                            })
                    }
                }
            }
            .overlay {
                VStack {
                    if showheart {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 100, height: 90)
                            .foregroundColor(.white)
                    }
                }
//                .onAppear(perform: {
//                    disappearHeart()
//                    showheart = true
//                })
            }
            
            /*
             - Parameters:
               - get: A closure that retrieves the binding value. The closure has no
                 parameters, and returns a value.
              - set: A closure that sets the binding value. The closure has the
               following parameter:
               - newValue: The new value of the binding value.
            public init(get: @escaping () -> Value, set: @escaping (Value) -> Void)
             */
            
            VStack {
                FeedBottomBar(isLike: .init(get: {
                    UserDefaults.standard.storedLikes[userPostId] ?? false
                }, set: { value in
                    UserDefaults.standard.storedLikes[userPostId] = value
                    isliked = value
                    print("130",value)
                }), likeCount: $likeCount, currImage : $currImage, postCount: posts.count)
            }
            VStack {
                DescriptionBox(likeCount: $likeCount, isLiked: $isliked, description: description)
            }
        }
    }
}

#Preview {
    FeedPost(userPostId : "101", postAvatar: "instaImage5", username: "Craig", location: "Indore, India", posts: ["alex-3","alex-1"], likeCount : 150, description: "Adventure seeker, storyteller, and life enthusiast. Embracing the chaos and celebrating the magic in every moment. Here’s to making each day count. Follow my journey.")
}

//
//  ContentView.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 24/01/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var images : [String] = ["instaImage1","instaImage2","instaImage3","instaImage4","userimg1", "instaImage5"]
    var users = ["instaImage1": "Your Story", "instaImage2":"Jon", "instaImage3": "Zackjohn", "instaImage4" : "Zackjohn",  "instaImage5" : "Zackjohn", "userimg1" : "Zackjohn"]
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("Instagram")
                    .padding(.leading ,30)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    
                Spacer()
                Image(.IGTV)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
//                    //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    
                Image(.send)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 20)
//                    //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                    
                    

            }
            .padding([.leading,.trailing],20)
            .frame(maxWidth: .infinity )
            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            
            // MARK: STORY LAYOUT
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(images, id : \.self) { key in
                        if let val = users[key] {
                            ProfileImage(imageUrl: key, userName: val)
                                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 10))
                        }
                    }
                }
                .padding(.top,10)
                
            }
           

            VStack {
                FeedPost()
            }
            //.border(Color.red)
            
            HStack {
                Image(.postImg1)
                    .resizable()
//                   .scaledToFit()
                    .frame(height: 350)
            }
            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            .padding([.top],-10.0)

            
            VStack {
                FeedBottomBar()
            }
            ////.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
           
            HStack{
                DescriptionBox()
            }
            
            VStack {
                BottomBar()
            }
        }
        //.background(Color.black)
        
    }
}


struct ProfileImage : View {
    var imageUrl : String = ""
    var userName : String = ""
    var body: some View {
        VStack{
            Image(imageUrl)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay {
                    Circle()
                        .stroke( Gradient(colors: [.red, .purple, .orange, .yellow, .orange]) ,lineWidth: 3)
                        .frame(width: 80, height: 80)
                }
            Text(userName)
                .padding(.top, 5)
        }
    }
}

struct FeedPost : View {
    var body : some View {
            HStack {
                HStack{
                    Image(.userimg1)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading){
                        HStack{
                            Text("joshua_I")
                            Image(.blueTicklRemovebgPreview)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        Text("Tokyo, Japan")
                    }
                    ////.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                HStack(alignment: .center){
                    Text("...")
                        .font(.largeTitle)
                        .padding(.bottom)
                }
                ////.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            }
            .padding([.leading,.trailing],20)
        
    }
}

struct FeedBottomBar : View {
    var body : some View {
        HStack(alignment: .center){
            HStack{
                Image(.heart)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Image(.chat)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Image(.send)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            ////.border(Color.red, width: 3)
            //Spacer()
            HStack {
                Circle()
                    .frame(width: 6)
                    .foregroundColor(.blue)
                    
                Circle()
                    .frame(width: 6)
                    .foregroundColor(.gray.opacity(0.3))
                Circle()
                    .frame(width: 6)
                    .foregroundColor(.gray.opacity(0.3))
            }
            .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 120))
            ////.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            //Spacer()
            HStack {
                Image(.bookmark)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
           ////.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        //.frame(minWidth: .infinity)
        ////.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)

        
    }
}


struct DescriptionBox : View {
    var body : some View {
        VStack {
            HStack {
                Image(.instaImage5)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("Liked by **craig_love** and **44,686 others**")
            }
            .frame(maxWidth: .infinity)
            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            HStack {
                Text("**joshu_I** The game in Japan was amazing and I want to share some photos")
            }
            //.border(Color.red)
            .padding([.leading,.trailing])
        }
        .frame(maxWidth: .infinity)
//        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

struct BottomBar : View {
    var body : some View {
        HStack{
            Image(.homeButton)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Spacer()
            Image(.search)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Spacer()
            Image(.more)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            Spacer()
            Image(.heart)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 24)
            Spacer()
            Image(.instaImage1)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding([.leading,.trailing], 20)
//        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    ContentView()
//    ProfileImage()
//    FeedPost()
//    FeedBottomBar()
//    DescriptionBox()
//    BottomBar()
}

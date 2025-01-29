//
//  FeedBottomBar.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct FeedBottomBar: View {
    @Binding var isLike : Bool
    @Binding var likeCount : Int
    @Binding var currImage : Bool
    var postCount : Int
    var body: some View {
        HStack(alignment: .center){
            HStack{
                Button(action: {
                   isLike.toggle()
                }) {
                    if isLike {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(Color.red)
                            .frame(width: 24, height: 24)
                        
                    }
                    else {
                        Image("heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                    }
                        
                }
                Image(.chat)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Image(.send)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
            //.border(Color.red, width: 3)
            //Spacer()
            HStack {
                ForEach(0..<postCount, id: \.self) {_ in
                    Circle()
                        .frame(width: 6)
                        .foregroundColor(currImage ? .gray : .blue )
                }
                
                /*Circle()
                    .frame(width: 6)
                    .foregroundColor(.blue)
                    
                Circle()
                    .frame(width: 6)
                    .foregroundColor(.gray.opacity(0.3))
                Circle()
                    .frame(width: 6)
                    .foregroundColor(.gray.opacity(0.3))*/
            }
            .padding(EdgeInsets(top: 0, leading: 80, bottom: 0, trailing: 120))
            //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            //Spacer()
            HStack {
                Image(.bookmark)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
            }
           //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        }
        //.frame(minWidth: .infinity)
        //.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
    
}
//
#Preview {
    FeedBottomBar(isLike: .constant(true), likeCount: .constant(102), currImage: .constant(true), postCount: 5)
}

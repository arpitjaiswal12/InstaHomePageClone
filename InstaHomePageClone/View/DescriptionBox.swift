//
//  DescriptionBox.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct DescriptionBox: View {
    @Binding var likeCount : Int
    @Binding var isLiked : Bool
    var description : String

    var body : some View {
        
        VStack {
            HStack {
                Image(.instaImage5)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("Liked by **craig_love** and **\(likeCount) others**")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity)
            HStack{
                Text(description)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading)
            }
            
            
            
        }
        .frame(maxWidth: .infinity)
    }

}

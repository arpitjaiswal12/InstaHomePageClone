//
//  UserStory.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct UserStory: View {
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
        .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 10))
    }
}

#Preview {
    UserStory()
}

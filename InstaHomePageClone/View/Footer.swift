//
//  BottomBar.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct BottomBar: View {
    var icons = ["home-button", "search","more","heart"]
    var body: some View {
        HStack{
            ForEach(icons, id: \.self){
                Image($0)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                Spacer()
                
            }
            Image(.instaImage1)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .padding([.leading,.trailing], 20)
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    BottomBar()
}

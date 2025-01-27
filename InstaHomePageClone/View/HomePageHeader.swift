//
//  HomePageHeader.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct HomePageHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "camera")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 30)
                
            Spacer()
            Text("Instagram")
                .padding(.leading ,30)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
            Spacer()
            Image(.IGTV)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                
            Image(.send)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 20)
                
                

        }
        .padding([.leading,.trailing],20)
        .frame(maxWidth: .infinity )
    }
}

#Preview {
    HomePageHeader()
}

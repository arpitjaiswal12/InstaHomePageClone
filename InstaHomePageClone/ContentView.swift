//
//  ContentView.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 24/01/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HomePagePostView()
            VStack {
                BottomBar()
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  HomePagePostView.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

struct HomePagePostView: View {
    
    var body: some View {
        HStack {
            ExtractedView()
        }
    }
}

#Preview {
    HomePagePostView()
}

struct ExtractedView: View {
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                HomePageHeader()
                StorySection()
                DailyFeedSection()
            }
        }
        .padding(.top, -10)
    }
}

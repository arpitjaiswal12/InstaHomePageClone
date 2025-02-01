//
//  DailyFeedSection.swift
//  InstaHomePageClone
//
//  Created by Arpit Jaiswal on 27/01/25.
//

import SwiftUI

enum Keys: String {
    case storedLikes
}

extension UserDefaults {
    var storedLikes: [String: Bool] {
        get {
            let dict = self.dictionary(forKey: Keys.storedLikes.rawValue) as? [String : Bool] ?? [:]
            //print(dict)
            return dict
        } set {
            self.set(newValue, forKey: Keys.storedLikes.rawValue)
            //print(newValue)
        }
    }
}

struct DailyFeedSection: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(feeds, id: \.userPostId) { obj in
                    FeedPost(
                        userPostId : obj.userPostId,
                        postAvatar: obj.postAvatar,
                        username: obj.username,
                        location: obj.location,
                        posts: obj.posts,
                        likeCount: obj.likeCount,
                        description: obj.description
                        
                    )
                }
            }
        }
    }
    
}

extension DailyFeedSection {
    var feeds: [userPost] {
        [
            userPost(
                userPostId : "101",
                postAvatar: "userimg1",
                username: "Jenny",
                location: "Indore, India",
                posts: [
                    "instaImage1",
                    "instaImage2",
                    "instaImage3"
                ],
                isliked: false,
                description: "Dream big, work hard, and make it happen. Sharing moments from my journey through life, one step at a time. Stay tuned for more stories ahead.",
                likeCount : 250
            ),
            
            userPost(
                userPostId : "102",
                postAvatar: "instaImage3",
                username: "Jon",
                location: "Indore, India",
                posts: [
                    "instaImage5",
                    "instaImage4"
                ],
                isliked: false,
                description: "Lover of sunsets, good books, and spontaneous adventures. Life’s a collection of moments, and I’m here to capture them all. Grateful for the little things.",
                likeCount : 520
            ),
            
            userPost(
                userPostId : "103",
                postAvatar: "instaImage4",
                username: "Zackjohn",
                location: "Indore, India",
                posts: [
                    "instaImage4",
                    "instaImage2",
                    "instaImage5"
                ],
                isliked: false,
                description: "Exploring the beauty of everyday life, one photo at a time. Passionate about creativity, learning, and connecting with like-minded souls. Welcome to my corner of the internet.",
                likeCount: 639
            ),
            
            userPost(
                userPostId : "104",
                postAvatar: "instaImage1",
                username: "Alex",
                location: "Indore, India",
                posts: [
                    "alex-1",
                    "alex-2",
                    "alex-3"
                ],
                isliked: false,
                description: "Navigating life’s twists and turns with curiosity and courage. Sharing glimpses of my world, full of dreams, challenges, and endless inspiration. Follow for stories worth sharing.",
                likeCount: 6930
            ),
            
            userPost(
                userPostId : "105",
                postAvatar: "instaImage2",
                username: "Craig",
                location: "Indore, India",
                posts: [
                    "appleFruitImg",
                    "instaImage4",
                    "alex-3"
                ],
                isliked: false,
                description: "Just a soul with a camera and a story to tell. Obsessed with capturing fleeting moments and turning them into lasting memories. Let’s find beauty in everything.",
                likeCount:2300
            ),
            
            userPost(
                userPostId : "106",
                postAvatar: "instaImage5",
                username: "Craig",
                location: "Indore, India",
                posts: ["alex-3"],
                isliked: false,
                description: "Adventure seeker, storyteller, and life enthusiast. Embracing the chaos and celebrating the magic in every moment. Here’s to making each day count. Follow my journey.",
                likeCount: 3650
            )
        ]
    }
}

typealias ScreenshotMakerClosure = (ScreenshotMaker) -> Void

struct ScreenshotMakerView: UIViewRepresentable {
    let closure: ScreenshotMakerClosure

    init(_ closure: @escaping ScreenshotMakerClosure) {
        self.closure = closure
    }

    func makeUIView(context: Context) -> ScreenshotMaker {
        let view = ScreenshotMaker(frame: CGRect.zero)
        return view
    }

    func updateUIView(_ uiView: ScreenshotMaker, context: Context) {
        DispatchQueue.main.async {
            closure(uiView)
        }
    }
}

class ScreenshotMaker: UIView {
    /// Takes the screenshot of the superview of this superview
    /// - Returns: The UIImage with the screenshot of the view
    func screenshot() -> UIImage? {
        guard let containerView = self.superview?.superview,
              let containerSuperview = containerView.superview else { return nil }
        let renderer = UIGraphicsImageRenderer(bounds: containerView.frame)
        print(renderer)
        return renderer.image { (context) in
            print(context)
            return containerSuperview.layer.render(in: context.cgContext)
        }
    }
}

extension View {
    func screenshotView(_ closure: @escaping ScreenshotMakerClosure) -> some View {
        let screenshotView = ScreenshotMakerView(closure)
        return overlay(screenshotView.allowsHitTesting(false))
    }
}

struct ScrollViewScreenshot: UIViewRepresentable {
    let scrollView: UIScrollView
    var onCapture: (UIImage?) -> Void

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
            onCapture(captureScrollView())
        }
    }

    /// Captures the entire scroll view, including off-screen content
    private func captureScrollView() -> UIImage? {
        let originalFrame = scrollView.frame
        let originalOffset = scrollView.contentOffset
        
        // Expand the scrollView's frame to fit all content
        let fullSize = scrollView.contentSize
        scrollView.frame = CGRect(origin: .zero, size: fullSize)
        scrollView.contentOffset = .zero
        
        let renderer = UIGraphicsImageRenderer(size: fullSize)
        let image = renderer.image { context in
            scrollView.layer.render(in: context.cgContext)
        }
        
        // Restore the original frame and offset
        scrollView.frame = originalFrame
        scrollView.contentOffset = originalOffset

        return image
    }
}

extension View {
    func snapshot() -> UIImage? {
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first else {
                print("Error: Unable to access the key window")
                return nil
            }

            let renderer = UIGraphicsImageRenderer(size: window.bounds.size)
            return renderer.image { _ in
                window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
            }
        }
}

extension UIImage {
    func saveToDocuments(fileName: String = "screenshot.png") -> URL? {
        guard let data = self.pngData() else { return nil }
        
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)

        do {
            try data.write(to: fileURL)
            print("Saved to:", fileURL)
            return fileURL
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }
}



#Preview {
    DailyFeedSection()
}

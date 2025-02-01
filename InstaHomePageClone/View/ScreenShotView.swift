import SwiftUI

struct ContentView2: View {
    @State private var screenshot: UIImage?

    var body: some View {
        VStack {

            // The ScrollView that will be captured
            ScrollViewScreenshotView()

            // Button to capture the screenshot of the entire scroll view
            Button(action: {
                Task {		
                    if let image = await ScrollViewScreenshotView.capture() {
                        DispatchQueue.main.async {
                            screenshot = image
                        }
                        if let url = image.saveToDocuments2() {
                            print("Screenshot saved at:", url)
                        }
                    }
                }
            }) {
                Text("Take Full Screenshot")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
struct ImageModel: Identifiable {
    let id = UUID()
    let image: String
}

struct ScrollViewScreenshotView: View {
    var userImages = [
        "instaImage2", 
        "instaImage3" ,
        "instaImage4",
        "instaImage2",
        "instaImage3" ,
        "instaImage2",
//        "instaImage3"
//        "instaImage2",
//        "instaImage3" ,
//        "instaImage2",
//        "instaImage3" ,        
//        "instaImage2"
//        "instaImage3"
    ]
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image("instaImage1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    VStack(alignment: .leading,spacing:0){
                        HStack {
                            Text("Username")
                            Image(.blueTicklRemovebgPreview)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                        }
                        Text("location")
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
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(userImages.map({ ImageModel(image: $0) })) { post in
                        Image(post.image)
                            .resizable()
                            .frame(width: 400, height: 400)
                            .onAppear {
                                print(post.id)
                                print("Appeared")
                            }
                            
                    }
                }
            }
        }
        
    }

    /// Captures the entire ScrollView, including off-screen content
    static func capture() async -> UIImage? {
        await MainActor.run {
            let controller = UIHostingController(rootView: ScrollViewScreenshotView())
            guard let view = controller.view else { return nil }

            let targetSize = view.intrinsicContentSize
            view.bounds = CGRect(origin: .zero, size: targetSize)
            view.backgroundColor = .clear

            let renderer = UIGraphicsImageRenderer(size: targetSize)
            return renderer.image { _ in
                view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
            }
        }
    }
}

extension UIImage {
    func saveToDocuments2(fileName: String = "screenshot.png") -> URL? {
        guard let data = self.pngData() else { return nil }

        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)

        do {
            try data.write(to: fileURL)
            print("Screenshot saved to:", fileURL)
            return fileURL
        } catch {
            print("Error saving image: \(error)")
            return nil
        }
    }
}

#Preview(body: {
    ContentView2()
})

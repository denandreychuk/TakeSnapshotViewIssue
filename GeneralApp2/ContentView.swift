import SwiftUI
import SwiftUIX

struct ContentView: View {
    @State private var captureImage: UIImage?
    
    var body: some View {
        GeometryReader { proxy in
             ScrollView(showsIndicators: false) {
                 VStack {
                     Text("Hello\nWorld")
                         .screenshotOnAppear(to: $captureImage)
                         .height(100) // comment this to investigate problem with size propogation
                         //.fixedSize(horizontal: false, vertical: true) // uncomment this to investigate problem with size propogation
                     
                     if let captureImage {
                         Image(uiImage: captureImage)
                             .resizable()
                             .height(100)
                     }
                 }
             }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

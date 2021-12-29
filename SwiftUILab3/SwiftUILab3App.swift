import SwiftUI

@main
struct SwiftUILab3App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .edgesIgnoringSafeArea(.bottom)
        }
    }
}

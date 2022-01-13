import SwiftUI

@main
struct SwiftUILab3App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(UserViewModel())
            }
        }
    }
}

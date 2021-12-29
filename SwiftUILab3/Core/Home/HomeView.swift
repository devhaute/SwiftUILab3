import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            ForEach(0..<10) { _ in
                RandomUserRowView()
            }
        }
        .listStyle(.plain)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .edgesIgnoringSafeArea(.bottom)
    }
}

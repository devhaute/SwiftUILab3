import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel()
    
    var body: some View {
        List(homeVM.randomUsers) { user in
            RandomUserRowView(user: user)
                .padding(.vertical, 5)
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

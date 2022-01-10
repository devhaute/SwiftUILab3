import SwiftUI

struct ProfileImageView: View {
    let user: User
    
    private var profileImageURL: URL {
        URL(string: user.avatar) ??
        URL(string: "https://avatars.githubusercontent.com/u/90536403?v=4")! // default image url
    }
    
    var body: some View {
        AsyncImage(url: profileImageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "person.fill.questionmark")
                    .resizable()
                    .scaledToFit()
                    .padding()
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileImageView(user: User.dummyData)
        }
    }
}

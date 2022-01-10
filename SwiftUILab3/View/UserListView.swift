import SwiftUI

struct UserListView: View {
    let users: [User]
    
    var body: some View {
        List(users) { user in
            NavigationLink {
                OtherUserProfileView(user: user)
            } label: {
                HStack {
                    ProfileImageView(user: user)
                        .frame(width: 120)
                    
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.system(size: 24))
                            .bold()
                        Text(user.email)
                            .font(.system(size: 16))
                            .lineLimit(1)
                    }
                }
            }

        }.navigationTitle("사용자 목록")
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserListView(users: [User.dummyData, User.dummyData, User.dummyData])
        }
    }
}

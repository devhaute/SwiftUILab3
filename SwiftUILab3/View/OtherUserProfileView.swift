import SwiftUI

struct OtherUserProfileView: View {
    let user: User
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        ProfileImageView(user: user)
                        Spacer()
                    }
                }
                
                Section {
                    Text(String(user.id))
                } header: {
                    Text("아이디")
                        .font(.callout)
                }
                
                Section {
                    Text(user.name)
                } header: {
                    Text("이름")
                        .font(.callout)
                }
                
                Section {
                    Text(user.email)
                } header: {
                    Text("이메일")
                        .font(.callout)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("\(user.name) 프로필")
    }
}

struct OtherUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OtherUserProfileView(user: .dummyData)
        }
    }
}

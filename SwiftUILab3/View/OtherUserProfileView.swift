import SwiftUI

struct OtherUserProfileView: View {
    let user: User
    private var profileImageURL: URL {
        URL(string: user.avatar) ??
        URL(string: "https://avatars.githubusercontent.com/u/90536403?v=4")! // default image url
    }
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Spacer()
                        
                        AsyncImage(url: profileImageURL) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                                    .frame(width: 250, height: 250, alignment: .center)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 250, alignment: .center)
                            case .failure:
                                Image(systemName: "person.fill.questionmark")
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                    .frame(width: 250, height: 250, alignment: .center)
                            @unknown default:
                                EmptyView()
                                    .frame(width: 250, height: 250, alignment: .center)
                            }
                        }
                        
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

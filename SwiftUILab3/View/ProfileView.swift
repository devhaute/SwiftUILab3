import SwiftUI

struct ProfileView: View {
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
                    Text("아이디: \(user.id)")
                    Text("이름: \(user.name)")
                    Text("이메일: \(user.email)")
                }
                
                Section {
                    Button {
                        //
                    } label: {
                        Text("새로고침")
                    }
                }
            }
        }
        .navigationTitle("내 프로필")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(user: .dummyData)
        }
    }
}

import SwiftUI

struct ContentView: View {
    let screen = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Image(systemName: "lock.shield.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 130)
                .padding(.bottom, 80)
            
            NavigationLink {
                LoginView()
            } label: {
                Text("로그인 하러 가기")
                    .setLoginButtonStyle(backgroundColor: .blue)
            }
            
            NavigationLink {
                RegisterView()
            } label: {
                Text("회원가입 하러가기")
                    .setLoginButtonStyle(backgroundColor: .black)
            }
            .padding(.bottom, 30)
            
            NavigationLink {
                ProfileView(user: User.dummyData)
            } label: {
                Text("내 프로필 보러가기")
                    .setLoginButtonStyle(backgroundColor: .purple)
            }

            NavigationLink {
                UserListView(users: [User.dummyData, User.dummyData, User.dummyData])
            } label: {
                Text("사용자 목록 보러가기")
                    .setLoginButtonStyle(backgroundColor: .green)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}

struct LoginCustomTextStyle: ViewModifier {
    let backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundColor(.white)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(5)
    }
}

extension Text {
    func setLoginButtonStyle(backgroundColor: Color) -> some View {
        self.modifier(LoginCustomTextStyle(backgroundColor: backgroundColor))
    }
}

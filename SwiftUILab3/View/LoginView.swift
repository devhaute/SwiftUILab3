import SwiftUI

struct LoginView: View {
    @State private var emailInput = ""
    @State private var passwordInput = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("이메일을 입력해주세요", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("비밀번호를 입력해주세요", text: $passwordInput)
                        .keyboardType(.default)
                } header: {
                    Text("로그인 정보")
                }
                
                Section {
                    Button {
                        //
                    } label: {
                        Text("로그인")
                    }

                }
            }
        }
        .navigationTitle("로그인")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}

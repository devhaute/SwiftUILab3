import SwiftUI

struct RegisterView: View {
    @State private var nameInput = ""
    @State private var emailInput = ""
    @State private var passwordInput = ""
    @State private var passwordCheckInput = ""
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("이름을 입력해주세요", text: $nameInput)
                        .autocapitalization(.none)
                } header: {
                    Text("이름")
                }
                
                Section {
                    TextField("이메일을 입력해주세요", text: $emailInput)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                } header: {
                    Text("이메일")
                }
                
                Section {
                    TextField("비밀번호", text: $passwordInput)
                        .autocapitalization(.none)
                    TextField("비밀번호 확인", text: $passwordCheckInput)
                        .autocapitalization(.none)
                } header: {
                    Text("비밀번호")
                }
                
                Section {
                    Button {
                        // TODO: 
                    } label: {
                        Text("회원가입하기")
                    }

                }
            }
        }
        .navigationTitle("회원가입")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegisterView()
        }
    }
}

import SwiftUI

struct RegisterView: View {
    @State private var nameInput = ""
    @State private var emailInput = ""
    @State private var passwordInput = ""
    @State private var passwordCheckInput = ""
    
    @State fileprivate var shouldShowAlert: Bool = false
    
    @EnvironmentObject var userVM: UserViewModel {
        didSet {
            if userVM.loggedInUser != nil {
                self.shouldShowAlert = true
            }
        }
    }
    @Environment(\.dismiss) var dismiss
    
    private func register(name: String, email: String, password: String) {
        guard !name.isEmpty, !emailInput.isEmpty, !passwordInput.isEmpty, passwordInput == passwordCheckInput  else {
            return
        }
        
        userVM.register(name: nameInput, email: emailInput, password: passwordInput)
    }
    
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
                        register(name: nameInput, email: emailInput, password: passwordInput)
                    } label: {
                        Text("회원가입하기")
                    }
                }
            }
            .alert("회원가입이 완료되었습니다.", isPresented: $shouldShowAlert) {
                Button {
                    self.dismiss()
                } label: {
                    Text("확인")
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

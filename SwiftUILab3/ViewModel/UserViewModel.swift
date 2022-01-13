import Foundation
import Combine

class UserViewModel: ObservableObject {
    var subscription = Set<AnyCancellable>()
    @Published var loggedInUser: User? = nil
    
    func register(name: String, email: String, password: String) {
        AuthApiService.register(name: name, email: email, password: password)
            .sink { completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] user  in
                self?.loggedInUser = user
            }
            .store(in: &subscription)
    }
}

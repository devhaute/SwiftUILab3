import Foundation
import Combine
import Alamofire

struct AuthApiService {
    static func register(name: String, email: String, password: String) -> AnyPublisher<User, AFError> {
        return ApiClient.shared.session.request(AuthRouter.register(name: name, email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map({ $0.user })
            .eraseToAnyPublisher()
    }
    
    static func login(email: String, password: String) -> AnyPublisher<AuthResponse, AFError> {
        return ApiClient.shared.session.request(AuthRouter.login(email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .eraseToAnyPublisher()
    }
}

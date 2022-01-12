import Foundation
import Alamofire

// 회원가입, 로그인, 리프래시 토큰
enum AuthRouter: URLRequestConvertible {
    case register(name: String, email: String, password: String)
    case login(email: String, password: String)
    case tokenRefresh
    
    var baseURL: URL {
        URL(string: ApiClient.BASE_URL)!
    }
    
    var endPoint: String {
        switch self {
        case .register:
            return "/user/register"
        case .login:
            return "/user/login"
        case .tokenRefresh:
            return "/user/token-refresh"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .register, .login, .tokenRefresh:
            return .post
        }
    }
    
    var parameters: Parameters {
        switch self {
        case .register(let name, let email, let password):
            var params = Parameters()
            params["name"] = name
            params["email"] = email
            params["password"] = password
            return params
        case .login(let email, let password):
            var params = Parameters()
            params["email"] = email
            params["password"] = password
            return params
        case .tokenRefresh:
            let params = Parameters()
//            params["refresh_token"] =
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(endPoint)
        
        var request = URLRequest(url: url)
        request.method = method
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        
        return request
    }
}

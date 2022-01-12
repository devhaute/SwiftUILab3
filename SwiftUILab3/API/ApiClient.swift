import Foundation
import Alamofire

final class ApiClient {
    static let shared = ApiClient() // 싱글톤
    static let BASE_URL = "https://dev-jeongdaeri-oauth.tk/api"
    
    let interceptors = Interceptor(interceptors: [
        BaseInterceptor() // application/json
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    // Session
    var session: Session
    
    init() {
        self.session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
}

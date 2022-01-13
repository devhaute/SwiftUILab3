import Foundation

struct AuthResponse: Codable {
    let user: User
    let token: Token
}

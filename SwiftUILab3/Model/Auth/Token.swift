import Foundation

struct Token: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken, refreshToken: String

    private enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}


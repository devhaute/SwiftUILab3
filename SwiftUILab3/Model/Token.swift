//{
//    "user": {
//        "id": 8,
//        "name": "tester100",
//        "email": "tester100@email.com",
//        "avatar": "https://www.gravater.com/avatar/582640e204bbra81ab3255184a309bb2.jpg?s=200&d-robohash"
//    },
//    "token": {
//        "token_type": "Bearer",
//        "expires_in": 30,
//        "access_token": "easdasdas",
//        "refresh_token": "asdasdasd"
//    }
//}

import Foundation

struct Token: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken, refreshToken: String

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}


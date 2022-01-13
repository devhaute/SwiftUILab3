import Foundation

struct User: Identifiable, Codable {
    let id: Int
    let name: String
    let email: String
    let avatar: String
}

extension User {
    static let dummyData = User(id: 1, name: "이찬호", email: "devhaute@gmail.com", avatar: "https://www.gravatar.com/avatar/b87c0cd09c8c06be1d50f18d2104c814.jpg?s=200&d=robohash")
}


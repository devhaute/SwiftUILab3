import Foundation

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct RandomUser: Identifiable, Decodable {
    var id: String = UUID().uuidString
    let gender: String
    let name: Name
    let picture: Picture
}

struct Info: Decodable {
    let seed: String
    let results: Int
    let page: Int
    let version: String
}

struct RandomUserResponse: Decodable, CustomStringConvertible {
    let results: [RandomUser]
    let info: Info
    
    var description: String {
        "results count: \(results.count) | info: \(info.seed)"
    }
}

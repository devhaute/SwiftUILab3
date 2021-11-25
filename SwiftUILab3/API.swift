import Networking
import Combine

class NetworkSetup {
    lazy var network: NetworkingClient {
        let network = NetworkingClient(baseURL: "https://jsonplaceholder.typicode.com")
        network.timeout = 5
        network.logLevels = .debug
        return network
    }
}

struct API: NetworkingService {
    var network = NetworkSetup().network
    
    func fetchPost(postWithId id: Int) -> AnyPublisher<Post, Error> {
        get("/post/\(id)")
    }
}



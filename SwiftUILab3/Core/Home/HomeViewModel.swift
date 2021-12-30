import Combine
import Alamofire

class HomeViewModel: ObservableObject {
    private var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    let BASE_URL: String = "https://randomuser.me/api?results=50"
    
    init() {
        fetchRandomUsers()
    }
    
    func fetchRandomUsers() {
        AF.request(BASE_URL)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap({ $0.value })
            .map({ $0.results })
            .sink { completion in
                switch completion {
                case .finished:
                    print("스트림 전달 완료")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { receivedValue in
                self.randomUsers = receivedValue
            }.store(in: &subscription)
    }
}

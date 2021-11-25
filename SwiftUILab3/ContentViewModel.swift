import Foundation
import Combine

class ContentViewModel: ObservableObject {
    private let api = API()
    
    @Published var post: Post = Post()
    @Published var posts: [Post] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    func fetch(postWithId id: Int, completion: @escaping (Error?) -> ()) {
        api.fetchPost(postWithId: id)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    completion(error)
                }
            } receiveValue: { post in
                self.post = post
                completion(nil)
            }
            .store(in: &cancellables)
    }
}

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    @Published var post: Post = Post()
    @Published var posts: [Post] = []
    
    var cancellables: Set<AnyCancellable> = []
    
    
    func fetch(postWithId: Int, completion: @escaping (Error?) -> ()) {
        //
    }
}

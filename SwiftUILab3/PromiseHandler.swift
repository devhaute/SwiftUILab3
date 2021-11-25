import Foundation
import Combine

struct PromiseHandler<T: Codable> {
    static func fulfill(
        _ promise: AnyPublisher<T, Error>,
        storedIn cancellables: inout Set<AnyCancellable>,
        completion: @escaping (Result<T, Error>) -> ())
    {
        promise
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    error.printError()
                    completion(.failure(error))
                }
            } receiveValue: { value in
                completion(.success(value))
            }
            .store(in: &cancellables)
    }
}

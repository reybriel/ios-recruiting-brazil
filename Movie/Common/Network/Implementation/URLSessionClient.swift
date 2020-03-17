import Foundation
import struct RxSwift.Disposables
import class RxSwift.Observable

final class URLSessionClient: NetworkClient {
    private let session: URLSession
    private let base: NetworkBase.Type

    init(session: URLSession = .shared, base: NetworkBase.Type = DefaultNetworkBase.self) {
        self.session = session
        self.base = base
    }

    func request<EndpointType: Endpoint>(endpoint: EndpointType) -> Observable<Void> {
        performRequest(endpoint: endpoint).map { _ in () }
    }

    func request<EndpointType: Endpoint, ResultType: Decodable>(endpoint: EndpointType) -> Observable<ResultType> {
        performRequest(endpoint: endpoint).map { data in try JSONDecoder().decode(ResultType.self, from: data) }
    }

    private func performRequest<EndpointType: Endpoint>(endpoint: EndpointType) -> Observable<Data> {
        let request = URLRequestBuilder(base: base, endpoint: endpoint).build()

        return .create { [session, request] subscriber in
            let dataTask = session.dataTask(with: request) { data, response, _ in
                defer { subscriber.onCompleted() }

                guard let response = response as? HTTPURLResponse else { fatalError() }

                if let data = data, (200 ..< 300).contains(response.statusCode) {
                    subscriber.onNext(data)
                } else {
                    subscriber.onError(NetworkError.statusCode(response.statusCode))
                }
            }

            dataTask.resume()
            return Disposables.create {
                dataTask.cancel()
            }
        }
    }
}

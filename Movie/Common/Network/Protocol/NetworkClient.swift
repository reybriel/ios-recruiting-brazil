import class RxSwift.Observable

protocol NetworkClient {
    func request<EndpointType: Endpoint>(endpoint: EndpointType) -> Observable<Void>
    func request<EndpointType: Endpoint, ResultType: Decodable>(endpoint: EndpointType) -> Observable<ResultType>
}

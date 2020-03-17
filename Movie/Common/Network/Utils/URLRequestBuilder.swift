import Foundation

struct URLRequestBuilder<EndpointType> where EndpointType: Endpoint {
    let base: NetworkBase.Type
    let endpoint: EndpointType

    private var pathURL: URL {
        guard let baseURL = URL(string: base.apiDomain) else { fatalError() }
        return baseURL.appendingPathComponent(endpoint.path)
    }

    private var completeURL: URL? {
        let apiKeyQuery = [URLQueryItem(name: "api_key", value: base.apiKey)]
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = endpoint.queryItems + apiKeyQuery
        return urlComponents?.url
    }

    func build() -> URLRequest {
        guard let completeURL = completeURL else { fatalError() }
        var request = URLRequest(url: completeURL)
        request.httpMethod = endpoint.httpMethod
        request.httpBody = endpoint.httpBody
        return request
    }
}

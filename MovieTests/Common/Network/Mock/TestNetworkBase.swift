@testable
import Movie

enum TestNetworkBase: NetworkBase {
    static var apiDomain: String {
        "http://test.com"
    }

    static var apiKey: String {
        "test_api_key_1234"
    }
}

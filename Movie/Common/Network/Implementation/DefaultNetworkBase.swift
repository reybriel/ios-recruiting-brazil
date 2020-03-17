enum DefaultNetworkBase: NetworkBase {
    static var apiDomain: String {
        Secrets.apiDomain
    }

    static var apiKey: String {
        Secrets.apiKey
    }
}

import Foundation
public final class NumlookupApiClient {
    public struct Configuration { public let apiKey: String; public let baseURL: URL; public init(apiKey: String, baseURL: URL = URL(string: "https://api.numlookupapi.com")!) { self.apiKey = apiKey; self.baseURL = baseURL } }
    private let cfg: Configuration; private let session: URLSession
    public init(configuration: Configuration, urlSession: URLSession = .shared) { self.cfg = configuration; self.session = urlSession }
    @available(iOS 15.0, macOS 12.0, *)
    public func validate(number: String) async throws -> [String: Any] {
        var comps = URLComponents(url: cfg.baseURL.appendingPathComponent("validate"), resolvingAgainstBaseURL: false)!; comps.queryItems = [URLQueryItem(name: "number", value: number)]
        var req = URLRequest(url: comps.url!); req.addValue(cfg.apiKey, forHTTPHeaderField: "apikey")
        let (data, resp) = try await session.data(for: req); try Self.validate(resp); return try Self.json(data)
    }
    private static func validate(_ r: URLResponse) throws { if let h = r as? HTTPURLResponse, !(200..<300).contains(h.statusCode) { throw NSError(domain: "numlookupapi", code: h.statusCode) } }
    private static func json(_ d: Data) throws -> [String: Any] { guard let o = try JSONSerialization.jsonObject(with: d) as? [String: Any] else { throw NSError(domain: "numlookupapi", code: -2) }; return o }
}

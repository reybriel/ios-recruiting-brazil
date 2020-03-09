// swiftlint:disable all
import Foundation

enum Secrets {
    private static let salt: [UInt8] = [
        49, 77, 75, 101, 49, 111, 68, 118, 120, 66,
        77, 114, 48, 53, 73, 50, 121, 55, 109, 57,
        56, 122, 122, 117, 56, 51, 70, 118, 57, 52,
        114, 108, 121, 78, 51, 70, 110, 52, 84, 98,
        97, 48, 53, 48, 112, 88, 51, 98, 81, 80,
        98, 88, 82, 53, 73, 78, 57, 77, 54, 57,
        51, 69, 122, 77,
    ]
    static var apiKey: String {
        let encoded: [UInt8] = [
            71, 44, 56, 92, 1, 6, 118, 70, 30, 123,
            59, 19, 0, 70, 47, 11, 19, 89, 94, 9,
            78, 67, 16, 20, 75, 85, 48, 70, 0, 13,
            19, 31, 31, 56, 93, 42, 5, 90, 103, 86,
        ]
        return decode(encoded, cipher: salt)
    }

    static var apiDomain: String {
        let encoded: [UInt8] = [
            89, 57, 63, 21, 66, 85, 107, 89, 25, 50,
            36, 92, 68, 93, 44, 95, 22, 65, 4, 92,
            92, 24, 84, 26, 74, 84, 105, 69,
        ]
        return decode(encoded, cipher: salt)
    }

    private static func decode(_ encoded: [UInt8], cipher: [UInt8]) -> String {
        String(decoding: encoded.enumerated().map { offset, element in
            element ^ cipher[offset % cipher.count]
        }, as: UTF8.self)
    }
}

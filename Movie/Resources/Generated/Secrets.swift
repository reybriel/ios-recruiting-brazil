// swiftlint:disable all
import Foundation

enum Secrets {
    private static let salt: [UInt8] = [
        53, 57, 48, 57, 113, 106, 106, 111, 53, 107,
        106, 101, 89, 118, 86, 56, 86, 82, 72, 65,
        111, 72, 88, 48, 83, 48, 56, 72, 48, 115,
        54, 101, 119, 49, 78, 76, 82, 56, 51, 89,
        84, 53, 70, 52, 66, 49, 122, 69, 112, 109,
        72, 117, 75, 66, 101, 97, 109, 72, 75, 56,
        83, 110, 48, 73,
    ]
    static var apiDomain: String {
        let encoded: [UInt8] = [
            93, 77, 68, 73, 2, 80, 69, 64, 84, 27,
            3, 75, 45, 30, 51, 85, 57, 36, 33, 36,
            11, 42, 118, 95, 33, 87, 23, 123,
        ]
        return decode(encoded, cipher: salt)
    }

    static var apiKey: String {
        let encoded: [UInt8] = [
            13, 93, 2, 1, 64, 11, 95, 14, 7, 82,
            12, 1, 96, 16, 96, 12, 101, 106, 43, 113,
            92, 127, 97, 1, 106, 81, 9, 123, 81, 22,
            14, 93,
        ]
        return decode(encoded, cipher: salt)
    }

    private static func decode(_ encoded: [UInt8], cipher: [UInt8]) -> String {
        String(decoding: encoded.enumerated().map { offset, element in
            element ^ cipher[offset % cipher.count]
        }, as: UTF8.self)
    }
}

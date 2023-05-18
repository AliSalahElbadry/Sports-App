//
//  CricketTeamDetails.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation
class CricketTeamDetails{
    
    // MARK: - Welcome
    struct Welcome: Codable {
        var success: Int?
        var result: [Result]?
    }

    // MARK: - Result
    struct Result: Codable {
        var teamKey: Int?
        var teamName: String?
        var teamLogo: JSONNull?

        enum CodingKeys: String, CodingKey {
            case teamKey = "team_key"
            case teamName = "team_name"
            case teamLogo = "team_logo"
        }
    }

    // MARK: - Encode/decode helpers

    class JSONNull: Codable, Hashable {

        public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
        }

        public var hashValue: Int {
            return 0
        }

        public init() {}

        public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
        }
    }

}

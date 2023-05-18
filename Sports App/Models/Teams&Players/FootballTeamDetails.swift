//
//  FootballTeamDetails.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

class FootballTeamDetails{
    struct Welcome: Codable {
        var success: Int?
        var result: [Result]?
    }

    // MARK: - Result
    struct Result: Codable {
        var teamKey: Int?
        var teamName: String?
        var teamLogo: String?
        var players: [Player]?
        var coaches: [Coach]?

        enum CodingKeys: String, CodingKey {
            case teamKey = "team_key"
            case teamName = "team_name"
            case teamLogo = "team_logo"
            case players, coaches
        }
    }

    // MARK: - Coach
    struct Coach: Codable {
        var coachName: String?
        var coachCountry, coachAge: JSONNull?

        enum CodingKeys: String, CodingKey {
            case coachName = "coach_name"
            case coachCountry = "coach_country"
            case coachAge = "coach_age"
        }
    }

    // MARK: - Player
    struct Player: Codable {
        var playerKey: Int?
        var playerName, playerNumber: String?
        var playerCountry: JSONNull?
        var playerType: PlayerType?
        var playerAge, playerMatchPlayed, playerGoals, playerYellowCards: String?
        var playerRedCards: String?
        var playerImage: JSONNull?

        enum CodingKeys: String, CodingKey {
            case playerKey = "player_key"
            case playerName = "player_name"
            case playerNumber = "player_number"
            case playerCountry = "player_country"
            case playerType = "player_type"
            case playerAge = "player_age"
            case playerMatchPlayed = "player_match_played"
            case playerGoals = "player_goals"
            case playerYellowCards = "player_yellow_cards"
            case playerRedCards = "player_red_cards"
            case playerImage = "player_image"
        }
    }

    enum PlayerType: String, Codable {
        case defenders = "Defenders"
        case forwards = "Forwards"
        case goalkeepers = "Goalkeepers"
        case midfielders = "Midfielders"
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

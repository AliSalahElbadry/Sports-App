//
//  FootLatestResponse.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import Foundation
class FootLatestResponse{
    class Welcome: Codable {
        var success: Int?
        var result: [Result]?

        init(success: Int?, result: [Result]?) {
            self.success = success
            self.result = result
        }
    }

    // MARK: - Result
    class Result: Codable {
        var eventKey: Int?
        var eventDate: String?
        var eventTime: EventTime?
        var eventHomeTeam: String?
        var homeTeamKey: Int?
        var eventAwayTeam: String?
        var awayTeamKey: Int?
        var eventHalftimeResult, eventFinalResult, eventFtResult: EventFinalResult?
        var eventPenaltyResult: String?
        var eventStatus: EventStatus?
        var countryName: CountryName?
        var leagueName: LeagueName?
        var leagueKey: Int?
        var leagueRound: String?
        var leagueSeason: LeagueSeason?
        var eventLive, eventStadium, eventReferee: String?
        var homeTeamLogo, awayTeamLogo: String?
        var eventCountryKey: Int?
        var leagueLogo, countryLogo: String?
        var eventHomeFormation, eventAwayFormation: String?
        var fkStageKey: Int?
        var stageName: StageName?
        var leagueGroup: JSONNull?
        var goalscorers: [Goalscorer]?
        var substitutes: [Substitute]?
        var cards: [CardElement]?
        var lineups: Lineups?
        var statistics: [Statistic]?

        enum CodingKeys: String, CodingKey {
            case eventKey = "event_key"
            case eventDate = "event_date"
            case eventTime = "event_time"
            case eventHomeTeam = "event_home_team"
            case homeTeamKey = "home_team_key"
            case eventAwayTeam = "event_away_team"
            case awayTeamKey = "away_team_key"
            case eventHalftimeResult = "event_halftime_result"
            case eventFinalResult = "event_final_result"
            case eventFtResult = "event_ft_result"
            case eventPenaltyResult = "event_penalty_result"
            case eventStatus = "event_status"
            case countryName = "country_name"
            case leagueName = "league_name"
            case leagueKey = "league_key"
            case leagueRound = "league_round"
            case leagueSeason = "league_season"
            case eventLive = "event_live"
            case eventStadium = "event_stadium"
            case eventReferee = "event_referee"
            case homeTeamLogo = "home_team_logo"
            case awayTeamLogo = "away_team_logo"
            case eventCountryKey = "event_country_key"
            case leagueLogo = "league_logo"
            case countryLogo = "country_logo"
            case eventHomeFormation = "event_home_formation"
            case eventAwayFormation = "event_away_formation"
            case fkStageKey = "fk_stage_key"
            case stageName = "stage_name"
            case leagueGroup = "league_group"
            case goalscorers, substitutes, cards, lineups, statistics
        }

        init(eventKey: Int?, eventDate: String?, eventTime: EventTime?, eventHomeTeam: String?, homeTeamKey: Int?, eventAwayTeam: String?, awayTeamKey: Int?, eventHalftimeResult: EventFinalResult?, eventFinalResult: EventFinalResult?, eventFtResult: EventFinalResult?, eventPenaltyResult: String?, eventStatus: EventStatus?, countryName: CountryName?, leagueName: LeagueName?, leagueKey: Int?, leagueRound: String?, leagueSeason: LeagueSeason?, eventLive: String?, eventStadium: String?, eventReferee: String?, homeTeamLogo: String?, awayTeamLogo: String?, eventCountryKey: Int?, leagueLogo: String?, countryLogo: String?, eventHomeFormation: String?, eventAwayFormation: String?, fkStageKey: Int?, stageName: StageName?, leagueGroup: JSONNull?, goalscorers: [Goalscorer]?, substitutes: [Substitute]?, cards: [CardElement]?, lineups: Lineups?, statistics: [Statistic]?) {
            self.eventKey = eventKey
            self.eventDate = eventDate
            self.eventTime = eventTime
            self.eventHomeTeam = eventHomeTeam
            self.homeTeamKey = homeTeamKey
            self.eventAwayTeam = eventAwayTeam
            self.awayTeamKey = awayTeamKey
            self.eventHalftimeResult = eventHalftimeResult
            self.eventFinalResult = eventFinalResult
            self.eventFtResult = eventFtResult
            self.eventPenaltyResult = eventPenaltyResult
            self.eventStatus = eventStatus
            self.countryName = countryName
            self.leagueName = leagueName
            self.leagueKey = leagueKey
            self.leagueRound = leagueRound
            self.leagueSeason = leagueSeason
            self.eventLive = eventLive
            self.eventStadium = eventStadium
            self.eventReferee = eventReferee
            self.homeTeamLogo = homeTeamLogo
            self.awayTeamLogo = awayTeamLogo
            self.eventCountryKey = eventCountryKey
            self.leagueLogo = leagueLogo
            self.countryLogo = countryLogo
            self.eventHomeFormation = eventHomeFormation
            self.eventAwayFormation = eventAwayFormation
            self.fkStageKey = fkStageKey
            self.stageName = stageName
            self.leagueGroup = leagueGroup
            self.goalscorers = goalscorers
            self.substitutes = substitutes
            self.cards = cards
            self.lineups = lineups
            self.statistics = statistics
        }
    }

    // MARK: - CardElement
    class CardElement: Codable {
        var time, homeFault: String?
        var card: CardEnum?
        var awayFault: String?
        var info: Info?
        var homePlayerID, awayPlayerID: String?
        var infoTime: InfoTime?

        enum CodingKeys: String, CodingKey {
            case time
            case homeFault = "home_fault"
            case card
            case awayFault = "away_fault"
            case info
            case homePlayerID = "home_player_id"
            case awayPlayerID = "away_player_id"
            case infoTime = "info_time"
        }

        init(time: String?, homeFault: String?, card: CardEnum?, awayFault: String?, info: Info?, homePlayerID: String?, awayPlayerID: String?, infoTime: InfoTime?) {
            self.time = time
            self.homeFault = homeFault
            self.card = card
            self.awayFault = awayFault
            self.info = info
            self.homePlayerID = homePlayerID
            self.awayPlayerID = awayPlayerID
            self.infoTime = infoTime
        }
    }

    enum CardEnum: String, Codable {
        case redCard = "red card"
        case yellowCard = "yellow card"
    }

    enum Info: String, Codable {
        case away = "away"
        case empty = ""
        case home = "home"
        case penalty = "Penalty"
    }

    enum InfoTime: String, Codable {
        case the1StHalf = "1st Half"
        case the2NdHalf = "2nd Half"
    }

    enum CountryName: String, Codable {
        case ghana = "Ghana"
    }

    enum EventFinalResult: String, Codable {
        case the00 = "0 - 0"
        case the01 = "0 - 1"
        case the02 = "0 - 2"
        case the03 = "0 - 3"
        case the10 = "1 - 0"
        case the11 = "1 - 1"
        case the12 = "1 - 2"
        case the13 = "1 - 3"
        case the14 = "1 - 4"
        case the20 = "2 - 0"
        case the21 = "2 - 1"
        case the22 = "2 - 2"
        case the23 = "2 - 3"
        case the30 = "3 - 0"
        case the31 = "3 - 1"
        case the32 = "3 - 2"
        case the33 = "3 - 3"
        case the34 = "3 - 4"
        case the40 = "4 - 0"
        case the41 = "4 - 1"
        case the42 = "4 - 2"
        case the50 = "5 - 0"
        case the51 = "5 - 1"
        case the52 = "5 - 2"
        case the60 = "6 - 0"
    }

    enum EventStatus: String, Codable {
        case finished = "Finished"
    }

    enum EventTime: String, Codable {
        case the1100 = "11:00"
        case the1600 = "16:00"
        case the1700 = "17:00"
        case the1900 = "19:00"
        case the1930 = "19:30"
        case the2000 = "20:00"
    }

    // MARK: - Goalscorer
    class Goalscorer: Codable {
        var time, homeScorer, homeScorerID, homeAssist: String?
        var homeAssistID: String?
        var score: EventFinalResult?
        var awayScorer, awayScorerID, awayAssist, awayAssistID: String?
        var info: Info?
        var infoTime: InfoTime?

        enum CodingKeys: String, CodingKey {
            case time
            case homeScorer = "home_scorer"
            case homeScorerID = "home_scorer_id"
            case homeAssist = "home_assist"
            case homeAssistID = "home_assist_id"
            case score
            case awayScorer = "away_scorer"
            case awayScorerID = "away_scorer_id"
            case awayAssist = "away_assist"
            case awayAssistID = "away_assist_id"
            case info
            case infoTime = "info_time"
        }

        init(time: String?, homeScorer: String?, homeScorerID: String?, homeAssist: String?, homeAssistID: String?, score: EventFinalResult?, awayScorer: String?, awayScorerID: String?, awayAssist: String?, awayAssistID: String?, info: Info?, infoTime: InfoTime?) {
            self.time = time
            self.homeScorer = homeScorer
            self.homeScorerID = homeScorerID
            self.homeAssist = homeAssist
            self.homeAssistID = homeAssistID
            self.score = score
            self.awayScorer = awayScorer
            self.awayScorerID = awayScorerID
            self.awayAssist = awayAssist
            self.awayAssistID = awayAssistID
            self.info = info
            self.infoTime = infoTime
        }
    }

    enum LeagueName: String, Codable {
        case premierLeague = "Premier League"
    }

    enum LeagueSeason: String, Codable {
        case the20212022 = "2021/2022"
        case the20222023 = "2022/2023"
    }

    // MARK: - Lineups
    class Lineups: Codable {
        var homeTeam, awayTeam: Team?

        enum CodingKeys: String, CodingKey {
            case homeTeam = "home_team"
            case awayTeam = "away_team"
        }

        init(homeTeam: Team?, awayTeam: Team?) {
            self.homeTeam = homeTeam
            self.awayTeam = awayTeam
        }
    }

    // MARK: - Team
    class Team: Codable {
        var startingLineups, substitutes, coaches, missingPlayers: [JSONAny]?

        enum CodingKeys: String, CodingKey {
            case startingLineups = "starting_lineups"
            case substitutes, coaches
            case missingPlayers = "missing_players"
        }

        init(startingLineups: [JSONAny]?, substitutes: [JSONAny]?, coaches: [JSONAny]?, missingPlayers: [JSONAny]?) {
            self.startingLineups = startingLineups
            self.substitutes = substitutes
            self.coaches = coaches
            self.missingPlayers = missingPlayers
        }
    }

    enum StageName: String, Codable {
        case current = "Current"
    }

    // MARK: - Statistic
    class Statistic: Codable {
        var type: TypeEnum?
        var home, away: String?

        init(type: TypeEnum?, home: String?, away: String?) {
            self.type = type
            self.home = home
            self.away = away
        }
    }

    enum TypeEnum: String, Codable {
        case attacks = "Attacks"
        case ballPossession = "Ball Possession"
        case corners = "Corners"
        case dangerousAttacks = "Dangerous Attacks"
        case offTarget = "Off Target"
        case onTarget = "On Target"
        case penalty = "Penalty"
        case substitution = "Substitution"
    }

    // MARK: - Substitute
    class Substitute: Codable {
        var time: String?
        var homeScorer: AwayScorerUnion?
        var homeAssist: String?
        var score: Score?
        var awayScorer: AwayScorerUnion?
        var awayAssist, info: String?
        var infoTime: InfoTime?

        enum CodingKeys: String, CodingKey {
            case time
            case homeScorer = "home_scorer"
            case homeAssist = "home_assist"
            case score
            case awayScorer = "away_scorer"
            case awayAssist = "away_assist"
            case info
            case infoTime = "info_time"
        }

        init(time: String?, homeScorer: AwayScorerUnion?, homeAssist: String?, score: Score?, awayScorer: AwayScorerUnion?, awayAssist: String?, info: String?, infoTime: InfoTime?) {
            self.time = time
            self.homeScorer = homeScorer
            self.homeAssist = homeAssist
            self.score = score
            self.awayScorer = awayScorer
            self.awayAssist = awayAssist
            self.info = info
            self.infoTime = infoTime
        }
    }

    enum AwayScorerUnion: Codable {
        case anythingArray([JSONAny])
        case awayScorerClass(AwayScorerClass)

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            if let x = try? container.decode(AwayScorerClass.self) {
                self = .awayScorerClass(x)
                return
            }
            throw DecodingError.typeMismatch(AwayScorerUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AwayScorerUnion"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .anythingArray(let x):
                try container.encode(x)
            case .awayScorerClass(let x):
                try container.encode(x)
            }
        }
    }

    // MARK: - AwayScorerClass
    class AwayScorerClass: Codable {
        var scorerIn, out: String?
        var inID, outID: Int?

        enum CodingKeys: String, CodingKey {
            case scorerIn = "in"
            case out
            case inID = "in_id"
            case outID = "out_id"
        }

        init(scorerIn: String?, out: String?, inID: Int?, outID: Int?) {
            self.scorerIn = scorerIn
            self.out = out
            self.inID = inID
            self.outID = outID
        }
    }

    enum Score: String, Codable {
        case substitution = "substitution"
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

    class JSONCodingKey: CodingKey {
        let key: String

        required init?(intValue: Int) {
            return nil
        }

        required init?(stringValue: String) {
            key = stringValue
        }

        var intValue: Int? {
            return nil
        }

        var stringValue: String {
            return key
        }
    }

    class JSONAny: Codable {

        let value: Any

        static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
        }

        static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
        }

        static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if container.decodeNil() {
                return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if let value = try? container.decode(Bool.self) {
                return value
            }
            if let value = try? container.decode(Int64.self) {
                return value
            }
            if let value = try? container.decode(Double.self) {
                return value
            }
            if let value = try? container.decode(String.self) {
                return value
            }
            if let value = try? container.decodeNil() {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer() {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
            if let value = try? container.decode(Bool.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Int64.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(Double.self, forKey: key) {
                return value
            }
            if let value = try? container.decode(String.self, forKey: key) {
                return value
            }
            if let value = try? container.decodeNil(forKey: key) {
                if value {
                    return JSONNull()
                }
            }
            if var container = try? container.nestedUnkeyedContainer(forKey: key) {
                return try decodeArray(from: &container)
            }
            if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
                return try decodeDictionary(from: &container)
            }
            throw decodingError(forCodingPath: container.codingPath)
        }

        static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
            var arr: [Any] = []
            while !container.isAtEnd {
                let value = try decode(from: &container)
                arr.append(value)
            }
            return arr
        }

        static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                let value = try decode(from: &container, forKey: key)
                dict[key.stringValue] = value
            }
            return dict
        }

        static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                if let value = value as? Bool {
                    try container.encode(value)
                } else if let value = value as? Int64 {
                    try container.encode(value)
                } else if let value = value as? Double {
                    try container.encode(value)
                } else if let value = value as? String {
                    try container.encode(value)
                } else if value is JSONNull {
                    try container.encodeNil()
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer()
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                let key = JSONCodingKey(stringValue: key)!
                if let value = value as? Bool {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Int64 {
                    try container.encode(value, forKey: key)
                } else if let value = value as? Double {
                    try container.encode(value, forKey: key)
                } else if let value = value as? String {
                    try container.encode(value, forKey: key)
                } else if value is JSONNull {
                    try container.encodeNil(forKey: key)
                } else if let value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer(forKey: key)
                    try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }

        static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }

        public required init(from decoder: Decoder) throws {
            if var arrayContainer = try? decoder.unkeyedContainer() {
                self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
                self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
                let container = try decoder.singleValueContainer()
                self.value = try JSONAny.decode(from: container)
            }
        }

        public func encode(to encoder: Encoder) throws {
            if let arr = self.value as? [Any] {
                var container = encoder.unkeyedContainer()
                try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
                var container = encoder.container(keyedBy: JSONCodingKey.self)
                try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                var container = encoder.singleValueContainer()
                try JSONAny.encode(to: &container, value: self.value)
            }
        }
    }

}

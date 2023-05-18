//
//  CricketEvents.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation
class CricketEvents{
    
    // MARK: - Welcome
    struct Welcome: Codable {
        var success: Int?
        var result: [Result]?
    }

    // MARK: - Result
    struct Result: Codable {
        var eventKey: Int?
        var eventDateStart, eventDateStop: String?
        var eventTime: EventTime?
        var eventHomeTeam: String?
        var homeTeamKey: Int?
        var eventAwayTeam: String?
        var awayTeamKey: Int?
        var eventServiceHome: EventServiceHome?
        var eventServiceAway, eventHomeFinalResult, eventAwayFinalResult: String?
        var eventHomeRr, eventAwayRr: JSONNull?
        var eventStatus: EventStatus?
        var eventStatusInfo: String?
        var countryName: CountryName?
        var leagueName: LeagueName?
        var leagueKey: Int?
        var leagueRound, leagueSeason, eventLive: String?
        var eventType: EventType?
        var eventToss, eventManOfMatch: String?
        var eventStadium: EventStadium?
        var eventHomeTeamLogo, eventAwayTeamLogo: JSONNull?
        var scorecard: [String: [Scorecard]]?
        var comments: Comments?
        var wickets: Wickets?
        var extra: [String: Extra]?
        var lineups: Lineups?

        enum CodingKeys: String, CodingKey {
            case eventKey = "event_key"
            case eventDateStart = "event_date_start"
            case eventDateStop = "event_date_stop"
            case eventTime = "event_time"
            case eventHomeTeam = "event_home_team"
            case homeTeamKey = "home_team_key"
            case eventAwayTeam = "event_away_team"
            case awayTeamKey = "away_team_key"
            case eventServiceHome = "event_service_home"
            case eventServiceAway = "event_service_away"
            case eventHomeFinalResult = "event_home_final_result"
            case eventAwayFinalResult = "event_away_final_result"
            case eventHomeRr = "event_home_rr"
            case eventAwayRr = "event_away_rr"
            case eventStatus = "event_status"
            case eventStatusInfo = "event_status_info"
            case countryName = "country_name"
            case leagueName = "league_name"
            case leagueKey = "league_key"
            case leagueRound = "league_round"
            case leagueSeason = "league_season"
            case eventLive = "event_live"
            case eventType = "event_type"
            case eventToss = "event_toss"
            case eventManOfMatch = "event_man_of_match"
            case eventStadium = "event_stadium"
            case eventHomeTeamLogo = "event_home_team_logo"
            case eventAwayTeamLogo = "event_away_team_logo"
            case scorecard, comments, wickets, extra, lineups
        }
    }

    enum Comments: Codable {
        case anythingArray([JSONAny])
        case commentArrayMap([String: [Comment]])

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            if let x = try? container.decode([String: [Comment]].self) {
                self = .commentArrayMap(x)
                return
            }
            throw DecodingError.typeMismatch(Comments.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Comments"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .anythingArray(let x):
                try container.encode(x)
            case .commentArrayMap(let x):
                try container.encode(x)
            }
        }
    }

    // MARK: - Comment
    struct Comment: Codable {
        var innings: Innings?
        var balls, overs: String?
        var ended: Ended?
        var runs, post: String?
    }

    enum Ended: String, Codable {
        case no = "No"
        case yes = "Yes"
    }

    enum Innings: String, Codable {
        case abahaniLimited1INN = "Abahani Limited 1 INN"
        case abahaniLimited2INN = "Abahani Limited 2 INN"
        case agraniBankCricketClub1INN = "Agrani Bank Cricket Club 1 INN"
        case agraniBankCricketClub2INN = "Agrani Bank Cricket Club 2 INN"
        case brothersUnion1INN = "Brothers Union 1 INN"
        case brothersUnion2INN = "Brothers Union 2 INN"
        case cityClub1INN = "City Club 1 INN"
        case cityClub2INN = "City Club 2 INN"
        case dhakaLeopards1INN = "Dhaka Leopards 1 INN"
        case dhakaLeopards2INN = "Dhaka Leopards 2 INN"
        case gaziGroupCricketers1INN = "Gazi Group Cricketers 1 INN"
        case gaziGroupCricketers2INN = "Gazi Group Cricketers 2 INN"
        case legendsOfRupganj1INN = "Legends of Rupganj 1 INN"
        case legendsOfRupganj2INN = "Legends of Rupganj 2 INN"
        case live = "Live"
        case mohammedanSportingClub1INN = "Mohammedan Sporting Club 1 INN"
        case mohammedanSportingClub2INN = "Mohammedan Sporting Club 2 INN"
        case primeBankCricketClub1INN = "Prime Bank Cricket Club 1 INN"
        case primeBankCricketClub2INN = "Prime Bank Cricket Club 2 INN"
        case rupganjTigersCricketClub1INN = "Rupganj Tigers Cricket Club 1 INN"
        case rupganjTigersCricketClub2INN = "Rupganj Tigers Cricket Club 2 INN"
        case sheikhJamalDhanmondiClub1INN = "Sheikh Jamal Dhanmondi Club 1 INN"
        case sheikhJamalDhanmondiClub2INN = "Sheikh Jamal Dhanmondi Club 2 INN"
        case shinepukurCricketClub1INN = "Shinepukur Cricket Club 1 INN"
        case shinepukurCricketClub2INN = "Shinepukur Cricket Club 2 INN"
    }

    enum CountryName: String, Codable {
        case cricket = "Cricket"
    }

    enum EventServiceHome: String, Codable {
        case empty = ""
        case the2020Ov = "20/20 ov"
        case the2121Ov = "21/21 ov"
        case the3333Ov = "33/33 ov"
        case the39342Ov = "39.3/42 ov"
        case the4242Ov = "42/42 ov"
        case the4444Ov = "44/44 ov"
        case the4747Ov = "47/47 ov"
        case the4949Ov = "49/49 ov"
    }

    enum EventStadium: String, Codable {
        case bangladeshKriraShikkhaProtisthanNo3GroundSavar = "Bangladesh Krira Shikkha Protisthan No 3 Ground, Savar"
        case bangladeshKriraShikkhaProtisthanNo4GroundSavar = "Bangladesh Krira Shikkha Protisthan No 4 Ground, Savar"
        case khanShahebOsmanAliStadiumFatullah = "Khan Shaheb Osman Ali Stadium, Fatullah"
        case shereBanglaNationalStadiumMirpur = "Shere Bangla National Stadium, Mirpur"
    }

    enum EventStatus: String, Codable {
        case cancelled = "Cancelled"
        case finished = "Finished"
    }

    enum EventTime: String, Codable {
        case the0400 = "04:00"
        case the0430 = "04:30"
        case the0500 = "05:00"
    }

    enum EventType: String, Codable {
        case odi = "ODI"
    }

    // MARK: - Extra
    struct Extra: Codable {
        var innings: Innings?
        var nr, text: String?
        var totalOvers: JSONNull?
        var total: String?
        var percentOver: JSONNull?

        enum CodingKeys: String, CodingKey {
            case innings, nr, text
            case totalOvers = "total_overs"
            case total
            case percentOver = "percent_over"
        }
    }

    enum LeagueName: String, Codable {
        case dhakaPremierDivisionCricketLeague = "Dhaka Premier Division Cricket League"
    }

    // MARK: - Lineups
    struct Lineups: Codable {
        var homeTeam, awayTeam: Team?

        enum CodingKeys: String, CodingKey {
            case homeTeam = "home_team"
            case awayTeam = "away_team"
        }
    }

    // MARK: - Team
    struct Team: Codable {
        var startingLineups: [StartingLineup]?

        enum CodingKeys: String, CodingKey {
            case startingLineups = "starting_lineups"
        }
    }

    // MARK: - StartingLineup
    struct StartingLineup: Codable {
        var player, playerCountry: String?

        enum CodingKeys: String, CodingKey {
            case player
            case playerCountry = "player_country"
        }
    }

    // MARK: - Scorecard
    struct Scorecard: Codable {
        var innings: Innings?
        var player: String?
        var type: TypeEnum?
        var status: String?
        var r: Int?
        var b, min, the4S, the6S: Int?
        var o: Double?
        var m, w: Int?
        var sr, er: String?

        enum CodingKeys: String, CodingKey {
            case innings, player, type, status
            case r = "R"
            case b = "B"
            case min = "Min"
            case the4S = "4s"
            case the6S = "6s"
            case o = "O"
            case m = "M"
            case w = "W"
            case sr = "SR"
            case er = "ER"
        }
    }

    enum TypeEnum: String, Codable {
        case batsman = "Batsman"
        case bowler = "Bowler"
    }

    enum Wickets: Codable {
        case anythingArray([JSONAny])
        case wicketArrayMap([String: [Wicket]])

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            if let x = try? container.decode([String: [Wicket]].self) {
                self = .wicketArrayMap(x)
                return
            }
            throw DecodingError.typeMismatch(Wickets.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Wickets"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .anythingArray(let x):
                try container.encode(x)
            case .wicketArrayMap(let x):
                try container.encode(x)
            }
        }
    }

    // MARK: - Wicket
    struct Wicket: Codable {
        var innings: Innings?
        var fall, balwer, batsman, score: String?
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

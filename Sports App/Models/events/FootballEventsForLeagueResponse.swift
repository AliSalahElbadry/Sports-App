//
//  FootballEventsResponse.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

class FootballEvents{
    
    // MARK: - Welcome
    struct EventsWelcome: Codable {
        var success: Int
        var result: [EventsResult]
    }
    
    // MARK: - Result
    struct EventsResult: Codable {
        var eventKey: Int
        var eventDate: String
        var eventTime: EventTime
        var eventHomeTeam: String
        var homeTeamKey: Int
        var eventAwayTeam: String
        var awayTeamKey: Int
        var eventHalftimeResult: EventHalftimeResult
        var eventFinalResult, eventFtResult, eventPenaltyResult: String
        var eventStatus: EventStatus
        var countryName: CountryName
        var leagueName: LeagueName
        var leagueKey: Int
        var leagueRound: String
        var leagueSeason: LeagueSeason
        var eventLive, eventStadium, eventReferee: String
        var homeTeamLogo, awayTeamLogo: String
        var eventCountryKey: Int
        var leagueLogo, countryLogo: String
        var eventHomeFormation, eventAwayFormation: String
        var fkStageKey: Int
        var stageName: StageName
        var leagueGroup: JSONNull?
        var goalscorers: [Goalscorer]
        var substitutes: [Substitute]
        var cards: [CardElement]
        var lineups: Lineups
        var statistics: [Statistic]
        
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
    }
    
    // MARK: - CardElement
    struct CardElement: Codable {
        var time, homeFault: String
        var card: CardEnum
        var awayFault: String
        var info: Info
        var homePlayerID: HomePlayerID
        var awayPlayerID: String
        var infoTime: InfoTime
        
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
    }
    
    enum CardEnum: String, Codable {
        case redCard = "red card"
        case yellowCard = "yellow card"
    }
    
    enum HomePlayerID: String, Codable {
        case empty = ""
        case the3215501330 = "3215501330"
        case the3543847450 = "3543847450"
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
    
    enum EventHalftimeResult: String, Codable {
        case empty = ""
        case the00 = "0 - 0"
        case the01 = "0 - 1"
        case the02 = "0 - 2"
        case the10 = "1 - 0"
        case the11 = "1 - 1"
        case the12 = "1 - 2"
        case the20 = "2 - 0"
        case the21 = "2 - 1"
        case the30 = "3 - 0"
        case the32 = "3 - 2"
        case the40 = "4 - 0"
    }
    
    enum EventStatus: String, Codable {
        case empty = ""
        case finished = "Finished"
    }
    
    enum EventTime: String, Codable {
        case the1200 = "12:00"
        case the1600 = "16:00"
        case the1700 = "17:00"
        case the1900 = "19:00"
        case the1945 = "19:45"
        case the2000 = "20:00"
        case the2045 = "20:45"
        case the2100 = "21:00"
    }
    
    // MARK: - Goalscorer
    struct Goalscorer: Codable {
        var time, homeScorer, homeScorerID: String
        var homeAssist: HomeAssist
        var homeAssistID, score, awayScorer, awayScorerID: String
        var awayAssist: AwayAssist
        var awayAssistID: String
        var info: Info
        var infoTime: InfoTime
        
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
    }
    
    enum AwayAssist: String, Codable {
        case empty = ""
        case iSalifu = "I. Salifu"
        case jMereku = "J. Mereku"
    }
    
    enum HomeAssist: String, Codable {
        case cGyamfi = "C. Gyamfi"
        case eAppau = "E. Appau"
        case empty = ""
        case mArthur = "M. Arthur"
        case mOmgba = "M. Omgba"
        case sMukwala = "S. Mukwala"
    }
    
    enum LeagueName: String, Codable {
        case premierLeague = "Premier League"
    }
    
    enum LeagueSeason: String, Codable {
        case the20222023 = "2022/2023"
    }
    
    // MARK: - Lineups
    struct Lineups: Codable {
        var homeTeam, awayTeam: Team
        
        enum CodingKeys: String, CodingKey {
            case homeTeam = "home_team"
            case awayTeam = "away_team"
        }
    }
    
    // MARK: - Team
    struct Team: Codable {
        var startingLineups, substitutes, coaches, missingPlayers: [JSONAny]
        
        enum CodingKeys: String, CodingKey {
            case startingLineups = "starting_lineups"
            case substitutes, coaches
            case missingPlayers = "missing_players"
        }
    }
    
    enum StageName: String, Codable {
        case current = "Current"
    }
    
    // MARK: - Statistic
    struct Statistic: Codable {
        var type: TypeEnum
        var home, away: String
    }
    
    enum TypeEnum: String, Codable {
        case attacks = "Attacks"
        case dangerousAttacks = "Dangerous Attacks"
        case offTarget = "Off Target"
        case onTarget = "On Target"
        case penalty = "Penalty"
        case substitution = "Substitution"
    }
    
    // MARK: - Substitute
    struct Substitute: Codable {
        var time: String
        var homeScorer: AwayScorerUnion
        var homeAssist: String
        var score: Score
        var awayScorer: AwayScorerUnion
        var awayAssist, info: String
        var infoTime: InfoTime
        
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
    }
    
    enum AwayScorerUnion: Codable {
        case anythingArray([JSONAny])
        case awayScorerClass(AwayScorerClass)
        
        init(from decoder: Decoder) throws {
            var container = try decoder.singleValueContainer()
            if var x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            if var x = try? container.decode(AwayScorerClass.self) {
                self = .awayScorerClass(x)
                return
            }
            throw DecodingError.typeMismatch(AwayScorerUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AwayScorerUnion"))
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .anythingArray(var x):
                try container.encode(x)
            case .awayScorerClass(var x):
                try container.encode(x)
            }
        }
    }
    
    // MARK: - AwayScorerClass
    struct AwayScorerClass: Codable {
        var scorerIn, out: String
        var inID, outID: Int
        
        enum CodingKeys: String, CodingKey {
            case scorerIn = "in"
            case out
            case inID = "in_id"
            case outID = "out_id"
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
            var container = try decoder.singleValueContainer()
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
        var key: String
        
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
        
        var value: Any
        
        static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
            var context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
            return DecodingError.typeMismatch(JSONAny.self, context)
        }
        
        static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
            var context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
            return EncodingError.invalidValue(value, context)
        }
        
        static func decode(from container: SingleValueDecodingContainer) throws -> Any {
            if var value = try? container.decode(Bool.self) {
                return value
            }
            if var value = try? container.decode(Int64.self) {
                return value
            }
            if var value = try? container.decode(Double.self) {
                return value
            }
            if var value = try? container.decode(String.self) {
                return value
            }
            if container.decodeNil() {
                return JSONNull()
            }
            throw decodingError(forCodingPath: container.codingPath)
        }
        
        static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
            if var value = try? container.decode(Bool.self) {
                return value
            }
            if var value = try? container.decode(Int64.self) {
                return value
            }
            if var value = try? container.decode(Double.self) {
                return value
            }
            if var value = try? container.decode(String.self) {
                return value
            }
            if var value = try? container.decodeNil() {
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
            if var value = try? container.decode(Bool.self, forKey: key) {
                return value
            }
            if var value = try? container.decode(Int64.self, forKey: key) {
                return value
            }
            if var value = try? container.decode(Double.self, forKey: key) {
                return value
            }
            if var value = try? container.decode(String.self, forKey: key) {
                return value
            }
            if var value = try? container.decodeNil(forKey: key) {
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
                var value = try decode(from: &container)
                arr.append(value)
            }
            return arr
        }
        
        static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
            var dict = [String: Any]()
            for key in container.allKeys {
                var value = try decode(from: &container, forKey: key)
                dict[key.stringValue] = value
            }
            return dict
        }
        
        static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
            for value in array {
                if var value = value as? Bool {
                    try container.encode(value)
                } else if var value = value as? Int64 {
                    try container.encode(value)
                } else if var value = value as? Double {
                    try container.encode(value)
                } else if var value = value as? String {
                    try container.encode(value)
                } else if value is JSONNull {
                    try container.encodeNil()
                } else if var value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer()
                    try encode(to: &container, array: value)
                } else if var value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }
        
        static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
            for (key, value) in dictionary {
                var key = JSONCodingKey(stringValue: key)!
                if var value = value as? Bool {
                    try container.encode(value, forKey: key)
                } else if var value = value as? Int64 {
                    try container.encode(value, forKey: key)
                } else if var value = value as? Double {
                    try container.encode(value, forKey: key)
                } else if var value = value as? String {
                    try container.encode(value, forKey: key)
                } else if value is JSONNull {
                    try container.encodeNil(forKey: key)
                } else if var value = value as? [Any] {
                    var container = container.nestedUnkeyedContainer(forKey: key)
                    try encode(to: &container, array: value)
                } else if var value = value as? [String: Any] {
                    var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                    try encode(to: &container, dictionary: value)
                } else {
                    throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }
        
        static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
            if var value = value as? Bool {
                try container.encode(value)
            } else if var value = value as? Int64 {
                try container.encode(value)
            } else if var value = value as? Double {
                try container.encode(value)
            } else if var value = value as? String {
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
                var container = try decoder.singleValueContainer()
                self.value = try JSONAny.decode(from: container)
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            if var arr = self.value as? [Any] {
                var container = encoder.unkeyedContainer()
                try JSONAny.encode(to: &container, array: arr)
            } else if var dict = self.value as? [String: Any] {
                var container = encoder.container(keyedBy: JSONCodingKey.self)
                try JSONAny.encode(to: &container, dictionary: dict)
            } else {
                var container = encoder.singleValueContainer()
                try JSONAny.encode(to: &container, value: self.value)
            }
        }
    }
}

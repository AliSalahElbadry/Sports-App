//
//  CricketLatestResponse.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import Foundation
class CricketLatestResponse{
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
        var eventHomeTeamLogo, eventAwayTeamLogo: String?
        var scorecard: ScorecardUnion?
        var comments: Comments?
        var wickets: Wickets?
        var extra: ExtraUnion?
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

        init(eventKey: Int?, eventDateStart: String?, eventDateStop: String?, eventTime: EventTime?, eventHomeTeam: String?, homeTeamKey: Int?, eventAwayTeam: String?, awayTeamKey: Int?, eventServiceHome: EventServiceHome?, eventServiceAway: String?, eventHomeFinalResult: String?, eventAwayFinalResult: String?, eventHomeRr: JSONNull?, eventAwayRr: JSONNull?, eventStatus: EventStatus?, eventStatusInfo: String?, countryName: CountryName?, leagueName: LeagueName?, leagueKey: Int?, leagueRound: String?, leagueSeason: String?, eventLive: String?, eventType: EventType?, eventToss: String?, eventManOfMatch: String?, eventStadium: EventStadium?, eventHomeTeamLogo: String?, eventAwayTeamLogo: String?, scorecard: ScorecardUnion?, comments: Comments?, wickets: Wickets?, extra: ExtraUnion?, lineups: Lineups?) {
            self.eventKey = eventKey
            self.eventDateStart = eventDateStart
            self.eventDateStop = eventDateStop
            self.eventTime = eventTime
            self.eventHomeTeam = eventHomeTeam
            self.homeTeamKey = homeTeamKey
            self.eventAwayTeam = eventAwayTeam
            self.awayTeamKey = awayTeamKey
            self.eventServiceHome = eventServiceHome
            self.eventServiceAway = eventServiceAway
            self.eventHomeFinalResult = eventHomeFinalResult
            self.eventAwayFinalResult = eventAwayFinalResult
            self.eventHomeRr = eventHomeRr
            self.eventAwayRr = eventAwayRr
            self.eventStatus = eventStatus
            self.eventStatusInfo = eventStatusInfo
            self.countryName = countryName
            self.leagueName = leagueName
            self.leagueKey = leagueKey
            self.leagueRound = leagueRound
            self.leagueSeason = leagueSeason
            self.eventLive = eventLive
            self.eventType = eventType
            self.eventToss = eventToss
            self.eventManOfMatch = eventManOfMatch
            self.eventStadium = eventStadium
            self.eventHomeTeamLogo = eventHomeTeamLogo
            self.eventAwayTeamLogo = eventAwayTeamLogo
            self.scorecard = scorecard
            self.comments = comments
            self.wickets = wickets
            self.extra = extra
            self.lineups = lineups
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
    class Comment: Codable {
        var innings: Innings?
        var balls, overs: String?
        var ended: Ended?
        var runs, post: String?

        init(innings: Innings?, balls: String?, overs: String?, ended: Ended?, runs: String?, post: String?) {
            self.innings = innings
            self.balls = balls
            self.overs = overs
            self.ended = ended
            self.runs = runs
            self.post = post
        }
    }

    enum Ended: String, Codable {
        case no = "No"
        case yes = "Yes"
    }

    enum Innings: String, Codable {
        case bahrain1INN = "Bahrain 1 INN"
        case hongKong1INN = "Hong Kong 1 INN"
        case hongKong2INN = "Hong Kong 2 INN"
        case kuwait1INN = "Kuwait 1 INN"
        case kuwait2INN = "Kuwait 2 INN"
        case live = "Live"
        case malaysia1INN = "Malaysia 1 INN"
        case malaysia2INN = "Malaysia 2 INN"
        case nepal1INN = "Nepal 1 INN"
        case nepal2INN = "Nepal 2 INN"
        case oman1INN = "Oman 1 INN"
        case oman2INN = "Oman 2 INN"
        case qatar1INN = "Qatar 1 INN"
        case qatar2INN = "Qatar 2 INN"
        case saudiArabia1INN = "Saudi Arabia 1 INN"
        case saudiArabia2INN = "Saudi Arabia 2 INN"
        case singapore1INN = "Singapore 1 INN"
        case singapore2INN = "Singapore 2 INN"
        case unitedArabEmirates1INN = "United Arab Emirates 1 INN"
        case unitedArabEmirates2INN = "United Arab Emirates 2 INN"
    }

    enum CountryName: String, Codable {
        case cricket = "Cricket"
    }

    enum EventServiceHome: String, Codable {
        case empty = ""
        case the3535Ov = "35/35 ov"
        case the4242Ov = "42/42 ov"
    }

    enum EventStadium: String, Codable {
        case mulpaniCricketGround = "Mulpani Cricket Ground"
        case tribhuvanUniversityInternationalCricketGroundKirtipur = "Tribhuvan University International Cricket Ground, Kirtipur"
    }

    enum EventStatus: String, Codable {
        case abandoned = "Abandoned"
        case cancelled = "Cancelled"
        case empty = ""
        case finished = "Finished"
    }

    enum EventTime: String, Codable {
        case the0500 = "05:00"
        case the0515 = "05:15"
        case the0545 = "05:45"
    }

    enum EventType: String, Codable {
        case odi = "ODI"
    }

    enum ExtraUnion: Codable {
        case anythingArray([JSONAny])
        case extraValueMap([String: ExtraValue])

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            if let x = try? container.decode([String: ExtraValue].self) {
                self = .extraValueMap(x)
                return
            }
            throw DecodingError.typeMismatch(ExtraUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ExtraUnion"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .anythingArray(let x):
                try container.encode(x)
            case .extraValueMap(let x):
                try container.encode(x)
            }
        }
    }

    // MARK: - ExtraValue
    class ExtraValue: Codable {
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

        init(innings: Innings?, nr: String?, text: String?, totalOvers: JSONNull?, total: String?, percentOver: JSONNull?) {
            self.innings = innings
            self.nr = nr
            self.text = text
            self.totalOvers = totalOvers
            self.total = total
            self.percentOver = percentOver
        }
    }

    enum LeagueName: String, Codable {
        case accMenSPremierCup = "ACC Men's Premier Cup"
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
        var startingLineups: [StartingLineup]?

        enum CodingKeys: String, CodingKey {
            case startingLineups = "starting_lineups"
        }

        init(startingLineups: [StartingLineup]?) {
            self.startingLineups = startingLineups
        }
    }

    // MARK: - StartingLineup
    class StartingLineup: Codable {
        var player, playerCountry: String?

        enum CodingKeys: String, CodingKey {
            case player
            case playerCountry = "player_country"
        }

        init(player: String?, playerCountry: String?) {
            self.player = player
            self.playerCountry = playerCountry
        }
    }

    enum ScorecardUnion: Codable {
        case anythingArray([JSONAny])
        case scorecardElementArrayMap([String: [ScorecardElement]])

        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let x = try? container.decode([JSONAny].self) {
                self = .anythingArray(x)
                return
            }
            if let x = try? container.decode([String: [ScorecardElement]].self) {
                self = .scorecardElementArrayMap(x)
                return
            }
            throw DecodingError.typeMismatch(ScorecardUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ScorecardUnion"))
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .anythingArray(let x):
                try container.encode(x)
            case .scorecardElementArrayMap(let x):
                try container.encode(x)
            }
        }
    }

    // MARK: - ScorecardElement
    class ScorecardElement: Codable {
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

        init(innings: Innings?, player: String?, type: TypeEnum?, status: String?, r: Int?, b: Int?, min: Int?, the4S: Int?, the6S: Int?, o: Double?, m: Int?, w: Int?, sr: String?, er: String?) {
            self.innings = innings
            self.player = player
            self.type = type
            self.status = status
            self.r = r
            self.b = b
            self.min = min
            self.the4S = the4S
            self.the6S = the6S
            self.o = o
            self.m = m
            self.w = w
            self.sr = sr
            self.er = er
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
    class Wicket: Codable {
        var innings: Innings?
        var fall, balwer, batsman, score: String?

        init(innings: Innings?, fall: String?, balwer: String?, batsman: String?, score: String?) {
            self.innings = innings
            self.fall = fall
            self.balwer = balwer
            self.batsman = batsman
            self.score = score
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

//
//  FootballEventsResponse.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

class FootballEvents{
    
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
        var eventDate, eventTime, eventHomeTeam: String?
        var homeTeamKey: Int?
        var eventAwayTeam: String?
        var awayTeamKey: Int?
        var eventFinalResult: String?
        var countryName, leagueName: String?
        var leagueKey: Int?
        var homeTeamLogo, awayTeamLogo: String?
        var leagueLogo: String?

        enum CodingKeys: String, CodingKey {
            case eventKey = "event_key"
            case eventDate = "event_date"
            case eventTime = "event_time"
            case eventHomeTeam = "event_home_team"
            case homeTeamKey = "home_team_key"
            case eventAwayTeam = "event_away_team"
            case awayTeamKey = "away_team_key"
            case eventFinalResult = "event_final_result"
            case countryName = "country_name"
            case leagueName = "league_name"
            case leagueKey = "league_key"
            case homeTeamLogo = "home_team_logo"
            case awayTeamLogo = "away_team_logo"
            case leagueLogo = "league_logo"
        }

        init(eventKey: Int? = nil, eventDate: String? = nil, eventTime: String? = nil, eventHomeTeam: String? = nil, homeTeamKey: Int? = nil, eventAwayTeam: String? = nil, awayTeamKey: Int? = nil, eventHalftimeResult: String? = nil, eventFinalResult: String? = nil, eventFtResult: String? = nil, eventPenaltyResult: String? = nil, eventStatus: String? = nil, countryName: String? = nil, leagueName: String? = nil, leagueKey: Int? = nil, homeTeamLogo: String? = nil, awayTeamLogo: String? = nil, leagueLogo: String? = nil) {
            self.eventKey = eventKey
            self.eventDate = eventDate
            self.eventTime = eventTime
            self.eventHomeTeam = eventHomeTeam
            self.homeTeamKey = homeTeamKey
            self.eventAwayTeam = eventAwayTeam
            self.awayTeamKey = awayTeamKey
            self.eventFinalResult = eventFinalResult
            self.countryName = countryName
            self.leagueName = leagueName
            self.leagueKey = leagueKey
            self.homeTeamLogo = homeTeamLogo
            self.awayTeamLogo = awayTeamLogo
            self.leagueLogo = leagueLogo
        }
    }

}

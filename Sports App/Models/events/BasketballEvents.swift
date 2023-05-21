//
//  BasketballEvents.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

class BasketballEvents{
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
        var eventTime: String?
        var eventHomeTeam: String?
        var homeTeamKey: Int?
        var eventAwayTeam: String?
        var awayTeamKey: Int?
        var eventFinalResult: String?
        var leagueKey: Int?
        var eventHomeTeamLogo, eventAwayTeamLogo: String?

        enum CodingKeys: String, CodingKey {
            case eventKey = "event_key"
            case eventDate = "event_date"
            case eventTime = "event_time"
            case eventHomeTeam = "event_home_team"
            case homeTeamKey = "home_team_key"
            case eventAwayTeam = "event_away_team"
            case awayTeamKey = "away_team_key"
            case eventFinalResult = "event_final_result"
            case leagueKey = "league_key"
            case eventHomeTeamLogo = "event_home_team_logo"
            case eventAwayTeamLogo = "event_away_team_logo"
        }

        init(eventKey: Int? = nil, eventDate: String? = nil, eventTime: String? = nil, eventHomeTeam: String? = nil, homeTeamKey: Int? = nil, eventAwayTeam: String? = nil, awayTeamKey: Int? = nil, eventFinalResult: String? = nil, leagueKey: Int? = nil, eventHomeTeamLogo: String? = nil, eventAwayTeamLogo: String? = nil) {
            self.eventKey = eventKey
            self.eventDate = eventDate
            self.eventTime = eventTime
            self.eventHomeTeam = eventHomeTeam
            self.homeTeamKey = homeTeamKey
            self.eventAwayTeam = eventAwayTeam
            self.awayTeamKey = awayTeamKey
            self.eventFinalResult = eventFinalResult
            self.leagueKey = leagueKey
            self.eventHomeTeamLogo = eventHomeTeamLogo
            self.eventAwayTeamLogo = eventAwayTeamLogo
        }
    }
}

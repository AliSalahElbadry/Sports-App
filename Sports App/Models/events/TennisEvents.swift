//
//  TennisEvents.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

class TennisEvents{
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
        var eventDate, eventTime, eventFirstPlayer: String?
        var firstPlayerKey: Int?
        var eventSecondPlayer: String?
        var secondPlayerKey: Int?
        var eventFinalResult: String?
        var eventGameResult: String?
        var eventWinner: String?
        var leagueKey: Int?
        var eventFirstPlayerLogo, eventSecondPlayerLogo: String?

        enum CodingKeys: String, CodingKey {
            case eventKey = "event_key"
            case eventDate = "event_date"
            case eventTime = "event_time"
            case eventFirstPlayer = "event_first_player"
            case firstPlayerKey = "first_player_key"
            case eventSecondPlayer = "event_second_player"
            case secondPlayerKey = "second_player_key"
            case eventFinalResult = "event_final_result"
            case eventGameResult = "event_game_result"
           
            case eventWinner = "event_winner"
            
            case leagueKey = "league_key"
            
            case eventFirstPlayerLogo = "event_first_player_logo"
            case eventSecondPlayerLogo = "event_second_player_logo"
        
        }

        init(eventKey: Int? = nil, eventDate: String? = nil, eventTime: String? = nil, eventFirstPlayer: String? = nil, firstPlayerKey: Int? = nil, eventSecondPlayer: String? = nil, secondPlayerKey: Int? = nil, eventFinalResult: String? = nil, eventGameResult: String? = nil, eventWinner: String? = nil, leagueKey: Int? = nil, eventFirstPlayerLogo: String? = nil, eventSecondPlayerLogo: String? = nil) {
            self.eventKey = eventKey
            self.eventDate = eventDate
            self.eventTime = eventTime
            self.eventFirstPlayer = eventFirstPlayer
            self.firstPlayerKey = firstPlayerKey
            self.eventSecondPlayer = eventSecondPlayer
            self.secondPlayerKey = secondPlayerKey
            self.eventFinalResult = eventFinalResult
            self.eventGameResult = eventGameResult
            self.eventWinner = eventWinner
            self.leagueKey = leagueKey
            self.eventFirstPlayerLogo = eventFirstPlayerLogo
            self.eventSecondPlayerLogo = eventSecondPlayerLogo
        }
    }
}

//
//  FakeBasketNetworkManager.swift
//  Sports AppTests
//
//  Created by Mac on 30/05/2023.
//

import Foundation
@testable import Sports_App
class FakeBasketNetworkManager : PBasketballNetworkManager{
  
    
    
    let basketLeaguesResponse = """
{"success":1,"result":[{"league_key":962,"league_name":"1. Liga","country_key":216,"country_name":"Poland"},{"league_key":1098,"league_name":"1. Liga","country_key":191,"country_name":"Czech Republic"},{"league_key":967,"league_name":"1. SKL Women","country_key":229,"country_name":"Slovenia"},{"league_key":1109,"league_name":"1. ZLS Women","country_key":217,"country_name":"Serbia"},{"league_key":1074,"league_name":"A1 Women","country_key":203,"country_name":"Greece"}]}
"""
    let basketEventResponse =
    """
    {"success":1,"result":[{"event_key":90689,"event_date":"2023-05-22","event_time":"18:00","event_home_team":"Keravnos","home_team_key":549,"event_away_team":"AEK Larnaca","away_team_key":550,"event_final_result":"70 - 72","event_quarter":"","event_status":"Finished","country_name":"Cyprus","league_name":"Division A","league_key":777,"league_round":null,"league_season":"2022/2023","event_live":"0","event_home_team_logo":"https://apiv2.allsportsapi.com/logo-basketball/549_keravnos.jpg","event_away_team_logo":"https://apiv2.allsportsapi.com/logo-basketball/550_aek_larnaca.jpg","scores":{"1stQuarter":[{"score_home":"15","score_away":"14"}],"2ndQuarter":[{"score_home":"16","score_away":"20"}],"3rdQuarter":[{"score_home":"17","score_away":"21"}],"4thQuarter":[{"score_home":"22","score_away":"17"}]},"statistics":[],"lineups":{"home_team":{"starting_lineups":[],"substitutes":[]},"away_team":{"starting_lineups":[],"substitutes":[]}},"player_statistics":{"home_team":[],"away_team":[]}}]}
    """
    let basketTeamResponse = """
    {"success":1,"result":[{"team_key":79,"team_name":"Baskonia","team_logo":"https://apiv2.allsportsapi.com/logo-basketball/79_baskonia.jpg"}]}
    """
    let shouldReturnError : Bool
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    func fetchLeagues(complition: @escaping (Sports_App.BasketLeaguesWelcome?) -> Void) {
        if(shouldReturnError == false){
        
                let data = basketLeaguesResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(BasketLeaguesWelcome.self, from: data)
                    complition(result)
                }catch {
                    complition(nil)
                }
          
        }else{
            complition(nil)
        }
    }
    
    func fetchEvents(mode: Int, leagueId: String, complition: @escaping (Sports_App.BasketballEvents.Welcome?) -> Void) {
        if(shouldReturnError == false){
          
                  let data = basketEventResponse.data(using: String.Encoding.utf8)!
                  do{
                      let result = try JSONDecoder().decode(BasketballEvents.Welcome.self, from: data)
                      complition(result )
                  }catch {
                      complition(nil)
                  }
             
        }else{
            complition(nil)
        }
    }
    
    func fetchTeamDetails(teamId: String, complition: @escaping (Sports_App.BasketballTeamDetails.Welcome?) -> Void) {
        if(shouldReturnError == false){
           
                let data = basketTeamResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(BasketballTeamDetails.Welcome.self, from: data)
                    complition(result)
                }catch {
                    complition(nil)
                }
        }else{
            complition(nil)
        }
    }
}

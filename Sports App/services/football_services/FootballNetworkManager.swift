//
//  FootbalNetworkManager.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation
import Alamofire
protocol PFootballNetworkManager{
    func fetchLeagues(complition:@escaping (FootballLeaguesWelcome?) -> Void)
    func fetchEvents(leagueId:String, complition:@escaping (FootballEvents.EventsWelcome?) -> Void)
    func fetchPlayerDetails(teamId:String, complition:@escaping (FootballTeamDetails.Welcome?) -> Void)
}
class FootballNetworkManager : PFootballNetworkManager{
    
    let urls:URLs
    init(){
        urls=URLs()
    }
    func fetchLeagues(complition: @escaping (FootballLeaguesWelcome?) -> Void) {
        AF.request(urls.FootballLeagues()).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(FootballLeaguesWelcome.self, from: data)
                    DispatchQueue.main.async {
                        complition(result)
                    }
                }
                catch{
                    complition(nil)
                }
            } else {
                complition(nil)
            }
        }
    }
    
    func fetchEvents(leagueId: String, complition:@escaping (FootballEvents.EventsWelcome?) -> Void) {
        AF.request(urls.FootballUpcomingEvents(leagueKey: leagueId)).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(FootballEvents.EventsWelcome.self, from: data)
                    DispatchQueue.main.async {
                        complition(result)
                    }
                }
                catch{
                    complition(nil)
                }
            } else {
                complition(nil)
            }
        }
    }
    
    func fetchPlayerDetails(teamId: String, complition:@escaping (FootballTeamDetails.Welcome?) -> Void)  {
        AF.request(urls.FootballTeamDetails(teamKey: teamId)).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(FootballTeamDetails.Welcome.self, from: data)
                    DispatchQueue.main.async {
                        complition(result)
                    }
                }
                catch{
                    complition(nil)
                }
            } else {
                complition(nil)
            }
        }
    }
}

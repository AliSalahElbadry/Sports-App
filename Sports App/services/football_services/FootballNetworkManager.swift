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
    func fetchEvents(leagueId:String, complition:@escaping (FootballEvents.Welcome?) -> Void)
    func fetchTeamDetails(teamId:String, complition:@escaping (FootballTeamDetails.Welcome?) -> Void)
    func fetchLatestEvents(leagueId: String, complition:@escaping (FootLatestResponse.Welcome?) -> Void)
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
    
    func fetchEvents(leagueId: String, complition:@escaping (FootballEvents.Welcome?) -> Void) {
        let url =  urls.FootballUpcomingEvents(leagueKey: leagueId)
        print("\(url)aaaadasdasdasdassdasdasdasdassdasdasdasdasdas")
        AF.request(url).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(FootballEvents.Welcome.self, from: data)
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
    func fetchLatestEvents(leagueId: String, complition:@escaping (FootLatestResponse.Welcome?) -> Void) {
        let url = urls.FootballLatestEvents(leagueKey: leagueId)
        AF.request(url).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(FootLatestResponse.Welcome.self, from: data)
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
    
    func fetchTeamDetails(teamId: String, complition:@escaping (FootballTeamDetails.Welcome?) -> Void)  {
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

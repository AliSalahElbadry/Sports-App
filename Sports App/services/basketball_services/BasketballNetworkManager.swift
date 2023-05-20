//
//  BasketballNetworkManager.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation
import Alamofire
protocol PBasketballNetworkManager{
    func fetchLeagues(complition:@escaping (BasketLeaguesWelcome?) -> Void)
    func fetchEvents(leagueId:String, complition:@escaping (BasketballEvents.Welcome?) -> Void)
    func fetchTeamDetails(teamId:String, complition:@escaping (BasketballTeamDetails.Welcome?) -> Void)
    func fetchLatestEvents(leagueId: String, complition:@escaping (BasketballEvents.Welcome?) -> Void)
}
class BasketballNetworkManager : PBasketballNetworkManager{
    
    let urls:URLs
    init(){
        urls=URLs()
    }
    func fetchLeagues(complition: @escaping (BasketLeaguesWelcome?) -> Void) {
        AF.request(urls.BasketballLeagues()).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(BasketLeaguesWelcome.self, from: data)
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
    
    func fetchEvents(leagueId: String, complition:@escaping (BasketballEvents.Welcome?) -> Void) {
        let url  =  urls.BasketballUpcomingEvents(leagueKey: leagueId)
            
        AF.request(url ).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(BasketballEvents.Welcome.self, from: data)
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
    func fetchLatestEvents(leagueId: String, complition:@escaping (BasketballEvents.Welcome?) -> Void) {
        let url = urls.BasketballLatestEvents(leagueKey: leagueId)
            
        
        AF.request(url).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(BasketballEvents.Welcome.self, from: data)
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
    func fetchTeamDetails(teamId: String, complition:@escaping (BasketballTeamDetails.Welcome?) -> Void)  {
        AF.request(urls.BasketballTeamDetails(teamKey: teamId)).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(BasketballTeamDetails.Welcome.self, from: data)
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

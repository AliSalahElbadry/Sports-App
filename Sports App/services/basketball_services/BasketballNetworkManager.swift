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
    func fetchPlayerDetails(teamId:String, complition:@escaping (BasketballTeamDetails.Welcome?) -> Void)
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
        AF.request(urls.BasketballUpcomingEvents(leagueKey: leagueId)).response
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
    
    func fetchPlayerDetails(teamId: String, complition:@escaping (BasketballTeamDetails.Welcome?) -> Void)  {
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

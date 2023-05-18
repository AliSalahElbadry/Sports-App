//
//  CricketNetworkManager.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation
import Alamofire
protocol PCricketNetworkManager{
    func fetchLeagues(complition:@escaping (CricketLeaguesWelcome?) -> Void)
    func fetchEvents(leagueId:String, complition:@escaping (CricketEvents.Welcome?) -> Void)
    func fetchPlayerDetails(teamId:String, complition:@escaping (CricketTeamDetails.Welcome?) -> Void)
}
class CricketNetworkManager : PCricketNetworkManager{
    
    let urls:URLs
    init(){
        urls=URLs()
    }
    func fetchLeagues(complition: @escaping (CricketLeaguesWelcome?) -> Void) {
        AF.request(urls.CricketLeagues()).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CricketLeaguesWelcome.self, from: data)
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
    
    func fetchEvents(leagueId: String, complition:@escaping (CricketEvents.Welcome?) -> Void) {
        AF.request(urls.CricketUpcomingEvents(leagueKey: leagueId)).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CricketEvents.Welcome.self, from: data)
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
    
    func fetchPlayerDetails(teamId: String, complition:@escaping (CricketTeamDetails.Welcome?) -> Void)  {
        AF.request(urls.CricketTeamDetails(teamKey: teamId)).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CricketTeamDetails.Welcome.self, from: data)
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

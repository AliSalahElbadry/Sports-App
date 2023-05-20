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
    func fetchTeamDetails(teamId:String, complition:@escaping (CricketTeamDetails.Welcome?) -> Void)
    func fetchLatestEvents(leagueId: String, complition:@escaping (CricketLatestResponse.Welcome?) -> Void)
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
        let url  =  urls.CricketUpcomingEvents(leagueKey: leagueId)
        
        AF.request(url ).response
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
    func fetchLatestEvents(leagueId: String, complition:@escaping (CricketLatestResponse.Welcome?) -> Void) {
        let url = urls.CricketLatestEvents(leagueKey: leagueId)
            
        
        AF.request(url ).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(CricketLatestResponse.Welcome.self, from: data)
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
    func fetchTeamDetails(teamId: String, complition:@escaping (CricketTeamDetails.Welcome?) -> Void)  {
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

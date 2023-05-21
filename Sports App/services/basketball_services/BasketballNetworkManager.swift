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
    func fetchEvents(mode:Int,leagueId:String, complition:@escaping (BasketballEvents.Welcome?) -> Void)
    func fetchTeamDetails(teamId:String, complition:@escaping (BasketballTeamDetails.Welcome?) -> Void)
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
    
    func fetchEvents(mode:Int,leagueId: String, complition:@escaping (BasketballEvents.Welcome?) -> Void) {
       
        var url:String?
        
        if(mode==0){
            url =  urls.BasketballUpcomingEvents(leagueKey: leagueId)
        }else if(mode == 1)
        {
            url = urls.BasketballLatestEvents(leagueKey: leagueId)
        }
        AF.request(url! ,method: .get).response
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

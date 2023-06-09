//
//  TennisNetworkManager.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//
import Foundation
import Alamofire
protocol PTennisNetworkManager{
    func fetchLeagues(complition:@escaping (TennisLeaguesWelcome?) -> Void)
    func fetchEvents(mode:Int,leagueId:String, complition:@escaping (TennisEvents.Welcome?) -> Void)
    func fetchPlayerDetails(playerId:String, complition:@escaping (TennisPlayerDetails.Welcome?) -> Void)
}
class TennisNetworkManager : PTennisNetworkManager{
    
    let urls:URLs
    init(){
        urls=URLs()
    }
    func fetchLeagues(complition: @escaping (TennisLeaguesWelcome?) -> Void) {
        AF.request(urls.TennisLeagues()).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(TennisLeaguesWelcome.self, from: data)
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
    
    func fetchEvents(mode:Int,leagueId: String, complition:@escaping (TennisEvents.Welcome?) -> Void) {
        var url:String?
        if(mode==0){
            url  =  urls.TennisUpcomingEvents(leagueKey: leagueId)
        }else if(mode==1)
        {
            url  = urls.TennisLatestEvents(leagueKey: leagueId)
        }
        AF.request(url!,method: .get ).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(TennisEvents.Welcome.self, from: data)
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
    func fetchPlayerDetails(playerId: String, complition:@escaping (TennisPlayerDetails.Welcome?) -> Void)  {
        AF.request(urls.TennisPlayerDetails(playerKey: playerId)).response
        { response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(TennisPlayerDetails.Welcome.self, from: data)
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

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
    func fetchEvents(mode:Int,leagueId:String, complition:@escaping (FootballEvents.Welcome?) -> Void)
    func fetchTeamDetails(teamId:String, complition:@escaping (FootballTeamDetails.Welcome?) -> Void)
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
   
    func fetchEvents(mode:Int ,leagueId: String, complition:@escaping (FootballEvents.Welcome?) -> Void) {
        var url:String?
        if(mode==0){
            url =  urls.FootballUpcomingEvents(leagueKey: leagueId)
        }
        else if(mode==1)
        {
            url = urls.FootballLatestEvents(leagueKey: leagueId)
        }
        AF.request(url!,method: .get).response
        { response in
            
            switch response.result {
            case .success(let data):
                do{
                    let result = try JSONDecoder().decode(FootballEvents.Welcome.self, from: data!)
                    DispatchQueue.main.async {
                        
                        complition(result)
                    }
                }
                catch {
                    complition(nil)
                }
            case .failure(let error) :
                print(error.localizedDescription)
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

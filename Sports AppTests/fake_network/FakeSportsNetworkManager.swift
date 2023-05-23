//
//  FakeSportsNetworkManager.swift
//  Sports AppTests
//
//  Created by Mac on 23/05/2023.
//

import Foundation
@testable import Sports_App
class FakeSportsNetworkManager{
    
    let shouldReturnError : Bool
    let managerType:Int
    init(shouldReturnError: Bool, managerType: Int) {
        self.shouldReturnError = shouldReturnError
        self.managerType = managerType
    }
    // fake response data
    
    func fetchLeagues(complitionHandler:(Any?)->Void){
        if(shouldReturnError == false){
         let responses=FakeResponses()
            if(managerType == 0)
            {
                let data = responses.footballLeaguesResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(FootballLeaguesWelcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 1)
            {
                let data = responses.basketLeaguesResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(BasketLeaguesWelcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 2)
            {
                let data = responses.cricketLeaguesResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(CricketLeaguesWelcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 4){
                let data = responses.tennisLeaguesRsepnse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(TennisLeaguesWelcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }
        }else{
            complitionHandler(nil)
        }
    }
    func fetchEvents(complitionHandler:(Any?)->Void){
        if(shouldReturnError == false){
         let responses=FakeResponses()
            if(managerType == 0)
            {
                let data = responses.footballEventResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(FootballEvents.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 1)
            {
                let data = responses.basketEventResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(BasketballEvents.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 2)
            {
                let data = responses.cricketEventResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(CricketEvents.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 4){
                let data = responses.tennisEventsResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(TennisEvents.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }
        }else{
            complitionHandler(nil)
        }
    }
    func fetchTeams(complitionHandler:(Any?)->Void){
        if(shouldReturnError == false){
         let responses=FakeResponses()
            if(managerType == 0)
            {
                let data = responses.footballTeamResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(FootballTeamDetails.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 1)
            {
                let data = responses.basketTeamResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(BasketballTeamDetails.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 2)
            {
                let data = responses.cricketTeamResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(CricketTeamDetails.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }else if (managerType == 4){
                let data = responses.tennisPlayerResponse.data(using: String.Encoding.utf8)!
                do{
                    let result = try JSONDecoder().decode(TennisPlayerDetails.Welcome.self, from: data)
                    complitionHandler(result as Any)
                }catch {
                    complitionHandler(nil)
                }
            }
        }else{
            complitionHandler(nil)
        }
    }
}

//
//  File.swift
//  Sports App
//
//  Created by Mac on 19/05/2023.
//

import Foundation
struct TeamDetailsViewModelDependancyFactory{
    static func footnetworkManager()->PFootballNetworkManager{
            return FootballNetworkManager()
    }
    static func basketnetworkManager()->PBasketballNetworkManager{
            return BasketballNetworkManager()
    }
    static func tennisnetworkManager()->PTennisNetworkManager{
            return TennisNetworkManager()
    }
    static func cricketnetworkManager()->PCricketNetworkManager{
            return CricketNetworkManager()
    }
    static func viewModel(sportName:String,pTeamDetailsViewController:PTeamDetailsViewController,teamId:String)->TeamDetailsViewModel{
        var footNetworkManager:FootballNetworkManager?
        var basketNetworkManager:BasketballNetworkManager?
        var cricketNetworkManager:CricketNetworkManager?
        var tennisNetworkManager:TennisNetworkManager?
        if(sportName == "football"){
            footNetworkManager = self.footnetworkManager() as? FootballNetworkManager
        }else if( sportName == "basketball"){
            basketNetworkManager = self.basketnetworkManager() as? BasketballNetworkManager
        }else if(sportName == "cricket"){
            cricketNetworkManager = self.cricketnetworkManager() as? CricketNetworkManager
        }else if (sportName == "tennis"){
            tennisNetworkManager = self.tennisnetworkManager() as? TennisNetworkManager
        }
        return TeamDetailsViewModel(footNetworkManager: footNetworkManager, basketNetworkManager: basketNetworkManager, cricketNetworkManager: cricketNetworkManager, tennisNetworkManager: tennisNetworkManager,pTeamController:pTeamDetailsViewController,sportName: sportName,teamId: teamId)
        
    }
    
}

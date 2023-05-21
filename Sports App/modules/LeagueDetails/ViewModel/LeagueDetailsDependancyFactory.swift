//
//  LeagueDetailsDependancyFactory.swift
//  Sports App
//
//  Created by Mac on 19/05/2023.
//

import Foundation
struct LeagueDetailsDependancyFactory{
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
    static func viewModel(league:League)->LeaugeDetailsViewModel{
        
        var footNetworkManager:FootballNetworkManager?
        var basketNetworkManager:BasketballNetworkManager?
        var cricketNetworkManager:CricketNetworkManager?
        var tennisNetworkManager:TennisNetworkManager?
        if(league.sport == "football"){
            footNetworkManager = self.footnetworkManager() as? FootballNetworkManager
        }else if( league.sport == "basketball"){
            basketNetworkManager = self.basketnetworkManager() as? BasketballNetworkManager
        }else if(league.sport == "cricket"){
            cricketNetworkManager = self.cricketnetworkManager() as? CricketNetworkManager
        }else if (league.sport == "tennis"){
            tennisNetworkManager = self.tennisnetworkManager() as? TennisNetworkManager
        }
        return LeaugeDetailsViewModel(footNetworkManager:footNetworkManager , basketNetworkManager: basketNetworkManager, cricketNetworkManager:cricketNetworkManager, tennisNetworkManager:tennisNetworkManager, league: league, dbManager: self.dbManager())
    }
    static func dbManager()->PDBManager{
        return DBManager()
    }
    
}

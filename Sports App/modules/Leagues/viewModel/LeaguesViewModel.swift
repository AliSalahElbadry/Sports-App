//
//  LeaguesViewModel.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

class LeaguesViewModel{
    var leagues:Array<League>?
   private var footNetworkManager:PFootballNetworkManager?
   private var basketNetworkManager:PBasketballNetworkManager?
   private var cricketNetworkManager:PCricketNetworkManager?
   private var tennisNetworkManager:PTennisNetworkManager?
     var sportName:String
    var showLeagues:()->()={}
    init( footNetworkManager: PFootballNetworkManager? = nil, basketNetworkManager: PBasketballNetworkManager? = nil, cricketNetworkManager: PCricketNetworkManager? = nil, tennisNetworkManager: PTennisNetworkManager? = nil, sportName: String) {
        self.leagues = []
        self.footNetworkManager = footNetworkManager
        self.basketNetworkManager = basketNetworkManager
        self.cricketNetworkManager = cricketNetworkManager
        self.tennisNetworkManager = tennisNetworkManager
        self.sportName = sportName
    }
    func getLeagues(){
        leagues = []
        if(sportName == Constants.football){
            footNetworkManager?.fetchLeagues(complition: { it in
                self.map_football_to_leages(res: it )
            })
        }else if( sportName == Constants.basketball){
            basketNetworkManager?.fetchLeagues(complition: { it in
                self.map_basket_to_leages(res: it)
            })
        }else if(sportName == Constants.cricket){
            cricketNetworkManager?.fetchLeagues(complition: { it in
                self.map_cricket_to_leages(res: it)
            })
        }else if (sportName == Constants.tennis){
            tennisNetworkManager?.fetchLeagues(complition: { it in
               self.map_tennis_to_leages(res: it ?? nil)
            })
        }
        
    }
    private func map_football_to_leages(res:FootballLeaguesWelcome?)
    {
        var arr : Array<League> = []
        res?.result.forEach({it in
            let l:League=League()
            l.id = String(it.leagueKey)
            l.name = it.leagueName
            l.image = it.leagueLogo
            l.sport = Constants.football
            l.url = it.leagueName
            arr.append(l)
        })
        self.leagues = arr
        showLeagues()
    }
    private func map_basket_to_leages(res:BasketLeaguesWelcome?)
    {
        var arr : Array<League> = []
        res?.result.forEach({it in
            let l:League=League()
            l.id = String(it.leagueKey)
            l.name = it.leagueName
            l.image = "https://img.freepik.com/premium-vector/vector-basketball-league-logo-with-ball-sport-badge-tournament-championship-league_175838-2917.jpg"
            l.sport = Constants.basketball
            l.url = it.leagueName
            arr.append(l)
        })
        self.leagues = arr
        showLeagues()
    }
    private func map_cricket_to_leages(res:CricketLeaguesWelcome?)
    {
        var arr : Array<League> = []
        res?.result.forEach({it in
            let l:League=League()
            l.id = String(it.leagueKey)
            l.name = it.leagueName
            l.image = "https://png.pngtree.com/png-clipart/20230226/ourmid/pngtree-cricket-league-logo-png-image_6619719.png"
            l.sport = Constants.cricket
            l.url = it.leagueName
            arr.append(l)
        })
        self.leagues = arr
       showLeagues()
    }
    private func map_tennis_to_leages(res:TennisLeaguesWelcome?)
    {
        var arr : Array<League> = []
        res?.result.forEach({it in
            let l:League=League()
            l.id = String(it.leagueKey)
            l.name = it.leagueName
            l.image = "https://i0.wp.com/indiantennisdaily.com/wp-content/uploads/2022/11/301967932_509211634540389_3621829506550752633_n.jpg"
            l.sport = Constants.tennis
            l.url = it.leagueName
            arr.append(l)
        })
        self.leagues = arr
        showLeagues()
    }
    
}

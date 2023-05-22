//
//  LeaugeDetailsViewModel.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

struct Events{
    var footUpComingEvents:[FootballEvents.Result]?
    var basketUpcomingEvents:[BasketballEvents.Result]?
    var cricketUpcomingEvents:[CricketEvents.Result]?
    var tennisUpcomingEvents:[TennisEvents.Result]?
    
    var footLatestEvents:[FootballEvents.Result]?
    var basketLatestEvents:[BasketballEvents.Result]?
    var cricketLatestEvents:[CricketEvents.Result]?
    var tennisLatestEvents:[TennisEvents.Result]?
}
struct Team:Hashable{
    var name:String?
    var image:String?
    var teamKey:Int?
}

class LeaugeDetailsViewModel{
    var teams:Array<Team>?
    var events:Events?
    var refrishUserInterface :()->()={}
    var isItFavorite :(Bool)->() = {_ in }
    private var footNetworkManager:PFootballNetworkManager?
    private var basketNetworkManager:PBasketballNetworkManager?
    private var cricketNetworkManager:PCricketNetworkManager?
    private var tennisNetworkManager:PTennisNetworkManager?
            var league:League
    private var dbManager:PDBManager?
    init(footNetworkManager: PFootballNetworkManager? = nil, basketNetworkManager: PBasketballNetworkManager? = nil, cricketNetworkManager: PCricketNetworkManager? = nil, tennisNetworkManager: PTennisNetworkManager? = nil, league: League, dbManager: PDBManager? = nil) {
        self.footNetworkManager = footNetworkManager
        self.basketNetworkManager = basketNetworkManager
        self.cricketNetworkManager = cricketNetworkManager
        self.tennisNetworkManager = tennisNetworkManager
        self.league = league
        self.dbManager = dbManager
        teams = []
        events = Events()
    }
    
    func prepareLeageDetails(){
       fetchUpcomingEvents()
    }
    private func fetchUpcomingEvents(){
        if(league.sport == "football"){
            events?.footUpComingEvents = []
            footNetworkManager?.fetchEvents( mode: 0,leagueId: league.id!, complition: { it in
                self.events?.footUpComingEvents = it?.result
               
                self.fetchLatestEvents()
            })
        }else if( league.sport == "basketball"){
            events?.basketUpcomingEvents = []
            basketNetworkManager?.fetchEvents(mode: 0, leagueId: league.id!, complition: { it in
                self.events?.basketUpcomingEvents = it?.result
                self.fetchLatestEvents()
            })
        }else if(league.sport == "cricket"){
            events?.cricketUpcomingEvents = []
            cricketNetworkManager?.fetchEvents(mode: 0,leagueId: league.id!, complition: { it in
                self.events?.cricketUpcomingEvents = it?.result
                self.fetchLatestEvents()
            })
        }else if (league.sport == "tennis"){
            events?.tennisUpcomingEvents = []
            tennisNetworkManager?.fetchEvents(mode: 0, leagueId: league.id!, complition: { it in
                self.events?.tennisUpcomingEvents = it?.result
                self.fetchLatestEvents()
            })
        }
    }
    private func fetchLatestEvents(){
        if(league.sport == "football"){
            events?.footLatestEvents = []
            footNetworkManager?.fetchEvents(mode:1, leagueId: league.id!, complition: { it in
                self.events?.footLatestEvents = it?.result
                self.prepareTeams()
            })
        }else if( league.sport == "basketball"){
            events?.basketLatestEvents = []
            basketNetworkManager?.fetchEvents(mode:1,leagueId: league.id!, complition: { it in
                self.events?.basketLatestEvents = it?.result
                self.prepareTeams()
            })
        }else if(league.sport == "cricket"){
            events?.cricketLatestEvents = []
            cricketNetworkManager?.fetchEvents(mode:1,leagueId: league.id!, complition: { it in
                self.events?.cricketLatestEvents = it?.result
                self.prepareTeams()
            })
        }else if (league.sport == "tennis"){
            events?.tennisLatestEvents = []
            tennisNetworkManager?.fetchEvents(mode:1,leagueId: league.id!, complition: { it in
                self.events?.tennisLatestEvents = it?.result
                self.prepareTeams()
            })
        }
    }
    private func prepareTeams(){
        
        if(league.sport == "football"){
            var footTeams = Set<Team>()
            events?.footUpComingEvents?.forEach({it in
                footTeams.insert(Team(name: it.eventAwayTeam,image: it.awayTeamLogo,teamKey: it.awayTeamKey))
                footTeams.insert(Team(name: it.eventHomeTeam,image: it.homeTeamLogo,teamKey: it.homeTeamKey))
            })
            events?.footLatestEvents?.forEach({it in
                footTeams.insert(Team(name: it.eventAwayTeam,image: it.awayTeamLogo,teamKey:it.awayTeamKey))
                footTeams.insert(Team(name: it.eventHomeTeam,image: it.homeTeamLogo,teamKey:it.homeTeamKey))
            })
            teams = Array(footTeams)
        }else if( league.sport == "basketball"){
            var basketTeams = Set<Team>()
            events?.basketUpcomingEvents?.forEach({it in
                basketTeams.insert(Team(name: it.eventAwayTeam,image: it.eventAwayTeamLogo,teamKey: it.awayTeamKey))
                basketTeams.insert(Team(name: it.eventHomeTeam,image: it.eventHomeTeamLogo,teamKey: it.homeTeamKey))
            })
            events?.basketLatestEvents?.forEach({it in
                basketTeams.insert(Team(name: it.eventAwayTeam,image: it.eventAwayTeamLogo,teamKey: it.awayTeamKey))
                basketTeams.insert(Team(name: it.eventHomeTeam,image: it.eventHomeTeamLogo,teamKey: it.homeTeamKey))
            })
            teams  = Array(basketTeams)
        }else if(league.sport == "cricket"){
            var cricketTeams = Set<Team>()
            events?.cricketUpcomingEvents?.forEach({it in
                cricketTeams.insert(Team(name: it.eventAwayTeam, image: it.eventAwayTeamLogo,teamKey: it.awayTeamKey))
                cricketTeams.insert(Team(name: it.eventHomeTeam,image: it.eventHomeTeamLogo, teamKey: it.homeTeamKey))
            })
            events?.cricketLatestEvents?.forEach({it in
                cricketTeams.insert(Team(name: it.eventAwayTeam,image: it.eventAwayTeamLogo, teamKey: it.awayTeamKey))
                cricketTeams.insert(Team(name: it.eventHomeTeam,image: it.eventHomeTeamLogo, teamKey: it.homeTeamKey))
            })
            teams = Array(cricketTeams)
        }else if (league.sport == "tennis"){
            var tennisTeams = Set<Team>()
            events?.tennisUpcomingEvents?.forEach({it in
                tennisTeams.insert(Team(name: it.eventFirstPlayer,image: it.eventFirstPlayerLogo, teamKey: it.firstPlayerKey))
                tennisTeams.insert(Team(name: it.eventSecondPlayer,image: it.eventSecondPlayerLogo, teamKey: it.secondPlayerKey))
            })
            events?.tennisLatestEvents?.forEach({it in
                tennisTeams.insert(Team(name: it.eventFirstPlayer,image: it.eventFirstPlayerLogo, teamKey: it.firstPlayerKey))
                tennisTeams.insert(Team(name: it.eventSecondPlayer,image: it.eventSecondPlayerLogo, teamKey: it.secondPlayerKey))
            })
            teams  = Array(tennisTeams)
        }
        refrishUserInterface()
    }
    func addToFavorite(){
        self.dbManager?.saveNewFavorite(league: self.league)
    }
    func removeFromFavorite(){
        dbManager?.deleteFavorite(leagueId: league.id!, sportName: league.sport!)
    }
    func isFavorite(){
        
       isItFavorite(dbManager?.isFavorite(leagueId: league.id!, sportName: league.sport!) ?? false)
    }
}

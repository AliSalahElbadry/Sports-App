//
//  LeaugeDetailsViewModel.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

struct Events{
    var footUpComingEvents:[FootballEvents.EventsResult]?
    var basketUpcomingEvents:[BasketballEvents.Result]?
    var cricketUpcomingEvents:[CricketEvents.Result]?
    var tennisUpcomingEvents:[TennisEvents.Result]?
    
    var footLatestEvents:[FootballEvents.EventsResult]?
    var basketLatestEvents:[BasketballEvents.Result]?
    var cricketLatestEvents:[CricketEvents.Result]?
    var tennisLatestEvents:[TennisEvents.Result]?
}
struct Team:Hashable{
    var name:String?
    var image:String?
    var teamKey:Int?
}
struct CricketTeam:Hashable{
    var name:String?
    var key:Int?
    var image:CricketEvents.JSONNull?
}
struct TennisTeam:Hashable{
    var name:String?
    var key:Int?
    var image:TennisEvents.JSONNull?
}
struct Teams{
    var footTeams:Set<Team>?
    var basketTeams:Set<Team>?
    var cricketTeams:Set<CricketTeam>?
    var tennisTeams:Set<TennisTeam>?
}
class LeaugeDetailsViewModel{
    var teams:Teams?
    var events:Events?
    private var footNetworkManager:PFootballNetworkManager?
    private var basketNetworkManager:PBasketballNetworkManager?
    private var cricketNetworkManager:PCricketNetworkManager?
    private var tennisNetworkManager:PTennisNetworkManager?
    private let league:League
    private var dbManager:PDBManager?
    private let leagueDetailsViewController:PLeagueDetailsViewController
    init(footNetworkManager: PFootballNetworkManager? = nil, basketNetworkManager: PBasketballNetworkManager? = nil, cricketNetworkManager: PCricketNetworkManager? = nil, tennisNetworkManager: PTennisNetworkManager? = nil, league: League, dbManager: PDBManager? = nil, leagueDetailsViewController: PLeagueDetailsViewController) {
        self.footNetworkManager = footNetworkManager
        self.basketNetworkManager = basketNetworkManager
        self.cricketNetworkManager = cricketNetworkManager
        self.tennisNetworkManager = tennisNetworkManager
        self.league = league
        self.dbManager = dbManager
        self.leagueDetailsViewController = leagueDetailsViewController
        teams = Teams()
        events = Events()
    }
    
    func prepareLeageDetails(){
     fetchUpcomingEvents()
    }
    private func fetchUpcomingEvents(){
        if(league.sport == "football"){
            events?.footUpComingEvents = []
            footNetworkManager?.fetchEvents(mode: 0, leagueId: league.id!, complition: { it in
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
            cricketNetworkManager?.fetchEvents(mode: 0, leagueId: league.id!, complition: { it in
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
            footNetworkManager?.fetchEvents(mode: 1, leagueId: league.id!, complition: { it in
                self.events?.footLatestEvents = it?.result
                self.prepareTeams()
            })
        }else if( league.sport == "basketball"){
            events?.basketLatestEvents = []
            basketNetworkManager?.fetchEvents(mode: 1, leagueId: league.id!, complition: { it in
                self.events?.basketLatestEvents = it?.result
                self.prepareTeams()
            })
        }else if(league.sport == "cricket"){
            events?.cricketLatestEvents = []
            cricketNetworkManager?.fetchEvents(mode: 1, leagueId: league.id!, complition: { it in
                self.events?.cricketLatestEvents = it?.result
                self.prepareTeams()
            })
        }else if (league.sport == "tennis"){
            events?.tennisLatestEvents = []
            tennisNetworkManager?.fetchEvents(mode: 1, leagueId: league.id!, complition: { it in
                self.events?.tennisLatestEvents = it?.result
                self.prepareTeams()
            })
        }
    }
    private func prepareTeams(){
        
        if(league.sport == "football"){
            teams?.footTeams = []
            events?.footUpComingEvents?.forEach({it in
                teams?.footTeams?.insert(Team(name: it.eventAwayTeam,image: it.awayTeamLogo,teamKey: it.awayTeamKey))
                teams?.footTeams?.insert(Team(name: it.eventHomeTeam,image: it.homeTeamLogo,teamKey: it.homeTeamKey))
            })
            events?.footLatestEvents?.forEach({it in
                teams?.footTeams?.insert(Team(name: it.eventAwayTeam,image: it.awayTeamLogo,teamKey:it.awayTeamKey))
                teams?.footTeams?.insert(Team(name: it.eventHomeTeam,image: it.homeTeamLogo,teamKey:it.homeTeamKey))
            })
        }else if( league.sport == "basketball"){
            teams?.basketTeams = []
            events?.basketUpcomingEvents?.forEach({it in
                teams?.basketTeams?.insert(Team(name: it.eventAwayTeam,image: it.eventAwayTeamLogo,teamKey: it.awayTeamKey))
                teams?.basketTeams?.insert(Team(name: it.eventHomeTeam,image: it.eventHomeTeamLogo,teamKey: it.homeTeamKey))
            })
            events?.basketLatestEvents?.forEach({it in
                teams?.basketTeams?.insert(Team(name: it.eventAwayTeam,image: it.eventAwayTeamLogo,teamKey: it.awayTeamKey))
                teams?.basketTeams?.insert(Team(name: it.eventHomeTeam,image: it.eventHomeTeamLogo,teamKey: it.homeTeamKey))
            })
        }else if(league.sport == "cricket"){
            teams?.cricketTeams = []
            events?.cricketUpcomingEvents?.forEach({it in
                teams?.cricketTeams?.insert(CricketTeam(name: it.eventAwayTeam,key: it.awayTeamKey, image: it.eventAwayTeamLogo))
                teams?.cricketTeams?.insert(CricketTeam(name: it.eventHomeTeam,key: it.homeTeamKey,image: it.eventHomeTeamLogo))
            })
            events?.cricketLatestEvents?.forEach({it in
                teams?.cricketTeams?.insert(CricketTeam(name: it.eventAwayTeam,key: it.awayTeamKey,image: it.eventAwayTeamLogo))
                teams?.cricketTeams?.insert(CricketTeam(name: it.eventHomeTeam,key: it.homeTeamKey,image: it.eventHomeTeamLogo))
            })
        }else if (league.sport == "tennis"){
            teams?.tennisTeams = []
            events?.tennisUpcomingEvents?.forEach({it in
                teams?.tennisTeams?.insert(TennisTeam(name: it.eventFirstPlayer,key: it.firstPlayerKey, image: it.eventFirstPlayerLogo))
                teams?.tennisTeams?.insert(TennisTeam(name: it.eventSecondPlayer,key: it.secondPlayerKey, image: it.eventSecondPlayerLogo))
            })
            events?.tennisLatestEvents?.forEach({it in
                teams?.tennisTeams?.insert(TennisTeam(name: it.eventFirstPlayer,key: it.firstPlayerKey,image: it.eventFirstPlayerLogo))
                teams?.tennisTeams?.insert(TennisTeam(name: it.eventSecondPlayer,key: it.secondPlayerKey,image: it.eventSecondPlayerLogo))
            })
        }
        leagueDetailsViewController.refrishUserInterface()
    }
    func addToFavorite(){
        dbManager?.saveNewFavorite(league: league)
    }
    func removeFromFavorite(){
        dbManager?.deleteFavorite(leagueId: league.id!, sportName: league.sport!)
    }
    func isFavorite()->Bool{
        return dbManager?.isFavorite(leagueId: league.id!, sportName: league.sport!) ?? false
    }
}

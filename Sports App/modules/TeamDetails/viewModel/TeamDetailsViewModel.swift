//
//  TeamDetailsViewModel.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

class TeamDetailsViewModel{
    
    var refrishTeamDetails : ()->()={}
    private var footNetworkManager:FootballNetworkManager?
    private var basketNetworkManager:BasketballNetworkManager?
    private var cricketNetworkManager:CricketNetworkManager?
    private var tennisNetworkManager:TennisNetworkManager?
    var footTeam:FootballTeamDetails.Result?
    var basketTeam:BasketballTeamDetails.Result?
    var tennisTeam:TennisPlayerDetails.Result?
    var cricketTeam:CricketTeamDetails.Result?
    private let sportName:String
    private let teamId:String
    init(footNetworkManager: FootballNetworkManager? = nil, basketNetworkManager: BasketballNetworkManager? = nil, cricketNetworkManager: CricketNetworkManager? = nil, tennisNetworkManager: TennisNetworkManager? = nil,sportName:String,teamId:String) {
        self.footNetworkManager = footNetworkManager
        self.basketNetworkManager = basketNetworkManager
        self.cricketNetworkManager = cricketNetworkManager
        self.tennisNetworkManager = tennisNetworkManager
        self.sportName = sportName
        self.teamId = teamId
    }
    func fetchTeam(){
        if(sportName == "football"){
            footNetworkManager?.fetchTeamDetails(teamId: teamId, complition: { it in
                self.footTeam = FootballTeamDetails.Result()
                self.footTeam = it?.result?[0]
                self.refrishTeamDetails()
            })
        }else if( sportName == "basketball"){
            basketNetworkManager?.fetchTeamDetails(teamId: teamId, complition: { it in
                self.basketTeam = BasketballTeamDetails.Result()
                self.basketTeam = it?.result?[0]
                self.refrishTeamDetails()
            })
        }else if(sportName == "cricket"){
            cricketNetworkManager?.fetchTeamDetails(teamId: teamId, complition: { it in
                self.cricketTeam = CricketTeamDetails.Result()
                self.cricketTeam = it?.result?[0]
                self.refrishTeamDetails()
            })
        }else if (sportName == "tennis"){
            tennisNetworkManager?.fetchPlayerDetails(playerId: teamId, complition: { it in
                self.tennisTeam = TennisPlayerDetails.Result()
                self.tennisTeam = it?.result?[0]
                self.refrishTeamDetails()
            })
        }
    }
    
}

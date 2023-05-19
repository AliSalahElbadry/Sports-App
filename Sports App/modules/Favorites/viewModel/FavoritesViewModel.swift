//
//  FavoritesViewModel.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

class FavoritesViewModel{
    var favorites : Array<FavoriteLeagues>?
    let dbManager:PDBManager
    let favoritesLeaguesProtocol :FavoritesLeaguesProtocol
    init(dbManager: PDBManager, favoritesLeaguesProtocol:FavoritesLeaguesProtocol) {
        self.dbManager = dbManager
        self.favoritesLeaguesProtocol = favoritesLeaguesProtocol
        favorites = []
    }
    func saveNewFavorite(league: FavoriteLeagues) {
        favorites?.append(league)
        dbManager.saveNewFavorite(league: league)
        favoritesLeaguesProtocol.showFavorites()
    }
    
    func deleteFavorite(leagueId:Int) {
        dbManager.deleteFavorite(leagueId: self.favorites?[leagueId].id ?? "", sportName: self.favorites?[leagueId].sport ?? "")
        self.favorites?.remove(at: leagueId)
        favoritesLeaguesProtocol.showFavorites()
    }
    func getAllFavoriteLeagues() {
        self.favorites = []
        let allFav = dbManager.getAllFavoriteLeagues()
        allFav?.forEach({it in
            let favorite = FavoriteLeagues()
            favorite.id = it.value(forKey: "id") as? String
            favorite.name = it.value(forKey: "name") as? String
            favorite.image = it.value(forKey: "image") as? String
            favorite.sport = it.value(forKey: "sport") as? String
            favorite.url = it.value(forKey: "url") as? String
            self.favorites?.append(favorite)
        })
        favoritesLeaguesProtocol.showFavorites()
    }
}

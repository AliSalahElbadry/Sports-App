//
//  FavoritesViewModel.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

class FavoritesViewModel{
    var favorites : Array<League>?
    var showFavorites : ()->()={}
    let dbManager:PDBManager
    init(dbManager: PDBManager) {
        self.dbManager = dbManager
        favorites = []
    }
    func saveNewFavorite(league: League) {
        favorites?.append(league)
        dbManager.saveNewFavorite(league: league)
        showFavorites()
    }
    
    func deleteFavorite(leagueId:Int) {
        dbManager.deleteFavorite(leagueId: self.favorites?[leagueId].id ?? "", sportName: self.favorites?[leagueId].sport ?? "")
        self.favorites?.remove(at: leagueId)
       showFavorites()
    }
    func getAllFavoriteLeagues() {
        self.favorites = []
        let allFav = dbManager.getAllFavoriteLeagues()
        allFav?.forEach({it in
            let favorite = League()
            favorite.id = it.value(forKey: "id") as? String
            favorite.name = it.value(forKey: "name") as? String
            favorite.image = it.value(forKey: "image") as? String
            favorite.sport = it.value(forKey: "sport") as? String
            favorite.url = it.value(forKey: "url") as? String
            self.favorites?.append(favorite)
        })
        showFavorites()
    }
}

//
//  FavoriteDependancyFactory.swift
//  Sports App
//
//  Created by Mac on 19/05/2023.
//

import Foundation

struct FavoriteDependancyFactory{
    
    static func dbManager()->PDBManager{
        return DBManager()
    }
    static func viewModel(favoriteLeagueProtocol:FavoritesLeaguesProtocol)->FavoritesViewModel{
        return FavoritesViewModel(dbManager: self.dbManager(), favoritesLeaguesProtocol: favoriteLeagueProtocol)
    }
}

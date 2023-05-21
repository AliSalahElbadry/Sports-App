//
//  CricketLeagues.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation

// MARK: - Welcome
struct CricketLeaguesWelcome: Codable {
    let success: Int
    let result: [CricketLeaguesResult]
}

// MARK: - Result
struct CricketLeaguesResult: Codable {
    let leagueKey: Int
    let leagueName, leagueYear: String

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case leagueYear = "league_year"
    }
}


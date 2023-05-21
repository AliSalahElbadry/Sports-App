//
//  TennisLeaguesResponse.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation



struct TennisLeaguesWelcome: Codable {
    let success: Int
    let result: [TennisLeaguesResult]
}

// MARK: - Result
struct TennisLeaguesResult: Codable {
        let leagueKey: Int
        let leagueName: String
        let countryKey: Int
        let countryName: String
        enum CodingKeys: String, CodingKey {
            case leagueKey = "league_key"
            case leagueName = "league_name"
            case countryKey = "country_key"
            case countryName = "country_name"
        }
}

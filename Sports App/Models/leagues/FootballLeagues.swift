//
//  FootballLeagues.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//


// MARK: - Welcome
struct FootballLeaguesWelcome: Codable {
    let success: Int
    let result: [FootballLeaguesResult]
}

// MARK: - Result
struct FootballLeaguesResult: Codable {
    let leagueKey: Int
    let leagueName: String
    let countryKey: Int
    let countryName: String
    let leagueLogo, countryLogo: String

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}

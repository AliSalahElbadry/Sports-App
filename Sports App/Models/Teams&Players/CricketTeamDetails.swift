//
//  CricketTeamDetails.swift
//  Sports App
//
//  Created by Mac on 18/05/2023.
//

import Foundation
class CricketTeamDetails{
    
    // MARK: - Welcome
    struct Welcome: Codable {
        var success: Int?
        var result: [Result]?
    }

    // MARK: - Result
    struct Result: Codable {
        var teamKey: Int?
        var teamName: String?
        var teamLogo: String?

        enum CodingKeys: String, CodingKey {
            case teamKey = "team_key"
            case teamName = "team_name"
            case teamLogo = "team_logo"
        }
    }

   

}

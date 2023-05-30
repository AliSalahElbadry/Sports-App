//
//  LeaguesViewModelTests.swift
//  Sports AppTests
//
//  Created by Mac on 30/05/2023.
//

import XCTest
@testable import Sports_App
final class LeaguesViewModelTests: XCTestCase {
    var fakeFootballNetwork:FakeFootballNetworkManager? = nil
    var fakeBasketNetwork:FakeBasketNetworkManager? = nil
    var fakeCricketNetwork:FakeCricketNetworkManager? = nil
    var fakeTennisNetwork:FakeTennisNetworkManager? = nil
    var leaguesViewModel : LeaguesViewModel? = nil
    
    override func setUpWithError() throws {
        fakeFootballNetwork = FakeFootballNetworkManager(shouldReturnError: false)
        fakeBasketNetwork = FakeBasketNetworkManager(shouldReturnError: false)
        fakeCricketNetwork = FakeCricketNetworkManager(shouldReturnError: false)
        fakeTennisNetwork = FakeTennisNetworkManager(shouldReturnError: false)
      leaguesViewModel = LeaguesViewModel(footNetworkManager: fakeFootballNetwork,basketNetworkManager: fakeBasketNetwork,cricketNetworkManager: fakeCricketNetwork, tennisNetworkManager: fakeTennisNetwork, sportName: Constants.football)
    }
    override func tearDownWithError() throws {
        fakeFootballNetwork = nil
        fakeBasketNetwork = nil
        fakeCricketNetwork = nil
        fakeTennisNetwork = nil
    }
    
    func testgetLeagues_FootballLeagues_AssertEqual(){
        leaguesViewModel?.sportName = Constants.football
        let expectedFirstLeagueActerMapping = League()
        expectedFirstLeagueActerMapping.id = "4"
        expectedFirstLeagueActerMapping.image = "https://apiv2.allsportsapi.com/logo/logo_leagues/"
        expectedFirstLeagueActerMapping.name = "UEFA Europa League"
        expectedFirstLeagueActerMapping.sport = "football"
        expectedFirstLeagueActerMapping.url = "UEFA Europa League"
        leaguesViewModel?.showLeagues = {
            let resultFirstLeage = self.leaguesViewModel?.leagues?[0]
            XCTAssertEqual(expectedFirstLeagueActerMapping.name, resultFirstLeage?.name)
        }
        leaguesViewModel?.getLeagues()
        
    }
    func testgetLeagues_BasketballLeagues_AssertNotEqual(){
        leaguesViewModel?.sportName = Constants.basketball
        
        let expectedFirstLeagueActerMapping = League()
        expectedFirstLeagueActerMapping.id = "962"
        expectedFirstLeagueActerMapping.image = "https://img.freepik.com/premium-vector/vector-basketball-league-logo-with-ball-sport-badge-tournament-championship-league_175838-2917.jpg"
        expectedFirstLeagueActerMapping.name = "1. Liga"
        expectedFirstLeagueActerMapping.sport = "basketball"
        expectedFirstLeagueActerMapping.url = "UEFA Europa League"
        leaguesViewModel?.showLeagues = {
            let resultFirstLeage = self.leaguesViewModel?.leagues?[0]
            XCTAssertNotEqual(expectedFirstLeagueActerMapping.url, resultFirstLeage?.url)
        }
        leaguesViewModel?.getLeagues()
        
    }
    func testgetLeagues_TennisLeagues_AssertTrue(){
        leaguesViewModel?.sportName = Constants.tennis
        
        leaguesViewModel?.showLeagues = {
            let resultCount = self.leaguesViewModel?.leagues?.count
            let excepected = 11
            XCTAssertTrue(excepected==resultCount)
        }
        leaguesViewModel?.getLeagues()
       
    }
    func testgetLeagues_CricketLeagues_Assert(){
        
        fakeCricketNetwork = FakeCricketNetworkManager(shouldReturnError: true)
        leaguesViewModel = LeaguesViewModel(footNetworkManager: fakeFootballNetwork,basketNetworkManager: fakeBasketNetwork,cricketNetworkManager: fakeCricketNetwork, tennisNetworkManager: fakeTennisNetwork, sportName: Constants.cricket)
        
        leaguesViewModel?.showLeagues = {
            XCTAssert(self.leaguesViewModel?.leagues?.count == 0)
        }
        leaguesViewModel?.getLeagues()
    }
    
}

//
//  FootballNetworkManager.swift
//  Sports AppTests
//
//  Created by Mac on 23/05/2023.
//

import XCTest
@testable import Sports_App
final class FootballNetworkManagerTest: XCTestCase {

    var networkMannager:FootballNetworkManager?
    override func setUpWithError() throws {
        networkMannager = FootballNetworkManager()
    }

    override func tearDownWithError() throws {
        networkMannager = nil
    }
    func testFootballLeaguesFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchLeagues{ it in
                XCTAssertNotNil(it)
                myExcipectation.fulfill()
        }
        
        waitForExpectations(timeout:10)
    }
    func testFootballUpcomingEventsFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchEvents(mode: 0, leagueId: "4", complition:{ it in
                XCTAssertNotNil(it)
                myExcipectation.fulfill()
        })
                            
        
        waitForExpectations(timeout:10)
    }
    func testFootballLatestEventsFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchEvents(mode: 1, leagueId: "4", complition:{ it in
            XCTAssertNotNil(it)
            myExcipectation.fulfill()
    })
        
        waitForExpectations(timeout:10)
    }
    func testFootballTeamDetailsFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchTeamDetails(teamId: "704", complition:{ it in
                XCTAssertNotNil(it)
                myExcipectation.fulfill()
        })
        
        waitForExpectations(timeout:10)
    }
}

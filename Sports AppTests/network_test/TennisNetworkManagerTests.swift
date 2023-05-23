//
//  TennisNetworkManagerTests.swift
//  Sports AppTests
//
//  Created by Mac on 23/05/2023.
//

import XCTest
@testable import Sports_App
final class TennisNetworkManagerTests: XCTestCase {

    var networkMannager:TennisNetworkManager?
    override func setUpWithError() throws {
        networkMannager = TennisNetworkManager()
    }

    override func tearDownWithError() throws {
        networkMannager = nil
    }
    func testBasketballLeaguesFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchLeagues{ it in
                XCTAssertNotNil(it)
                myExcipectation.fulfill()
        }
        
        waitForExpectations(timeout:15)
    }
    func testBasketballUpcomingEventsFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchEvents(mode: 0, leagueId: "2833", complition:{ it in
                XCTAssertNotNil(it)
                myExcipectation.fulfill()
        })
                            
        
        waitForExpectations(timeout:10)
    }
    func testBasketballLatestEventsFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchEvents(mode: 1, leagueId: "2833", complition:{ it in
            XCTAssertNotNil(it)
            myExcipectation.fulfill()
    })
        
        waitForExpectations(timeout:15)
    }
    func testBasketballTeamDetailsFromNetwork(){
        let myExcipectation = expectation(description:"waiting for api result ")
        networkMannager?.fetchPlayerDetails(playerId: "437", complition:{ it in
                XCTAssertNotNil(it)
                myExcipectation.fulfill()
        })
        
        waitForExpectations(timeout:10)
    }
}

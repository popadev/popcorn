//
//  PopcornTests.swift
//  PopcornTests
//
//  Created by Petru Popa on 4/22/21.
//

import XCTest
@testable import Popcorn

class PopcornTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchMovies() {
        let apiService = APIService()
        let moviesExpectation = expectation(description: "movies")
        var moviesResponse: Movies?
        
        apiService.searchMovies(query: "titanic") { (movies, error) in
            moviesResponse = movies
            moviesExpectation.fulfill()
        }
        waitForExpectations(timeout: 3) { (error) in
            XCTAssertNotNil(moviesResponse)
        }
    }

}

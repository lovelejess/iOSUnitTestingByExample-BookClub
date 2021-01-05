//
//  ViewControllerTests.swift
//  NetworkResponseTests
//
//  Created by Quinne Farenwald on 1/4/21.
//

@testable import NetworkResponse
import XCTest

class ViewControllerTests: XCTestCase {
    private var sut: ViewController!
    private var spyURLSession: SpyURLSession!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        spyURLSession = SpyURLSession()
        sut.session = spyURLSession
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        sut = nil
        spyURLSession = nil
        super.tearDown()
    }
    
    private func jsonData() -> Data {
        """
        { "results": [
                {
                    "artistName": "Artist",
                    "trackName": "Track",
                    "averageUserRating": 2.5,
                    "genres": [
                        "Foo",
                        "Bar
                    ]
                }
            ]
        }
        """.data(using: .utf8)!
    }
    
    private func response(statusCode: Int) -> HTTPURLResponse? {
        HTTPURLResponse(url: URL(string: "http://DUMMY")!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
    }

    func test_searchForBookNetworkCall_withSuccessResponse_shouldSaveDataInResults() {
        tap(sut.button)
        
        let handleResultsCalled = expectation(description: "handleResults called")
        sut.handleResults = {_ in
            handleResultsCalled.fulfill()
        }
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 200), nil)
        
        waitForExpectations(timeout: 0.01)
        
        XCTAssertEqual(sut.results, [SearchResult(artistName: "Artist", trackName: "Track", averageUserRating: 2.5, genres: ["Foo", "Bar"])])
    }
    
    func test_searchForBookNetworkCall_withSuccessBeforeAsync_shouldNotSaveDataInResults() {
        tap(sut.button)
        
        spyURLSession.dataTaskArgsCompletionHandler.first?(jsonData(), response(statusCode: 200), nil)
                
        XCTAssertEqual(sut.results, [])
    }

}

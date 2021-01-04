//
//  ViewControllerTests.swift
//  NetworkRequestTests
//
//  Created by Quinne Farenwald on 1/3/21.
//

@testable import NetworkRequest
import XCTest

class ViewControllerTests: XCTestCase {
    private var sut: ViewController!
    private var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(identifier: String(describing: ViewController.self))
        mockURLSession = MockURLSession()
        sut.session = mockURLSession
    }
    
    override func tearDown() {
        sut = nil
        mockURLSession = nil
        super.tearDown()
    }

    func test_tappingButton_shouldMakeDataTaskSearchForEveryBookOutFromBoneville() {
        sut.loadViewIfNeeded()
        
        tap(sut.button)
        
        mockURLSession.verifyDataTask(with: URLRequest(url: URL(string: "https://itunes.apple.com/search?" + "media=ebooks&term=out%20from%20boneville")!))
    }
}

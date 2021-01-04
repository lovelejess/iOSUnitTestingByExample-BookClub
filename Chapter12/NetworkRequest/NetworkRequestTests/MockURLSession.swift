//
//  MockURLSession.swift
//  NetworkRequestTests
//
//  Created by Quinne Farenwald on 1/3/21.
//

@testable import NetworkRequest
import Foundation
import XCTest

class MockURLSession: URLSessionProtocol {
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        return DummyURLSessionDataTask()
    }
    
    func verifyDataTask(with request: URLRequest, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(dataTaskCallCount, 1, file: file, line: line)
        
        XCTAssertEqual(dataTaskArgsRequest.first, request, file: file, line: line)
    }
}

private class DummyURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}

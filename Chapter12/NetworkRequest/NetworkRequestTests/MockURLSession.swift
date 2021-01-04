//
//  MockURLSession.swift
//  NetworkRequestTests
//
//  Created by Quinne Farenwald on 1/3/21.
//

@testable import NetworkRequest
import Foundation

class MockURLSession: URLSessionProtocol {
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        return URLSessionDataTask()
    }
}

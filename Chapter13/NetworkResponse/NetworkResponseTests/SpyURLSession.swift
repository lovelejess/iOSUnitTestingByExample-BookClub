//
//  SpyURLSession.swift
//  NetworkResponseTests
//
//  Created by Quinne Farenwald on 1/4/21.
//

@testable import NetworkResponse
import Foundation

private class DummyURLSessionDataTask: URLSessionDataTask {
    override func resume() {}
}

class SpyURLSession: URLSessionProtocol {
    var dataTaskCallCount = 0
    var dataTaskArgsRequest: [URLRequest] = []
    var dataTaskArgsCompletionHandler: [(Data?, URLResponse?, Error?) -> Void] = []
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        dataTaskCallCount += 1
        dataTaskArgsRequest.append(request)
        dataTaskArgsCompletionHandler.append(completionHandler)
        return DummyURLSessionDataTask()
    }
}

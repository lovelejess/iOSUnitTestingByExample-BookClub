//
//  TestError.swift
//  NetworkResponseTests
//
//  Created by Quinne Farenwald on 1/4/21.
//

import Foundation

struct TestError: LocalizedError {
    let message: String
    
    var errorDescription: String? { message }
}

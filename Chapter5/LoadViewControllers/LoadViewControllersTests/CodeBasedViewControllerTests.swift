//
//  CodeBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Quinne Farenwald on 11/4/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

@testable import LoadViewControllers
import XCTest

class CodeBasedViewControllerTests: XCTestCase {

    func test_loading() {
        let sut = CodeBasedViewController(data: "Catz")
        
        sut.loadViewIfNeeded()
        
        // assert something
    }

}

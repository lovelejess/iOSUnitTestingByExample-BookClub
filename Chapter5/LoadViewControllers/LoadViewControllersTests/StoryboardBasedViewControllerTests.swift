//
//  StoryboardBasedViewControllerTests.swift
//  LoadViewControllersTests
//
//  Created by Quinne Farenwald on 11/4/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

@testable import LoadViewControllers
import XCTest

class StoryboardBasedViewControllerTests: XCTestCase {

    func test_loading() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let sut: StoryboardBasedViewController = sb.instantiateViewController(identifier: String(describing: StoryboardBasedViewController.self))
        
        sut.loadViewIfNeeded()
        
        XCTAssertNotNil(sut.label)
    }

}

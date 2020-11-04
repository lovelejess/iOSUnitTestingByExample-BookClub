//
//  ClosurePropertyViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Quinne Farenwald on 11/4/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

@testable import HardDependencies
import XCTest

class ClosurePropertyViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ClosurePropertyViewController =
                storyboard.instantiateViewController(identifier:
                    String(describing: ClosurePropertyViewController.self))
        sut.loadViewIfNeeded()

        sut.makeAnalytics = { Analytics() }
        sut.loadViewIfNeeded()

        sut.viewDidAppear(false)

        // Normally, assert something
    }
}

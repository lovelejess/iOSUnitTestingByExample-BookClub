//
//  OverrideViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Quinne Farenwald on 11/4/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

@testable import HardDependencies
import XCTest

private class TestableOverrideViewController: OverrideViewController {

    override func analytics() -> Analytics { Analytics() }
}

class OverrideViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let sut = TestableOverrideViewController()
        sut.loadViewIfNeeded()

        sut.viewDidAppear(false)

        // Normally, assert something
    }
}

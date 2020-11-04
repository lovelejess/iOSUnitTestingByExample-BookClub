//
//  InstanceInitializerViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Quinne Farenwald on 11/4/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

@testable import HardDependencies
import XCTest

class InstanceInitializerViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let sut = InstanceInitializerViewController(analytics: Analytics())
        sut.loadViewIfNeeded()

        sut.viewDidAppear(false)

        // Normally, assert something
    }

}

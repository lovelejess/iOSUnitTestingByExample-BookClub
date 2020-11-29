//
//  InstancePropertyViewControllerTests.swift
//  HardDependenciesTests
//
//  Created by Quinne Farenwald on 11/4/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

@testable import HardDependencies
import XCTest

class InstancePropertyViewControllerTests: XCTestCase {

    func test_viewDidAppear() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: InstancePropertyViewController =
                storyboard.instantiateViewController(identifier:
                    String(describing: InstancePropertyViewController.self))

        // “The test loads the view controller from the storyboard.
        // Then it sets the value of the analytics property to an instance different from the singleton.
        // Notice that it does this before calling loadViewIfNeeded so that the replacement instance is ready before any view controller methods fire.”
        //
        // Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
        sut.analytics = Analytics()
        sut.loadViewIfNeeded()

        sut.viewDidAppear(false)

        // Normally, assert something
    }
}

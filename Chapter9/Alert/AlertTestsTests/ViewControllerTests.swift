//
//  ViewControllerTests.swift
//  AlertTestsTests
//
//  Created by Jess Lê on 12/6/20.
//

@testable import Alert
import ViewControllerPresentationSpy
// “This import provides a class named AlertVerifier.
// When test code instantiates an AlertVerifier, it patches UIKit to capture any alerts.
// (This works because the AlertVerifier initializer uses method swizzling to replace the UIViewController present(_:animated:completion:) method.
// Its deinitializer reverses the swizzling to restore the original method.)”

// Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
import XCTest

class ViewControllerTests: XCTestCase {
    private var alertVerifier: AlertVerifier!
    private var sut: ViewController!

    override func setUp() {
        super.setUp()
        alertVerifier = AlertVerifier()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
                identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        alertVerifier = nil
        sut = nil
        super.tearDown()
    }
    
    func test_tappingButton_shouldShowAlert() {
        tap(sut.button)

        alertVerifier.verify(
                title: "Do the Thing?",
                message: "Let us know if you want to do the thing.",
                animated: true,
                actions: [
                    .cancel("Cancel"),
                    .default("OK"),
                ],
                presentingViewController: sut
        )
        XCTAssertEqual(alertVerifier.preferredAction?.title, "OK",
                "preferred action")
    }
    
    func test_executeAlertAction_withOKButton() throws {
        tap(sut.button)

        try alertVerifier.executeAction(forButton: "OK")

        // Normally, assert something
    }

    func test_executeAlertAction_withCancelButton() throws {
        tap(sut.button)

        try alertVerifier.executeAction(forButton: "Cancel")

        // Normally, assert something
    }
}

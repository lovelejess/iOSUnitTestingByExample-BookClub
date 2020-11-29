//
//  ViewControllerTests.swift
//  ButtonTapTests
//
//  Created by Jess Lê on 11/29/20.
//

@testable import ButtonTap
import XCTest

class ViewControllerTests: XCTestCase {

    func test_tappingButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut: ViewController = storyboard.instantiateViewController(
                identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()

        #if false
        // “All you need to do is make the outlet accessible, then call sendActions(for:).
        // The event .touchUpInside is the correct event for button taps.”
        //
        // Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
        sut.button.sendActions(for: .touchUpInside)
        #endif
        tap(sut.button)

        // Normally, assert something
    }
}

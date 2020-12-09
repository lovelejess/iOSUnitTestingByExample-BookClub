//
//  ViewControllerTests.swift
//  NavigationTests
//
//  Created by Jess Lê on 12/6/20.
//

@testable import Navigation
import ViewControllerPresentationSpy
import XCTest

// MARK:- codePushButton
class ViewControllerTests: XCTestCase {
    private var sut: ViewController!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: String(describing: ViewController.self))
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        executeRunLoop()
        sut = nil
        super.tearDown()
    }

    func test_navigationController_shouldNotBeNil() {
        sut.loadViewIfNeeded()
//        “To get it to pass, we need to embed the view controller inside a navigation controller. ”
//
//        Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
        let navigation = UINavigationController(rootViewController: sut)

        XCTAssertNotNil(sut.navigationController)
    }

    func test_tappingCodePushButton_shouldPushCodeNextViewController() {
        #if false
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
                withIdentifier: "ViewController") as! ViewController
        sut.loadViewIfNeeded()
        #endif
        let navigation = UINavigationController(rootViewController: sut)

        tap(sut.codePushButton)

        executeRunLoop()
        XCTAssertEqual(navigation.viewControllers.count, 2, "navigation stack")
        
        #if false
        let pushedVC = navigation.viewControllers.last
        XCTAssertTrue(pushedVC is CodeNextViewController,
                "Expected CodeNextViewController, "
                + "but was \(String(describing: pushedVC))")
        #endif

        let pushedVC = navigation.viewControllers.last
        guard let codeNextVC = pushedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, "
                    + "but was \(String(describing: pushedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Pushed from code")
    }
}

// MARK:- codeModalButton
extension ViewControllerTests {
    // “You’ll see that neither ViewController nor CodeNextViewController are deinitialized for this test.”
    // “This violates the clean room goals of Chapter 2, ​Manage Your Test Life Cycles​.
    // The lingering objects from this memory leak may not cause trouble, but they have the potential to do so. ”

    func test_INCORRECT_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        UIApplication.shared.windows.first?.rootViewController = sut

        tap(sut.codeModalButton)

        let presentedVC = sut.presentedViewController
        guard let codeNextVC = presentedVC as? CodeNextViewController else {
            XCTFail("Expected CodeNextViewController, "
                    + "but was \(String(describing: presentedVC))")
            return
        }
        XCTAssertEqual(codeNextVC.label.text, "Modal from code")
    }

    func test_tappingCodeModalButton_shouldPresentCodeNextViewController() {
        // “The PresentationVerifier captures arguments, but without presenting anything. ”
        let presentationVerifier = PresentationVerifier()

        tap(sut.codeModalButton)

        let codeNextVC: CodeNextViewController? = presentationVerifier.verify(
                animated: true, presentingViewController: sut)
        XCTAssertEqual(codeNextVC?.label.text, "Modal from code")
    }
}
// MARK:- seguePushButton
extension ViewControllerTests {
    func test_tappingSeguePushButton_shouldShowSegueNextViewController() {
        let presentationVerifier = PresentationVerifier()
        // “To give the segue an environment that works, we need to load the view controller into a visible UIWindow.”
        // Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
        putInWindow(sut)

        tap(sut.seguePushButton)

        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(
                animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Pushed from segue")
    }

}

// MARK:- segueModalButton
extension ViewControllerTests {
    func test_tappingSegueModalButton_shouldShowSegueNextViewController() {
        let presentationVerifier = PresentationVerifier()

        tap(sut.segueModalButton)

        let segueNextVC: SegueNextViewController? = presentationVerifier.verify(
                animated: true, presentingViewController: sut)
        XCTAssertEqual(segueNextVC?.labelText, "Modal from segue")
    }
}

// We can't use this for a view controller that comes from a storyboard.
/**
 “That’s because the storyboard stores an instance of a particular class. We can’t instantiate a ViewController from the storyboard and convert it to a subclass after it already exists.”

 Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
 */
private class TestableViewController: ViewController {
    var presentCallCount = 0
    var presentArgsViewController: [UIViewController] = []
    var presentArgsAnimated: [Bool] = []
    var presentArgsClosure: [(() -> Void)?] = []
    
    override func present(_ viewControllerToPresent: UIViewController,
                          animated flag: Bool,
                          completion: (() -> Void)? = nil) {
        presentCallCount += 1
        presentArgsViewController.append(viewControllerToPresent)
        presentArgsAnimated.append(flag)
        presentArgsClosure.append(completion)
    }
}

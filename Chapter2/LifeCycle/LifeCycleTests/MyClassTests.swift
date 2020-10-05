//
//  MyClassTests.swift
//  LifeCycleTests
//
//  Created by Jess Lê on 10/4/20.
//

// NOTES:
// SHIFT+CMD+C = console


// Four Phase Test
//“ four phases as set up the thing, call the thing, check the thing, destroy the thing.”


// Unit Tests are FIRST
// “FIRST is a helpful acronym for unit test principles:
// unit tests are fast, isolated, repeatable, self-verifying, and timely.”

// AAA
// Arrange, Act, Assert





// “@testable makes internal declarations visible.”
// since swift classes are by default internal, unless declared otherwise
@testable import LifeCycle
import XCTest

#if true
class MyClassTests: XCTestCase {
    
    // “take a small step, get feedback.”
    
    // Always ensure that our testing framework works as expected by writing a failing test first
    func test_zero() {
        XCTFail("Tests not yet implemented in MyClassTests")
    }

    func test_methodOne() {
        
        // SUT = system under test - the thing we're testing
        let sut = MyClass()

        sut.methodOne()

        // Normally, assert something
        XCTFail("Test failed, yo")
    }

    func test_methodTwo() {
        let sut = MyClass()

        sut.methodTwo()

        // Normally, assert something
    }

}
#endif

#if false

/**
 >> MyClass.init() #1
 >> MyClass.init() #2
 Test Suite 'Selected tests' started at 2020-10-04 20:52:08.843
 Test Suite 'LifeCycleTests.xctest' started at 2020-10-04 20:52:08.844
 Test Suite 'MyClassTests' started at 2020-10-04 20:52:08.844
 Test Case '-[LifeCycleTests.MyClassTests test_methodOne]' started.
 >> methodOne
 Test Case '-[LifeCycleTests.MyClassTests test_methodOne]' passed (0.001 seconds).
 Test Case '-[LifeCycleTests.MyClassTests test_methodTwo]' started.
 >> methodTwo
 Test Case '-[LifeCycleTests.MyClassTests test_methodTwo]' passed (0.001 seconds).
 Test Suite 'MyClassTests' passed at 2020-10-04 20:52:08.847.
      Executed 2 tests, with 0 failures (0 unexpected) in 0.002 (0.003) seconds
 Test Suite 'LifeCycleTests.xctest' passed at 2020-10-04 20:52:08.848.
      Executed 2 tests, with 0 failures (0 unexpected) in 0.002 (0.004) seconds
 Test Suite 'Selected tests' passed at 2020-10-04 20:52:08.848.
      Executed 2 tests, with 0 failures (0 unexpected) in 0.002 (0.005) seconds
 
 */

class MyClassTests: XCTestCase {
    // THe below will create two instances of `MyClass`,
    // One for `test_methodOne` and another for `test_methodTwo`
    private let sut = MyClass()

    func test_methodOne() {
        sut.methodOne()

        // Normally, assert something
    }

    func test_methodTwo() {
        sut.methodTwo()

        // Normally, assert something
    }
}
#endif

#if false
class MyClassTests: XCTestCase {
    private var sut: MyClass!

    override func setUp() {
        super.setUp()
        
        // Create the
        sut = MyClass()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_methodOne() {
        sut.methodOne()

        // Normally, assert something
    }

    func test_methodTwo() {
        sut.methodTwo()

        // Normally, assert something
    }
}
#endif

class TestZeroDemoTests: XCTestCase {
    #if false
    func test_zero() {
        XCTFail("Tests not yet implemented in MyClassTests")
    }
    #endif
}

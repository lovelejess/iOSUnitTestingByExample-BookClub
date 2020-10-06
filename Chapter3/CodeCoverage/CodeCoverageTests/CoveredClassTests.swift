//
//  CoveredClassTests.swift
//  CodeCoverageTests
//
//  Created by Jess Lê on 10/4/20.
//

@testable import CodeCoverage
import XCTest

// MARK: - Conditional Tests
class CoveredClassTests: XCTestCase {

    #if true
    // Step 1 - Base test zero
    func test_zero() {
        XCTFail("Tests not yet implemented in CoveredClassTests")
    }
    #endif

    #if true
    // Step 3 - Make it fail
    func test_max_with1And2_shouldReturnSomething() {
        let result = CoveredClass.max(1, 2)

        XCTAssertEqual(result, -123)
    }
    #endif

    // Step 4 - Make it Pass
    func test_max_with1And2_shouldReturn2() {
        let result = CoveredClass.max(1, 2)

        XCTAssertEqual(result, 2)
    }

    // Step 5 - Conditional Case
    func test_max_with3And2_shouldReturn3() {
        let result = CoveredClass.max(3, 2)

        XCTAssertEqual(result, 3)
    }

}

// MARK: - Loop Tests
extension CoveredClassTests {

    #if false
    // Step 1 - Characterization Test
    func test_commaSeparated_from2to4_shouldReturnSomething() {
        let result = CoveredClass.commaSeparated(from: 2, to: 4)

        XCTAssertEqual(result, "FOO")
    }
    #endif

    // Step 2 - Make it pass
    func test_commaSeparated_from2to4_shouldReturn234SeparatedByCommas() {
        let result = CoveredClass.commaSeparated(from: 2, to: 4)

        XCTAssertEqual(result, "2,3,4")
    }

    #if false
    // Step 3 - Characterization Test for other conditional
    func test_commaSeparated_from2to2_shouldReturnSomething() {
        let result = CoveredClass.commaSeparated(from: 2, to: 2)

        XCTAssertEqual(result, "FOO")
    }
    #endif

    // Step 4 - Make it passs
    func test_commaSeparated_from2to2_shouldReturn2WithNoComma() {
        let result = CoveredClass.commaSeparated(from: 2, to: 2)

        XCTAssertEqual(result, "2")
    }
}

// MARK: - Sequence Tests
extension CoveredClassTests {
    #if false
    // Step 5 - Characterization Test
    func test_area_withWidth7_shouldBeSomething() {
        let sut = CoveredClass()

        sut.width = 7

        XCTAssertEqual(sut.area, -1)
    }
    #endif

    #if true
    // Step 6 - Make it passs
    func test_area_withWidth7_shouldBe49() {
        let sut = CoveredClass()

        sut.width = 7

        XCTAssertEqual(sut.area, 49)
    }
    #endif

}

//
//  PlayWorldTests.swift
//  PlayWorldTests
//
//  Created by Lenard Pop on 15/01/2024.
//

import XCTest
import MockableTest
@testable import PlayWorld

final class PlayWorldTests: XCTestCase {

    lazy var testService = MockTestProtocol()
    
    func testResults() throws {
        let results = ["Cool", "SomeCool", "Some"]
        
        given(testService)
            .testing().willReturn(results)
        
        let viewModel = TestViewModel(service: testService)
        
        viewModel.fetchResults()
        
        XCTAssertEqual("SomeCool", viewModel.results.first ?? "")
    }
}

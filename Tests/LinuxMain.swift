//
//  File.swift
//  
//
//  Created by Dmitry Golub on 17.03.21.
//

#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
    // AppTests
    testCase(PostControllerTests.allTests),
    testCase(RouteTests.allTests)
])

#endif

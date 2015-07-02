//
//  XCTestHelpers.swift
//  TBMultiAppearanceButton
//
//  Created by Clay Smith on 7/1/15.
//  Copyright © 2015 Talking Bibles International. All rights reserved.
//

import Foundation
import XCTest

extension XCTestCase {
  var testBundle: NSBundle {
    return NSBundle(forClass: self.dynamicType)
  }
}

func XCTAssertNil<T>(@autoclosure expression: () -> T?, message: String = "",
  file: String = __FILE__, line: UInt = __LINE__) {
    
    XCTAssert(expression() == nil, message, file:file, line:line)
}

func XCTAssertNotNil<T>(@autoclosure expression: () -> T?, message: String = "",
  file: String = __FILE__, line: UInt = __LINE__) {
    
    XCTAssert(expression() != nil, message, file:file, line:line)
}

func XCTAssertEqual<T: Equatable>(@autoclosure expression1: () -> T?, @autoclosure _ expression2: () -> T?, message: String = "",
  file: String = __FILE__, line: UInt = __LINE__) {
    
    XCTAssert(expression1() == expression2(), message, file:file, line:line)
}

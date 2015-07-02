//
//  TBMultiAppearanceButtonTests.swift
//  TBMultiAppearanceButtonTests
//
//  Created by Clay Smith on 7/1/15.
//  Copyright © 2015 Talking Bibles International. All rights reserved.
//

import XCTest
import TBMultiAppearanceButton

struct TBTestControlAppearance: TBControlAppearanceType {
  let rawValue: Int
  
  init(rawValue: Int) { self.rawValue = rawValue }
  
  static let One = TBTestControlAppearance(rawValue: 1)
  static let Ten = TBTestControlAppearance(rawValue: 10)
}

class TBMultiAppearanceButtonTests: XCTestCase {
  func testActivatingAppearance() {
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // There should be no appearance
    XCTAssertNil(button.appearance)
    
    // Activate an empty One and check appearance
    button.activateAppearance(.One)
    XCTAssertEqual(button.appearance, .One)
    
    // Activate an empty Ten and check appearance
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.appearance, .Ten)
  }
  
  func testTitle() {
    let oneString = "One"
    let anotherOneString = "Another One"
    let tenString = "Ten"
    let nilString = ""
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // Set titles for One and Ten
    button.setTitle(oneString, forAppearance: .One, andState: .Normal)
    button.setTitle(tenString, forAppearance: .Ten, andState: .Normal)
    
    // Activate One and check title
    button.activateAppearance(.One)
    XCTAssertEqual(button.titleForState(.Normal), oneString)
    
    // Change title for One and check title
    button.setTitle(anotherOneString, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.titleForState(.Normal), anotherOneString)
    
    // Active Ten and check title
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.titleForState(.Normal), tenString)
    
    // Nullify title for Ten and check title
    button.setTitle(nil, forAppearance: .Ten, andState: .Normal)
    XCTAssertEqual(button.titleForState(.Normal), nilString)
  }
  
  func testAttributedTitle() {
    let oneString = NSAttributedString(string: "One")
    let anotherOneString = NSAttributedString(string: "Another One")
    let tenString = NSAttributedString(string: "Ten")
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // Set attributed titles for One and Ten
    button.setAttributedTitle(oneString, forAppearance: .One, andState: .Normal)
    button.setAttributedTitle(tenString, forAppearance: .Ten, andState: .Normal)
    
    // Activate One and check attributed title
    button.activateAppearance(.One)
    XCTAssertEqual(button.attributedTitleForState(.Normal), oneString)
    
    // Change attributed title and check
    button.setAttributedTitle(anotherOneString, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.attributedTitleForState(.Normal), anotherOneString)

    // Activate Ten and check attributed title
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.attributedTitleForState(.Normal), tenString)
    
    // Nullify Ten attributed title and check
    button.setAttributedTitle(nil, forAppearance: .Ten, andState: .Normal)
    XCTAssertNil(button.attributedTitleForState(.Normal))
  }
  
  func testTitleColor() {
    let oneColor = UIColor.blueColor()
    let anotherOneColor = UIColor.blackColor()
    let tenColor = UIColor.orangeColor()
    let nilColor = TBSystemDefaults.titleColorForState(.Normal)
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // Set title colors for One and Ten
    button.setTitleColor(oneColor, forAppearance: .One, andState: .Normal)
    button.setTitleColor(tenColor, forAppearance: .Ten, andState: .Normal)
    
    // Activate One and check title color
    button.activateAppearance(.One)
    XCTAssertEqual(button.titleColorForState(.Normal), oneColor)
    
    // Change title color and check
    button.setTitleColor(anotherOneColor, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.titleColorForState(.Normal), anotherOneColor)
    
    // Activate Ten and check title color
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.titleColorForState(.Normal), tenColor)
    
    // Nullify Ten title and check
    button.setTitleColor(nil, forAppearance: .Ten, andState: .Normal)
    XCTAssertEqual(button.titleColorForState(.Normal), nilColor)
  }
  
  func testTitleShadowColor() {
    let oneColor = UIColor.blueColor()
    let anotherOneColor = UIColor.blackColor()
    let tenColor = UIColor.orangeColor()
    let nilColor = TBSystemDefaults.titleShadowColorForState(.Normal)
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // Set title shadow colors for One and Ten
    button.setTitleShadowColor(oneColor, forAppearance: .One, andState: .Normal)
    button.setTitleShadowColor(tenColor, forAppearance: .Ten, andState: .Normal)
    
    // Activate One and check title shadow color
    button.activateAppearance(.One)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), oneColor)
    
    // Change title shadow color and check
    button.setTitleShadowColor(anotherOneColor, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), anotherOneColor)
    
    // Activate Ten and check title shadow color
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), tenColor)
    
    // Nullify Ten title shadow color and check
    button.setTitleShadowColor(nil, forAppearance: .Ten, andState: .Normal)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), nilColor)
  }
  
  func testBackgroundImage() {
    let oneImage = UIImage(named: "OneBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let anotherOneImage = UIImage(named: "AnotherOneBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let tenImage = UIImage(named: "TenBug", inBundle: testBundle, compatibleWithTraitCollection: nil)

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // Set background images for One and Ten
    button.setBackgroundImage(oneImage, forAppearance: .One, andState: .Normal)
    button.setBackgroundImage(tenImage, forAppearance: .Ten, andState: .Normal)
    
    // Activate One and check background image
    button.activateAppearance(.One)
    XCTAssertEqual(button.backgroundImageForState(.Normal), oneImage)
    
    // Change background image and check
    button.setBackgroundImage(anotherOneImage, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.backgroundImageForState(.Normal), anotherOneImage)
    
    // Activate Ten and check background image
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.backgroundImageForState(.Normal), tenImage)
    
    // Nullify Ten background image and check
    button.setBackgroundImage(nil, forAppearance: .Ten, andState: .Normal)
    XCTAssertEqual(button.backgroundImageForState(.Normal), nil)
  }
  
  func testImage() {
    let oneImage = UIImage(named: "OneBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let anotherOneImage = UIImage(named: "AnotherOneBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let tenImage = UIImage(named: "TenBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // Set background images for One and Ten
    button.setImage(oneImage, forAppearance: .One, andState: .Normal)
    button.setImage(tenImage, forAppearance: .Ten, andState: .Normal)
    
    // Activate One and check background image
    button.activateAppearance(.One)
    XCTAssertEqual(button.imageForState(.Normal), oneImage)
    
    // Change background image and check
    button.setImage(anotherOneImage, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.imageForState(.Normal), anotherOneImage)
    
    // Activate Ten and check background image
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.imageForState(.Normal), tenImage)
    
    // Nullify Ten background image and check
    button.setImage(nil, forAppearance: .Ten, andState: .Normal)
    XCTAssertEqual(button.imageForState(.Normal), nil)
  }
  
  func testEnabled() {
    let oneBool = true
    let anotherOneBool = false
    let tenBool = false
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: CGRectMake(0, 0, 120, 44))
    
    // Set enabled for One and Ten
    button.setEnabled(oneBool, forAppearance: .One, andState: .Normal)
    button.setEnabled(tenBool, forAppearance: .Ten, andState: .Normal)
    
    // Activate One and check enabled
    button.activateAppearance(.One)
    XCTAssertEqual(button.enabled, oneBool)
    
    // Change enabled for One and check
    button.setEnabled(anotherOneBool, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.enabled, anotherOneBool)
    
    // Activate Ten and check enabled
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.enabled, tenBool)
    
    // Nullify Ten background image and check that enabled is false
    button.setEnabled(nil, forAppearance: .One, andState: .Normal)
    XCTAssertEqual(button.enabled, false)
  }
}


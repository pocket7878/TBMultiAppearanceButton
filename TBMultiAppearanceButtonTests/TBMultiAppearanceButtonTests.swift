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
  let buttonFrame = CGRectMake(0, 0, 120, 44)
  
  func testActivatingAppearance() {
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
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
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
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
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
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
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
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
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
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

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
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
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
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
    
    // Nullify Ten image and check
    button.setImage(nil, forAppearance: .Ten, andState: .Normal)
    XCTAssertEqual(button.imageForState(.Normal), nil)
  }
  
  func testEnabled() {
    let enabledString = "Enabled"
    let disabledString = "Disabled"
    let anotherEnabledString = "Another Enabled"
    let anotherDisabledString = "Another Disabled"
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
    // Set enabled for One and Ten
    button.setTitle(enabledString, forAppearance: .One, andState: .Normal)
    button.setTitle(disabledString, forAppearance: .One, andState: .Disabled)
    
    button.setTitle(anotherEnabledString, forAppearance: .Ten, andState: .Normal)
    button.setTitle(anotherDisabledString, forAppearance: .Ten, andState: .Disabled)
    
    // Activate One and check title
    button.activateAppearance(.One)
    XCTAssertEqual(button.titleLabel?.text, enabledString)
    
    // Disable One and check
    button.enabled = false
    XCTAssertEqual(button.titleLabel?.text, disabledString)
    
    // Activate Ten and check for disabled
    button.activateAppearance(.Ten)
    XCTAssertEqual(button.titleLabel?.text, anotherDisabledString)
    
    // Enable Ten and check
    button.enabled = true
    XCTAssertEqual(button.titleLabel?.text, anotherEnabledString)
  }
  
  func testHighlighted() {
    let normalTitle = "Normal"
    let highlightedTitle = "Hightlighted"
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
    button.setTitle(normalTitle, forAppearance: .One, andState: .Normal)
    button.setTitle(highlightedTitle, forAppearance: .One, andState: .Highlighted)
    
    // Activate One and check for normal title
    button.activateAppearance(.One)
    XCTAssertEqual(button.titleLabel?.text, normalTitle)
    
    // Highlight One and check for highlighted title
    button.highlighted = true
    XCTAssertEqual(button.titleLabel?.text, highlightedTitle)
  }
  
  func testSelected() {
    let normalTitle = "Normal"
    let selectedTitle = "Selected"
    
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)
    
    button.setTitle(normalTitle, forAppearance: .One, andState: .Normal)
    button.setTitle(selectedTitle, forAppearance: .One, andState: .Selected)
    
    // Activate One and check for normal title
    button.activateAppearance(.One)
    XCTAssertEqual(button.titleLabel?.text, normalTitle)
    
    // Select One and check for selected title
    button.selected = true
    XCTAssertEqual(button.titleLabel?.text, selectedTitle)
  }
}


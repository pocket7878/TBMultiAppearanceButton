//
// The MIT License (MIT)
//
// TBMultiAppearanceButton
// Copyright (c) 2015 Talking Bibles International and Stephen Clay Smith
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import XCTest
import TBMultiAppearanceButton

enum TBTestControlAppearance: Int, TBControlAppearanceType {
  case Play = 2
  case Pause = 3
}

class TBMultiAppearanceButtonTests: XCTestCase {
  let buttonFrame = CGRectMake(0, 0, 120, 44)

  func testActivatingAppearance() {
    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // There should be no appearance
    XCTAssertNil(button.appearance)

    // Activate an empty Play and check appearance
    button.activateAppearance(.Play)
    XCTAssertEqual(button.appearance, .Play)

    // Activate an empty Pause and check appearance
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.appearance, .Pause)
  }

  func testTitle() {
    let playString = "Play"
    let anotherPlayString = "Another Play"
    let pauseString = "Pause"
    let nilString = ""

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // Set titles for Play and Pause
    button.setTitle(playString, forAppearance: .Play, andStates: [.Normal, .Highlighted])
    button.setTitle(pauseString, forAppearance: .Pause, andState: .Normal)

    // Activate Play and check title
    button.activateAppearance(.Play)
    XCTAssertEqual(button.titleForState(.Normal), playString)
    XCTAssertEqual(button.titleForState(.Highlighted), playString)

    // Change title for Play and check title
    button.setTitle(anotherPlayString, forAppearance: .Play, andState: .Normal)
    XCTAssertEqual(button.titleForState(.Normal), anotherPlayString)

    // Active Pause and check title
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.titleForState(.Normal), pauseString)

    // Nullify title for Pause and check title
    button.setTitle(nil, forAppearance: .Pause, andState: .Normal)
    XCTAssertEqual(button.titleForState(.Normal), nilString)
  }

  func testAttributedTitle() {
    let playString = NSAttributedString(string: "Play")
    let anotherPlayString = NSAttributedString(string: "Another Play")
    let pauseString = NSAttributedString(string: "Pause")

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // Set attributed titles for Play and Pause
    button.setAttributedTitle(playString, forAppearance: .Play, andStates: [.Normal, .Highlighted])
    button.setAttributedTitle(pauseString, forAppearance: .Pause, andState: .Normal)

    // Activate Play and check attributed title
    button.activateAppearance(.Play)
    XCTAssertEqual(button.attributedTitleForState(.Normal), playString)
    XCTAssertEqual(button.attributedTitleForState(.Highlighted), playString)

    // Change attributed title and check
    button.setAttributedTitle(anotherPlayString, forAppearance: .Play, andState: .Normal)
    XCTAssertEqual(button.attributedTitleForState(.Normal), anotherPlayString)

    // Activate Pause and check attributed title
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.attributedTitleForState(.Normal), pauseString)

    // Nullify Pause attributed title and check
    button.setAttributedTitle(nil, forAppearance: .Pause, andState: .Normal)
    XCTAssertNil(button.attributedTitleForState(.Normal))
  }

  func testTitleColor() {
    let playColor = UIColor.blueColor()
    let anotherPlayColor = UIColor.blackColor()
    let pauseColor = UIColor.orangeColor()
    let nilColor = TBSystemDefaults.titleColorForState(.Normal)

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // Set title colors for Play and Pause
    button.setTitleColor(playColor, forAppearance: .Play, andStates: [.Normal, .Highlighted])
    button.setTitleColor(pauseColor, forAppearance: .Pause, andState: .Normal)

    // Activate Play and check title color
    button.activateAppearance(.Play)
    XCTAssertEqual(button.titleColorForState(.Normal), playColor)
    XCTAssertEqual(button.titleColorForState(.Highlighted), playColor)

    // Change title color and check
    button.setTitleColor(anotherPlayColor, forAppearance: .Play, andState: .Normal)
    XCTAssertEqual(button.titleColorForState(.Normal), anotherPlayColor)

    // Activate Pause and check title color
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.titleColorForState(.Normal), pauseColor)

    // Nullify Pause title and check
    button.setTitleColor(nil, forAppearance: .Pause, andState: .Normal)
    XCTAssertEqual(button.titleColorForState(.Normal), nilColor)
  }

  func testTitleShadowColor() {
    let playColor = UIColor.blueColor()
    let anotherPlayColor = UIColor.blackColor()
    let pauseColor = UIColor.orangeColor()
    let nilColor = TBSystemDefaults.titleShadowColorForState(.Normal)

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // Set title shadow colors for Play and Pause
    button.setTitleShadowColor(playColor, forAppearance: .Play, andStates: [.Normal, .Highlighted])
    button.setTitleShadowColor(pauseColor, forAppearance: .Pause, andState: .Normal)

    // Activate Play and check title shadow color
    button.activateAppearance(.Play)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), playColor)
    XCTAssertEqual(button.titleShadowColorForState(.Highlighted), playColor)

    // Change title shadow color and check
    button.setTitleShadowColor(anotherPlayColor, forAppearance: .Play, andState: .Normal)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), anotherPlayColor)

    // Activate Pause and check title shadow color
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), pauseColor)

    // Nullify Pause title shadow color and check
    button.setTitleShadowColor(nil, forAppearance: .Pause, andState: .Normal)
    XCTAssertEqual(button.titleShadowColorForState(.Normal), nilColor)
  }

  func testBackgroundImage() {
    let playImage = UIImage(named: "PlayBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let anotherPlayImage = UIImage(named: "AnotherPlayBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let pauseImage = UIImage(named: "PauseBug", inBundle: testBundle, compatibleWithTraitCollection: nil)

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // Set background images for Play and Pause
    button.setBackgroundImage(playImage, forAppearance: .Play, andStates: [.Normal, .Highlighted])
    button.setBackgroundImage(pauseImage, forAppearance: .Pause, andState: .Normal)

    // Activate Play and check background image
    button.activateAppearance(.Play)
    XCTAssertEqual(button.backgroundImageForState(.Normal), playImage)
    XCTAssertEqual(button.backgroundImageForState(.Highlighted), playImage)

    // Change background image and check
    button.setBackgroundImage(anotherPlayImage, forAppearance: .Play, andState: .Normal)
    XCTAssertEqual(button.backgroundImageForState(.Normal), anotherPlayImage)

    // Activate Pause and check background image
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.backgroundImageForState(.Normal), pauseImage)

    // Nullify Pause background image and check
    button.setBackgroundImage(nil, forAppearance: .Pause, andState: .Normal)
    XCTAssertEqual(button.backgroundImageForState(.Normal), nil)
  }

  func testImage() {
    let playImage = UIImage(named: "PlayBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let anotherPlayImage = UIImage(named: "AnotherPlayBug", inBundle: testBundle, compatibleWithTraitCollection: nil)
    let pauseImage = UIImage(named: "PauseBug", inBundle: testBundle, compatibleWithTraitCollection: nil)

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // Set background images for Play and Pause
    button.setImage(playImage, forAppearance: .Play, andStates: [.Normal, .Highlighted])
    button.setImage(pauseImage, forAppearance: .Pause, andState: .Normal)

    // Activate Play and check background image
    button.activateAppearance(.Play)
    XCTAssertEqual(button.imageForState(.Normal), playImage)
    XCTAssertEqual(button.imageForState(.Highlighted), playImage)

    // Change background image and check
    button.setImage(anotherPlayImage, forAppearance: .Play, andState: .Normal)
    XCTAssertEqual(button.imageForState(.Normal), anotherPlayImage)

    // Activate Pause and check background image
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.imageForState(.Normal), pauseImage)

    // Nullify Pause image and check
    button.setImage(nil, forAppearance: .Pause, andState: .Normal)
    XCTAssertEqual(button.imageForState(.Normal), nil)
  }

  func testEnabled() {
    let enabledString = "Enabled"
    let disabledString = "Disabled"
    let anotherEnabledString = "Another Enabled"
    let anotherDisabledString = "Another Disabled"

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    // Set enabled for Play and Pause
    button.setTitle(enabledString, forAppearance: .Play, andState: .Normal)
    button.setTitle(disabledString, forAppearance: .Play, andState: .Disabled)

    button.setTitle(anotherEnabledString, forAppearance: .Pause, andState: .Normal)
    button.setTitle(anotherDisabledString, forAppearance: .Pause, andState: .Disabled)

    // Activate Play and check title
    button.activateAppearance(.Play)
    XCTAssertEqual(button.titleLabel?.text, enabledString)

    // Disable Play and check
    button.enabled = false
    XCTAssertEqual(button.titleLabel?.text, disabledString)

    // Activate Pause and check for disabled
    button.activateAppearance(.Pause)
    XCTAssertEqual(button.titleLabel?.text, anotherDisabledString)

    // Enable Pause and check
    button.enabled = true
    XCTAssertEqual(button.titleLabel?.text, anotherEnabledString)
  }

  func testHighlighted() {
    let normalTitle = "Normal"
    let highlightedTitle = "Hightlighted"

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    button.setTitle(normalTitle, forAppearance: .Play, andState: .Normal)
    button.setTitle(highlightedTitle, forAppearance: .Play, andState: .Highlighted)

    // Activate Play and check for normal title
    button.activateAppearance(.Play)
    XCTAssertEqual(button.titleLabel?.text, normalTitle)

    // Highlight Play and check for highlighted title
    button.highlighted = true
    XCTAssertEqual(button.titleLabel?.text, highlightedTitle)
  }

  func testSelected() {
    let normalTitle = "Normal"
    let selectedTitle = "Selected"

    let button = TBMultiAppearanceButton<TBTestControlAppearance>(frame: buttonFrame)

    button.setTitle(normalTitle, forAppearance: .Play, andState: .Normal)
    button.setTitle(selectedTitle, forAppearance: .Play, andState: .Selected)

    // Activate Play and check for normal title
    button.activateAppearance(.Play)
    XCTAssertEqual(button.titleLabel?.text, normalTitle)

    // Select Play and check for selected title
    button.selected = true
    XCTAssertEqual(button.titleLabel?.text, selectedTitle)
  }
}

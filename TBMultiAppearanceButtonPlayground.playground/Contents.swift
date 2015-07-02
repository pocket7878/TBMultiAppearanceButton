//: Playground - noun: a place where people can play

import UIKit
import TBMultiAppearanceButton
import XCPlayground


// Setup view
let viewRect = CGRectMake(0, 0, 300, 300)
var contentView = UIView(frame: viewRect)

contentView.backgroundColor = UIColor.whiteColor()

XCPShowView("Content View", view: contentView)
XCPExecutionShouldContinueIndefinitely()

struct PlayerControlAppearance: TBControlAppearanceType {
  let rawValue: Int
  
  init(rawValue: Int) { self.rawValue = rawValue }

  static let Stop = PlayerControlAppearance(rawValue: 1)
  static let Play = PlayerControlAppearance(rawValue: 2)
  static let Pause = PlayerControlAppearance(rawValue: 3)
}

let button = TBMultiAppearanceButton<PlayerControlAppearance>(frame: CGRectMake(0, 0, 100, 100))

button.setTitle("Play", forAppearance: .Play, andState: .Normal)
button.setTitle("Clicked play", forAppearance: .Play, andState: .Highlighted)

button.setBackgroundImage(UIImage.imageWithColor(UIColor.blueColor()), forAppearance: .Play, andState: .Normal)
button.setBackgroundImage(UIImage.imageWithColor(UIColor.lightGrayColor()), forAppearance: .Play, andState: .Highlighted)

button.setTitle("Pause", forAppearance: .Pause, andState: .Normal)
button.setBackgroundImage(UIImage.imageWithColor(UIColor.yellowColor()), forAppearance: .Pause, andState: .Normal)

button.setTitle("Stop", forAppearance: .Stop, andState: .Normal)

button.activateAppearance(.Play)


button
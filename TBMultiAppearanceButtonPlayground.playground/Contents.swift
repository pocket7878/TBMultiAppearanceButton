//: Playground - noun: a place where people can play

import UIKit
import TBMultiAppearanceButton

enum PlayerButtonAppearance: Int, TBControlAppearanceType {
  case Stop = 1
  case Play = 2
  case Pause = 3
}

let button = TBMultiAppearanceButton<PlayerButtonAppearance>(frame: CGRectMake(0, 0, 100, 100))

button.setTitle("Play", forAppearance: .Play, andState: .Normal)
button.setTitle("Play", forAppearance: .Play, andState: .Highlighted)

button.setBackgroundImage(UIImage.imageWithColor(UIColor.blueColor()), forAppearance: .Play, andState: .Normal)
button.setBackgroundImage(UIImage.imageWithColor(UIColor.lightGrayColor()), forAppearance: .Play, andState: .Highlighted)

button.setTitle("Pause", forAppearance: .Pause, andState: .Normal)
button.setTitleColor(UIColor.blueColor(), forAppearance: .Pause, andState: .Normal)
button.setBackgroundImage(UIImage.imageWithColor(UIColor.yellowColor()), forAppearance: .Pause, andState: .Normal)

button.setTitle("Stop", forAppearance: .Stop, andState: .Normal)

button.activateAppearance(.Play)

button

button.highlighted = true

button

button.highlighted = false
button.activateAppearance(.Pause)

button

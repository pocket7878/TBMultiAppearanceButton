//
//  TBSystemDefaults.swift
//  TBMultiAppearanceButton
//
//  Created by Clay Smith on 7/1/15.
//  Copyright © 2015 Talking Bibles International. All rights reserved.
//

import UIKit

struct TBSystemDefaults {
  static func titleColorForState(state: UIControlState) -> UIColor? {
    let tempView = UIButton()
    return tempView.titleColorForState(state)
  }
  
  static func titleShadowColorForState(state: UIControlState) -> UIColor? {
    let tempView = UIButton()
    return tempView.titleShadowColorForState(state)
  }
  
  static func backgroundImageForState(state: UIControlState) -> UIImage? {
    let tempView = UIButton()
    return tempView.backgroundImageForState(state)
  }
  
  static func imageForState(state: UIControlState) -> UIImage? {
    let tempView = UIButton()
    return tempView.imageForState(state)
  }
}
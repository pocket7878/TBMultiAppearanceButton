//
//  TBControlState.swift
//  TBMultiAppearanceButton
//
//  Created by Clay Smith on 7/1/15.
//  Copyright © 2015 Talking Bibles International. All rights reserved.
//

import Foundation

public protocol TBControlAppearanceType: RawRepresentable, Hashable {  
  var rawValue: Int { get }

  init(rawValue: Int)
}

public extension TBControlAppearanceType {
  var hashValue: Int { return rawValue }
}

func ==<T: TBControlAppearanceType>(lhs: T, rhs: T) -> Bool {
  return lhs.rawValue == rhs.rawValue
}
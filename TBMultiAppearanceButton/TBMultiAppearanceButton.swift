//
//  TBMultiAppearanceButton.swift
//  TBMultiAppearanceButton
//
//  Created by Clay Smith on 6/30/15.
//  Copyright © 2015 Talking Bibles International. All rights reserved.
//

import UIKit

extension UIControlState: Hashable {
  public var hashValue: Int {
    return Int(rawValue)
  }
}

public class TBMultiAppearanceButton<TBControlAppearance: TBControlAppearanceType>: UIButton {
  private var titlesForAppearance = [TBControlAppearance: [UIControlState: String]]()
  private var attributedTitlesForAppearance = [TBControlAppearance: [UIControlState: NSAttributedString]]()
  private var titleColorsForAppearance = [TBControlAppearance: [UIControlState: UIColor]]()
  private var titleShadowColorsForAppearance = [TBControlAppearance: [UIControlState: UIColor]]()
  private var backgroundImagesForAppearance = [TBControlAppearance: [UIControlState: UIImage]]()
  private var imagesForAppearance = [TBControlAppearance: [UIControlState: UIImage]]()
  private var enabledForAppearance = [TBControlAppearance: [UIControlState: Bool]]()

  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  /// Holds the currently active TBControlAppearance; otherwise nil.
  /// Setting this property conforms the button to the current
  /// appearance.
  private var _appearance: Int? {
    didSet {
      guard let _appearance = _appearance else {
        return
      }
      
      updateAppearance(TBControlAppearance(rawValue: _appearance))
    }
  }
  
  private func updateAppearance(appearance: TBControlAppearance) {
    // Cycle through states and update each
    setAttributedTitle(attributedTitleForAppearance(appearance, andState: state), forState: state)
    setTitle(titleForAppearance(appearance, andState: state) ?? "", forState: state)
    
    let titleColor = titleColorForAppearance(appearance, andState: state) ?? TBSystemDefaults.titleColorForState(state)
    setTitleColor(titleColor, forState: state)
    
    let shadowColor = titleShadowColorForAppearance(appearance, andState: state) ?? TBSystemDefaults.titleShadowColorForState(state)
    setTitleShadowColor(shadowColor, forState: state)
    
    let bgImage = backgroundImageForAppearance(appearance, andState: state) ?? TBSystemDefaults.backgroundImageForState(state)
    setBackgroundImage(bgImage, forState: state)
    
    let image = imageForAppearance(appearance, andState: state) ?? TBSystemDefaults.imageForState(state)
    setImage(image, forState: state)
    
    enabled = enabledForAppearance(appearance, andState: state) ?? enabled
  }
  
  private func shouldUpdateAppearance(appearance: TBControlAppearance, andState state: UIControlState) {
    if _appearance == appearance.rawValue {
      updateAppearance(appearance)
    }
  }
}

public extension TBMultiAppearanceButton {
  // MARK: - Configuring the Button Title

  /// Returns the title associated with the specified appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the title.
  ///
  /// - returns: The title for the specified appearance. If no title
  ///   has been set, return nil.
  func titleForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> String? {
    return titlesForAppearance[appearance]?[state]
  }

  /// Sets the title to use for the specified appearance.
  ///
  /// - parameter title: The text string to use for the specified appearance.
  /// - parameter appearance: The TBControlAppearance that uses the specified title.
  func setTitle(title: String?, forAppearance appearance: TBControlAppearance, andState state: UIControlState) {
    defer { shouldUpdateAppearance(appearance, andState: state) }

    guard let title = title else {
      titlesForAppearance.removeValueForKey(appearance)
      return
    }
    
    if titlesForAppearance[appearance] == nil {
      titlesForAppearance[appearance] = [:]
    }

    titlesForAppearance[appearance]?[state] = title
  }

  /// Returns the styled title associated with the specified appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the title.
  ///
  /// - returns: The title for the specified appearance. If no
  ///   attributed title has been set, return nil.
  func attributedTitleForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> NSAttributedString? {
    return attributedTitlesForAppearance[appearance]?[state]
  }

  /// Sets the styled title to use for the specified appearance.
  ///
  /// - parameter title: The styled text string to use for the specified appearance.
  /// - parameter appearance: The TBControlAppearance that uses the specified title.
  func setAttributedTitle(title: NSAttributedString?, forAppearance appearance: TBControlAppearance, andState state: UIControlState) {
    defer { shouldUpdateAppearance(appearance, andState: state) }
    
    guard let title = title else {
      attributedTitlesForAppearance.removeValueForKey(appearance)
      return
    }

    if attributedTitlesForAppearance[appearance] == nil {
      attributedTitlesForAppearance[appearance] = [:]
    }
    
    attributedTitlesForAppearance[appearance]?[state] = title
  }

  /// Returns the title color associated with the specified appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the title color.
  ///
  /// - returns: The color of the title for the specified appearance.
  func titleColorForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIColor? {
    return titleColorsForAppearance[appearance]?[state]
  }

  /// Sets the styled title to use for the specified appearance.
  ///
  /// - parameter color: The color of the title to use for the specified appearance.
  /// - parameter appearance: The TBControlAppearance that uses the specified color.
  func setTitleColor(color: UIColor?, forAppearance appearance: TBControlAppearance, andState state: UIControlState) {
    defer { shouldUpdateAppearance(appearance, andState: state) }

    guard let color = color else {
      titleColorsForAppearance.removeValueForKey(appearance)
      return
    }

    if titleColorsForAppearance[appearance] == nil {
      titleColorsForAppearance[appearance] = [:]
    }
    
    titleColorsForAppearance[appearance]?[state] = color
  }

  /// Returns the shadow color of the title used for a appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the title shadow color.
  ///
  /// - returns: The color of the title’s shadow for the specified appearance.
  func titleShadowColorForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIColor? {
    return titleShadowColorsForAppearance[appearance]?[state]
  }

  /// Sets the styled title to use for the specified appearance.
  ///
  /// - parameter color: The color of the title to use for the specified appearance.
  /// - parameter appearance: The TBControlAppearance that uses the specified color.
  func setTitleShadowColor(color: UIColor?, forAppearance appearance: TBControlAppearance, andState state: UIControlState) {
    defer { shouldUpdateAppearance(appearance, andState: state) }

    guard let color = color else {
      titleShadowColorsForAppearance.removeValueForKey(appearance)
      return
    }

    if titleShadowColorsForAppearance[appearance] == nil {
      titleShadowColorsForAppearance[appearance] = [:]
    }
    
    titleShadowColorsForAppearance[appearance]?[state] = color
  }


  // MARK: - Configuring the Button Presentation
  
  /// Returns the background image used for a button appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the background image.
  ///
  /// - returns: The background image used for the specified appearance.
  func backgroundImageForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIImage? {
    return backgroundImagesForAppearance[appearance]?[state]
  }

  /// Sets the background image to use for the specified button appearance.
  ///
  /// - parameter color: The background image to use for the specified appearance.
  /// - parameter appearance: The TBControlAppearance that uses the specified image.
  func setBackgroundImage(image: UIImage?, forAppearance appearance: TBControlAppearance, andState state: UIControlState) {
    defer { shouldUpdateAppearance(appearance, andState: state) }

    guard let backgroundImage = image else {
      backgroundImagesForAppearance.removeValueForKey(appearance)
      return
    }

    if backgroundImagesForAppearance[appearance] == nil {
      backgroundImagesForAppearance[appearance] = [:]
    }
    
    backgroundImagesForAppearance[appearance]?[state] = backgroundImage
  }

  /// Returns the image used for a button appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the background image.
  ///
  /// - returns: The image used for the specified appearance.
  func imageForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIImage? {
    return imagesForAppearance[appearance]?[state]
  }

  /// Sets the image to use for the specified button appearance.
  ///
  /// - parameter color: The image to use for the specified appearance.
  /// - parameter appearance: The TBControlAppearance that uses the specified image.
  func setImage(image: UIImage?, forAppearance appearance: TBControlAppearance, andState state: UIControlState) {
    defer { shouldUpdateAppearance(appearance, andState: state) }

    guard let image = image else {
      imagesForAppearance.removeValueForKey(appearance)
      return
    }

    if imagesForAppearance[appearance] == nil {
      imagesForAppearance[appearance] = [:]
    }
    
    imagesForAppearance[appearance]?[state] = image
  }


  // MARK: - Setting and getting control attributes

  /// Returns enabled'ness for specificed button appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that is enabled or disabled.
  ///
  /// - returns: The enabled'ness used for the specified appearance. If not
  ///   specified, return nil.
  func enabledForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> Bool? {
    return enabledForAppearance[appearance]?[state]
  }

  /// Set enabled'ness for specificed button appearance.
  ///
  /// Specify true to make the control enabled when selecting the specified appearance;
  /// otherwise, specify false to make it disabled. The default value is to make no change.
  ///
  /// - parameter enabled: The boolean value to use for the specified appearance.
  /// - parameter appearance: The TBControlAppearance to be enabled or disabled.
  func setEnabled(enabled: Bool?, forAppearance appearance: TBControlAppearance, andState state: UIControlState) {
    defer { shouldUpdateAppearance(appearance, andState: state) }

    guard let enabled = enabled else {
      enabledForAppearance.removeValueForKey(appearance)
      return
    }
    
    if enabledForAppearance[appearance] == nil {
      enabledForAppearance[appearance] = [:]
    }

    enabledForAppearance[appearance]?[state] = enabled
  }


  // MARK: Setting and Getting Control Appearance

  /// Select a TBControlAppearance, conforming the button to the specified settings.
  ///
  /// - parameter appearance: The TBControlAppearance to display.
  public func activateAppearance(appearance: TBControlAppearance) {
    _appearance = appearance.rawValue
  }
  
  /// The currently active TBControlAppearance
  var appearance: TBControlAppearance? {
    guard let _appearance = _appearance else {
      return nil
    }
    
    return TBControlAppearance(rawValue: _appearance)
  }
}

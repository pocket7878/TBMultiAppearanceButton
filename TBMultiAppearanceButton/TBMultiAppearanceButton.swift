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

import UIKit

/// Generic subclass of UIButton that provides methods to configure and switch between multiple appearances,
/// which are specified during initialization by an enum conforming to TBControlAppearanceType.
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
  private var _appearance: TBControlAppearance? {
    didSet {
      guard let appearance = _appearance else {
        return
      }
            
      updateAppearance(appearance)
    }
  }
  
  override public var highlighted: Bool {
    didSet {
      guard let appearance = _appearance else {
        return
      }
      
      updateAppearance(appearance)
    }
  }
  
  override public var selected: Bool {
    didSet {
      guard let appearance = _appearance else {
        return
      }
      
      updateAppearance(appearance)
    }
  }
  
  override public var enabled: Bool {
    didSet {
      guard let appearance = _appearance else {
        return
      }
      
      updateAppearance(appearance)
    }
  }
  
  /// Update the visible properties of the button as specified for the current state and appearance
  ///
  /// - parameter appearance: The TBControlAppearance to apply to the button.
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
  }
  
  /// Updates appearance for specified appearance if the specified state matches the current state
  ///
  /// - parameter appearance: The TBControlAppearance that has been updated.
  /// - parameter state: The UIControlState that has been updated.
  private func shouldUpdateAppearance(appearance: TBControlAppearance, andState state: UIControlState) {
    if _appearance == appearance && self.state == state {
      updateAppearance(appearance)
    }
  }
}

public extension TBMultiAppearanceButton {
  // MARK: - Configuring the Button Title

  /// Returns the title associated with the specified appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the title.
  /// - parameter andState: The UIControlState that receives the title.
  ///
  /// - returns: The title for the specified appearance. If no title
  ///   has been set, return nil.
  func titleForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> String? {
    return titlesForAppearance[appearance]?[state]
  }

  /// Sets the title to use for the specified appearance.
  ///
  /// - parameter title: The text string to use for the specified appearance.
  /// - parameter forAppearance: The TBControlAppearance that uses the specified title.
  /// - parameter andState: The UIControlState that receives the title.
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

  /// Returns the attributed title associated with the specified appearance.
  ///
  /// - parameter appearance: The TBControlAppearance that uses the attributed title.
  /// - parameter andState: The UIControlState that receives the attributed title.
  ///
  /// - returns: The attributed title for the specified appearance. If no
  ///   attributed title has been set, return nil.
  func attributedTitleForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> NSAttributedString? {
    return attributedTitlesForAppearance[appearance]?[state]
  }

  /// Sets the attributed title to use for the specified appearance.
  ///
  /// - parameter title: The styled text string to use for the specified appearance.
  /// - parameter forAppearance: The TBControlAppearance that uses the specified attributed title.
  /// - parameter andState: The UIControlState that receives the attributed title.
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
  /// - parameter andState: The UIControlState that receives the title.
  ///
  /// - returns: The color of the title for the specified appearance.
  func titleColorForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIColor? {
    return titleColorsForAppearance[appearance]?[state]
  }

  /// Sets the title color to use for the specified appearance.
  ///
  /// - parameter color: The color of the title to use for the specified appearance.
  /// - parameter forAppearance: The TBControlAppearance that uses the specified title color.
  /// - parameter andState: The UIControlState that receives the title color.
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
  /// - parameter andState: The UIControlState that receives the title shadow color.
  ///
  /// - returns: The color of the title’s shadow for the specified appearance.
  func titleShadowColorForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIColor? {
    return titleShadowColorsForAppearance[appearance]?[state]
  }

  /// Sets the shadow color of the title to use for the specified appearance.
  ///
  /// - parameter color: The shadow color of the title to use for the specified appearance.
  /// - parameter forAppearance: The TBControlAppearance that uses the specified title shadow color.
  /// - parameter andState: The UIControlState that receives the title shadow color.
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
  /// - parameter andState: The UIControlState that receives the background image.
  ///
  /// - returns: The background image used for the specified appearance.
  func backgroundImageForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIImage? {
    return backgroundImagesForAppearance[appearance]?[state]
  }

  /// Sets the background image to use for the specified button appearance.
  ///
  /// - parameter color: The background image to use for the specified appearance.
  /// - parameter forAppearance: The TBControlAppearance that uses the specified background image.
  /// - parameter andState: The UIControlState that receives the background image.
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
  /// - parameter andState: The UIControlState that receives the image.
  ///
  /// - returns: The image used for the specified appearance.
  func imageForAppearance(appearance: TBControlAppearance, andState state: UIControlState) -> UIImage? {
    return imagesForAppearance[appearance]?[state]
  }

  /// Sets the image to use for the specified button appearance.
  ///
  /// - parameter color: The image to use for the specified appearance.
  /// - parameter forAppearance: The TBControlAppearance that uses the specified image.
  /// - parameter andState: The UIControlState that receives the image.
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
  

  // MARK: Setting and Getting Control Appearance

  /// Select a TBControlAppearance, conforming the button to the specified settings.
  ///
  /// - parameter appearance: The TBControlAppearance to display.
  public func activateAppearance(appearance: TBControlAppearance) {
    _appearance = appearance
  }
  
  /// The currently active TBControlAppearance
  var appearance: TBControlAppearance? {
    guard let appearance = _appearance else {
      return nil
    }
    
    return appearance
  }
}

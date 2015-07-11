# <img src="https://avatars3.githubusercontent.com/u/12140183" width="26" height="26"> TBMultiAppearanceButton

[![Cocoapod compatible](https://img.shields.io/cocoapods/v/TBMultiAppearanceButton.svg)](https://cocoapods.org/pods/TBMultiAppearanceButton)
[![Carthage compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![MIT License](https://img.shields.io/badge/license-MIT%20License-blue.svg)](LICENSE)

Swift framework to configure and switch between multiple appearances of a UIButton, courtesy
of [Talking Bibles International](https://github.com/TalkingBibles) and [Clay Smith](https://github.com/stphnclysmth)


## USAGE

This framework adds a `TBMultiAppearanceButton` subclass of `UIButton`. This new class
allows for switching between multiple appearances of the button, each with its own full
complement of `UIButton` core properties. Each appearance may be configured for all
`UIControlStates`, including highlight and selected.

The possible appearances are cases of an enum that conforms to `TBControlAppearanceType`
with a raw type of `Int`. This enum can be used to control the appearance of multiple
buttons.

```swift
enum PlayerButtonAppearance: Int, TBControlAppearanceType {
  case Play = 2
  case Pause = 3
}
```

Buttons must be programmatically created (at least for now), because the new button class
is generic. It must be specified with an appearance enum.

```swift
let button = TBMultiAppearanceButton<PlayerButtonAppearance>(frame: someFrame)
```

The properties of the button can now be configured for each of the appearances. Changing a
stored property will update the appearance if the specified appearance and state are
currently displayed.

```swift
button.setTitle("Play", forAppearance: .Play, andState: .Normal)
button.setTitle("Play", forAppearance: .Pause, andState: .Normal)

button.setBackgroundImage(UIImage.imageWithColor(UIColor.blueColor()), forAppearance: .Play, andState: .Normal)
button.setBackgroundImage(UIImage.imageWithColor(UIColor.lightGrayColor()), forAppearance: .Play, andState: .Normal)
```

The button can receive all the same messages as a `UIButton`. But the display properties of
the button will be overwritten by any stored appearance properties whenever the button
changes appearance or state. For this reason, it is advised to change the display
properties of the button only through the provided methods.

```swift
// Bad :(
// Will probably be overwritten
self.setTitle("Play", forState: .Normal)

// Good :)
button.setTitle("Play", forAppearance: .Play, andState: .Normal)
```

Switching between appearances is simple. The button will retain its current state, and any
properties configured for the appearance will be changed on the button.

```swift
// Select an appearance
button.activateAppearance(.Play)

// Later... select another appearance
button.activateAppearance(.Pause)
```

This framework does not make any further changes to `UIButton` beyond adding on appearance
control. The subclassed button can be used without fear of cross-interaction any where a
built-in button could go.


## INSTALL

This project is compatible with Cocoapods and Carthage. (These instructions assume that your
chosen method is already installed.)

### Cocoapods

Add `pod 'TBMultiAppearanceButton'` to your target. Since this is a Swift dynamic
framework, you must also tell Cocoapods to `use_frameworks!` instead of static libraries.

```ruby
platform :ios, '8.0'
use_frameworks!

target 'YourProject' do
pod 'TBMultiAppearanceButton', '~> 1.2.0'
end
```

### Carthage

Add `github "TalkingBibles/TBMultiAppearanceButton" ~> 1.2.0` to your Cartfile and run
`carthage bootstrap`. This builds an iOS framework.

```sh
> echo 'github "TalkingBibles/TBMultiAppearanceButton" ~> 1.0.0' >> Cartfile
> carthage bootstrap
```

## License

See [License](LICENSE)

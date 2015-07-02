# TBMultiAppearanceButton

[![Cocoapod compatible](https://img.shields.io/cocoapods/v/TBMultiAppearanceButton.svg)](https://cocoapods.org/pods/TBMultiAppearanceButton)
[![Carthage compatible](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![MIT License](https://img.shields.io/badge/license-MIT%20License-blue.svg)](LICENSE)

Swift framework to configure and switch between multiple appearances of a UIButton, courtesy 
of [Talking Bibles International](https://github.com/TalkingBibles) and [Clay Smith](https://github.com/stphnclysmth)


## USAGE

This framework adds a `TBMultiAppearanceButton` subclass of `UIButton`. This new class allows for switching between multiple appearances of the button, each with its own full complement of `UIButton` core properties. Each appearance may be configured for all `UIControlStates`, including highlight and selected.

```swift

struct PlayerControlAppearance: TBControlAppearanceType {
  let rawValue: Int

  init(rawValue: Int) { self.rawValue = rawValue }

  static let Play = PlayerControlAppearance(rawValue: 1)
  static let Pause = PlayerControlAppearance(rawValue: 2)
}

let button = TBMultiAppearanceButton<PlayerControlAppearance>(frame: CGRectMake(0, 0, 100, 100))

button.setTitle("Play", forAppearance: .Play, andState: .Normal)
button.setTitle("Play", forAppearance: .Pause, andState: .Highlighted)

button.setBackgroundImage(UIImage.imageWithColor(UIColor.blueColor()), forAppearance: .Play, andState: .Normal)
button.setBackgroundImage(UIImage.imageWithColor(UIColor.lightGrayColor()), forAppearance: .Play, andState: .Highlighted)

// Later... select the Play appearance
button.activateAppearance(.Play)

// Even later... select the Pause appearance
button.activateAppearance(.Pause)
```


## INSTALL

This project is compatible with Cocoapods and Carthage. (These instructions assume that your chosen method is already installed.)

### Cocoapods

Add `pod 'TBMultiAppearanceButton'` to your target. Since this is a Swift dynamic framework, you must also tell Cocoapods to `use_frameworks!` instead of static libraries.

```ruby
platform :ios, '9.0' # or, :osx, '10.10'
use_frameworks!

target 'YourProject' do
pod 'TBMultiAppearanceButton', '~> 1.0.0'
end
```

### Carthage

Add `github "TalkingBibles/TBMultiAppearanceButton" ~> 1.0.0` to your Cartfile and run `carthage bootstrap`. This builds frameworks for Mac and iOS targets.

```sh
> echo 'github "TalkingBibles/TBMultiAppearanceButton" ~> 1.0.0' >> Cartfile
> carthage bootstrap
```


## TODO

* Improve tests and add continuous integration testing
* Add better usage documentation


## License

See [License](LICENSE)

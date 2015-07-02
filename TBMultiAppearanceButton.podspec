Pod::Spec.new do |s|
  s.name             = "TBMultiAppearanceButton"

  s.version          = "1.1.0"

  s.summary          = "Swift framework to configure and switch between multiple appearances of a UIButton"
  s.homepage         = "https://github.com/TalkingBibles/TBMultiAppearanceButton"
  s.license          = { :type => 'MIT', :text => '@see LICENSE' }
  s.authors          = { "Talking Bibles International" => "devops@talkingbibles.org", "Clay Smith" => "s.clay.smith@gmail.com" }
  s.social_media_url = 'https://twitter.com/Talking_Bibles'
  s.source           = { :git => "https://github.com/TalkingBibles/TBMultiAppearanceButton.git", :tag => "v" + s.version.to_s }
  s.requires_arc     = true
  s.xcconfig         = { 'SWIFT_INSTALL_OBJC_HEADER' => 'NO' }

  s.ios.deployment_target = '8.0'

  s.ios.source_files = 'TBMultiAppearanceButton/*.{swift}'
  s.ios.frameworks   = 'UIKit'
end

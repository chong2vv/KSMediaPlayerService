#
# Be sure to run `pod lib lint KSMediaPlayerService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KSMediaPlayerService'
  s.version          = '1.0.3'
  s.summary          = 'A short description of KSMediaPlayerService.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/chong2vv/KSMediaPlayerService.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '王远东' => 'wangyuandong@gmail.com' }
  s.source           = { :git => 'https://github.com/chong2vv/KSMediaPlayerService.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KSMediaPlayerService/**/*.{h}'
  s.vendored_frameworks = 'KSMediaPlayerService/Vendors/*.framework'
  s.public_header_files = 'KSMediaPlayerService/**/*.{h}'

end

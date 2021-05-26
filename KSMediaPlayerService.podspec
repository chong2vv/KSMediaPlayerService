#
# Be sure to run `pod lib lint KSMediaPlayerService.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KSMediaPlayerService'
  s.version          = '1.0.0'
  s.summary          = 'A short description of KSMediaPlayerService.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/xuwenxin/KSMediaPlayerService'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'xuwenxin' => 'xuwenxin@meishubao.com' }
  s.source           = { :git => 'https://gitlab.meishubao.com/ArtPods/ArtKSYMediaPlayer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'
  s.resources = 'KSMediaPlayerService/Assets/*.bundle'

  s.source_files = 'KSMediaPlayerService/Classes/**/*'
  s.vendored_frameworks = 'KSMediaPlayerService/Vendors/*.framework'
  # s.resource_bundles = {
  #   'KSMediaPlayerService' => ['KSMediaPlayerService/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency  'ArtFoundation/NSCategories', '>=0.0.9.3'
  s.dependency  'ArtFoundation/ReactiveCocoa', '>=0.0.9.3'

   s.dependency 'ArtCommon/ArtMediaPlayer', '>=1.0.13.18'
   s.dependency 'Masonry' ,'>=1.0.2'
   s.dependency 'ArtFoundation/UIUtils', '>=0.0.9.3'

end

#
# Be sure to run `pod lib lint FHNavigationController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FHNavigationController'
  s.version          = '0.1.0'
  s.summary          = '自定义导航栏，支持全屏滑动返回，分类实现配置导航栏左右按钮以及title样式'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    自定义导航栏，支持每个控制器单独配置全屏返回，并设置左右按钮的样式以及title的样式
                       DESC

  s.homepage         = 'https://github.com/Africa802916/FHNavigationController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Africa802916' => 'zenghongfei@picooc.com' }
  s.source           = { :git => 'https://github.com/Africa802916/FHNavigationController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FHNavigationController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'FHNavigationController' => ['FHNavigationController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end

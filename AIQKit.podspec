#
# Be sure to run `pod lib lint AIQKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AIQKit'
  s.version          = '0.9.8'
  s.summary          = 'AIQ iOS Search SDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                       AIQ iOS Search SDK
                       * Search by Image
                       DESC

  s.homepage         = 'https://github.com/aiqtech/aiqkit-ios'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => "Commercial", :text => "http://aiq.tech/enterprise.php" }
  s.author           = { 'AIQ' => 'tech@aiq.tech' }
  s.source           = {  :git => "git@github.com/aiqtech/aiqkit-ios.git", :tag => s.version.to_s  }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.3'

  s.source_files = 'AIQKit/Classes/**/*'
  
  s.exclude_files = 'AIQKit/Assets/Info.plist'
  s.resource_bundles = { 'iQKitResources' => ['AIQKit/Assets/**/*'] }

  s.public_header_files = 'AIQKit/Classes/**/*.h'
  s.frameworks = 'AVFoundation', 'CoreLocation', 'CoreText', 'CoreData', 'QuartzCore'

  s.dependency 'NFAllocInit', '1.1.3'
  s.dependency 'SVProgressHUD', '~> 2.0'
  s.dependency 'SDWebImage', '4.4.1'
  s.dependency 'SBJson', '~> 5.0'
  s.dependency 'Masonry', '1.1.0'
  s.dependency 'OpenCV', '3.2.0'
  s.dependency 'FBSDKCoreKit', '~>4.14'
  s.dependency 'FBSDKLoginKit', '~>4.14'

end

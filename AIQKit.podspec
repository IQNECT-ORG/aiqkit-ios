Pod::Spec.new do |s|

  s.name         = "AIQKit"
  s.version      = "0.9.5"
  s.summary      = "Search by AIQ."
  s.description  = <<-DESC
                   Search by AIQ 

                   * text/keyword search
                   * image search
                   DESC
  s.homepage     = "https://github.com/iqnect-org/aiqkit-ios"
  s.license      = { :type => "Commercial", :text => "http://aiq.tech/enterprise.php#" }
  s.author        = "AIQ"

  s.platform     = :ios, "8.3"
  s.source       = { :git => "https://github.com/iqnect-org/aiqkit-ios.git", :tag => s.version.to_s }
  
  s.source_files = "AIQKit/include/iQKit/*.h"
  s.public_header_files = "AIQKit/include/iQKit/*.h"

  s.resources = "AIQKit/iQKitResources.bundle"
  s.vendored_libraries = 'AIQKit/libiQKit.a'
  s.frameworks = "AVFoundation", "CoreLocation", "CoreText", "CoreData", "QuartzCore"
  s.library  = "c++"
  s.requires_arc = true

  s.dependency 'NFAllocInit', '~> 1.0'
  s.dependency 'SVProgressHUD', '~> 2.0'
  s.dependency 'SDWebImage', '3.7.1'
  s.dependency 'SBJson', '~> 5.0'
  s.dependency 'Masonry'
  s.dependency 'OpenCV', '2.4.9'
  s.dependency 'FBSDKCoreKit'
  s.dependency 'FBSDKLoginKit'

end

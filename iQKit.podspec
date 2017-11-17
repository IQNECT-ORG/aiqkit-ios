Pod::Spec.new do |s|

  s.name         = "iQKit"
  s.version      = "0.9.3"
  s.summary      = "Search by iQNECT."
  s.description  = <<-DESC
                   Search by iQNECT

                   * text/keyword search
                   * image search
                   DESC
  s.homepage     = "https://github.com/iqnect-org/iqkit-ios"
  s.license      = { :type => "Commercial", :text => "http://iqnect.org/business/terms-and-conditions/" }
  s.author        = "iQNECT"

  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/iqnect-org/iqkit-ios.git", :tag => s.version.to_s }
  
  s.source_files = "iQKit/include/iQKit/*.h"
  s.public_header_files = "iQKit/include/iQKit/*.h"

  s.resources = "iQKit/iQKitResources.bundle"
  s.vendored_libraries = 'iQKit/libiQKit.a'
  s.frameworks = "AVFoundation", "CoreLocation", "CoreText", "CoreData", "QuartzCore"
  s.library  = "c++"
  s.requires_arc = true

  s.dependency 'NFAllocInit', '~> 1.0'
  s.dependency 'SVProgressHUD', '~> 2.0'
  s.dependency 'SDWebImage', '3.7.1'
  s.dependency 'SBJson', '~> 5.0'
  s.dependency 'Masonry'
  s.dependency 'OpenCV', '2.4.9'

end

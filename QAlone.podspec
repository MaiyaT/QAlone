#
# Be sure to run `pod lib lint QAlone.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QAlone'
  s.version          = '0.1.1'
  s.summary          = 'q shell common'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'yh q shell common'

  s.homepage         = 'https://gitee.com/lnn/QAlone'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lnn' => '763465697@qq.com' }
  s.source           = { :git => 'https://gitee.com/lnn/QAlone.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'QAlone/Classes/**/*'
  
  s.resource_bundles = {
    'QAlone' => ['QAlone/Assets/**/*']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'WebKit', 'Foundation'
  
  s.prefix_header_contents = '#import "QAlone.h"'
  
  s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'GVUserDefaults'
  s.dependency 'YYKit'
  s.dependency 'LKDBHelper'
    
  s.dependency 'TZImagePickerController'
  s.dependency 'AFNetworking'
    
  s.dependency 'Masonry'
  s.dependency 'SVProgressHUD'
  s.dependency 'Toast'
  s.dependency 'DZNEmptyDataSet'
  s.dependency 'MJRefresh'
  s.dependency 'KVOController'
    
  s.dependency 'UITableView+FDTemplateLayoutCell'
  s.dependency 'FDFullscreenPopGesture'
    
  s.dependency 'SDWebImage', '~> 4.0.0'
  s.dependency 'SDWebImage/GIF'
    
  s.dependency 'AVOSCloud'
  s.dependency 'AXPracticalHUD'
  s.dependency 'AXNavigationBackItemInjection'
  s.dependency 'NJKWebViewProgress'
  s.dependency 'Aspects'
end

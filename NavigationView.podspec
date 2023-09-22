#
# Be sure to run `pod lib lint NavigationView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NavigationView'
  s.version          = '1.1.0'
  s.summary          = '自定义系统导航条'

  s.description      = <<-DESC
  支持iOS 12+ 系统
  支持Swift4.2+
  导航条右侧支持多个按钮
  隐藏系统导航条
  使用自定义导航条
                       DESC

  s.homepage         = 'https://github.com/chaopengCoder/NavigationView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'cpcoder' => 'chaopeng_coder@qq.com' }
  
  s.source           = { :git => 'https://github.com/chaopengCoder/NavigationView.git', :tag => s.version.to_s }
  
  s.swift_version = '4.2'
  s.ios.deployment_target = '12.0'
  s.source_files = 'NavigationView/Classes/**/*'
  
  s.resource_bundles = {
      'NavigationView' => ['NavigationView/Assets/*']
  }
  
end

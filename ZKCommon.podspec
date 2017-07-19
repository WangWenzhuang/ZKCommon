Pod::Spec.new do |s|
  s.name = 'ZKCommon'
  s.version = '1.6'
  s.ios.deployment_target = '8.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = '我自己常用的扩展、工具等...'
  s.homepage = 'https://github.com/WangWenzhuang/ZKCommon'
  s.authors = { 'WangWenzhuang' => '1020304029@qq.com' }
  s.source = { :git => 'https://github.com/WangWenzhuang/ZKCommon.git', :tag => s.version }
  s.description = 'ZKCommon 是我工作中常用的扩展、工具等。做成库方便使用。'
  s.source_files = 'ZKCommon/**/*.swift'
  s.requires_arc = true
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0' }
  s.dependency 'FMDB', '~> 2.6.2'
  s.dependency 'Alamofire', '~> 4.5.0'
  s.dependency 'SwiftyJSON', '~> 3.1.4'
  s.dependency 'ZKProgressHUD', '~> 1.5'
  s.dependency 'ZKAlertViewSwift', '~> 1.0.2'
  s.dependency 'ZKStatusBarNotification', '~> 1.1'
end

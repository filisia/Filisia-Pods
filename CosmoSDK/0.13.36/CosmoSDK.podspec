Pod::Spec.new do |s|
  s.name             = 'CosmoSDK'
  s.version          = '0.13.36'
  s.summary          = 'This is the SDK with which you control the bluetooth connection and the cosmo devices.'
  
  s.homepage         = 'https://github.com/filisia/CosmoSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'abinop' => 'abinop@gmail.com' }
  s.source           = { :git => 'https://github.com/filisia/CosmoSDK.git', :tag => s.version.to_s }
    
  s.ios.deployment_target = '15.0'
  s.swift_versions = ['5.0']

  s.source_files = 'CosmoSDK/Classes/**/*.swift'
  
  s.frameworks = 'CoreBluetooth'
  
  s.dependency 'iOSDFULibrary', '~> 4.15.3'
  s.dependency 'ZIPFoundation', '~> 0.9.19'
  s.dependency 'Alamofire', '~> 5.9'

  s.pod_target_xcconfig = {
    'SWIFT_VERSION' => '5.0',
    'IPHONEOS_DEPLOYMENT_TARGET' => '15.0'
  }
  s.user_target_xcconfig = { 'IPHONEOS_DEPLOYMENT_TARGET' => '15.0' }
  
  s.compiler_flags = '-Xfrontend -debug-time-function-bodies'
end

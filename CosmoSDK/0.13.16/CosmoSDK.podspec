#
# Be sure to run `pod lib lint CosmoSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CosmoSDK'
  s.version          = '0.13.16'
  s.summary          = 'This is the SDK with which you control the bluetooth connection and the cosmo devices.'

#TODO: Add long description of the pod here.

  s.homepage         = 'https://github.com/filisia/CosmoSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sonic555gr' => 'sonic555gr@gmail.com' }
  s.source           = { :git => 'https://github.com/filisia/CosmoSDK.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  s.ios.deployment_target = '14.0'

  s.source_files = 'CosmoSDK/Classes/**/*'
  
  s.dependency 'iOSDFULibrary', '~> 4.13.0'
  s.dependency 'ZIPFoundation', '~> 0.9.11'
  s.dependency 'Alamofire', '~> 5.4.0'
  
  s.pod_target_xcconfig = { 'IPHONEOS_DEPLOYMENT_TARGET' => '14.0' }
  s.user_target_xcconfig = { 'IPHONEOS_DEPLOYMENT_TARGET' => '14.0' }

end

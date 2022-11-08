#
# Be sure to run `pod lib lint CosmoSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CosmoSDK'
  s.version          = '0.13.05'
  s.summary          = 'This is the SDK with which you control the bluetooth connection and the cosmo devices.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

#s.description      = <<-DESC
#TODO: Add long description of the pod here.
#                      DESC

  s.homepage         = 'https://github.com/filisia/CosmoSDK'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'sonic555gr' => 'sonic555gr@gmail.com' }
  s.source           = { :git => 'git@github.com:filisia/CosmoSDK.git', :tag => s.version.to_s }
  s.swift_version    = '5.0'
  s.ios.deployment_target = '11.0'

  s.source_files = 'CosmoSDK/Classes/**/*'
  
  s.dependency 'iOSDFULibrary', '= 4.11.0'
  s.dependency 'Alamofire', '~> 4.9.0'

end

Pod::Spec.new do |s|
  s.name             = 'CosmoCore'
  s.version          = '0.9.15'
  s.summary          = 'Core protocols and data structures for Cosmo'

#TODO: Add long description of the pod here.

  s.homepage         = 'https://github.com/filisia/CosmoCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alkiviadis Papadakis' => 'sonic555gr@gmail.com' }
  s.source           = { :git => 'git@github.com:filisia/CosmoCore.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '5.0'
  s.source_files = 'CosmoCore/Classes/**/*'
end

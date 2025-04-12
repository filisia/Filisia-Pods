Pod::Spec.new do |s|
    s.name             = 'CosmoCore'
    s.version          = '0.9.18'
    s.summary          = 'Core protocols and data structures for Cosmo'
    s.description      = 'Core protocols and data structures for Cosmo. This pod provides essential components for Cosmo-related development.'
    s.homepage         = 'https://github.com/filisia/CosmoCore'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Alexandros Binopoulos' => 'alexandros@filisia.com' }
    s.source = { :git => "https://github.com/filisia/CosmoCore.git", :tag => s.version.to_s }
    
    s.ios.deployment_target = '14.0'
    s.swift_version = '5.0'
    #  s.source_files = 'CosmoCore/Classes/**/*'
    s.source_files = 'CosmoCore/**/*.{swift,h,m}'
    
end

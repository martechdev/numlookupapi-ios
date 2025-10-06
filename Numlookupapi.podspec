Pod::Spec.new do |s|
  s.name             = 'Numlookupapi'
  s.version          = '0.1.0'
  s.summary          = 'Swift client for numlookupapi.com API.'
  s.description      = 'Phone validation lookups. See https://numlookupapi.com/docs/'
  s.homepage         = 'https://numlookupapi.com'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'EverAPI' => 'support@numlookupapi.com' }
  s.source           = { :git => 'https://github.com/martechdev/numlookupapi-ios.git', :tag => s.version.to_s }
  s.swift_version    = '5.9'
  s.ios.deployment_target = '12.0'
  s.macos.deployment_target = '10.15'
  s.source_files     = 'Sources/**/*.{swift}'
  s.frameworks       = 'Foundation'
end

Pod::Spec.new do |s|
	s.name = "ZappPlugins"
	s.version = "11.6.2"
	s.platform = :ios
	s.ios.deployment_target = "10.0"
	s.summary = "ZappPlugins"
	s.description = "Zapp Plugins store Protocol and Managers that relevant for Applicaster Zapp Plugin System"
	s.homepage = "https://applicaster.com"
	s.license = ''
	s.author = "Applicaster LTD."
	s.source = {
		 :git => 'git@github.com:applicaster/ZappPlugins.2.0-iOS.git',
		 :tag => s.version.to_s
  }
	s.frameworks = 'AVFoundation'

	s.source_files  = 'ZappPlugins/**/*.{h,m,swift}'

	s.xcconfig = {  'ENABLE_BITCODE' => 'YES',
				    'SWIFT_VERSION' => '5.1',
				    'ENABLE_TESTABILITY' => 'YES',
				    'OTHER_CFLAGS'  => '-fembed-bitcode'
							 }

	s.dependency 'ZappCore'

end

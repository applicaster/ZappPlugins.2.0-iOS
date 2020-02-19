Pod::Spec.new do |s|
	s.name = "__framework_name__"
	s.version = "__version__"
	s.ios.deployment_target = "__ios_platform_version__"

	s.summary = "__framework_name__"
	s.description = "Zapp Plugins store Protocol and Managers that relevant for Applicaster Zapp Plugin System"
	s.homepage = "https://applicaster.com"
	s.license = ''
	s.author = "Applicaster LTD."
	s.source       = {
		:git => 'git@github.com:applicaster/ZappPlugins.2.0-iOS.git',
		:tag => s.version.to_s
  }

	s.frameworks = 'AVFoundation'
	s.source_files  = 'ZappPlugins/**/*.{h,m,swift}'
	s.xcconfig = { 'ENABLE_BITCODE' => 'YES',
				   'SWIFT_VERSION' => '__swift_version__',
				   'ENABLE_TESTABILITY' => 'YES',
				   'OTHER_CFLAGS'  => '-fembed-bitcode' }

	s.dependency 'ZappCore'

end

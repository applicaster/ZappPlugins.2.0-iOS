Pod::Spec.new do |s|
	s.name = "__framework_name__"
	s.version = "__version__"
	s.platforms = { 
		:ios => "__ios_platform_version__", 
		:tvos => "__tvos_platform_version__" 
	}
	s.summary = "__framework_name__"
	s.description = "Zapp Plugins store Protocol and Managers that relevant for Applicaster Zapp Plugin System"
	s.homepage = "https://applicaster.com"
	s.license = ''
	s.author = "Applicaster LTD."
	s.source       = {
		:git => 'git@github.com:applicaster/__framework_name__.2.0-iOS.git',
		:tag => s.version.to_s
  	}

	s.ios.source_files  = '__framework_name__/**/*.{h,m,swift}'
	s.tvos.source_files  = [
		'__framework_name__/ZappHelpers/**/Universal/**/*.{h,m,swift}',
		'__framework_name__/**/ZPJsonSerializableProtocol.swift',
		'__framework_name__/**/ZPAnalyticsProviderProtocol.swift'
	]
	s.frameworks = 'AVFoundation'
	s.xcconfig = { 'ENABLE_BITCODE' => 'YES',
				   'SWIFT_VERSION' => '__swift_version__',
				   'ENABLE_TESTABILITY' => 'YES',
				   'OTHER_CFLAGS'  => '-fembed-bitcode' }

	s.dependency 'ZappCore'

end

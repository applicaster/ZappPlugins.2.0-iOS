use_frameworks!

source 'git@github.com:applicaster/CocoaPods.git'
source 'git@github.com:applicaster/CocoaPods-Private.git'
source 'git@github.com:applicaster/AppleApplicasterFrameworks.git'
source 'https://cdn.cocoapods.org/'

target 'ZappPlugins' do
  platform :ios, '10.0'
  pod 'ZappCore', :git => 'https://github.com/applicaster/AppleApplicasterFrameworks.git', :branch => 'master'

    target 'ZappPluginsTests' do
      pod 'Cuckoo', '= 1.0.6'
    end
end

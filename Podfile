platform :ios, '13.0'

target 'TestApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TestApp
  pod 'SwiftLint'


  # Rx
  pod 'RxSwift', '6.2.0'
  pod 'RxCocoa', '6.2.0'

  # Needle
  pod 'NeedleFoundation'

end

post_install do |installer|
 installer.pods_project.build_configurations.each do |config|
  config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = ''
 end
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13'
  end
 end
 installer.pods_project.build_configurations.each do |config|
  config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
 end
end
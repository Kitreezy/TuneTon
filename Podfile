
platform :ios, '15.0'
use_frameworks!

target 'TuneTon' do
  pod 'Alamofire'
  

end

#Fix Error 'DT_TOOLCHAIN_DIR....
post_install do |installer|
      installer.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
          xcconfig_path = config.base_configuration_reference.real_path
          xcconfig = File.read(xcconfig_path)
          xcconfig_mod = xcconfig.gsub(/DT_TOOLCHAIN_DIR/, "TOOLCHAIN_DIR")
          File.open(xcconfig_path, "w") { |file| file << xcconfig_mod }
          end
      end
  end
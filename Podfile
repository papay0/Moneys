# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def common_pods
  pod 'RIBs', '~> 0.9.0'
  pod 'SnapKit', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'

  pod 'Firebase/Core'
end

target 'Moneys' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  common_pods

  target 'MoneysTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MoneysUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'NewsApp' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # ignore all warnings from all pods
  inhibit_all_warnings!

  # Pods for NewsApp

  # DI
  pod 'Swinject'
  pod 'SwinjectStoryboard'
  
  # Network
  pod 'Himotoki'
  pod 'Alamofire'
  
  # Rx
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxOptional'
  
  target 'NewsAppTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NewsAppUITests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
  end

end

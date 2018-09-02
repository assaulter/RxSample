platform :ios, '11.4'
use_frameworks!

project 'RxSample.xcodeproj'

def rx_pod    
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
end

def rx_testing_pod
    pod 'RxBlocking', '~> 4.0'
    pod 'RxTest',     '~> 4.0'
end

def networking_pod
    pod 'Moya/RxSwift', '~> 11.0'
    pod 'Alamofire', '~> 4.7'
end

target 'RxSample' do project 'RxSample.xcodeproj'
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  # Pods for Renosy
  rx_pod
  networking_pod
end

# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'
inhibit_all_warnings!
use_frameworks!

ENV["APP_NAME"] = ENV["APP_NAME"] || "SwiftHeroesLive"

def app_pods
  core_pods
  pod 'Alamofire'
end

def core_pods
  pod 'RxSwift'
end

target 'Core' do
  core_pods
end

target "#{ENV["APP_NAME"]}" do
  app_pods
end

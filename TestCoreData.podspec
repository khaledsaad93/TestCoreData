#
#  Be sure to run `pod spec lint TestCoreData.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

spec.name         = 'TestCoreData'
spec.requires_arc = true
spec.version      = '0.0.8'
spec.summary      = 'Test A CocaPod Library written in swift to share Auth between our Applications'
spec.description  = 'Test CocoaPods library helps us to use Test in Test and Test - VFAuthKeyCloak A CocaPod Library written in swift to share Auth between our Applications'

spec.homepage     = 'https://github.com/khaledsaad93/TestCoreData.git'
spec.license      = { :type => "MIT", :file => "LICENSE" }
spec.author       = { "VodafoneEgypt" => "k.m.saad@outlook.com" }

# spec.resource  = "icon.png"
spec.resources = "TestPod/Resources/*.xcdatamodel"

spec.ios.deployment_target = '10.0'
spec.source_files  = "TestPod/**/*.{h,m,swift,xcdatamodel}"

spec.resource_bundles = {
    'VFAuthKeyCloak' => ['TestPod/Resource/CoreDataModel.xcdatamodeld']
}

spec.frameworks = 'CoreData', 'Foundation'

spec.source       = { :git => 'https://github.com/khaledsaad93/TestCoreData.git', :tag => spec.version }

spec.requires_arc = true

end


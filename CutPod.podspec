#
#  Be sure to run `pod spec lint CutPod.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name         = "CutDemo"
s.version      = "1.0.0"
s.ios.deployment_target = '7.0'
s.summary      = "A delightful setting interface framework."
s.homepage     = "https://github.com/diankuanghuolong/CutPod"
s.license              = { :type => "MIT", :file => "LICENSE" }
s.author             = { "diankuanghuolong" => "3243388139@qq.com" }
s.source       = { :git => "https://github.com/diankuanghuolong/CutPod.git", :tag => s.version }
s.source_files  = "CutPodSource/*.{h,m}"
s.requires_arc = true
end

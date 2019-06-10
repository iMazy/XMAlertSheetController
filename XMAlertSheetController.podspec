#
#  Be sure to run `pod spec lint XMAlertSheetController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "XMAlertSheetController"
  s.version      = "1.0.1"
  s.summary      = "A alert sheet like sub type alertSheet of UIAlertViewController "

  s.description  = "XMAlertSheetController is a Swift library that provides a custom action sheet. It will give the users a fancy experience without taking pains coding the cool animation. Hokusai is compatible with Swift4."

  s.homepage     = "https://github.com/iMazy/XMAlertSheetController"

  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Mazy" => "mazy_ios@163.com" }

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/iMazy/XMAlertSheetController.git", :tag => "#{s.version}" }

  s.source_files  = "XMAlertSheetController/AlertSheet/*"
    s.resource_bundles = {
        'XMAlertSheetController' => ['XMAlertSheetController/AlertSheet/*.xib']
    }
 s.swift_version = '4.0'
s.framework  = "UIKit"
s.requires_arc = true
end

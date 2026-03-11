#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint aliyun_face_plugin.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'aliyun_face_plugin'
  s.version          = '0.0.3'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # 静态库模式
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386'
  }

  # -ObjC 确保 category 加载；force_load 仅针对包含 category 的关键 framework
  # PODS_TARGET_SRCROOT 指向本 pod 的源码目录（即 ios/）
  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC' \
      ' -force_load "$(PODS_TARGET_SRCROOT)/Products/DTFUtility.framework/DTFUtility"' \
      ' -force_load "$(PODS_TARGET_SRCROOT)/Products/AliyunFaceAuthFacade.framework/AliyunFaceAuthFacade"' \
      ' -force_load "$(PODS_TARGET_SRCROOT)/Products/DTFIdentityManager.framework/DTFIdentityManager"'
  }

  # 实人认证SDK framework库
  s.vendored_frameworks = 'Products/*.framework'

  # 系统framework库
  s.frameworks = 'CoreGraphics', 'Accelerate', 'SystemConfiguration', 'AssetsLibrary',
                'CoreTelephony', 'QuartzCore', 'CoreFoundation', 'CoreLocation',
                'ImageIO', 'CoreMedia', 'CoreMotion', 'AVFoundation', 'WebKit',
                'AudioToolbox', 'CFNetwork', 'MobileCoreServices', 'AdSupport', 'ReplayKit'
  # 系统C库
  s.libraries = 'resolv', 'z', 'c++', 'c++.1', 'c++abi', 'z.1.2.8'

end

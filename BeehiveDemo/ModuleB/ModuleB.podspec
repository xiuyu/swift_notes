#
# Be sure to run `pod lib lint ModuleB.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ModuleB'
  s.version          = '0.1.0'
  s.summary          = '随便一个说明'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  随便一个说明
                       DESC

  s.homepage         = 'https://github.com/1241375380@qq.com/ModuleB'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '1241375380@qq.com' => '1241375380@qq.com' }
  s.source           = { :git => 'https://github.com/1241375380@qq.com/ModuleB.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ModuleB/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ModuleB' => ['ModuleB/Assets/*.png']
  # }

  s.dependency 'ModuleNetwork'
  s.dependency 'ModuleProtocol'

end

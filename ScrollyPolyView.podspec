Pod::Spec.new do |s|
  s.name             = 'ScrollyPolyView'
  s.version          = '0.1.0'
  s.summary          = 'A UIView subclass for scrollable masks'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ScrollyPoly is a simple UIView subclass that creates a scrollable mask
                       DESC

  s.homepage         = 'https://github.com/mikekavouras/ScrollyPolyView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mike Kavouras' => 'kavourasm@gmail.com' }
  s.source           = { :git => 'https://github.com/mikekavouras/ScrollyPolyView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'ScrollyPolyView/Classes/**/*'
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # s.resource_bundles = {
  #   'ScrollyPolyView' => ['ScrollyPolyView/Assets/*.png']
  # }
end

Pod::Spec.new do |s|
  s.name             = "CVKHierarchySearcher"
  s.version          = "0.2.0"
  s.summary          = "Helper for important objects in view controller hierarchy."
  s.description      = <<-DESC
                       Helper class to access topmost view controllers of different kind
                       in current hierarchy. Uses app's window and iterates down from it.

                       Implements a protocol to ease its mocking in tests.
                       DESC
  s.homepage         = "https://github.com/coverback/CVKHierarchySearcher"
  s.license          = 'MIT'
  s.author           = { "Romans Karpelcevs" => "karpelcev@gmail.com" }
  s.source           = { :git => "https://github.com/coverback/CVKHierarchySearcher.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/cvbk'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.frameworks = 'UIKit'
end

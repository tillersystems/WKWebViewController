Pod::Spec.new do |s|
  s.name             = 'WKWebViewController'
  s.module_name      = 'WKWebViewController'
  s.version          = "1.4.0"

  s.summary          = "An UIViewController with WKWebView inside."
  s.description      = "WKWebViewController is an UIViewController with WKWebView inside."

  s.author           = 'Elias Abel'
  s.social_media_url = 'https://meniny.cn/'
  s.homepage         = "https://github.com/Meniny/WKWebViewController"
  s.license          = { :type => "MIT", :file => "LICENSE.md" }

  s.requires_arc     = true
  s.swift_version = ['4.2', '5.0']
  s.ios.deployment_target = "9.0"

  s.source_files     = "WKWebViewController/**/*.swift"
  s.resources        = "WKWebViewController/Assets.xcassets"
  s.source           = { :git => "https://github.com/Meniny/WKWebViewController.git", :tag => s.version.to_s }

  s.dependency         "JustLayout"

end

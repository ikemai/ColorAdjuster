Pod::Spec.new do |s|
  s.name         = "ColorAdjuster"
  s.version      = "0.1.2"
  s.summary      = "ColorAdjuster is the library which can create a new color by HBS or RGB for the cause in base color, and create gradation view."
  s.homepage     = "https://github.com/ikemai/ColorAdjuster"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "ikemai" => "ikeda_mai@cyberagent.co.jp" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/ikemai/ColorAdjuster.git", :tag => s.version.to_s }
  s.source_files  = "ColorAdjuster/**/*.{h,swift}"
  s.requires_arc = true
  s.frameworks = "UIKit"
end
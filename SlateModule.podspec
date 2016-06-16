
Pod::Spec.new do |s|

  s.name         = "SlateModule"
  s.version      = "3.4.2.1"
  s.summary      = "SlateModule"


  s.description  = <<-DESC
       SlateConstants   
  
                   DESC

  s.homepage     = "https://github.com/islate/SlateModule"
  s.license      = "Apache 2.0"
  s.author       = { "linyize" => "linyize@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/islate/SlateModule.git", :branch => "master" }

  s.source_files = 'SlateModule/*.{h,m}'

end

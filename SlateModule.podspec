
Pod::Spec.new do |s|

  s.name         = "SlateModule"
  s.version      = "3.4.2.1"
  s.summary      = "Split UIAppDelegate into modules."


  s.description  = <<-DESC
       Divide UIAppDelegate into modules.   
  
                   DESC

  s.homepage     = "https://github.com/islate/SlateModule"
  s.license      = "Apache 2.0"
  s.author       = { "linyize" => "linyize@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/islate/SlateModule.git", :tag => s.version.to_s }

  s.source_files = 'SlateModule/*.{h,m}'

end

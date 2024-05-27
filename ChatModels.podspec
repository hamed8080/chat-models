Pod::Spec.new do |s|
  s.name         = "ChatModels"
  s.version      = "2.0.1"
  s.summary      = "ChatModels"
  s.description  = "A package, full of models that are building blocks of Chat SDK."
  s.homepage     = "https://pubgi.sandpod.ir/chat/ios/chat-models"
  s.license      = "MIT"
  s.author       = { "Hamed Hosseini" => "hamed8080@gmail.com" }
  s.platform     = :ios, "10.0"
  s.swift_versions = "4.0"
  s.source       = { :git => "https://pubgi.sandpod.ir/chat/ios/chat-models", :tag => s.version }
  s.source_files = "Sources/ChatModels/**/*.{h,swift,xcdatamodeld,m,momd}"
  s.frameworks  = "Foundation"
end

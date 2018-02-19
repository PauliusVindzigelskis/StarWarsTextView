

Pod::Spec.new do |s|
  s.name             = 'StarWarsTextView'
  s.version          = '0.9.1'
  s.summary          = 'Shows Star Wars intro style Text View'
  s.swift_version    = '4.0'
  s.description      = <<-DESC
Did You ever thought how cool would be to show Star Wars intro running text in your app? It is now possible more than ever! Join the war between white and black pew pew soldiers and emerge into fantasy world of Star Wars!
                       DESC

  s.homepage         = 'https://github.com/PauliusVindzigelskis/StarWarsTextView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paulius Vindzigelskis' => 'p.vindzigelskis@gmail.com' }
  s.source           = { :git => 'https://github.com/PauliusVindzigelskis/StarWarsTextView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Library/*.swift'
  
  s.resources  = 'Library/*.otf'

  s.frameworks = 'UIKit'

end

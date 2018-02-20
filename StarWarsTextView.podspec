Pod::Spec.new do |s|
  s.name             = 'StarWarsTextView'
  s.version          = '1.0.0'
  s.summary          = 'Shows Star Wars intro style Text View'
  s.swift_version    = '4.0'
  s.description      = <<-DESC
Did You ever thought how cool would be to show Star Wars intro running text in your app? It is now possible more than ever! Join the war between white and black pew pew soldiers and emerge into fantasy world of Star Wars!
                       DESC

  s.homepage         = 'https://github.com/PauliusVindzigelskis/StarWarsTextView'
  s.screenshots     = 'https://user-images.githubusercontent.com/2383901/36440790-2e790c5c-1636-11e8-89ae-87726b30f98c.png', 'https://user-images.githubusercontent.com/2383901/36433632-910386e0-1622-11e8-8915-4e68ae656fd0.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Paulius Vindzigelskis' => 'p.vindzigelskis@gmail.com' }
  s.source           = { :git => 'https://github.com/PauliusVindzigelskis/StarWarsTextView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Library/*.swift'
  
  s.resources  = 'Library/*.otf'

  s.frameworks = 'UIKit'

end

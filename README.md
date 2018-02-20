# StarWarsTextView

Subclass of UITextView to present Star Wars style credits. 
Includes original Star Wars font (News Gothic) and animation API to crawl from top to bottom slowly.

<b><i>Note:</i></b> Suggested to setup through Xib/Storyboard as CALayer transformations will disrupt AutoLayout constraints. IBDesginables might help adjust view in screen

## Podfile (for use with Cocoapods)
`pod 'StarWarsTextView' `

## API

Initilize via code or XIB/Storyboard

### Public Properties
    public static func starWarsFont() -> UIFont
    
    public weak var starWarsDelegate:StarWarsTextViewDelegate? = nil
    public var scrollingSpeed:CGFloat = 10
    public var animationStepsInterval:TimeInterval = 0.2
    public var inclinationRatio:CGFloat = 3.0
    public var xAngle:CGFloat = 45.0

### Public Functions

    public func scrollToTop(animated:Bool = false)
    public func animateScrolling()

## Demo
<img width="160" alt="simulator screen shot - iphone se - 2018-02-20 at 12 02 43" src="https://user-images.githubusercontent.com/2383901/36440789-2e6d45a2-1636-11e8-88d4-0a595d786104.png"> <img width="160" alt="simulator screen shot - iphone se - 2018-02-20 at 12 02 36" src="https://user-images.githubusercontent.com/2383901/36440790-2e790c5c-1636-11e8-89ae-87726b30f98c.png">


![starwarsdemo2](https://user-images.githubusercontent.com/2383901/36433632-910386e0-1622-11e8-8915-4e68ae656fd0.gif)

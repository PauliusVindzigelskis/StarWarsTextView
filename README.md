# StarWarsTextView

Subclass of UITextView to present Star Wars style credits. 
Includes original Star Wars font (News Gothic) and animation API to crawl from top to bottom slowly.

<b><i>Note:</i></b> Suggested to setup through Xib/Storyboard as CALayer transformations will disrupt AutoLayout constrainted frames. IBDesginables might help adjust view in screen

## Podfile (for use with Cocoapods)
`pod 'StarWarsTextView' `

## API

Initilize via code or XIB/Storyboard

### Delegate

    protocol StarWarsTextViewDelegate : NSObjectProtocol
    {
        optional func starWarsTextViewDidStartScrolling(_ textView:StarWarsTextView)
        optional func starWarsTextViewDidFinishScrolling(_ textView:StarWarsTextView)
    }

### Public Properties
    public static func starWarsFont() -> UIFont
    
    public weak var starWarsDelegate: StarWarsTextViewDelegate?
    public var scrollingSpeed: CGFloat
    public var animationStepsInterval: TimeInterval
    public var inclinationRatio: CGFloat
    public var xAngle: CGFloat
    public var isCrawling: Bool

### Public Functions

    public func scrollToTop(animated: Bool = false)
    public func startCrawlingAnimation()
    public func stopCrawlingAnimation()

## Demo
<img width="160" alt="simulator screen shot - iphone se - 2018-02-20 at 12 02 43" src="https://user-images.githubusercontent.com/2383901/36440789-2e6d45a2-1636-11e8-88d4-0a595d786104.png"> <img width="160" alt="simulator screen shot - iphone se - 2018-02-20 at 12 02 36" src="https://user-images.githubusercontent.com/2383901/36440790-2e790c5c-1636-11e8-89ae-87726b30f98c.png">


![starwarsdemo2](https://user-images.githubusercontent.com/2383901/36433632-910386e0-1622-11e8-8915-4e68ae656fd0.gif)

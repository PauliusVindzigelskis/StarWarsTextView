# StarWarsTextView

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
![starwarsdemo2](https://user-images.githubusercontent.com/2383901/36433632-910386e0-1622-11e8-8915-4e68ae656fd0.gif)

//
//  StarWarsTextView.swift
//  StarWarsView
//
//  Created by Vindzigelskis, Paulius on 2/16/18.
//  Copyright © 2018 New Guy Studio. All rights reserved.
//

import UIKit

@objc public protocol StarWarsTextViewDelegate : NSObjectProtocol
{
    /**
     The animation of scrolling just started
     */
    @objc optional func starWarsTextViewDidStartCrawling(_ textView:StarWarsTextView)
    
    /**
     The animation of scrolling did end
     */
    @objc optional func starWarsTextViewDidFinishCrawling(_ textView:StarWarsTextView)
}

@IBDesignable
open class StarWarsTextView : UITextView
{
    /**
     The delegate to respond of StarWars Text View notifications
     */
    public weak var starWarsDelegate:StarWarsTextViewDelegate? = nil
    
    /**
     The speed of scrolling animation
     */
    public var scrollingSpeed:CGFloat = 10
    
    /**
     Interval between recalculation of animation
     */
    public var animationStepsInterval:TimeInterval = 0.2
    
    /**
     The higher ratio, the more wide the bottom and narrow top.
     
     Note: As transformation is added to view's layer, Your Auto Layout constraints might not make sense any more. Make adjustments accordingly
     */
    public var inclinationRatio:CGFloat = 3.0
    
    /**
     The angle of x Axis from viewer screen
     */
    public var xAngle:CGFloat = 45.0
    
    /**
     Indication whether scrolling is animating right now
     */
    public var isCrawling:Bool
    {
        return self.scrollingTimer != nil
    }
    
    // MARK:- Class API
    
    /**
     Original font used in Star Wars movies
     */
    public static func starWarsFont() -> UIFont
    {
        if !StarWarsTextView.isFontRegistered
        {
            let bundle = Bundle(for: StarWarsTextView.self)
            StarWarsTextView.isFontRegistered = UIFont.registerFont(bundle:bundle, fontName: "NewsGothicStd-Bold", fontExtension: "otf")
        }
        let font = UIFont(name: "News Gothic Std", size: 17)
        return font!
    }
    
    // MARK:- Instance API
    
    public override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    /**
     Sets content offset to be on top (minus top inset)
     
     - parameter animated: whether to scroll with animation or not
     */
    public func scrollToTop(animated:Bool = false)
    {
        let initialPoint = CGPoint(x: 0, y: -self.contentInset.top)
        self.setContentOffset(initialPoint, animated: animated)
    }
    
    /**
     Begins crawling animation
     */
    public func startCrawlingAnimation()
    {
        // Notify delegate
        self.starWarsDelegate?.starWarsTextViewDidStartCrawling?(self)
        
        scrollingTimer = Timer.scheduledTimer(withTimeInterval: animationStepsInterval, repeats: true, block: { (timer) in
            let repeatInterval:CGFloat = CGFloat(timer.timeInterval)
            
            var scrollPoint = self.contentOffset
            if scrollPoint.y >= self.contentSize.height
            {
                // stop timer and scrolling
                timer.invalidate()
                
                // Notify delegate
                self.starWarsDelegate?.starWarsTextViewDidFinishCrawling?(self)
            } else {
                
                scrollPoint.y += self.scrollingSpeed * repeatInterval
                self.setContentOffset(scrollPoint, animated: true)
            }
        })
    }
    
    /**
     Stops crawling animation if animation present
     */
    public func stopCrawlingAnimation()
    {
        let shouldNotifyDelegate = self.isCrawling
        self.scrollingTimer?.invalidate()
        if shouldNotifyDelegate
        {
            self.starWarsDelegate?.starWarsTextViewDidFinishCrawling?(self)
        }
    }
    
    // MARK:- View lifecycle
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        // Setup insets
        
        let angleRatio:CGFloat = xAngle / 180.0
        let newInset = self.frame.size.height * (1-angleRatio)
        var insets = self.contentInset
        if newInset != insets.top
        {
            insets.top = newInset
            insets.bottom = newInset
            self.contentInset = insets
        }
    }
    
    // MARK:- Internal API
    private weak var scrollingTimer:Timer?
    private static var isFontRegistered:Bool = false
    
    private func setupView()
    {
        var transform:CATransform3D =  CATransform3DIdentity
        transform.m34 = -self.inclinationRatio / 500.0;
        transform = CATransform3DRotate(transform, xAngle * CGFloat.pi / 180.0, 1.0, 0.0, 0.0);
        self.layer.transform = transform
        
        let fontSize = self.font?.pointSize ?? 12
        self.font = StarWarsTextView.starWarsFont().withSize(fontSize)
    }
}

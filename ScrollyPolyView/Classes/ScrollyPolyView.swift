//
//  ScrollyPolyView.swift
//  ScrollyPolyView 
//
//  Created by Mike Kavouras on 6/5/16.
//  Copyright © 2016 Mike Kavouras. All rights reserved.
//

import UIKit

open class ScrollyPolyView: UIView, UIScrollViewDelegate {
    
    open var masks: [UIView] = [UIView]() {
        didSet {
            resetMasks()
        }
    }
    open let scrollLayer = CAScrollLayer()
    open var offset: CGPoint {
        return scrollView.contentOffset
    }

    fileprivate let scrollView = UIScrollView()
    fileprivate let scrollLayerContainer = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    fileprivate func setup() {
        addSubview(scrollLayerContainer)
        scrollLayerContainer.layer.addSublayer(scrollLayer)
        
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        addSubview(scrollView)
    }
    
    override open func layoutSubviews() {
        scrollView.frame = bounds
        scrollView.contentSize = bounds.size
        scrollView.contentSize.width = bounds.size.width * CGFloat(masks.count)
        
        scrollLayerContainer.frame = bounds
        scrollLayer.frame = bounds
        scrollLayer.frame.size = scrollView.contentSize
        
        for (idx, subview) in scrollView.subviews.enumerated() {
            subview.frame = bounds
            subview.frame.origin.x = CGFloat(idx) * bounds.size.width
        }
        
        for (idx, sublayer) in (scrollLayer.sublayers ?? []).enumerated() {
            sublayer.frame = bounds
            sublayer.frame.origin.x = CGFloat(idx) * bounds.size.width
        }
        
        super.layoutSubviews()
    }
    
    fileprivate func resetMasks() {
        for subview in scrollView.subviews {
            subview.removeFromSuperview() // TODO: be more selective
        }
        
        for sublayer in scrollLayer.sublayers ?? [] {
            sublayer.removeFromSuperlayer()
        }
        
        for mask in masks {
            scrollView.addSubview(UIView())
            scrollLayer.addSublayer(mask.layer)
        }
        
        setNeedsLayout()
    }
    
    // MARK: UIScrollViewDelegate
    
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {
        CATransaction.begin()
        CATransaction.setValue(0.0, forKey: kCATransactionAnimationDuration)
        scrollLayer.scroll(to: scrollView.contentOffset)
        CATransaction.commit()
    }
}

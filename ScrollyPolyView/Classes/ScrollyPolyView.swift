//
//  ScrollyPolyView.swift
//  ScrollyPolyView 
//
//  Created by Mike Kavouras on 6/5/16.
//  Copyright © 2016 Mike Kavouras. All rights reserved.
//

import UIKit

public class ScrollyPolyView: UIView, UIScrollViewDelegate {
    
    public var masks: [UIView] = [UIView]() {
        didSet {
            resetMasks()
        }
    }

    private let scrollView = UIScrollView()
    private let scrollLayerContainer = UIView()
    public let scrollLayer = CAScrollLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addSubview(scrollLayerContainer)
        scrollLayerContainer.layer.addSublayer(scrollLayer)
        
        scrollView.pagingEnabled = true
        scrollView.delegate = self
        addSubview(scrollView)
    }
    
    override public func layoutSubviews() {
        scrollView.frame = bounds
        scrollView.contentSize = bounds.size
        scrollView.contentSize.width = bounds.size.width * CGFloat(masks.count)
        
        scrollLayerContainer.frame = bounds
        scrollLayer.frame = bounds
        scrollLayer.frame.size = scrollView.contentSize
        
        for (idx, subview) in scrollView.subviews.enumerate() {
            subview.frame = bounds
            subview.frame.origin.x = CGFloat(idx) * bounds.size.width
        }
        
        for (idx, sublayer) in (scrollLayer.sublayers ?? []).enumerate() {
            sublayer.frame = bounds
            sublayer.frame.origin.x = CGFloat(idx) * bounds.size.width
        }
        
        super.layoutSubviews()
    }
    
    private func resetMasks() {
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
    
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        CATransaction.begin()
        CATransaction.setValue(0.0, forKey: kCATransactionAnimationDuration)
        scrollLayer.scrollToPoint(scrollView.contentOffset)
        CATransaction.commit()
    }
}

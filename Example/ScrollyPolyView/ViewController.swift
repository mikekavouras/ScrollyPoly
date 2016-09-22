//
//  ViewController.swift
//  ScrollyPolyView
//
//  Created by Mike Kavouras on 06/05/2016.
//  Copyright (c) 2016 Mike Kavouras. All rights reserved.
//

import UIKit
import ScrollyPolyView

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: ScrollyPolyView!
    @IBOutlet weak var imageView: UIImageView!
    
    lazy var masks: [UIImageView] = {
        let images = [UIImage(named: "cat")!, UIImage(named:"circle")!, UIImage(named: "heart")!]
        let imageViews = images.map({ (image: UIImage) -> UIImageView in
            let imageView = UIImageView(image: image)
            imageView.contentMode = .center
            return imageView
        })
        return imageViews
    }()

    
    override func viewDidLoad() {
        scrollView.masks = masks
        imageView.layer.mask = scrollView.scrollLayer
        
        super.viewDidLoad()
    }
    
}


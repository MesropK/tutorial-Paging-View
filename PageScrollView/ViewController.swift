//
//  ViewController.swift
//  PageScrollView
//
//  Created by Mesrop Kareyan on 1/14/17.
//  Copyright © 2017 Mesrop Kareyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    struct Constants {
        static let iconHeight: CGFloat = 150.0
    }
    var images:[UIImageView] = []
    
    override func loadView() {
        super.loadView()
        initImages()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.clipsToBounds = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupImages()
    }
    
    func initImages() {
        for index in 0...2 {
            let image = UIImage(named: "icon\(index)")
            let imageView = UIImageView(image: image)
            scrollView.addSubview(imageView)
            images.append(imageView)
        }
    }
    
    func setupImages() {
        var scrollViewContentWidth: CGFloat = 0
        let scrollViewWidth = scrollView.frame.width
        for (index, imageView) in images.enumerated() {
            let extraDis: CGFloat  = UIDevice.current.orientation.isLandscape ? 0 : 0
            let newX = (scrollView.center.x - Constants.iconHeight) / 2 +
                        CGFloat(index) *
                        (scrollViewWidth + extraDis)
            imageView.frame = CGRect(x: newX, y: scrollView.center.y - Constants.iconHeight / 2, width: Constants.iconHeight, height: Constants.iconHeight)
            scrollViewContentWidth += scrollViewWidth
        }
        scrollView.contentSize = CGSize(width: scrollViewContentWidth, height: scrollView.frame.width)
    }
}


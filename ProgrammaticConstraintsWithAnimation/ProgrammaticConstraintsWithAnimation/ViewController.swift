//
//  ViewController.swift
//  ProgrammaticConstraintsWithAnimation
//
//  Created by Ross McIlwaine on 5/23/16.
//  Copyright © 2016 Ross McIlwaine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let topLeftButton = UIButton()
    let topRightButton = UIButton()
    let bottomLeftButton = UIButton()
    let bottomRightButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupContsraints()
        
    }

    func setupButtons() {
        
        topLeftButton.backgroundColor = .greenColor()
        topRightButton.backgroundColor = .yellowColor()
        bottomLeftButton.backgroundColor = .blueColor()
        bottomRightButton.backgroundColor = .redColor()
        
        topLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        topRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomLeftButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        bottomRightButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        
        topLeftButton.addTarget(self, action: #selector(ViewController.buttonDragged(_:)), forControlEvents: .TouchDragExit)
        topRightButton.addTarget(self, action: #selector(ViewController.buttonDragged(_:)), forControlEvents: .TouchDragExit)
        bottomLeftButton.addTarget(self, action: #selector(ViewController.buttonDragged(_:)), forControlEvents: .TouchDragExit)
        bottomRightButton.addTarget(self, action: #selector(ViewController.buttonDragged(_:)), forControlEvents: .TouchDragExit)
        
        
        view.addSubview(topLeftButton)
        view.addSubview(topRightButton)
        view.addSubview(bottomLeftButton)
        view.addSubview(bottomRightButton)
    }
    
    func buttonTapped() {
        
        let topLeftColor = topLeftButton.backgroundColor
        let topRightColor = topRightButton.backgroundColor
        let bottomLeftColor = bottomLeftButton.backgroundColor
        let bottomRightColor = bottomRightButton.backgroundColor
        
        UIView.animateWithDuration(1.0) {
        
            self.topLeftButton.backgroundColor = bottomLeftColor
            self.topRightButton.backgroundColor = topLeftColor
            self.bottomLeftButton.backgroundColor = topRightColor
            self.bottomRightButton.backgroundColor = bottomRightColor
        }
    }
    
    func buttonDragged(sender: UIButton) {
        
        view.bringSubviewToFront(sender)
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 - 15, sender.frame.origin.x + sender.frame.width/2, sender.frame.origin.x + sender.frame.width/2 + 15, sender.frame.origin.x + sender.frame.width/2]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.5
        animation.repeatCount = 5.0
        sender.layer.addAnimation(animation, forKey: "shake")
    }

    func setupContsraints() {
        
        topLeftButton.translatesAutoresizingMaskIntoConstraints = false
        topRightButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeftButton.translatesAutoresizingMaskIntoConstraints = false
        bottomRightButton.translatesAutoresizingMaskIntoConstraints = false
        
        let bottomLeftTop = NSLayoutConstraint(item: bottomLeftButton, attribute: .Top, relatedBy: .Equal, toItem: topLeftButton, attribute: .Bottom, multiplier: 1, constant: 0)
        let bottomLeftTrailing = NSLayoutConstraint(item: bottomLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Leading, multiplier: 1, constant: 0)
        let topLeftTrailing = NSLayoutConstraint(item: topLeftButton, attribute: .Trailing, relatedBy: .Equal, toItem: topRightButton, attribute: .Leading, multiplier: 1, constant: 0)
        let topRightBottom = NSLayoutConstraint(item: topRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Top, multiplier: 1, constant: 0)
        
        let topButtonWidths = NSLayoutConstraint(item: topLeftButton, attribute: .Width, relatedBy: .Equal, toItem: topRightButton, attribute: .Width, multiplier: 1, constant: 0)
        let bottomButtonWidths = NSLayoutConstraint(item: bottomLeftButton, attribute: .Width, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Width, multiplier: 1, constant: 0)
        let leftButtonHeights = NSLayoutConstraint(item: topLeftButton, attribute: .Height, relatedBy: .Equal, toItem: bottomLeftButton, attribute: .Height, multiplier: 1, constant: 0)
        let rightButtonHeights = NSLayoutConstraint(item: topRightButton, attribute: .Height, relatedBy: .Equal, toItem: bottomRightButton, attribute: .Height, multiplier: 1, constant: 0)
        let topLeftLeadingConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0)
        let topLeftTopConstraint = NSLayoutConstraint(item: topLeftButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 0)
        let topRightTopConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: 0)
        let topRightTrailingConstraint = NSLayoutConstraint(item: topRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)
        let bottomLeftLeadingConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: 0)
        let bottomLeftBottomConstraint = NSLayoutConstraint(item: bottomLeftButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: 0)
        let bottomRightBottomConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: 0)
        let bottomRightTrailingConstraint = NSLayoutConstraint(item: bottomRightButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: 0)
        
        let topLeftWidth = NSLayoutConstraint(item: topLeftButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.5, constant: 0)
        let topLeftHeight = NSLayoutConstraint(item: topLeftButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.5, constant: 0)
        
        view.addConstraints([bottomLeftTop, bottomLeftTrailing, topLeftTrailing, topRightBottom, topButtonWidths, bottomButtonWidths, leftButtonHeights, rightButtonHeights, topLeftLeadingConstraint, topLeftTopConstraint, topRightTopConstraint, topRightTrailingConstraint, bottomLeftLeadingConstraint, bottomLeftBottomConstraint, bottomRightBottomConstraint, bottomRightTrailingConstraint, topLeftWidth, topLeftHeight])
        
    }

}


//
//  TestImageView.swift
//  VKontakte
//
//  Created by Анна Ковтун on 12.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

@IBDesignable
extension UIImageView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }

        set {
            self.layer.cornerRadius = newValue
        }
    }
}

@IBDesignable
class TestImageView: UIControl {
    
    @IBInspectable var radius: CGFloat = 20 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 5 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .black  {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5  {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    func configure() {
        layer.cornerRadius = radius
        layer.shadowRadius = shadowRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset

    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        scaleAnimation()
        
        
    }
    override func cancelTracking(with event: UIEvent?) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    private func scaleAnimation() {
        let scaleAnimation = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = 0.5
        scaleAnimation.duration = 0.1
        scaleAnimation.stiffness = 10
        scaleAnimation.mass = 0.1

        self.layer.add(scaleAnimation, forKey: nil)
       }
    
}

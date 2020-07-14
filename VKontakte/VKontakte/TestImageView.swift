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
class TestImageView: UIView {
    
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
    
}

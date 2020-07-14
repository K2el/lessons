//
//  CustomImageView.swift
//  VKontakte
//
//  Created by Анна Ковтун on 12.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit


@IBDesignable class CustomImageView: UIView {
    
    override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }
    
    func configure() {
        
        
        let border = CALayer()
        
        border.borderWidth = 2
        border.borderColor = UIColor.blue.cgColor
        border.cornerRadius = 100
        border.masksToBounds = true
        layer.addSublayer(border)
        
       // let shadow = CALayer()
       // shadow.shadowColor = UIColor.black.cgColor
       // shadow.shadowOpacity = 0.5
      //  shadow.shadowOffset = .zero
      //  shadow.shadowRadius = 5
        
       // layer.addSublayer(shadow)
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(UIColor.red.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
        
        
    }
    
    
    
}

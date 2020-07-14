//
//  LikePhoto.swift
//  VKontakte
//
//  Created by Анна Ковтун on 13.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

@IBDesignable class LikePhoto: UIControl {
    
    var image: UIImageView = UIImageView()
    var textLabel: UILabel = UILabel()
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        if image.image == UIImage(systemName: "heart") {
            image.image = UIImage(systemName: "heart.fill")
            image.tintColor = UIColor.red
        } else {
            image.image = UIImage(systemName: "heart")
            image.tintColor = UIColor.black
        }
        
        if textLabel.text == "0" {
            textLabel.text = "1"
            textLabel.textColor = UIColor.red
        } else {
            textLabel.text = "0"
            textLabel.textColor = UIColor.black
        }
        
        
    }
    override func cancelTracking(with event: UIEvent?) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        
        
    }
    private func setupView() {
        image = UIImageView(frame: CGRect(x: 10, y: 0, width: 20, height: 20))
        image.image = UIImage(systemName: "heart")
        image.tintColor = UIColor.black
        textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textLabel.text = "0"
        addSubview(image)
        addSubview(textLabel)
    }
    
    
}

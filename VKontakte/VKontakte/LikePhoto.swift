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
            UIView.animate(withDuration: 0.2, delay: 0, animations: {
                self.image.alpha = 0.1
            }, completion: {_ in
                
                UIView.animate(withDuration: 0.2, delay: 0, animations: {
                    self.image.image = UIImage(systemName: "heart.fill")
                    self.image.tintColor = UIColor.red
                    self.image.alpha = 1
                })
                
            })
            
        } else {
            image.image = UIImage(systemName: "heart")
            image.tintColor = UIColor.black
        }
        
        if textLabel.text == "0" {
            UIView.animate(withDuration: 0.2, delay: 0, animations: {
                self.textLabel.alpha = 0.1
            }, completion: {_ in
                
                UIView.animate(withDuration: 0.2, delay: 0, animations: {
                    self.textLabel.textColor = UIColor.red
                    self.textLabel.text = "1"
                    self.textLabel.alpha = 1
                })
                
            })
            
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

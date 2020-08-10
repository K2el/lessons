//
//  CustomSegue.swift
//  VKontakte
//
//  Created by Анна Ковтун on 08.08.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let containerView = source.view.superview else { return }
        
        let containerViewFrame = containerView.frame
        let sourceViewTargetFrame = CGRect(
                                           x: -containerViewFrame.width,
                                           y: 0,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame
        
        containerView.addSubview(destination.view)
        
        /*destination.view.frame = CGRect(
                                        x: +containerViewFrame.width,
                                        y: 0,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)*/
        
        //let rotation = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
        
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        let position = CGAffineTransform(translationX: containerViewFrame.width, y: 0)
        destination.view.transform = scale.concatenating(position)
        

        
        UIView
            .animate(withDuration: 1,
                     animations: {
                        //self.source.view.frame = sourceViewTargetFrame
                        //self.destination.view.frame = destinationViewTargetFrame
                        self.destination.view.transform = .identity

            }) { finished in
                self.source.present(self.destination,
                                    animated: false,
                                    completion: nil)
        }
    }
    
}

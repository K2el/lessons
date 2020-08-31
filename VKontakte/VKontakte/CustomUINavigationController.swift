//
//  CustomUINavigationController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.08.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class CustomUINavigationController: UINavigationController, UINavigationControllerDelegate {
    
    private let animator = PushAnimator()

    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push {
            return PushAnimator()
        } else if operation == .pop {
            return PopAnimator()
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    
}


class PushAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from)
        else { return }
        guard let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: -containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame

        transitionContext.containerView.addSubview(destination.view)

        destination.view.frame = CGRect(x: 0,
                                        y: containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)


        UIView
            .animate(withDuration: self.transitionDuration(using: transitionContext),
                     animations: {
                        source.view.frame = sourceViewTargetFrame
                        destination.view.frame = destinationViewTargetFrame
        }) { finished in
            source.removeFromParent()
            transitionContext.completeTransition(finished)
        }
    }
    
}
    
    
class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from)
        else { return }
        guard let destination = transitionContext.viewController(forKey: .to)
        else { return }
        
        let containerViewFrame = transitionContext.containerView.frame
        let sourceViewTargetFrame = CGRect(x: 0,
                                           y: -containerViewFrame.height,
                                           width: source.view.frame.width,
                                           height: source.view.frame.height)
        let destinationViewTargetFrame = source.view.frame

        transitionContext.containerView.addSubview(destination.view)

        destination.view.frame = CGRect(x: 0,
                                        y: containerViewFrame.height,
                                        width: source.view.frame.width,
                                        height: source.view.frame.height)


        UIView
            .animate(withDuration: self.transitionDuration(using: transitionContext),
                     animations: {
                        source.view.frame = sourceViewTargetFrame
                        destination.view.frame = destinationViewTargetFrame
        }) { finished in
            source.removeFromParent()
            transitionContext.completeTransition(finished)
        }
    }
    
}

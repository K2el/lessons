//
//  OnePhotoViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 27.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class OnePhotoViewController: UIViewController {
    
    var photo = UIImageView()
    var photoNext = UIImageView()
    var i: Int = 0
    //var iNext: Int = 0
    
    @IBOutlet weak var photoArea: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photo = UIImageView(frame: CGRect(x: photoArea.center.x / 2, y: photoArea.center.y / 2, width: 200, height: 200))
        photo.image = friendsPhoto[self.i]
        photoArea.addSubview(photo)
        
        photoNext = UIImageView(frame: CGRect(x: photoArea.center.x / 2, y: photoArea.center.y / 2, width: 200, height: 200))
        photoNext.alpha = 0
        photoArea.addSubview(photoNext)
        
        let photoViewRightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(onPhotoViewSwiped(_:)))
        photoViewRightSwipeGesture.direction = .right
        
        let photoViewLeftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(onPhotoViewSwiped(_:)))
        photoViewRightSwipeGesture.direction = .left
        
        photo.addGestureRecognizer(photoViewRightSwipeGesture)
        photo.addGestureRecognizer(photoViewLeftSwipeGesture)
        photo.isUserInteractionEnabled = true
        
    }
    
    @objc func onPhotoViewSwiped (_ sender: UISwipeGestureRecognizer) {
        
        var x: CGFloat = 0
        
        switch sender.direction {
        case .right:
            x = 300.0
            i -= 1
            
            if i < 0 {
                i = friendsPhoto.count - 1
            }
           
            //print(i)
        case .left:
            x = -300.0
            i += 1
            
            if i > friendsPhoto.count - 1 {
                i = 0
            }
            //print(i)
        default:
            break
        }
        
        UIView.animate(withDuration: 1,
                       animations: {
                        self.photo.transform = CGAffineTransform(scaleX: 1/2, y: 1/2)
                        self.photo.alpha = 0.2
                        },
                       completion: {_ in
                        self.photoNext.center.x -= x
                        self.photoNext.image = friendsPhoto[self.i]
                        self.photoNext.alpha = 1
                        UIView.animate(withDuration: 1,
                                       animations: {
                                        self.photoNext.center.x += x
                        }, completion: { _ in
                            self.photo.image = friendsPhoto[self.i]
                            self.photo.transform = CGAffineTransform(scaleX: 1, y: 1)
                            self.photo.alpha = 1
                            
                            self.photoNext.alpha = 0
                        })
            })
 
    }
}

//
//  FriendsPhotoViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit


class FriendsPhotoViewController: UICollectionViewController {
    
    var vkPhotos: [VKPhotos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = NetworkService()
        
        test.loadPhotos(userId: MyFriendsViewController.friendsId, token: Session.shared.token){ [weak self] vkPhotos in
        // сохраняем полученные данные в массиве
            self?.vkPhotos = vkPhotos
            self?.collectionView.reloadData()
        }
        //print("id пользователя: \(MyFriendsViewController.friendsId)")
    }
    
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vkPhotos.count
        }
        
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendPhotoCell", for: indexPath) as! FriendsPhotoCellView
        
        //let image =
            
        cell.friendPhoto.sd_setImage(with: URL(string: vkPhotos[indexPath.row].sizes[0].url))
        
        //image?.downloaded(from: vkPhotos[indexPath.row].sizes[0].url)
        
        //cell.friendsPhoto.downloaded(from: vkPhotos[indexPath.row].sizes[0].url)
            
        //print(vkPhotos[indexPath.row].sizes[0].url)
        
            return cell
            
        }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
    }

    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        }
    
    
}

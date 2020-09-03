//
//  FriendsPhotoViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit
import RealmSwift


class FriendsPhotoViewController: UICollectionViewController {
    
    var vkPhotos: [VKPhotos] = []
    
    var token: NotificationToken?
    
    func loadData() {
        do {
            let realm = try Realm()
            
            let photos = realm.objects(VKPhotos.self).filter("ownerID = \(MyFriendsViewController.friendsId)")
            
            self.vkPhotos = Array(photos)
            
            token = photos.observe { [weak self] (changes: RealmCollectionChange) in
                guard let collectionView = self?.collectionView else { return }
                switch changes {
                case .initial:
                    collectionView.reloadData()
                case .update(_, let deletions, let insertions, let modifications):
                    collectionView.performBatchUpdates({ () -> Void in
                    collectionView.insertItems(at: insertions.map({ IndexPath(row: $0, section: 0) }))
                    collectionView.deleteItems(at: deletions.map({ IndexPath(row: $0, section: 0)}))
                    collectionView.reloadItems(at: modifications.map({ IndexPath(row: $0, section: 0) }))
                    }, completion: nil)
                case .error(let error):
                    fatalError("\(error)")
                }
            }
            
        } catch {
            // если произошла ошибка, выводим ее в консоль
            print(error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = NetworkService()
        
        test.loadPhotos(userId: MyFriendsViewController.friendsId, token: Session.shared.token){ [weak self] in
            // сохраняем полученные данные в массиве

            self?.loadData()
            //self?.collectionView.reloadData()
        }
        print("id пользователя: \(MyFriendsViewController.friendsId)")
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

//
//  TestNetworkViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 12.08.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class TestNetworkViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let test  = NetworkService()
        //test.alamofireRequest()
        
        let test = NetworkService()
        
        //Вывод групп пользователя
        //test.loadGroups(token: Session.shared.token)
        
        //Вывод друзей пользователя
        //test.loadFriends(userId: Session.shared.userId, token: Session.shared.token)
        
        //Вывод фотографий пользователя
        //test.loadPhotos(userId: Session.shared.userId, token: Session.shared.token)
        
        //Поиск групп
        //test.searchGroups(userId: Session.shared.userId, token: Session.shared.token, searchText: "пример")
        
    }
}

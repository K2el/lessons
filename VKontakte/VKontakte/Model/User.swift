//
//  User.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class User {
    let name: String
    let image: UIImage?
    let id: Int? = nil
    var groupsId: [Int] = []
    var photos: [UIImage?] = []
    var friendsId: [Int] = []
    init(_ name: String, _ image: UIImage?) {
        self.name = name
        self.image = image
    }
}

//var user1 = User("Имя 1", UIImage(named: "darkfit"), photos = [UIImage(named: "darkfit"), UIImage(named: "darkfit")])


var myFriends: [User] = [
    User("Имя друга 1", UIImage(named: "darkfit")),
    User("Имя друга 2", UIImage(named: "darkfit")),
    User("Имя друга 3", UIImage(named: "darkfit")),
    User("Имя друга 4", UIImage(named: "darkfit"))
]

var friendsPhoto: [UIImage?] = [
    UIImage(named: "darkfit"),
    UIImage(named: "darkfit"),
    UIImage(named: "darkfit"),
    UIImage(named: "darkfit")
]

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
    var photo: [UIImage?] = []
    var friendsId: [Int] = []
    init(_ name: String, _ image: UIImage?) {
        self.name = name
        self.image = image
    }
}

class User2 {
    let name: String
    let image: UIImage?
    var id: Int? = nil
    var groupsId: [Int] = []
    var photo: [UIImage?] = []
    var friendsId: [Int] = []
    init(_ name: String, _ image: UIImage?, photo: [UIImage?], id: Int) {
        self.name = name
        self.image = image
        self.photo = photo
        self.id = id
    }
}

//идентификатор пользователя
var row: Int = 0

var user1 = User2("Name2", UIImage(named: "darkfit"), photo: [UIImage(named: "darkfit"), UIImage(named: "darkfit")], id: 1)
var user2 = User2("Name2", UIImage(named: "darkfit"), photo: [UIImage(named: "darkfit"), UIImage(named: "darkfit"), UIImage(named: "darkfit")], id: 2)
var user3 = User2("Name3", UIImage(named: "darkfit"), photo: [UIImage(named: "darkfit"), UIImage(named: "darkfit"), UIImage(named: "darkfit"), UIImage(named: "darkfit")], id: 3)
var user4 = User2("Name4", UIImage(named: "darkfit"), photo: [UIImage(named: "darkfit")], id: 4)

var myFriends2: [User2] = [
    user1,
    user2,
    user3,
    user4
]


var myFriends: [User] = [
    User("Вася", UIImage(named: "darkfit")),
    User("Петя", UIImage(named: "darkfit")),
    User("Юля", UIImage(named: "darkfit")),
    User("Виктор", UIImage(named: "darkfit"))
]

var friendsPhoto: [UIImage?] = [
    UIImage(systemName: "heart"),
    UIImage(systemName: "heart.fill"),
    UIImage(named: "darkfit"),
    UIImage(systemName: "folder")
]

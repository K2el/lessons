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



struct UserCodable: Codable {
    let response: Response
}

struct Response: Codable {
    let count: Int
    let items: [VKuser]
}

struct VKuser: Codable {
    let id: Int
    let firstName, lastName: String
    let isClosed, canAccessClosed: Bool?
    let photo100: String
    let online: Int
    let trackCode: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case isClosed = "is_closed"
        case canAccessClosed = "can_access_closed"
        case photo100 = "photo_100"
        case online
        case trackCode = "track_code"
    }
}


struct PhotosCodable: Codable {
    let response: ResponsePhotos
}

struct ResponsePhotos: Codable {
    let count: Int
    let items: [VKPhotos]
}

struct VKPhotos: Codable {
    let albumID, date, id, ownerID: Int
    let hasTags: Bool
    let postID: Int?
    let sizes: [SizePhotos]
    let text: String

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        case postID = "post_id"
        case sizes, text
    }
}

struct SizePhotos: Codable {
    let height: Int
    let url: String
    let type: String
    let width: Int
}

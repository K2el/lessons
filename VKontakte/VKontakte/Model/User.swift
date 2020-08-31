//
//  User.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit
import RealmSwift

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

//---------------

//struct UserCodable: Codable {
//    let response: Response
//}
//
//struct Response: Codable {
//    let count: Int
//    let items: [VKuser]
//}
//
//struct VKuser: Codable {
//    let id: Int
//    let firstName, lastName: String
//    let isClosed, canAccessClosed: Bool?
//    let photo100: String
//    let online: Int
//    let trackCode: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case isClosed = "is_closed"
//        case canAccessClosed = "can_access_closed"
//        case photo100 = "photo_100"
//        case online
//        case trackCode = "track_code"
//    }
//}

class UserCodable: Codable {
    let response: Response
}

class Response: Codable {
    let count: Int = 0
    let items: [VKuser]
}

class VKuser: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    //var isClosed = RealmOptional<Bool>()
    //var canAccessClosed = RealmOptional<Bool>()
    @objc dynamic var is_closed: Bool = false
    @objc dynamic var can_access_closed: Bool = false
    @objc dynamic var photo100: String = ""
    @objc dynamic var online: Int = 0
    @objc dynamic var trackCode: String = ""

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        //case isClosed = "is_closed"
        //case canAccessClosed = "can_access_closed"
        case photo100 = "photo_100"
        case online
        case trackCode = "track_code"
    }
    override static func primaryKey() -> String? {
        return "id"
    }

}

//---------------


//struct PhotosCodable: Codable {
//    let response: ResponsePhotos
//}
//
//struct ResponsePhotos: Codable {
//    let count: Int
//    let items: [VKPhotos]
//}
//
//struct VKPhotos: Codable {
//    let albumID, date, id, ownerID: Int
//    let hasTags: Bool
//    let postID: Int?
//    let sizes: [SizePhotos]
//    let text: String
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case date, id
//        case ownerID = "owner_id"
//        case hasTags = "has_tags"
//        case postID = "post_id"
//        case sizes, text
//    }
//}
//
//struct SizePhotos: Codable {
//    let height: Int
//    let url: String
//    let type: String
//    let width: Int
//}

class PhotosCodable: Codable {
    let response: ResponsePhotos
}

class ResponsePhotos: Codable {
    let count: Int
    let items: [VKPhotos]
}

class VKPhotos: Object, Codable {
    @objc dynamic var albumID: Int = 0
    @objc dynamic var date: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var ownerID: Int = 0
    @objc dynamic var hasTags: Bool = false
    @objc dynamic var post_id: Int = 0
    var sizes = List<SizePhotos>()
    @objc dynamic var text: String = ""

    enum CodingKeys: String, CodingKey {
        case albumID = "album_id"
        case date, id
        case ownerID = "owner_id"
        case hasTags = "has_tags"
        //case postID = "post_id"
        case sizes, text
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}

class SizePhotos: Object, Codable {
    @objc dynamic var height: Int = 0
    @objc dynamic var url: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var width: Int = 0
}

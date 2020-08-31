//
//  Group.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit
import RealmSwift

struct Group {
    var name: String
    var image: UIImage?
    init(_ name: String, _ image: UIImage?) {
        self.name = name
        self.image = image
    }
}

var groups: [Group] = [
    Group("Супер группа", UIImage(named: "darkfit")),
    Group("Супер пупер группа", UIImage(named: "darkfit")),
    Group("Еще одна группа", UIImage(named: "darkfit")),
    Group("Группа 4", UIImage(named: "darkfit"))
]

var myGroups: [Group] = [
    Group("Моя группа 1", UIImage(named: "darkfit")),
    Group("Моя группа 2", UIImage(named: "darkfit")),
    Group("Моя группа 3", UIImage(named: "darkfit"))
]


//---------
//struct GroupCodable: Codable {
//    let response: GroupResponse
//}
//
//
//struct GroupResponse: Codable {
//    let count: Int
//    let items: [VKGroup]
//}
//struct VKGroup: Codable {
//    let id: Int
//    let name, screenName: String
//    let isClosed: Int
//    let type: String
//    let isAdmin: Int
//    let adminLevel: Int?
//    let isMember, isAdvertiser: Int
//    let photo50, photo100, photo200: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case screenName = "screen_name"
//        case isClosed = "is_closed"
//        case type
//        case isAdmin = "is_admin"
//        case adminLevel = "admin_level"
//        case isMember = "is_member"
//        case isAdvertiser = "is_advertiser"
//        case photo50 = "photo_50"
//        case photo100 = "photo_100"
//        case photo200 = "photo_200"
//    }
//}

class GroupCodable: Codable {
    let response: GroupResponse
}


class GroupResponse: Codable {
    let count: Int
    let items: [VKGroup]
}

class VKGroup: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var screenName: String = ""
    @objc dynamic var isClosed: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var isAdmin: Int = 0
    @objc dynamic var admin_level: Int = 0
    @objc dynamic var isMember: Int = 0
    @objc dynamic var isAdvertiser: Int = 0
    @objc dynamic var photo50: String = ""
    @objc dynamic var photo100: String = ""
    @objc dynamic var photo200: String = ""

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        //case adminLevel = "admin_level"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
    override static func primaryKey() -> String? {
        return "id"
    }
}

//----------------
struct GroupSearchCodable: Codable {
    let response: GroupSearchResponse
}

struct GroupSearchResponse: Codable {
    let count: Int
    let items: [VKGroupSearch]
}

struct VKGroupSearch: Codable {
    let id: Int
    let name, screenName: String
    let isClosed: Int
    let type: String
    let isAdmin, isMember, isAdvertiser: Int
    let photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case isAdmin = "is_admin"
        case isMember = "is_member"
        case isAdvertiser = "is_advertiser"
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}


//----------------

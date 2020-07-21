//
//  Group.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

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

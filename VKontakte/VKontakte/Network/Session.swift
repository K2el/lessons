//
//  Session.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.08.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class Session {
    
    static let shared = Session()
    
    private init(){}
    
    var token: String = ""
    var userId: Int = 0
}




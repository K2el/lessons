//
//  NewsCell.swift
//  VKontakte
//
//  Created by Анна Ковтун on 20.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var imageShadow: TestImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

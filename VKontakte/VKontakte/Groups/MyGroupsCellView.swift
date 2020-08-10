//
//  MyGroupsCellView.swift
//  VKontakte
//
//  Created by Анна Ковтун on 09.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit



class MyGroupsCellView: UITableViewCell {
    
    @IBOutlet weak var groupImage: UIImageView!
    @IBOutlet weak var groupTextName: UILabel!
    
    @IBOutlet weak var testImageView: TestImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

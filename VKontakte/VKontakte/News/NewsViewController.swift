//
//  NewsViewConroller.swift
//  VKontakte
//
//  Created by Анна Ковтун on 20.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.imageShadow.configure()
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         //   print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        }
    
}

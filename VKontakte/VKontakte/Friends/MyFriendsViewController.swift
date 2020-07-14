//
//  MyFriendsViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit



class MyFriendsViewController: UITableViewController {
    
    var sections: [String] = []
    var newMyFriends: [[User]] = []
    

    
    private func sectionChar() {
        var char: String
        
        for user in myFriends {
            char = String(user.name.first!)
            if (sections.firstIndex(of: char) == nil) {
                sections.append(char)
                newMyFriends.append([user])
            } else {
                newMyFriends[sections.firstIndex(of: char)!].append(user)
            }
        }
        print(newMyFriends)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionChar()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newMyFriends[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! MyFriendsCellView
        
        cell.friendName.text = newMyFriends[indexPath.section][indexPath.row].name
        cell.friendImage.image = newMyFriends[indexPath.section][indexPath.row].image
        cell.testImageView.configure()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
            row = indexPath.row
        }
    

}


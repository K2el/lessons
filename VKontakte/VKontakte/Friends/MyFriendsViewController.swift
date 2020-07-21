//
//  MyFriendsViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 10.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit



class MyFriendsViewController: UITableViewController, UISearchBarDelegate {
    
    var sections: [String] = []
    var newMyFriends: [[User]] = []
    
    var filtered: [User] = []

    
    private func sectionChar(_ users: [User]) {
        var char: String
        newMyFriends = []
        sections = []
        
        for user in users {
            char = String(user.name.first!)
            if (sections.firstIndex(of: char) == nil) {
                sections.append(char)
                newMyFriends.append([user])
            } else {
                newMyFriends[sections.firstIndex(of: char)!].append(user)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionChar(myFriends)
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            filtered = myFriends.filter({ (text) -> Bool in
                let tmp:NSString = text.name as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            //print(filtered)

            sectionChar(filtered)
            
        } else {
            sectionChar(myFriends)
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


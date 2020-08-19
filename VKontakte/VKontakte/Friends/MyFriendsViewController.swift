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
    var vkUsers: [VKuser] = []
    var myFriends: [[VKuser]] = []
    var filtered: [VKuser] = []
    static var friendsId: Int = 0


    
    private func sectionCharNew(_ users: [VKuser]) {
           var char: String
           myFriends = []
           sections = []
        //print(users)
           
           for user in users {
               char = String(user.firstName.first!)
               if (sections.firstIndex(of: char) == nil) {
                   sections.append(char)
                   myFriends.append([user])
               } else {
                   myFriends[sections.firstIndex(of: char)!].append(user)
               }
           }
        //print(newMyFriendsNew)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = NetworkService()
        
        test.loadFriends(userId: Session.shared.userId, token: Session.shared.token){ [weak self] vkUsers in
        // сохраняем полученные данные в массиве
            self?.vkUsers = vkUsers
            self!.sectionCharNew(self!.vkUsers)
            self?.tableView.reloadData()
        }
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            filtered = vkUsers.filter({ (text) -> Bool in
                let tmp:NSString = "\(text.firstName) \(text.lastName)" as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            //print(filtered)

            sectionCharNew(filtered)
            
        } else {
            sectionCharNew(vkUsers)
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
        //return newMyFriends[section].count
        return myFriends[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as! MyFriendsCellView
        
        cell.friendName.text = "\(myFriends[indexPath.section][indexPath.row].firstName) \(myFriends[indexPath.section][indexPath.row].lastName)"
        
        cell.friendImage.sd_setImage(with: URL(string: myFriends[indexPath.section][indexPath.row].photo100))
        //downloaded(from: myFriends[indexPath.section][indexPath.row].photo100)
        
        cell.testImageView.configure()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        MyFriendsViewController.friendsId = myFriends[indexPath.section][indexPath.row].id
        }

    

}


//
//  GlobalGroupsViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 09.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//


import UIKit

class GlobalGroupsViewController: UITableViewController, UISearchBarDelegate {
    
    var filtered: [Group] = groups
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            filtered = groups.filter({ (text) -> Bool in
                let tmp:NSString = text.name as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            //print(filtered)
            
        } else {
            filtered = groups
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalGroupsCell", for: indexPath) as! GlobalGroupsCellView
        cell.groupTextName.text = filtered[indexPath.row].name
        cell.groupImage.image = filtered[indexPath.row].image
        cell.testImageView.configure()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        }

}

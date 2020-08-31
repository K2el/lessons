//
//  GlobalGroupsViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 09.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//


import UIKit

class GlobalGroupsViewController: UITableViewController, UISearchBarDelegate {
    
    var vkGroupSearch: [VKGroupSearch] = []
    //var filtered: [VKGroupSearch] = []
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       // if searchText != "" {
//            filtered = vkGroupSearch.filter({ (text) -> Bool in
//                let tmp:NSString = text.name as NSString
//                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
//                return range.location != NSNotFound
//            })
            let test = NetworkService()
            test.searchGroups(userId: Session.shared.userId, token: Session.shared.token, searchText: searchText){ [weak self] vkGroupSearch in
            // сохраняем полученные данные в массиве
                self?.vkGroupSearch = vkGroupSearch
                //self?.filtered = vkGroupSearch
                self?.tableView.reloadData()
            }
            //print(filtered)
            
      //  } else {
            //filtered = vkGroupSearch
     //   }
        
     //   self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = NetworkService()
        
        //test.loadGroups(token: Session.shared.token)
        
        test.searchGroups(userId: Session.shared.userId, token: Session.shared.token, searchText: "проверка"){ [weak self] vkGroupSearch in
        // сохраняем полученные данные в массиве
            self?.vkGroupSearch = vkGroupSearch
            //self?.filtered = vkGroupSearch
            self?.tableView.reloadData()
        }
        
        let searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        searchBar.delegate = self
        searchBar.text = "Проверка"
        self.tableView.tableHeaderView = searchBar
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vkGroupSearch.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GlobalGroupsCell", for: indexPath) as! GlobalGroupsCellView
        //cell.groupTextName.text = filtered[indexPath.row].name
        //cell.groupImage.image = filtered[indexPath.row].image
        
        cell.groupTextName.text = vkGroupSearch[indexPath.row].name
        cell.groupImage.sd_setImage(with: URL(string: vkGroupSearch[indexPath.row].photo50))
        
        cell.testImageView.configure()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        }

}

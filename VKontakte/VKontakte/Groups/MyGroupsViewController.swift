//
//  MyGroupsViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 09.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit
import SDWebImage
import RealmSwift


class MyGroupsViewController: UITableViewController, UISearchBarDelegate {
    
    var vkGroup: [VKGroup] = []
    
    var filtered: [VKGroup] = []
    
    func loadData() {
            do {
                let realm = try Realm()
                
                let groups = realm.objects(VKGroup.self)
                

                self.vkGroup = Array(groups)
                self.filtered = Array(groups)
                
            } catch {
    // если произошла ошибка, выводим ее в консоль
                print(error)
            }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            filtered = vkGroup.filter({ (text) -> Bool in
                let tmp:NSString = text.name as NSString
                let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
                return range.location != NSNotFound
            })
            //print(filtered)
            
        } else {
            filtered = vkGroup
        }
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test = NetworkService()
        
        //test.loadGroups(token: Session.shared.token)
        
        test.loadGroups(token: Session.shared.token){ [weak self] in
        // сохраняем полученные данные в массиве
            self?.loadData()
            self?.tableView.reloadData()
        }
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! MyGroupsCellView
        //cell.groupTextName.text = filtered[indexPath.row].name
        //cell.groupImage.image = filtered[indexPath.row].image
        
        let image =  cell.groupImage
        
        //image!.downloaded(from: vkGroup[indexPath.row].photo50)
        image!.sd_setImage(with: URL(string: filtered[indexPath.row].photo50))
        
        cell.groupTextName.text = filtered[indexPath.row].name
        
        
        cell.testImageView.configure()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            filtered.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    @IBAction func addMyGroup(_ sender: Any) {
        let alert = UIAlertController(title: "Название группы", message: nil, preferredStyle: .alert)
        alert.addTextField {
            (textField) in
            textField.placeholder = "Название"
        }
        
        let action = UIAlertAction(title: "ОК", style: .default) {
            [weak self, weak alert] (action) in
            guard let firstText = alert?.textFields?.first?.text else { return }
            self?.addMyGroup(name: firstText)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    private func addMyGroup(name: String) {
        guard !name.isEmpty else { return }
        //filtered.insert(VKGroup(name, nil), at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        
    }
}

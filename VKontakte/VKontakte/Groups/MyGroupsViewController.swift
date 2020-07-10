//
//  MyGroupsViewController.swift
//  VKontakte
//
//  Created by Анна Ковтун on 09.07.2020.
//  Copyright © 2020 artGK. All rights reserved.
//

import UIKit


class MyGroupsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as! MyGroupsCellView
        cell.groupTextName.text = myGroups[indexPath.row].name
        cell.groupImage.image = myGroups[indexPath.row].image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("нажата строка № \(indexPath.row) в секции \(indexPath.section)")
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            myGroups.remove(at: indexPath.row)
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
        myGroups.insert(Group(name, nil), at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        
    }
}

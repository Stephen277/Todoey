//
//  TodoListViewController.swift
//  Todoey
//
//  Created by Stephen Casar on 2018-06-27.
//  Copyright © 2018 Stephen Casar. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
 //  var itemArray = ["find mike", "buy eggs", "destroy demogorgon"]
   var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "find mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "buy eggs"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "destroy demogorgon"
        itemArray.append(newItem3)
 
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
        
    }

    //MARK - tableView datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
 //       cell.accessoryType = item.done == true ? .checkmark : .none
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }

    //MARK - TableView Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
       
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonItem(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clikcs the Add Item button on our alert
         
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
           
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
}


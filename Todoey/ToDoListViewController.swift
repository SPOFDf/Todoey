//
//  ViewController.swift
//  Todoey
//
//  Created by Abhilash Reddy Muthyala on 3/10/18.
//  Copyright © 2018 Abhilash Muthyala. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["First Item","Second Todo","Third Todo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   // MARK - Tableview Datasource Methods
    
   override  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
   override  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    cell.textLabel?.text = itemArray[indexPath.row]
    return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
      if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark)
      {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
      else{
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func barButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item", message: " ", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen when Add Item is clicked
            print("success")
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
    alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}


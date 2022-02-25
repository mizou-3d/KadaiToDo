//
//  ViewController.swift
//  KadaiToDo
//
//  Created by 溝手彩加 on 2022/02/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var todoItems: Results<ToDo>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        let realm = try! Realm()
        self.todoItems = realm.objects(ToDo.self)
        
        table.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item: ToDo = todoItems[indexPath.row]
        cell.textLabel?.text = item.ToDoTitle
        cell.detailTextLabel?.text = item.ToDoSubtitle
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            deleteTodo(at: indexPath.row)
            table.reloadData()
        }
    }
    
    func deleteTodo(at index: Int){
        let realm = try! Realm()
        try! realm.write{
            realm.delete(todoItems[index])
        }
    }


}


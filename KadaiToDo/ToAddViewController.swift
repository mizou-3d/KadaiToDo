//
//  ToAddViewController.swift
//  KadaiToDo
//
//  Created by 溝手彩加 on 2022/02/21.
//

import UIKit
import RealmSwift

class ToAddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var deadlineLabel: UITextField!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var todoItems: Results<ToDo>!
    
    var datePicker: UIDatePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.datePickerMode = UIDatePicker.Mode.date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = Locale.current
        deadlineLabel.inputView = datePicker
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        deadlineLabel.inputView = datePicker
        deadlineLabel.inputAccessoryView = toolbar
    }
    
    @objc func done() {
        deadlineLabel.endEditing(true)
           
        // 日付のフォーマット
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        deadlineLabel.text = "\(formatter.string(from: datePicker.date))"
    }
    
    @IBAction func saveToDo(){
        let realm2 = try! Realm()
        let todoItem: ToDo = ToDo()
        todoItem.ToDoTitle = self.titleTextField.text
        todoItem.ToDoSubtitle = self.contentTextView.text
        todoItem.deadLine = self.deadlineLabel.text
        try! realm2.write{
            realm2.add(todoItem)
        }
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

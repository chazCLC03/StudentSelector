//
//  ViewController.swift
//  StudentSelector
//
//  Created by Tiger Coder on 3/8/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var students: [String] = []
    var selectedStudent: String = ""
    var random: Int?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = students[indexPath.row]
        cell.detailTextLabel?.text = ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            students.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func addBtnAction(_ sender: UIBarButtonItem) {
        students.append(nameTxtBox.text!)
        nameTxtBox.text = ""
        tableViewOutlet.reloadData()
    }
    
    @IBAction func genBtn(_ sender: UIBarButtonItem) {
        if(students.count > 0){
            random = Int.random(in: 0...students.count-1)
            selectedStudent = students[random!]
            alert()
        }
        else{
            
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "Student Selected:", message: "\(selectedStudent)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        }))
        //alert.addAction(UIAlertAction(title: "Remove Student", style:UIAlertAction.Style.default, handler: { _ in
        //}))
        let rmvAct = UIAlertAction(title: "Remove Student", style: UIAlertAction.Style.default) {
                UIAlertAction in
            self.students.remove(at: self.random!)
            self.tableViewOutlet.reloadData()
            }
        alert.addAction(rmvAct)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var nameTxtBox: UITextField!
    @IBOutlet weak var addBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var tableViewOutlet: UITableView!
    
}


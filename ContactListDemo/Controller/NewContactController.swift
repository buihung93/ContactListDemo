//
//  NewContactController.swift
//  ContactListDemo
//
//  Created by Bui Manh Hung on 7/15/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit

protocol NewContactDelegate {
    func addNewContact(success: Bool, name: String, phoneNumber: String);
}

class NewContactController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let inputField = ["Name", "Phone Number"];
    var name = "";
    var phoneNumber = "";
    var delegate : NewContactDelegate?;
    @IBOutlet weak var inputTableView: UITableView!;
    var textField = TextInputTableViewCell();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTableView.delegate = self;
        inputTableView.dataSource = self;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func onSavePress(_ sender: UIBarButtonItem) {
        delegate?.addNewContact(success: true, name: name, phoneNumber: phoneNumber);
        dismiss(animated: true, completion: nil);
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! TextInputTableViewCell;
        cell.configure(text: "", placeholder: inputField[indexPath.row], tag: indexPath.row)
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    @IBAction func onTextChanges(_ sender: UITextField, forEvent event: UIEvent) {
        if(sender.tag == 0) {
//            print("Name: \(sender.text ?? "")");
            name = sender.text ?? "";
        }
        if(sender.tag == 1) {
//            print("Phone Number: \(sender.text ?? "")");
            phoneNumber = sender.text ?? "";
        }
    }
    
}

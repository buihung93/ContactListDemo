//
//  NewContactController.swift
//  ContactListDemo
//
//  Created by Bui Manh Hung on 7/15/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit

class NewContactController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let inputField = ["Name", "Phone Number"];
    @IBOutlet weak var inputTableView: UITableView!;
    
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
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inputCell", for: indexPath) as! TextInputTableViewCell;
        cell.configure(text: "", placeholder: inputField[indexPath.row])
        return cell;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
}

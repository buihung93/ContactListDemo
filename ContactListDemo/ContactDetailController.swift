//
//  ContactDetailController.swift
//  ContactListDemo
//
//  Created by Savvycom on 7/13/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit

class ContactDetailController: UIViewController, UITableViewDelegate {
    var contactNameText : String?
    @IBOutlet weak var contactName: UILabel!;
    
    @IBOutlet weak var infoTableView: UITableView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactName.text = contactNameText;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "homePhoneCell");
        return (cell);
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    @IBAction func onBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
}

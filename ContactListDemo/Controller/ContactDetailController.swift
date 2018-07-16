//
//  ContactDetailController.swift
//  ContactListDemo
//
//  Created by Savvycom on 7/13/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit
import QuartzCore

class ViewCell: UITableViewCell {
    
    @IBOutlet weak var phoneNumerLabel: UILabel!
}

class ContactDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var contactNameText : String?
    var contactPhoneNumberValue : String?
    @IBOutlet weak var contactName: UILabel!;
    
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var infoTableView: UITableView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        infoTableView.delegate = self;
        infoTableView.dataSource = self;
        contactName.text = contactNameText;
        avatarLabel.text = String((contactNameText?.first)!);
        avatarLabel.layer.masksToBounds = true;
        avatarLabel.layer.cornerRadius = 50;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "homePhoneCell", for: indexPath) as! ViewCell;
            cell.phoneNumerLabel.text = contactPhoneNumberValue;
            cell.selectionStyle = .none;
            return cell;
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "noteContactCell", for: indexPath);
            print(cell.contentView.tag);
            tableView.separatorStyle = .none
            return cell;
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 1 {
            return 140;
        } else {
            return 70;
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    @IBAction func onBackPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    
}

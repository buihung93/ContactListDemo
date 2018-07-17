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

protocol ContactDetailDelegate {
    func reloadContact();
}

class ContactDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource, EditContactDelegate {
    
    
    
    var contactNameText : String?
    var contactPhoneNumberValue : String?
    var contactDetail : ContactStruct?;
    var isUpdated = false;
    @IBOutlet weak var contactName: UILabel!;
    
    @IBOutlet weak var avatarLabel: UILabel!
    @IBOutlet weak var infoTableView: UITableView!;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        infoTableView.delegate = self;
        infoTableView.dataSource = self;
        contactName.text = contactDetail?.name;
        avatarLabel.text = String((contactDetail?.name.first)!);
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
            cell.phoneNumerLabel.text = contactDetail?.phoneNumber;
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
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToEdit", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToEdit" {
            let destinationVC = segue.destination as! EditContactController;
            destinationVC.originalContact = contactDetail;
            destinationVC.delegate = self;
        }
    }
    func updateContact(newContactDetail: ContactStruct) {
        contactDetail = newContactDetail;
        contactName.text = newContactDetail.name;
        avatarLabel.text = String((newContactDetail.name.first)!);
        isUpdated = true;
    }
    
}

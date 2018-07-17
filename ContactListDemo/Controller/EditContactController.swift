//
//  NewContactController.swift
//  ContactListDemo
//
//  Created by Bui Manh Hung on 7/15/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit

protocol EditContactDelegate {
    func updateContact(newContactDetail: ContactStruct);
}

class EditContactController: UIViewController {
    
    var originalContact : ContactStruct? = nil;
    var delegate : EditContactDelegate?;
    let storedContact = StoredContact();
    @IBOutlet weak var nameInputField: UITextField!
    @IBOutlet weak var phoneNumberInputField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameInputField?.text = originalContact?.name;
        phoneNumberInputField?.text = originalContact?.phoneNumber;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil);
    }
    @IBAction func onSaveButtonPressed(_ sender: UIBarButtonItem) {
        let currentName = nameInputField.text!;
        let currentPhoneNumber = phoneNumberInputField.text!;
        print(currentName);
        print(originalContact!.name);
        if (currentName != originalContact!.name || currentPhoneNumber != originalContact!.phoneNumber) {
            
            let newContact = ContactStruct(name: currentName, phoneNumber: currentPhoneNumber)
            let updateResult = storedContact.updateContact(oldContact: originalContact!, newContact: newContact);
            if (updateResult) {
                print("Update Success");
                storedContact.loadContact();
                delegate?.updateContact(newContactDetail: newContact);
                dismiss(animated: true, completion: nil);
            } else {
                print("update failure");
            }
        } else {
            print("What");
            dismiss(animated: true, completion: nil);
        }
    }
    
}

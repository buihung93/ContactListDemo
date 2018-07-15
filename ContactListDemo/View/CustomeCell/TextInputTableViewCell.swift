//
//  TextInputTableViewCell.swift
//  ContactListDemo
//
//  Created by Bui Manh Hung on 7/16/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit

class TextInputTableViewCell: UITableViewCell {

    
    @IBOutlet weak var textField: UITextField!;
    
    public func configure (text: String?, placeholder: String) {
        textField.text = text;
        textField.placeholder = placeholder;
    }
    
}

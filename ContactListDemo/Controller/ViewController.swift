//
//  ViewController.swift
//  ContactListDemo
//
//  Created by Savvycom on 7/12/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate, NewContactDelegate {

    var listContact = [Contact]();
    let searchController = UISearchController(searchResultsController: nil)
    var selectedContact = "";
    var selectedPhoneNumber = "";
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var contactTableView: UITableView!;
    let newContactController = NewContactController();
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactTableView.delegate = self;
        contactTableView.dataSource = self;
        contactTableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
    }

    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "goToNewContact", sender: self);
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell;
        contactCell.textLabel?.text = listContact[indexPath.row].name;
        contactCell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17.0);
        return contactCell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listContact.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = listContact[indexPath.row].name;
        selectedPhoneNumber = listContact[indexPath.row].phoneNumber;
        performSegue(withIdentifier: "goToContactDetail", sender: self);
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToContactDetail" {
            let destinationVC = segue.destination as! ContactDetailController;
            destinationVC.contactNameText = selectedContact;
            destinationVC.contactPhoneNumberValue = selectedPhoneNumber;
        }
        if segue.identifier == "goToNewContact" {
            let destinationVC = segue.destination as! NewContactController;
            destinationVC.delegate = self;
//            destinationVC.contactNameText = selectedContact;
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addNewContact(success: Bool, name: String, phoneNumber: String) {
        if (success == true) {
            print(success);
            let newContact = Contact();
            newContact.name = name;
            newContact.phoneNumber = phoneNumber;
            self.listContact.append(newContact);
            self.contactTableView.reloadData();
        }
    }

}


//
//  ViewController.swift
//  ContactListDemo
//
//  Created by Savvycom on 7/12/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NewContactDelegate {

    var listContact = [Contact]();
    var storedContact = StoredContact();
    let searchController = UISearchController(searchResultsController: nil)
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
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
        storedContact.loadContact();
        listContact = storedContact.listContact;
        
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
        selectedContact = listContact[indexPath.row].name!;
        selectedPhoneNumber = listContact[indexPath.row].phoneNumber!;
        performSegue(withIdentifier: "goToContactDetail", sender: self);
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToContactDetail" {
            let destinationVC = segue.destination as! ContactDetailController;
            let contactDetail = ContactStruct(name: selectedContact, phoneNumber: selectedPhoneNumber)
            destinationVC.contactDetail = contactDetail;
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
        self.storedContact.saveContact(name: name, phoneNumber: phoneNumber);
        self.storedContact.loadContact();
        listContact = self.storedContact.listContact;
        self.contactTableView.reloadData();
    }

}

//MARK: - Search bar methods
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.storedContact.searchContact(searchString: searchBar.text!);
        listContact = self.storedContact.listContact;
        self.contactTableView.reloadData()
    }
}


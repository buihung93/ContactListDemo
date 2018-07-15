//
//  ViewController.swift
//  ContactListDemo
//
//  Created by Savvycom on 7/12/18.
//  Copyright © 2018 HungBM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchControllerDelegate {
    
    let list = ["Milk", "Honey", "Eggs"];
    let searchController = UISearchController(searchResultsController: nil)
    var selectedContact = "Duong";
    @IBOutlet var heightConstraint: NSLayoutConstraint!;
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var contactTableView: UITableView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contactTableView.delegate = self;
        contactTableView.dataSource = self;
        
        contactTableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "contactCell")
    }

    @IBAction func onAddPressed(_ sender: UIBarButtonItem) {
        print("here");
        self.performSegue(withIdentifier: "goToNewContact", sender: self);
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell;
        contactCell.textLabel?.text = list[indexPath.row];
        contactCell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17.0);
        return contactCell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedContact = list[indexPath.row];
        performSegue(withIdentifier: "goToContactDetail", sender: self);
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText);
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToContactDetail" {
            let destinationVC = segue.destination as! ContactDetailController;
            destinationVC.contactNameText = selectedContact;
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


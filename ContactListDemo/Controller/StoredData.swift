//
//  Utilities.swift
//  ContactListDemo
//
//  Created by Savvycom on 7/17/18.
//  Copyright © 2018 HungBM. All rights reserved.
//
import UIKit
import CoreData

class StoredContact {
    var listContact = [Contact]();
    let context  = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext;
    func loadContact() {
        let request : NSFetchRequest<Contact> = Contact.fetchRequest();
        let sort = NSSortDescriptor(key: "name", ascending: true);
        
        request.sortDescriptors = [sort];
        do {
            listContact =  try context.fetch(request);
        } catch {
            print("Error with fetching context \(error)")
        }
    }
    
    func saveContact(name: String, phoneNumber: String) {
        let newContact = Contact(context: context);
        newContact.name = name;
        newContact.phoneNumber = phoneNumber;
        
        do {
            try context.save()
        } catch {
            print("Error with saving context \(error)")
        }
    }
    
    func updateContact(oldContact: ContactStruct, newContact: ContactStruct) -> Bool {
        let request : NSFetchRequest<Contact> = Contact.fetchRequest();
        let predicate = NSPredicate(format: "name CONTAINS %@ AND phoneNumber CONTAINS %@", argumentArray: [oldContact.name, oldContact.phoneNumber])
        
        request.predicate = predicate;
        
        do {
            let contact =  try context.fetch(request);
            if (contact.count != 0) {
                contact[0].setValue(newContact.name, forKey: "name");
                contact[0].setValue(newContact.phoneNumber, forKey: "phoneNumber");
            }
        } catch {
            print("Error with fetching context \(error)")
            return false
        }
        
        do {
            try context.save();
            return true;
        } catch {
            print("Error with saving context \(error)");
            return false;
        }
    }
    
    func searchContact(searchString : String) {
        if (searchString == "") {
            loadContact();
        } else {
            let request : NSFetchRequest<Contact> = Contact.fetchRequest();
            let predicate = NSPredicate(format: "name CONTAINS[cd] %@ OR phoneNumber CONTAINS[cd] %@", argumentArray: [searchString, searchString])
            
            request.predicate = predicate;
            
            let sort = NSSortDescriptor(key: "name", ascending: true);
            
            request.sortDescriptors = [sort];
            
            do {
                listContact =  try context.fetch(request);
                print(listContact);
            } catch {
                print("Error with fetching context \(error)")
            }
        }
        
    }
}

//
//  CoreDateManager.swift
//  CoreDataFramework
//
//  Created by Yoel Lev on 24/01/2019.
//  Copyright © 2019 Yoel Lev. All rights reserved.
//

import Foundation
import CoreData


public class CoreDataManager {
    
    public static let shared = CoreDataManager()
    
    let identifier: String  = "com.newsCom.NewsApp.TestPod"       //Framework bundle ID
    let model: String       = "CoreDataModel"                      //Model name
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        
        
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            
            if let err = error{
                fatalError("❌ Loading of store failed:\(err)")
            }
        }
        
        return container
    }()
    
    
    
    public func createPerson(firstname: String, lastname: String, age: String ){
        
        let context = persistentContainer.viewContext
        let contact = NSEntityDescription.insertNewObject(forEntityName: "UserEntity", into: context) as! UserEntity
        
        contact.name = firstname
        contact.age = age
        
        do {
            try context.save()
            print("✅ Person saved succesfuly")
            
        } catch let error {
            print("❌ Failed to create Person: \(error.localizedDescription)")
        }
    }
    
    public func fetch(){
        
        let context = persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        
        do{
            
            let persons = try context.fetch(fetchRequest)
            
            for (index,person) in persons.enumerated() {
                print("Person \(index): \(person.name ?? "N/A") Age:\(person.age )")
            }
            
        }catch let fetchErr {
            print("❌ Failed to fetch Person:",fetchErr)
        }
        
    }
}


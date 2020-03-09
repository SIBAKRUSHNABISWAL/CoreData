//
//  CoreDataManager.swift
//  CoreData-Task
//
//  Created by Siba on 09/03/20.
//  Copyright © 2020 Mobiotics. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    // MARK: - Attributes
    public static let shared = CoreDataManager()
    private var managedContext: NSManagedObjectContext?
    // MARK: - Initialization
    private override init() {
        super.init()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        managedContext = appDelegate.persistentContainer.viewContext
    }
    // MARK: - Fetch the peoples
    public func fecthPeople() -> [People]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        do {
            return try managedContext?.fetch(fetchRequest) as? [People]
        } catch let error as NSError {
            print("Could not fetch \(error) \(error.userInfo)")
        }
        return nil
    }
    // MARK: - Save Data
    public func saveData(name: String, countryName: String) {
        guard let managedContext = managedContext else { return }
        let entity = NSEntityDescription.entity(forEntityName: "People", in: managedContext)
        let people = NSManagedObject(entity: entity!, insertInto: managedContext)
        people.setValue(name, forKey: "name")
        people.setValue(countryName, forKey: "country")
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save \(error) \(error.userInfo)")
        }
    }
    //MARK:- Update Data
    public func updateData(updateName: String, updateCountry: String) {
        var continValue: [NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "People")
        do {
            continValue = try ((managedContext?.fetch(fetchRequest) as? [People])! )
        } catch let error as NSError {
            print("Could not fetch \(error) \(error.userInfo)")
        }
    }
}

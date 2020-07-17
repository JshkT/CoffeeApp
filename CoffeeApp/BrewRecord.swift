//
//  BrewRecord.swift
//  CoffeeApp
//
//  Created by Joshua Tan on 16/5/20.
//  Copyright © 2020 Joshua Tan. All rights reserved.
//
//
import SwiftUI
import Foundation
import CoreData

public class BrewRecord: NSManagedObject, Identifiable {
    @NSManaged public var createdAt:Date
    @NSManaged public var brewerType:String
    @NSManaged public var temperature:Int16
    @NSManaged public var grinderType:String
    @NSManaged public var grindRotations:Int16
    @NSManaged public var grindClicks: Int16
    
}

extension BrewRecord {
    static func getAllBrewRecords() -> NSFetchRequest<BrewRecord> {
        let request: NSFetchRequest<BrewRecord> = BrewRecord.fetchRequest() as!
            NSFetchRequest<BrewRecord>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

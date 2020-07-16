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
    @NSManaged public var createdAt:Date?
    @NSManaged public var brewerType:String?
    @NSManaged public var temperature:Int16
    @NSManaged public var grinderType:String?
    @NSManaged public var grindRotations:Int16
    @NSManaged public var grindClicks: Int16
    
}

extension BrewRecord {
    static func getAllBrewRecords() -> NSFetchRequest<BrewRecord> {
        let request: NSFetchRequest<BrewRecord> = BrewRecord.fetchRequest() as!
            NSFetchRequest<BrewRecord>
        
        let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }
}

//struct BrewRecord: Codable {
//    var brewerType: String
//    var grinderType: String
//    var grindRotations: Int
//    var grindClicks: Int
//    var temperature: Int
//}

//let record = BrewRecord(brewerType: 0, grinderType: 0, grind: 3.5, temperature: 91)

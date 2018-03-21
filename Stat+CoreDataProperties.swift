//
//  Stat+CoreDataProperties.swift
//  BBallStatsTest
//
//  Created by Fred Erik on 21.03.18.
//  Copyright © 2018 Fred Erik. All rights reserved.
//
//

import Foundation
import CoreData


extension Stat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stat> {
        return NSFetchRequest<Stat>(entityName: "Stat")
    }

    @NSManaged public var actionID: Int16
    @NSManaged public var action: String?
    @NSManaged public var chosenTeam: Int16
    @NSManaged public var minute: Int16
    @NSManaged public var player: Int16
    @NSManaged public var quarter: Int16
    @NSManaged public var points: Int16

}

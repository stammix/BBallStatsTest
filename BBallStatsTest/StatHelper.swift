//
//  StatHelper.swift
//  BBallStatsTest
//
//  Created by Fred Erik on 29.07.18.
//  Copyright © 2018 Fred Erik. All rights reserved.
//

import UIKit
import CoreData


func createStat(actionID :Int32, quarter : Int32, minute :Int32, action :String, chosenTeam :Int32, player :Int32, points :Int32){
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let stat = Stat(context: context)
    stat.actionID = actionID
    stat.quarter = quarter
    stat.minute = minute
    stat.action = action
    stat.chosenTeam = chosenTeam
    stat.player = player
    stat.points = points
    (UIApplication.shared.delegate as! AppDelegate).saveContext()
}

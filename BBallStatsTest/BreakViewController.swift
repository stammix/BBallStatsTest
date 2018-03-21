//
//  BreakViewController.swift
//  BBallStats
//
//  Created by Fred Erik on 02.11.16.
//  Copyright © 2016 Fred Erik. All rights reserved.
//

import UIKit
import CoreData

class BreakViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var Period = Int()
    var actualMinute = Int()
    var homeTeamName = ""
    var guestTeamName = ""
    var homeTeamScore = Int()
    var guestTeamScore = Int()
    var quarterLength = Int()
    var player = Int()
    var playerToSwitchIn = Int()
    var chosenTeam = Int()
    var tappedAction = ""
    var pointsOfAction = Int()
    var homeTeamColor = UIColor()
    var guestTeamColor = UIColor()
    var collectStatsForBothTeams = Int()

   
    @IBOutlet weak var statSummaryTableView: UITableView!
    
    @IBOutlet weak var QuarterBreakTitleLabel: UILabel!
    
    
    @IBOutlet weak var nextQuarterButtonLabel: UIButton!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBAction func nextQuarterButton(_ sender: AnyObject) {
        Period = Period + 1
        if Period < 4 {
            performSegue(withIdentifier: "breakToGameSegue", sender: self)
        } else if Period >= 4 && homeTeamScore == guestTeamScore {
        performSegue(withIdentifier: "breakToGameSegue", sender: self)
        } else {
        performSegue(withIdentifier: "breakToGameSegue", sender: self)
        }
        UserDefaults.standard.set("break", forKey: "minute")
        UserDefaults.standard.set("break", forKey: "selectedTeam")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    statSummaryTableView.dataSource = self
     //   statSummaryTableView.delegate = self
        
    }
        override func viewWillAppear(_ animated: Bool) {
            let setPeriodObject = UserDefaults.standard.object(forKey: "period")
            if let setPeriod = setPeriodObject as? String {
                if setPeriod == "1" {
                    Period = 1
                    actualMinute  = quarterLength + 1
                    print ("QuarterBreak Period \(Period)")
                } else if setPeriod == "2" {
                    Period = 2
                    actualMinute  = (2 * quarterLength) + 1
                    print ("QuarterBreak Period \(Period)")
                } else if setPeriod == "3" {
                    Period = 3
                    actualMinute  = (3 * quarterLength) + 1
                    print ("QuarterBreak Period \(Period)")
                } else if setPeriod == "4" {
                    Period = 4
                    actualMinute  = (4 * quarterLength) + 1
                    print ("QuarterBreak Period \(Period)")
                }
            }
            
        if Period == 1 {
            print("*** Break after Period 1")
            nextQuarterButtonLabel.setTitle("Start Quarter \(Period + 1)", for: .normal)
            summaryLabel.text = "Summary Quarter 1"
        } else if Period == 2 {
            print("*** Break after Period 2")
            nextQuarterButtonLabel.setTitle("Start Quarter \(Period + 1)", for: .normal)
            summaryLabel.text = "Summary Quarter 2"
        } else if Period == 3 {
            print("*** Break after Period 3")
            nextQuarterButtonLabel.setTitle("Start Quarter \(Period + 1)", for: .normal)
            summaryLabel.text = "Summary Quarter 3"
        } else if Period == 4 && homeTeamScore == guestTeamScore{
            print("*** Break after Period 4")
            summaryLabel.text = "Summary Quarter 4"
            QuarterBreakTitleLabel.text = "Game Summary"
            nextQuarterButtonLabel.setTitle("Overtime Baby", for: .normal)
        } else if Period > 4 && homeTeamScore == guestTeamScore{
            print("*** Break after OT \(Period - 4)")
            summaryLabel.text = "Summary OT \(Period - 4)"
            QuarterBreakTitleLabel.text = "OT Summary"
            nextQuarterButtonLabel.setTitle("Overtime Baby", for: .normal)
        } else if Period >= 4 {
            print("*** Break after Period 4")
            summaryLabel.text = "Summary Quarter 4"
            QuarterBreakTitleLabel.text = "Game Summary"
            nextQuarterButtonLabel.setTitle("Save GameStats and upload", for: .normal)
        }
            
}
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return stats.count
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//      let stat = stats[indexPath.row]
//      cell.textLabel?.text = "\(stat.homeTeam), \(stat.player), \(stat.action), \(stat.points)"
        return cell
    }
    
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let whatVC = segue.destination as! WhatHappendViewController
        whatVC.Period = Period
        whatVC.quarterLength = quarterLength
        whatVC.currentMinute = actualMinute
        whatVC.homeTeamColor = homeTeamColor
        whatVC.guestTeamColor = guestTeamColor
        whatVC.collectStatsForBothTeams = collectStatsForBothTeams
    }

}

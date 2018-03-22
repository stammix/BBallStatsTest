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
    
    var stats : [Stat] = []
    var statsOfPeriod1 : [Stat] = []
    var statsOfPeriod2 : [Stat] = []
    var statsOfPeriod3 : [Stat] = []
    var statsOfPeriod4 : [Stat] = []
   
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
        
      //  statsOfPeriod1 = getStatsOfPeriod1()
        //statsOfPeriod2 = getStatsOfPeriod2()
      //  statsOfPeriod3 = getStatsOfPeriod3()
      //  statsOfPeriod4 = getStatsOfPeriod4()
        
        statSummaryTableView.dataSource = self
        statSummaryTableView.delegate = self
        
    }
        override func viewWillAppear(_ animated: Bool) {
            loadStats()
            
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
    func loadStats() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            stats = try context.fetch(Stat.fetchRequest()) as! [Stat]
            print ("Summary \(stats)")
        } catch {
            print ("tüdülü Error")
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return Period
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "PERIOD #\(Period)"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return stats.count
        return stats.count
    }
    
/*    func getStatsOfPeriod1() -> [Stat] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = Stat.fetchRequest() as NSFetchRequest<Stat>
        fetchRequest.predicate = NSPredicate(format: "quarter == @i", 1)
        do {
            let stats = try context.fetch(fetchRequest) as [Stat]
            return stats
        } catch  {}
            return []
    }
   

    func getStatsOfPeriod2() -> [Stat] {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = Stat.fetchRequest() as NSFetchRequest<Stat>
        fetchRequest.predicate = NSPredicate(format: "quarter == @i", 2)
        do {
            let stats = try context.fetch(fetchRequest) as [Stat]
            return stats
        } catch  {}
        return []
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let stat : Stat
        if indexPath.section == 0 {
            stat = statsOfPeriod1[indexPath.row]
        } else {
            stat = statsOfPeriod2[indexPath.row]
        }
        let cell = UITableViewCell()
     //   cell.textLabel?.textColor =
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = "\(stat.minute). Minute: \(stat.action!) by #\(stat.player) of Team \(stat.chosenTeam)"
//      let stat = stats[indexPath.row]
//      cell.textLabel?.text = "\(stat.homeTeam), \(stat.player), \(stat.action), \(stat.points)"
        return cell
    }
 */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let stat = stats[indexPath.row]
        //   cell.textLabel?.textColor =
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.text = "\(stat.minute). Minute: \(stat.action!) by #\(stat.player) of Team \(stat.chosenTeam)"
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

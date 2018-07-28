//
//  WhatHappendViewController.swift
//  BBallStats
//
//  Created by Fred Erik on 12.10.16.
//  Copyright © 2016 Fred Erik. All rights reserved.
//

import UIKit
import CoreData


class WhatHappendViewController: UIViewController {

    var homeTeamColor = UIColor.white
    var guestTeamColor = UIColor.black
    var homeColorPale = true
    var guestColorPale = false
    var currentMinute = 1
    var currentMinuteMinusTwo = -1
    var currentMinuteMinusOne = 0
    var currentMinutePlusOne = 2
    var currentMinutePlusTwo = 3
    var currentScoreTeamOne = 0
    var currentScoreTeamTwo = 0
    var Period = Int()
    var segueToWhoMade = "whatHappendToWhoMadeItSegue"
    var tappedAction = "2pointer"
    var collectStatsForBothTeams = 1
    var chosenTeam = 1
    var substitution = 0
    var gonePlayer = 1
    var newPlayer = 6
    var statAction = ""
    var pointsOfAction = 0
    var quarterLength = 10
    var GameTime = 10
    var homeTeamName = ""
    var actionNumber = 1
    
    var onFieldTeamOne = [0,1,2,3,4]
    var benchPlayersTeamOne = [5,6,7,8,9,10,11,12]
    var team1 = [Int()]
    
    var t1p1 = 0
    var t1p2 = 0
    var t1p3 = 0
    var t1p4 = 0
    var t1p5 = 0
    var t1p6 = 0
    var t1p7 = 0
    var t1p8 = 0
    var t1p9 = 0
    var t1p10 = 0
    var t1p11 = 0
    var t1p12 = 0
    var t2p1 = 0
    var t2p2 = 0
    var t2p3 = 0
    var t2p4 = 0
    var t2p5 = 0
    var t2p6 = 0
    var t2p7 = 0
    var t2p8 = 0
    var t2p9 = 0
    var t2p10 = 0
    var t2p11 = 0
    var t2p12 = 0
    
    var stats : [Stat] = []
    
    
    @IBAction func backToSettingsButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "toInGameSettingsSegue", sender: nil)
    }
    
    @IBOutlet weak var lastStatMinuteLabel: UILabel!
    
    @IBOutlet weak var lastStatActionLabel: UILabel!
    
    @IBOutlet weak var lastStatPlayerLabel: UILabel!
    
    @IBOutlet weak var twoMinutesBackLabel: UILabel!
    
    @IBOutlet weak var lastMinuteLabel: UILabel!
    
    @IBOutlet weak var CurrentMinuteLabel: UILabel!
    
    @IBOutlet weak var nextMinuteLabel: UILabel!
    
    @IBOutlet weak var plusTwoMinutesLabel: UILabel!
    
    @IBOutlet weak var currentScoreTeamOneLabel: UILabel!
    
    @IBOutlet weak var currentScoreTeamTwoLabel: UILabel!
    
    @IBOutlet weak var periodLabel: UILabel!
    
    @IBAction func twoMinutesBackPressed(_ sender: UIButton) {
        if currentMinute > 2 {
            currentMinute = currentMinute - 2
            currentMinuteMinusTwo = currentMinuteMinusTwo - 2
            currentMinuteMinusOne = currentMinuteMinusOne - 2
            currentMinutePlusOne = currentMinutePlusOne - 2
            currentMinutePlusTwo = currentMinutePlusTwo - 2
        }
        updateLabels()

    }
    
    
    @IBAction func oneMinuteBackPressed(_ sender: UIButton) {
        if currentMinute > 1 {
            currentMinute = currentMinute - 1
            currentMinuteMinusTwo = currentMinuteMinusTwo - 1
            currentMinuteMinusOne = currentMinuteMinusOne - 1
            currentMinutePlusOne = currentMinutePlusOne - 1
            currentMinutePlusTwo = currentMinutePlusTwo - 1
        }
        updateLabels()
    }
    
    
    @IBAction func nextMinutePressed(_ sender: UIButton) {
        if currentMinute <= GameTime - 1 {
            currentMinute = currentMinute + 1
            currentMinuteMinusTwo = currentMinuteMinusTwo + 1
            currentMinuteMinusOne = currentMinuteMinusOne + 1
            currentMinutePlusOne = currentMinutePlusOne + 1
            currentMinutePlusTwo = currentMinutePlusTwo + 1
        }
        updateLabels()
    }
    
    @IBAction func skipTwoMinutesPressed(_ sender: UIButton) {
        if currentMinute <= GameTime - 2 {
            currentMinute = currentMinute + 2
            currentMinuteMinusTwo = currentMinuteMinusTwo + 2
            currentMinuteMinusOne = currentMinuteMinusOne + 2
            currentMinutePlusOne = currentMinutePlusOne + 2
            currentMinutePlusTwo = currentMinutePlusTwo + 2
        } else if currentMinute == GameTime - 1 {
            self.performSegue(withIdentifier: "breakSegue", sender: self)
        } else if currentMinute == GameTime {
            self.performSegue(withIdentifier: "breakSegue", sender: self)
        }
        updateLabels()
    }
    
    func resetMinutes() {
                currentMinute = 1
        currentMinuteMinusTwo = -1
        currentMinuteMinusOne = 0
        currentMinutePlusOne = 2
        currentMinutePlusTwo = 3
        updateLabels()
    }
    
    func refreshMinutes() {
        if Period > 1 && Period < 5{
            GameTime = quarterLength * Period
            currentMinute = ((quarterLength * Period) - quarterLength) + 1
        } else if Period == 5 {
    //     let overtimeLength = quarterLength / 2
            GameTime = ((quarterLength * Period) - (quarterLength / 2))
            currentMinute = ((quarterLength * Period) - quarterLength) + 1
        } else if Period > 5 {
    //      let overtimeLength = quarterLength / 2
            GameTime = ((quarterLength * Period) - (quarterLength))
            currentMinute = ((quarterLength * Period) - (quarterLength + (quarterLength / 2))) + 1
        }

        currentMinuteMinusTwo = currentMinute-2
        currentMinuteMinusOne = currentMinute-1
        currentMinutePlusOne = currentMinute+1
        currentMinutePlusTwo = currentMinute+2
        updateLabels()
    }
    
    
    func updateLabels(){
        let helpVar = quarterLength - 1
        self.CurrentMinuteLabel.text = "\(currentMinute)"
       if currentMinuteMinusTwo >= (GameTime-helpVar) {
            self.twoMinutesBackLabel.text = "\(currentMinuteMinusTwo)"
        } else {
            self.twoMinutesBackLabel.text = "" }
        if currentMinuteMinusOne >= (GameTime-helpVar) {
            self.lastMinuteLabel.text = "\(currentMinuteMinusOne)"
        } else {
            self.lastMinuteLabel.text = "" }
        
        if currentMinutePlusOne < GameTime + 1 {
            self.nextMinuteLabel.text = "\(currentMinutePlusOne)"
        } else {
            self.nextMinuteLabel.text = "" }
        
        if currentMinutePlusTwo < GameTime + 1 {
            self.plusTwoMinutesLabel.text = "\(currentMinutePlusTwo)"
        } else {
            if Period >= 4 && currentScoreTeamOne == currentScoreTeamTwo {
            self.plusTwoMinutesLabel.text = "OT"
            } else {
            self.plusTwoMinutesLabel.text = "Break"
        }
    }
        if Period <= 4 {
        periodLabel.text = "Period \(Period)"
        } else {
            periodLabel.text = "Overtime \(Period - 4)"
        }
//        if chosenTeam == 1 {
//            if statAction == "2Pointer" {
//                currentScoreTeamOne = currentScoreTeamOne + 2
//                currentScoreTeamOneLabel.text = "\(currentScoreTeamOne)"
//            } else if statAction == "3Pointer" {
//                currentScoreTeamOne = currentScoreTeamOne + 3
//                currentScoreTeamOneLabel.text = "\(currentScoreTeamOne)"
//            } else if statAction == "FTmade" {
//                currentScoreTeamOne = currentScoreTeamOne + 1
//                currentScoreTeamOneLabel.text = "\(currentScoreTeamOne)"
//            }
//        }
    }
    
    //actions
    @IBAction func twoPointerPressed(_ sender: UIButton) {
        tappedAction = "2pointer"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
    }
    
    @IBAction func threePointsPressed(_ sender: UIButton) {
        tappedAction = "3pointer"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
    }
    
    @IBAction func FTmadePressed(_ sender: UIButton) {
        tappedAction = "madeFreeThrow"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
        
    }
    
    @IBAction func FTmissedPressed(_ sender: UIButton) {
        tappedAction = "missedFreeThrow"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
        
    }
    
    @IBAction func FoulPressed(_ sender: UIButton) {
        tappedAction = "Foul"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
    }
    
    @IBAction func TOPressed(_ sender: UIButton) {
        tappedAction = "Turnover"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
    }
    
    @IBAction func StealPressed(_ sender: UIButton) {
        tappedAction = "Steal"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
        
    }
    @IBAction func TimeOutPressed(_ sender: UIButton) {
        tappedAction = "TimeOut"
        actionNumber = actionNumber + 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: tappedAction)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whatHappendToWhoMadeItSegue" {
        let whoVC = segue.destination as! WhoMadeItViewController
        whoVC.tappedAction = sender as! String
        whoVC.actualMinute = currentMinute
        whoVC.homeTeamColor = homeTeamColor
        whoVC.homeColorPale = homeColorPale
        whoVC.quarterLength = quarterLength
        whoVC.actionNumber = actionNumber
        whoVC.actualQuarter = Period
        whoVC.fieldplayers = team1
        } else if segue.identifier == "whatHappendToWhoMadeBothTeamsSegue" {
        let whoVC = segue.destination as! WhoMadeItBothTeamsViewController
        whoVC.tappedAction = sender as! String
        whoVC.actualMinute = currentMinute
        whoVC.homeTeamColor = homeTeamColor
        whoVC.guestTeamColor = guestTeamColor
        whoVC.homeColorPale = homeColorPale
        whoVC.guestColorPale = guestColorPale
        whoVC.actionNumber = actionNumber
        whoVC.actualQuarter = Period
   //     whoVC.GameTime = GameTime
        } else if segue.identifier == "breakSegue" {
        let breakVC = segue.destination as! BreakViewController
        breakVC.Period = Period
        breakVC.quarterLength = quarterLength
        breakVC.homeTeamColor = homeTeamColor
        breakVC.guestTeamColor = guestTeamColor
        breakVC.collectStatsForBothTeams = collectStatsForBothTeams
            
        } else if segue.identifier == "toInGameSettingsSegue" {
            let keepScore = segue.destination as! InGameSettingsViewController
            keepScore.Minute = currentMinute
            keepScore.homeTeamColor = homeTeamColor
            keepScore.guestTeamColor = guestTeamColor
            keepScore.homeColorPale = homeColorPale
            keepScore.guestColorPale = guestColorPale
            keepScore.homeTeamScore = currentScoreTeamOne
            keepScore.guestTeamScore = currentScoreTeamTwo
            keepScore.collectStatsForBothTeams = collectStatsForBothTeams
            keepScore.Period = Period
            keepScore.quarterLength = quarterLength
            
        }
    }
    
    override func viewDidLoad() {
        
        if collectStatsForBothTeams == 2 {
            segueToWhoMade = "whatHappendToWhoMadeBothTeamsSegue"
        } else {
            segueToWhoMade = "whatHappendToWhoMadeItSegue"
        }
        
        GameTime = quarterLength
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentScoreTeamOneLabel.text = "\(currentScoreTeamOne)"
        currentScoreTeamTwoLabel.text = "\(currentScoreTeamTwo)"
      
        if homeTeamColor == UIColor.black {
            homeColorPale = false
        }
        if homeTeamColor == UIColor.blue {
            homeColorPale = false
        }
        if homeTeamColor == UIColor.red {
            homeColorPale = false
        }
        if homeTeamColor == UIColor.white {
            homeColorPale = true
        }
        if homeTeamColor == UIColor.yellow {
            homeColorPale = true
        }
        if homeTeamColor == UIColor.green {
            homeColorPale = true
        }
        if guestTeamColor == UIColor.black {
            guestColorPale = false
        }
        if guestTeamColor == UIColor.blue {
            guestColorPale = false
        }
        if guestTeamColor == UIColor.red {
            guestColorPale = false
        }
        if guestTeamColor == UIColor.white {
            guestColorPale = true
        }
        if guestTeamColor == UIColor.yellow {
            guestColorPale = true
        }
        if guestTeamColor == UIColor.green {
            guestColorPale = true
        }

        refreshMinutes()
        updateLabels()
           }

    override func viewWillAppear(_ animated: Bool) {
            
//        onFieldTeamOne = [t1p1, t1p2, t1p3, t1p4, t1p5]
//        onFieldTeamOne.sort()
//        t1p1 = onFieldTeamOne[0]
//        t1p2 = onFieldTeamOne[1]
//        t1p3 = onFieldTeamOne[2]
//        t1p4 = onFieldTeamOne[3]
//        t1p5 = onFieldTeamOne[4]
//        benchPlayersTeamOne = [t1p6, t1p7, t1p8, t1p9, t1p10, t1p11, t1p12]
//        benchPlayersTeamOne.sort()
//        t1p6 = benchPlayersTeamOne[0]
//        t1p7 = benchPlayersTeamOne[1]
//        t1p8 = benchPlayersTeamOne[2]
//        t1p9 = benchPlayersTeamOne[3]
//        t1p10 = benchPlayersTeamOne[4]
//        t1p11 = benchPlayersTeamOne[5]
//        t1p12 = benchPlayersTeamOne[6]
//
//
//        print ("on the field \(onFieldTeamOne)")
//        print ("on the bench \(benchPlayersTeamOne)")
        
//        print("what \(t1p1) + \(t1p2) + \(t1p3) + \(t1p4) + \(t1p5) + \(t1p6) + \(t1p7) + \(t1p8) + \(t1p9) + \(t1p10) + \(t1p11) + \(t1p12)")
//        print("what \(t2p1) + \(t2p2) + \(t2p3) + \(t2p4) + \(t2p5) + \(t2p6) + \(t2p7) + \(t2p8) + \(t2p9) + \(t2p10) + \(t2p11) + \(t2p12)")
    loadTeamPlayers()
    lastStat()
    updateLabels()
        }
    
        func lastStat() {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                stats = try context.fetch(Stat.fetchRequest()) as! [Stat]
                actionNumber = stats.count
      //          print ("\(actionNumber) Actions")
            } catch {
                print ("tüdülü Error")
            }
      //      lastStatActionLabel.text = "\(stats.action)"
        }
    
    func loadTeamPlayers() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            let loadPlayers = try context.fetch(Team1.fetchRequest()) as [Team1]
            for team in loadPlayers {
                team1 = team.fieldplayers as! [Int]
     //           team1 = [Int(team.player1), Int(team.player2), Int(team.player3), Int(team.player4), Int(team.player5), Int(team.player6), Int(team.player7), Int(team.player8), Int(team.player9), Int(team.player10), Int(team.player11), Int(team.player12)]
            }
            /*      do {
             
             let loadMin = try context.fetch(Game.fetchRequest()) as [Game]
             for stat in loadMin {
             //         let lastStatMinute = stat.minute
             lastStatMinuteLabel.text = "\(stat.minute)th minute"
             }
             } catch {
             print("didn't load minute")
             }
             
             let starters = loadPlayers.startingfive
            self.t1p1 = starters[0] as Int
            print("starters \(loadPlayers)")
 */           //let playerNumber = loadPlayers.count
//            t1p1 = Int(loadPlayers.player1)
  //          print("T1P1: \(loadPlayers.player1)")
        //print(loadPlayers.count)
        } catch {
            print("didn't load players")
        }
    }
    
}


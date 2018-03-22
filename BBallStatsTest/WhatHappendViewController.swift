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
     //   whoVC.GameTime = GameTime
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
        
        
        
          print("** what homeColorPale \(homeColorPale), guestColorPale \(guestColorPale)")
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
        //Period = 1
       // UserDefaults.standard.set("1", forKey: "period")
        
   /*     let setPeriodObject = UserDefaults.standard.object(forKey: "period")
        if let setPeriod = setPeriodObject as? String {
            if setPeriod == "1" {
                Period = 1
                periodLabel.text = "Period \(Period)"
                UserDefaults.standard.set("1", forKey: "period")
                currentMinute = 1
                print ("Period \(Period)")
            } else if setPeriod == "2" {
                Period = 2
                periodLabel.text = "Period \(Period)"
                UserDefaults.standard.set("2", forKey: "period")
                currentMinute = 11
                print ("Period \(Period)")
            } else if setPeriod == "3" {
                Period = 3
                periodLabel.text = "Period \(Period)"
                UserDefaults.standard.set("3", forKey: "period")
                currentMinute = 21
                print ("Period \(Period)")
            } else if setPeriod == "4" {
                Period = 4
                periodLabel.text = "Period \(Period)"
                plusTwoMinutesLabel.text = "Finish"
                UserDefaults.standard.set("4", forKey: "period")
                currentMinute = 31
                print("Period \(Period)")
            }
        } */
        refreshMinutes()
        updateLabels()
           }

    override func viewWillAppear(_ animated: Bool) {
        lastStat()
        
   /*     let appDelegate = UIApplication.shared.delegate as! AppDelegate // UIApplication.shared().delegate as! AppDelegate is now UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let newStat = NSEntityDescription.insertNewObject(forEntityName: "Stats", into: context)

    
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]
                {
                    if let player = result.value(forKey: "player") as? String {
                        print(player)
                    }
                }
            } else {
                print("No results")
            }
        } catch {
            print("Couldn't fetch results")
        } */
   /*     func fetchLastStat(){
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                stats = try context.fetch(Stat.fetchRequest()) // as! [Stat]
            } catch {
                print("Error Error Error")
            }
            
        }
 */
    /*    let setPeriodObject = UserDefaults.standard.object(forKey: "period")
        if let setPeriod = setPeriodObject as? String {
            if setPeriod == "1" {
                    Period = 1
                    periodLabel.text = "Period \(Period)"
                    UserDefaults.standard.set("1", forKey: "period")
                    currentMinute = 1
                    print ("Period \(Period)")
            } else if setPeriod == "2" {
                    Period = 2
                    periodLabel.text = "Period \(Period)"
                    UserDefaults.standard.set("2", forKey: "period")
                    currentMinute = 11
                    print ("Period \(Period)")
            } else if setPeriod == "3" {
                    Period = 3
                    periodLabel.text = "Period \(Period)"
                    UserDefaults.standard.set("3", forKey: "period")
                    currentMinute = 21
                    print ("Period \(Period)")
            } else if setPeriod == "4" {
                    Period = 4
                    periodLabel.text = "Period \(Period)"
                    plusTwoMinutesLabel.text = "Finish"
                    UserDefaults.standard.set("4", forKey: "period")
                    currentMinute = 31
                    print("Period \(Period)")
            }
                refreshMinutes()
                print ("test1")
                updateLabels()
        } */
        
        let resetGameObject = UserDefaults.standard.object(forKey: "action")
        if let resetGame = resetGameObject as? String {
        if resetGame == "resetGame" {
            currentScoreTeamOne = 0
            currentScoreTeamOneLabel.text = "0"
            currentScoreTeamTwo = 0
            currentScoreTeamTwoLabel.text = "0"
            GameTime = 10
            Period = 1
            resetMinutes()
            updateLabels()
            }
        }
        
        
     /*   let lastStatMinuteObject = UserDefaults.standard.object(forKey: "minute")
        if let lastStatMinute = lastStatMinuteObject as? String {
            
            if lastStatMinute == "1" {
                lastStatMinuteLabel.text = "1st Minute"
            } else if lastStatMinute == "2" {
                lastStatMinuteLabel.text = "2nd Minute"
            } else if lastStatMinute == "3" {
                lastStatMinuteLabel.text = "3rd Minute"
            } else {
            lastStatMinuteLabel.text = "\(lastStatMinute)th Minute"
            }
            
            let lastStatActionObject = UserDefaults.standard.object(forKey: "action")
            
            if let lastStatAction = lastStatActionObject as? String {
                lastStatActionLabel.text = "\(lastStatAction)"
            }
            
        } */
        if collectStatsForBothTeams == 2 {
            segueToWhoMade = "whatHappendToWhoMadeBothTeamsSegue"
        } else {
            segueToWhoMade = "whatHappendToWhoMadeItSegue"
        }

//        let lastStatPlayerObject = UserDefaults.standard.object(forKey: "player")
//        if let lastStatPlayer = lastStatPlayerObject as? String {
//            lastStatPlayerLabel.text = "\(lastStatPlayer)"
//            //lastStatPlayerLabel.textColor = teamOneColor
//        }
  
     
        if chosenTeam == 1 {
                    if statAction == "2Pointer" {
                            currentScoreTeamOne = currentScoreTeamOne + 2
                            currentScoreTeamOneLabel.text = "\(currentScoreTeamOne)"
                        } else if statAction == "3Pointer" {
                            currentScoreTeamOne = currentScoreTeamOne + 3
                            currentScoreTeamOneLabel.text = "\(currentScoreTeamOne)"
                        } else if statAction == "FTmade" {
                            currentScoreTeamOne = currentScoreTeamOne + 1
                            currentScoreTeamOneLabel.text = "\(currentScoreTeamOne)"
                        }
}
      /*                      lastStatPlayerLabel.text = "\(statPlayer)"
                            lastStatPlayerLabel.color = homeTeamColor
                            if let lastStatTeamColor = lastStatTeamColorObject as? String {
                                if homeTeamColor == "black" {
                                    lastStatPlayerLabel.textColor = UIColor.black
                                } else if homeTeamColor == "blue" {
                                    lastStatPlayerLabel.textColor = UIColor.blue
                                } else if homeTeamColor == "red" {
                                    lastStatPlayerLabel.textColor = UIColor.red
                                } else if homeTeamColor == "white" {
                                    lastStatPlayerLabel.textColor = UIColor.white
                                } else if homeTeamColor == "yellow" {
                                    lastStatPlayerLabel.textColor = UIColor.yellow
                                } else if homeTeamColor == "green" {
                                    lastStatPlayerLabel.textColor = UIColor.green
                                }
                            }
                        }
                }
    /*        } else if chosenTeam == 2 {
                print("selected Team T2")
                let lastStatActionObject = UserDefaults.standard.object(forKey: "action")
                if let lastStatAction = lastStatActionObject as? String {
                    if lastStatAction == "2Points" {
                        currentScoreTeamTwo = currentScoreTeamTwo + 2
                        currentScoreTeamTwoLabel.text = "\(currentScoreTeamTwo)"
                    } else if lastStatAction == "3Points" {
                        currentScoreTeamTwo = currentScoreTeamTwo + 3
                        currentScoreTeamTwoLabel.text = "\(currentScoreTeamTwo)"
                    } else if lastStatAction == "FTmade" {
                        currentScoreTeamTwo = currentScoreTeamTwo + 1
                        currentScoreTeamTwoLabel.text = "\(currentScoreTeamTwo)"
                    }
                    let lastStatPlayerObject = UserDefaults.standard.object(forKey: "player")
                    if let lastStatPlayer = lastStatPlayerObject as? String {
                        lastStatPlayerLabel.text = "\(lastStatPlayer)"
                        let lastStatTeamColorObject = UserDefaults.standard.object(forKey: "OpponentJerseyColor")
                        if let lastStatTeamColor = lastStatTeamColorObject as? String {
                            if lastStatTeamColor == "black" {
                                lastStatPlayerLabel.textColor = UIColor.black
                            } else if lastStatTeamColor == "blue" {
                                lastStatPlayerLabel.textColor = UIColor.blue
                            } else if lastStatTeamColor == "red" {
                                lastStatPlayerLabel.textColor = UIColor.red
                            } else if lastStatTeamColor == "white" {
                                lastStatPlayerLabel.textColor = UIColor.white
                            } else if lastStatTeamColor == "yellow" {
                                lastStatPlayerLabel.textColor = UIColor.yellow
                            } else if lastStatTeamColor == "green" {
                                lastStatPlayerLabel.textColor = UIColor.green
                            }
                        }
                    }
                    
                }
            }
        }
         */
 */
        updateLabels()
    }
    func lastStat() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            stats = try context.fetch(Stat.fetchRequest()) as! [Stat]
            // lastStatActionLabel.text = stats.action
            print (stats)
        } catch {
            print ("tüdülü Error")
        }
        
    }
}

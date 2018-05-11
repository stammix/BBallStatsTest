//
//  SubstitutionViewController.swift
//  BBallStats
//
//  Created by Fred Erik on 30.10.16.
//  Copyright © 2016 Fred Erik. All rights reserved.
//

import UIKit
import CoreData


class SubstitutionViewController: UIViewController {
    
    var gonePlayer = 1
    var newPlayer = 6
    var changingTeam = 1
    var homeTeamColor = UIColor()
    var guestTeamColor = UIColor()
    var subTeamColor = UIColor ()
    var homeColorPale = true
    var guestColorPale = false
    var subTeamPale = true
   // var JerseyColor = UIColor.black
    var actualQuarter = 0
    var actualMinute = 1
    var substution = 0
    var tappedAction = ""
    var chosenTeam = 1
    var quarterLength = 10
    var GameTime = 10
    var actionNumber = 0
    var pointsOfAction = 0
    var fieldPlayers = [0,1,2,3,4]
    var benchPlayers = [5,6,7,8,9,10,11]
    
    var p1 = 0
    var p2 = 1
    var p3 = 2
    var p4 = 3
    var p5 = 4
   /*
    var p1 = "dfa"
    var p2 = "fadf"
    var p3 = "test"
    var p4 = "fadf"
    var p5 = "test"
    */
    
    static var persistendContainer: NSPersistentContainer {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
    }
    static var viewContext: NSManagedObjectContext {
        return persistendContainer.viewContext
    }
    
    @IBOutlet weak var SubButton1: UIButton!
    @IBOutlet weak var SubButton2: UIButton!
    @IBOutlet weak var SubButton3: UIButton!
    @IBOutlet weak var SubButton4: UIButton!
    @IBOutlet weak var SubButton5: UIButton!
    
    
    @IBAction func SubForP1(_ sender: UIButton) {
        gonePlayer = 0
        saveStat()
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func SubForP2(_ sender: UIButton) {
        gonePlayer = 1
        saveStat()
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func SubForP3(_ sender: UIButton) {
        gonePlayer = 2
        saveStat()
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func SubForP4(_ sender: UIButton) {
        gonePlayer = 3
        saveStat()
        let _ = navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func SubForP5(_ sender: UIButton) {
        gonePlayer = 4
        saveStat()
        let _ = navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if chosenTeam == 1 {
            subTeamPale = homeColorPale
            SubButton1.backgroundColor = homeTeamColor
            SubButton2.backgroundColor = homeTeamColor
            SubButton3.backgroundColor = homeTeamColor
            SubButton4.backgroundColor = homeTeamColor
            SubButton5.backgroundColor = homeTeamColor
        } else if chosenTeam == 2 {
            subTeamPale = guestColorPale
            SubButton1.backgroundColor = guestTeamColor
            SubButton2.backgroundColor = guestTeamColor
            SubButton3.backgroundColor = guestTeamColor
            SubButton4.backgroundColor = guestTeamColor
            SubButton5.backgroundColor = guestTeamColor
        }
    
   /*     if homeTeamColor == UIColor.white {
            paleJerseyColor = true
        } else if homeTeamColor == UIColor.yellow{
            paleJerseyColor = true
        } else if homeTeamColor == UIColor.green{
            paleJerseyColor = true
        } else {
            paleJerseyColor = false
        }
        if guestTeamColor == UIColor.white {
            paleJerseyColor = true
        } else if guestTeamColor == UIColor.yellow{
            paleJerseyColor = true
        } else if guestTeamColor == UIColor.green{
            paleJerseyColor = true
        } else {
            paleJerseyColor = false
        } */
        if subTeamPale == true {
            SubButton1.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            SubButton1.setTitleColor(UIColor.black, for: .normal)
            SubButton2.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            SubButton2.setTitleColor(UIColor.black, for: .normal)
            SubButton3.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            SubButton3.setTitleColor(UIColor.black, for: .normal)
            SubButton4.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            SubButton4.setTitleColor(UIColor.black, for: .normal)
            SubButton5.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            SubButton5.setTitleColor(UIColor.black, for: .normal)
        }
        
        
  /*      //TeamColors
        if changingTeam == 2 {
            let homeJerseyColorObject = UserDefaults.standard.object(forKey: "HomeJerseyColor")
            if let homeJerseyColor = homeJerseyColorObject as? String {
                if homeJerseyColor == "black" {
                    paleJerseyColor = false
                    JerseyColor = UIColor.black
                } else if homeJerseyColor == "blue" {
                    paleJerseyColor = false
                    JerseyColor = UIColor.blue
                } else if homeJerseyColor == "red" {
                    paleJerseyColor = false
                JerseyColor = UIColor.red
                } else if homeJerseyColor == "white" {
                    paleJerseyColor = true
                    JerseyColor = UIColor.white
                } else if homeJerseyColor == "yellow" {
                    paleJerseyColor = true
                    JerseyColor = UIColor.yellow
                } else if homeJerseyColor == "green" {
                    paleJerseyColor = true
                    JerseyColor = UIColor.green
                }
            }
            } else if changingTeam == 2 {
            let opponentJerseyColorObject = UserDefaults.standard.object(forKey: "OpponentJerseyColor")
            if let opponentJerseyColor = opponentJerseyColorObject as? String {
                if opponentJerseyColor == "black" {
                    paleJerseyColor = false
                    JerseyColor = UIColor.black
                } else if opponentJerseyColor == "blue" {
                    paleJerseyColor = false
                    JerseyColor = UIColor.blue
                } else if opponentJerseyColor == "red" {
                    paleJerseyColor = false
                    JerseyColor = UIColor.red
                } else if opponentJerseyColor == "white" {
                    paleJerseyColor = true
                    JerseyColor = UIColor.white
                } else if opponentJerseyColor == "yellow" {
                    paleJerseyColor = true
                    JerseyColor = UIColor.yellow
                } else if opponentJerseyColor == "green" {
                    paleJerseyColor = true
                    JerseyColor = UIColor.green
                }
            }
        }
        
        
            if paleJerseyColor == true {
                SubButton1.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
                SubButton1.setTitleColor(UIColor.black, for: .normal)
                SubButton2.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
                SubButton2.setTitleColor(UIColor.black, for: .normal)
                SubButton3.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
                SubButton3.setTitleColor(UIColor.black, for: .normal)
                SubButton4.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
                SubButton4.setTitleColor(UIColor.black, for: .normal)
                SubButton5.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
                SubButton5.setTitleColor(UIColor.black, for: .normal)
            } else if paleJerseyColor == false {
                SubButton1.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
                SubButton2.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
                SubButton3.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
                SubButton4.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
                SubButton5.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            }
        
        if paleJerseyColor == true {
            
        }
        
        if changingTeam == 1 {
            SubButton1.backgroundColor = JerseyColor
            SubButton2.backgroundColor = JerseyColor
            SubButton3.backgroundColor = JerseyColor
            SubButton4.backgroundColor = JerseyColor
            SubButton5.backgroundColor = JerseyColor
        
       } else if changingTeam == 2 {
            SubButton1.backgroundColor = JerseyColor
            SubButton2.backgroundColor = JerseyColor
            SubButton3.backgroundColor = JerseyColor
            SubButton4.backgroundColor = JerseyColor
            SubButton5.backgroundColor = JerseyColor
            }
     */
        
    }
    override func viewWillAppear(_ animated: Bool) {
        SubButton1.setTitle("\(p1)", for: .normal)
        SubButton2.setTitle("\(p2)", for: .normal)
        SubButton3.setTitle("\(p3)", for: .normal)
        SubButton4.setTitle("\(p4)", for: .normal)
        SubButton5.setTitle("\(p5)", for: .normal)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let statVC = segue.destination as! WhatHappendViewController
        statVC.gonePlayer = gonePlayer
        statVC.newPlayer = newPlayer
        statVC.statAction = tappedAction
        statVC.chosenTeam = chosenTeam
        statVC.quarterLength = quarterLength
        statVC.GameTime = GameTime
        statVC.homeColorPale = homeColorPale
        statVC.guestColorPale = guestColorPale
    }
    func saveStat() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let stat = Stat(context: context)
        // stat.actionID = UUID(actionNumber)
        stat.quarter = Int32(actualQuarter)
        stat.minute = Int32(actualMinute)
        stat.chosenTeam = Int32(chosenTeam)
        stat.player = Int32(newPlayer)
        stat.action = tappedAction
        stat.points = Int32(pointsOfAction)
        stat.gonePlayer = Int32(gonePlayer)
        stat.newPlayer = Int32(newPlayer)
        stat.substitution = true
     //   let team = Team(context: context)
    //    team.fieldPlayers! = fieldPlayers
      //  team.benchPlayers = NSManagedObject(benchPlayers)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }

}

//
//  WhoMadeItViewController.swift
//  BballStats
//
//  Created by Fred Erik on 16.07.16.
//  Copyright © 2016 Fred Erik. All rights reserved.
//

import UIKit
import CoreData

class WhoMadeItViewController: UIViewController {
    
    var JerseyColor = UIColor.white
    var tappedAction = "NO ACTION"
    var actualQuarter = 1
    var actualMinute = 1
    var homeTeamName = ""
    var guestTeamName = ""
    var homeTeamColor = UIColor()
    var guestTeamColor = UIColor()
    var homeColorPale = true
    var guestColorPale = false
    var player = 1
    var playerToSwitchIn = 6
    var paleJerseyColor = true
    var chosenTeam = 1
    var quarterLength = 10
    var GameTime = 10
    var pointsOfAction = 0
    var actionNumber = 0
    
    
    
  
    @IBOutlet weak var jersey1Button: UIButton!
    @IBOutlet weak var jersey2Button: UIButton!
    @IBOutlet weak var jersey3Button: UIButton!
    @IBOutlet weak var jersey4Button: UIButton!
    @IBOutlet weak var jersey5Button: UIButton!
    @IBOutlet weak var jersey6Button: UIButton!
    @IBOutlet weak var jersey7Button: UIButton!
    @IBOutlet weak var jersey8Button: UIButton!
    @IBOutlet weak var jersey9Button: UIButton!
    @IBOutlet weak var jersey10Button: UIButton!
    @IBOutlet weak var jersey11Button: UIButton!
    @IBOutlet weak var jersey12Button: UIButton!
    
    
    
    @IBAction func T1P1Pressed(_ sender: UIButton) {
        player = 1
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T1P2Pressed(_ sender: UIButton) {
        player = 2
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P3Pressed(_ sender: UIButton) {
        player = 3
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P4Pressed(_ sender: UIButton) {
        player = 4
        saveStat()
      let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P5Pressed(_ sender: UIButton) {
        player = 5
        saveStat()
       let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P6Pressed(_ sender: UIButton) {
        playerToSwitchIn = 6
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: playerToSwitchIn)
    }
    @IBAction func T1P7Pressed(_ sender: UIButton) {
        playerToSwitchIn = 7
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: playerToSwitchIn)
    }
    
    @IBAction func T1P8Pressed(_ sender: UIButton) {
        playerToSwitchIn = 8
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: playerToSwitchIn)
    }
    @IBAction func T1P9Pressed(_ sender: UIButton) {
        playerToSwitchIn = 9
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: playerToSwitchIn)
    }
    @IBAction func T1P10Pressed(_ sender: UIButton) {
        playerToSwitchIn = 10
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: playerToSwitchIn)
    }
    @IBAction func T1P11Pressed(_ sender: UIButton) {
        playerToSwitchIn = 11
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: playerToSwitchIn)
    }
    @IBAction func T1P12Pressed(_ sender: UIButton) {
        playerToSwitchIn = 12
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: playerToSwitchIn)
    }
 /*
    func createStat(_ sender: AnyObject?) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newStat = Stats(context: context)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let _ = navigationController?.popViewController(animated: true)
        
    } */
    
     override func viewDidLoad() {
     super.viewDidLoad()
     //TeamColors
        
        
        JerseyColor = homeTeamColor
        
  /*   if homeTeamColor == UIColor.black {
     paleJerseyColor = false
     } else if homeTeamColor == UIColor.blue{
     paleJerseyColor = false
     } else if homeTeamColor == UIColor.red{
     paleJerseyColor = false
     } else if homeTeamColor == UIColor.white{
     paleJerseyColor = true
     JerseyColor = UIColor.white
     } else if homeTeamColor == UIColor.yellow{
     paleJerseyColor = true
     } else if homeTeamColor == UIColor.green{
     paleJerseyColor = true
     } */
     
     
     if paleJerseyColor == true {
     jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey1Button.setTitleColor(UIColor.black, for: .normal)
     jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey2Button.setTitleColor(UIColor.black, for: .normal)
     jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey3Button.setTitleColor(UIColor.black, for: .normal)
     jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey4Button.setTitleColor(UIColor.black, for: .normal)
     jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey5Button.setTitleColor(UIColor.black, for: .normal)
    jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey6Button.setTitleColor(UIColor.black, for: .normal)
    jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey7Button.setTitleColor(UIColor.black, for: .normal)
    jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey8Button.setTitleColor(UIColor.black, for: .normal)
    jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey9Button.setTitleColor(UIColor.black, for: .normal)
    jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey10Button.setTitleColor(UIColor.black, for: .normal)
    jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey11Button.setTitleColor(UIColor.black, for: .normal)
    jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
        jersey12Button.setTitleColor(UIColor.black, for: .normal)
     } else if paleJerseyColor == false {
     jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
     jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
     jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
     jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
     jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
     }
     
     jersey1Button.backgroundColor = JerseyColor
     jersey2Button.backgroundColor = JerseyColor
     jersey3Button.backgroundColor = JerseyColor
     jersey4Button.backgroundColor = JerseyColor
     jersey5Button.backgroundColor = JerseyColor
        jersey6Button.backgroundColor = JerseyColor
        jersey7Button.backgroundColor = JerseyColor
        jersey8Button.backgroundColor = JerseyColor
        jersey9Button.backgroundColor = JerseyColor
        jersey10Button.backgroundColor = JerseyColor
        jersey11Button.backgroundColor = JerseyColor
        jersey12Button.backgroundColor = JerseyColor

        print ("HomeTeamColor is \(homeTeamColor)")
        print ("TappedAction is \(tappedAction)")
        print("There was a \(tappedAction) in the \(actualMinute). Minute")
    }
    override func viewWillAppear(_ animated: Bool) {
        if tappedAction == "2pointer" {
            pointsOfAction = 2
        } else if tappedAction == "3pointer" {
            pointsOfAction = 3
        } else if tappedAction == "madeFreeThrow" {
            pointsOfAction = 1
        }
    }
    func saveStat() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let stat = Stat(context: context)
        // stat.actionID = UUID(actionNumber)
        stat.quarter = Int32(actualQuarter)
        stat.minute = Int32(actualMinute)
        stat.chosenTeam = Int32(chosenTeam)
        stat.player = Int32(player)
        stat.action = tappedAction
        stat.points = Int32(pointsOfAction)
        stat.actionID = Int32(actionNumber)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let subVC = segue.destination as! SubstitutionViewController
        subVC.newPlayer = playerToSwitchIn
        subVC.homeTeamColor = homeTeamColor
        subVC.guestTeamColor = guestTeamColor
        subVC.subTeamPale = paleJerseyColor
        subVC.tappedAction = tappedAction
        subVC.chosenTeam = chosenTeam
        subVC.quarterLength = quarterLength
        subVC.GameTime = GameTime
        subVC.actionNumber = actionNumber
    }
}

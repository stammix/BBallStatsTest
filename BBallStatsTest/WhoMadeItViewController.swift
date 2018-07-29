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
    var fieldplayers = [Int()]
    
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
    
     override func viewDidLoad() {
     super.viewDidLoad()
     
        jersey1Button.setTitle("\(fieldplayers[0])", for: .normal)
        jersey2Button.setTitle("\(fieldplayers[1])", for: .normal)
        jersey3Button.setTitle("\(fieldplayers[2])", for: .normal)
        jersey4Button.setTitle("\(fieldplayers[3])", for: .normal)
        jersey5Button.setTitle("\(fieldplayers[4])", for: .normal)
        jersey6Button.setTitle("\(fieldplayers[5])", for: .normal)
        jersey7Button.setTitle("\(fieldplayers[6])", for: .normal)
        jersey8Button.setTitle("\(fieldplayers[7])", for: .normal)
        jersey9Button.setTitle("\(fieldplayers[8])", for: .normal)
        jersey10Button.setTitle("\(fieldplayers[9])", for: .normal)
        jersey11Button.setTitle("\(fieldplayers[10])", for: .normal)
        jersey12Button.setTitle("\(fieldplayers[11])", for: .normal)
        //TeamColors
        print(fieldplayers[0])
        
        
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
        print("who \(fieldplayers)")
    }
    func saveStat() {
        createStat(actionID: 1, quarter: Int32(actualQuarter), minute: Int32(actualMinute), action: tappedAction, chosenTeam: Int32(chosenTeam), player: Int32(player), points: Int32(pointsOfAction))
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
        subVC.fieldplayers = fieldplayers
    }
}

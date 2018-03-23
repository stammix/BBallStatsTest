//
//  InGameSettingsViewController.swift
//  BBallStats
//
//  Created by Fred Erik on 16.10.16.
//  Copyright © 2016 Fred Erik. All rights reserved.
//

import UIKit
import CoreData

class InGameSettingsViewController: UIViewController {

 //   var collectForBothTeams = false
    var homeTeamColor = UIColor.white
    var guestTeamColor = UIColor.black
    var homeColorPale = true
    var guestColorPale = false
    var Period = 1
    var Minute = 1
    var homeTeamScore = 0
    var guestTeamScore = 0
    var collectStatsForBothTeams = 1
    var quarterLength = 10
    var t1p1 = "test"
    var t1p2 = "fadf"
    var t1p3 = "test"
    var t1p4 = "fadf"
    var t1p5 = "test"
    var t1p6 = "fadf"
    var t1p7 = "test"
    var t1p8 = "fadf"
    var t1p9 = "test"
    var t1p10 = "fadf"
    var t1p11 = "test"
    var t1p12 = "fadf"
    var t2p1 = "test"
    var t2p2 = "fadf"
    var t2p3 = "test"
    var t2p4 = "fadf"
    var t2p5 = "test"
    var t2p6 = "fadf"
    var t2p7 = "test"
    var t2p8 = "fadf"
    var t2p9 = "test"
    var t2p10 = "fadf"
    var t2p11 = "test"
    var t2p12 = "fadf"
  

    @IBOutlet weak var teamSwitch: UISwitch!
    @IBAction func collectBothSwitch(_ sender: UISwitch) {
        if collectStatsForBothTeams == 1 {
            collectStatsForBothTeams = 2
        } else if collectStatsForBothTeams == 2 {
            collectStatsForBothTeams = 1
        }
    }
   
    @IBAction func resetGameButton(_ sender: AnyObject) {
        Period = 1
        Minute = 1
        homeTeamScore = 0
        guestTeamScore = 0
    }

    @IBAction func tippOffButton(_ sender: AnyObject) {
        t1p1 = T1P1NrTextField.text!
        t1p2 = T1P2NrTextField.text!
        t1p3 = T1P3NrTextField.text!
        t1p4 = T1P4NrTextField.text!
        t1p5 = T1P5NrTextField.text!
        t1p6 = T1P6NrTextField.text!
        t1p7 = T1P7NrTextField.text!
        t1p8 = T1P8NrTextField.text!
        t1p9 = T1P9NrTextField.text!
        t1p10 = T1P10NrTextField.text!
        t1p11 = T1P11NrTextField.text!
        t1p12 = T1P12NrTextField.text!
        t2p1 = T2P1NrTextField.text!
        t2p2 = T2P2NrTextField.text!
        t2p3 = T2P3NrTextField.text!
        t2p4 = T2P4NrTextField.text!
        t2p5 = T2P5NrTextField.text!
        t2p6 = T2P6NrTextField.text!
        t2p7 = T2P7NrTextField.text!
        t2p8 = T2P8NrTextField.text!
        t2p9 = T2P9NrTextField.text!
        t2p10 = T2P10NrTextField.text!
        t2p11 = T2P11NrTextField.text!
        t2p12 = T2P12NrTextField.text!
         self.performSegue(withIdentifier: "SettingsToGameSegue", sender: self)
    }
    @IBOutlet weak var T1P1NrTextField: UITextField!
    @IBOutlet weak var T1P2NrTextField: UITextField!
    @IBOutlet weak var T1P3NrTextField: UITextField!
    @IBOutlet weak var T1P4NrTextField: UITextField!
    @IBOutlet weak var T1P5NrTextField: UITextField!
    @IBOutlet weak var T1P6NrTextField: UITextField!
    @IBOutlet weak var T1P7NrTextField: UITextField!
    @IBOutlet weak var T1P8NrTextField: UITextField!
    @IBOutlet weak var T1P9NrTextField: UITextField!
    @IBOutlet weak var T1P10NrTextField: UITextField!
    @IBOutlet weak var T1P11NrTextField: UITextField!
    @IBOutlet weak var T1P12NrTextField: UITextField!
    @IBOutlet weak var T2P1NrTextField: UITextField!
    @IBOutlet weak var T2P2NrTextField: UITextField!
    @IBOutlet weak var T2P3NrTextField: UITextField!
    @IBOutlet weak var T2P4NrTextField: UITextField!
    @IBOutlet weak var T2P5NrTextField: UITextField!
    @IBOutlet weak var T2P6NrTextField: UITextField!
    @IBOutlet weak var T2P7NrTextField: UITextField!
    @IBOutlet weak var T2P8NrTextField: UITextField!
    @IBOutlet weak var T2P9NrTextField: UITextField!
    @IBOutlet weak var T2P10NrTextField: UITextField!
    @IBOutlet weak var T2P11NrTextField: UITextField!
    @IBOutlet weak var T2P12NrTextField: UITextField!
    
    
    @IBAction func HomeTeamBlack(_ sender: AnyObject) {
        homeTeamColor = UIColor.black
  //      homeColorPale = false
    }
    @IBAction func HomeTeamBlue(_ sender: AnyObject) {
        homeTeamColor = UIColor.blue
  //      homeColorPale = false
    }
    
    @IBAction func HomeTeamRed(_ sender: AnyObject) {
        homeTeamColor = UIColor.red
  //      homeColorPale = false
    }
    @IBAction func HomeTeamWhite(_ sender: AnyObject) {
        homeTeamColor = UIColor.white
 //       homeColorPale = true
    }
    
    @IBAction func HomeTeamYellow(_ sender: AnyObject) {
        homeTeamColor = UIColor.yellow
    //    homeColorPale = true
    }
    @IBAction func HomeTeamGreen(_ sender: AnyObject) {
        homeTeamColor = UIColor.green
  //      homeColorPale = true
    }
    
    @IBAction func OpponentTeamBlack(_ sender: UIButton) {
        guestTeamColor = UIColor.black
    //    homeColorPale = false
    }
    @IBAction func OpponentTeamBlue(_ sender: UIButton) {
        guestTeamColor = UIColor.blue
  //      homeColorPale = false
    }
    @IBAction func OpponentTeamRed(_ sender: UIButton) {
        guestTeamColor = UIColor.red
       // homeColorPale = false
    }
    @IBAction func OpponentTeamWhite(_ sender: AnyObject) {
        guestTeamColor = UIColor.white
     //   homeColorPale = true
        
    }
    @IBAction func OpponentTeamYellow(_ sender: AnyObject) {
        guestTeamColor = UIColor.yellow
   //     homeColorPale = true
    }
    @IBAction func OpponentTeamGreen(_ sender: AnyObject) {
        guestTeamColor = UIColor.green
 //       homeColorPale = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let NVC = segue.destination as! UINavigationController
        let whatVC = NVC.topViewController as! WhatHappendViewController
        whatVC.homeTeamColor = homeTeamColor
        whatVC.guestTeamColor = guestTeamColor
     //   whatVC.homeColorPale = homeColorPale
    //  whatVC.guestColorPale = guestColorPale
        whatVC.Period = Period
        whatVC.currentMinute = Minute
        whatVC.currentScoreTeamOne = homeTeamScore
        whatVC.currentScoreTeamTwo = guestTeamScore
        whatVC.collectStatsForBothTeams = collectStatsForBothTeams
        whatVC.quarterLength = quarterLength
        whatVC.t1p1 = t1p1
        whatVC.t1p2 = t1p2
        whatVC.t1p3 = t1p3
        whatVC.t1p4 = t1p4
        whatVC.t1p5 = t1p5
        whatVC.t1p6 = t1p6
        whatVC.t1p7 = t1p7
        whatVC.t1p8 = t1p8
        whatVC.t1p9 = t1p9
        whatVC.t1p10 = t1p10
        whatVC.t1p11 = t1p11
        whatVC.t1p12 = t1p12
        if collectStatsForBothTeams == 2 {
            whatVC.t2p1 = t2p1
            whatVC.t2p2 = t2p2
            whatVC.t2p3 = t2p3
            whatVC.t2p4 = t2p4
            whatVC.t2p5 = t2p5
            whatVC.t2p6 = t2p6
            whatVC.t2p7 = t2p7
            whatVC.t2p8 = t2p8
            whatVC.t2p9 = t2p9
            whatVC.t2p10 = t2p10
            whatVC.t2p11 = t2p11
            whatVC.t2p12 = t2p12
      
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if collectStatsForBothTeams == 2 {
            teamSwitch.setOn(true, animated: true)
        }
        
        // Do any additional setup after loading the view.
    
    }
    override func viewWillAppear(_ animated: Bool) {
       
        print("Settings \(t1p1) + \(t1p2) + \(t1p3) + \(t1p4) + \(t1p5) + \(t1p6) + \(t1p7) + \(t1p8) + \(t1p9) + \(t1p10) + \(t1p11) + \(t1p12)")
    }
}

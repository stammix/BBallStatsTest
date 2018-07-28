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
    var starters: [Int32] = []
    @NSManaged var fieldplayers: [NSNumber]
    @NSManaged var benchplayers: [NSNumber]
    
  

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
        createTeams()
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
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if collectStatsForBothTeams == 2 {
            teamSwitch.setOn(true, animated: true)
        }
        
        // Do any additional setup after loading the view.
    
    }
    override func viewWillAppear(_ animated: Bool) {
      
    }
    func createTeams() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let team1 = Team1(context: context)
  //      starters = [Int32(T1P1NrTextField.text!)!, Int32(T1P2NrTextField.text!)!]
  //      players.startingfive = starters as NSObject
        team1.player1 = Int32(T1P1NrTextField.text!)!
        team1.player2 = Int32(T1P2NrTextField.text!)!
        team1.player3 = Int32(T1P3NrTextField.text!)!
        team1.player4 = Int32(T1P4NrTextField.text!)!
        team1.player5 = Int32(T1P5NrTextField.text!)!
        team1.player6 = Int32(T1P6NrTextField.text!)!
        team1.player7 = Int32(T1P7NrTextField.text!)!
        team1.player8 = Int32(T1P8NrTextField.text!)!
        team1.player9 = Int32(T1P9NrTextField.text!)!
        team1.player10 = Int32(T1P10NrTextField.text!)!
        team1.player11 = Int32(T1P11NrTextField.text!)!
        team1.player12 = Int32(T1P12NrTextField.text!)!
        team1.fieldplayers = [Int(T1P1NrTextField.text!), Int(T1P2NrTextField.text!), Int(T1P3NrTextField.text!), Int(T1P4NrTextField.text!), Int(T1P5NrTextField.text!)] as? [Int]
        
//        team1.fieldplayers = [T1P1NrTextField.text!, T1P2NrTextField.text!, T1P3NrTextField.text!, T1P4NrTextField.text!, T1P5NrTextField.text!] as! [Int]
  /*      let team2 =
    //    starters = [Int32(T1P1NrTextField.text!)!, Int32(T1P2NrTextField.text!)!]
    //    players.startingfive = starters as NSObject
        team2.player1 = Int32(T2P1NrTextField.text!)!
        team2.player2 = Int32(T2P2NrTextField.text!)!
        team2.player3 = Int32(T2P3NrTextField.text!)!
        team2.player4 = Int32(T2P4NrTextField.text!)!
        team2.player5 = Int32(T2P5NrTextField.text!)!
        team2.player6 = Int32(T2P6NrTextField.text!)!
        team2.player7 = Int32(T2P7NrTextField.text!)!
        team2.player8 = Int32(T2P8NrTextField.text!)!
        team2.player9 = Int32(T2P9NrTextField.text!)!
        team2.player10 = Int32(T2P10NrTextField.text!)!
        team2.player11 = Int32(T2P11NrTextField.text!)!
        team2.player12 = Int32(T2P12NrTextField.text!)!
        
*/
/*        let todaysdate = Game(context: context)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd - HH.mm.ss"
        let date = dateFormatter.date(from: dateFormatter.dateFormat)
       // let date = Date()
        let calendar = Calendar.current
        let comp = calendar.dateComponents([.hour, .minute, .second], from: date!)
        let hour = comp.hour
        let minute = comp.minute
        let second = comp.second
   //     todaysdate.datetest?.addingTimeInterval(.)
       // todaysdate.date = NSObject(hour + minute + second)
  */
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
   //     print(players)
    }
}

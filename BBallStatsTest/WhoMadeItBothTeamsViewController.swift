//
//  WhoMadeItBothTeamsViewController.swift
//  BBallStats
//
//  Created by Fred Erik on 30.10.16.
//  Copyright © 2016 Fred Erik. All rights reserved.
//

import UIKit
import CoreData

class WhoMadeItBothTeamsViewController: UIViewController {
    
    var homeTeamColor = UIColor.white
    var guestTeamColor = UIColor.black
    var homeColorPale = true
    var guestColorPale = false
    var tappedAction = "2pointer"
    var actualMinute = 1
    var Action = ""
    var player = 1
    var playerToSwitchIn = 6
    var chosenTeam = 1
    var quarterLength = 10
    var GameTime = 10
    var actionNumber = 0
    var pointsOfAction = 0
    var actualQuarter = 0
 
   

    
    
    @IBOutlet weak var T1Jersey1Button: UIButton!
    @IBOutlet weak var T1Jersey2Button: UIButton!
    @IBOutlet weak var T1Jersey3Button: UIButton!
    @IBOutlet weak var T1Jersey4Button: UIButton!
    @IBOutlet weak var T1Jersey5Button: UIButton!
    @IBOutlet weak var T1Jersey6Button: UIButton!
    @IBOutlet weak var T1Jersey7Button: UIButton!
    @IBOutlet weak var T1Jersey8Button: UIButton!
    @IBOutlet weak var T1Jersey9Button: UIButton!
    @IBOutlet weak var T1Jersey10Button: UIButton!
    @IBOutlet weak var T1Jersey11Button: UIButton!
    @IBOutlet weak var T1Jersey12Button: UIButton!
    
    @IBOutlet weak var T2Jersey1Button: UIButton!
    @IBOutlet weak var T2Jersey2Button: UIButton!
    @IBOutlet weak var T2Jersey3Button: UIButton!
    @IBOutlet weak var T2Jersey4Button: UIButton!
    @IBOutlet weak var T2Jersey5Button: UIButton!
    @IBOutlet weak var T2Jersey6Button: UIButton!
    @IBOutlet weak var T2Jersey7Button: UIButton!
    @IBOutlet weak var T2Jersey8Button: UIButton!
    @IBOutlet weak var T2Jersey9Button: UIButton!
    @IBOutlet weak var T2Jersey10Button: UIButton!
    @IBOutlet weak var T2Jersey11Button: UIButton!
    @IBOutlet weak var T2Jersey12Button: UIButton!
    
    
    @IBAction func T1P1Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 1
        print("by T1P1")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T1P2Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 2
        print("by T1P2")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T1P3Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 3
        print("by T1P3")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T1P4Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 4
        print("by T1P4")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T1P5Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 5
        print("by T1P5")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T1P6Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 6
        print("by T1P6 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T1P7Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 7
        print("by T1P7 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    
    @IBAction func T1P8Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 8
        print("by T1P8 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T1P9Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 9
        print("by T1P9 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T1P10Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 10
        print("by T1P10 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T1P11Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 11
        print("by T1P11 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T1P12Pressed(_ sender: UIButton) {
        chosenTeam = 1
        player = 12
        print("by T1P12 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }

    @IBAction func T2P1Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 1
        print("by T2P1")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T2P2Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 2
        print("by T2P2")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T2P3Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 3
        print("by T2P3")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T2P4Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 4
        print("by T2P4")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T2P5Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 5
        print("by T2P5")
        saveStat()
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T2P6Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 6
        print("by T2P6 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T2P7Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 7
        print("by T2P7 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T2P8Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 8
        print("by T2P8 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T2P9Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 9
        print("by T2P9 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T2P10Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 10
        print("by T2P10 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T2P11Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 11
        print("by T2P11 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    @IBAction func T2P12Pressed(_ sender: UIButton) {
        chosenTeam = 2
        player = 12
        print("by T2P12 - playerexchange")
        self.performSegue(withIdentifier: "BothTeamsToSubstitutionSegue", sender: self)
    }
    
    override func viewDidLoad() {
        print("*** whoBoth homeColorPale \(homeColorPale), guestColorPale \(guestColorPale)")
        super.viewDidLoad()
        
        T1Jersey1Button.backgroundColor = homeTeamColor
        T1Jersey2Button.backgroundColor = homeTeamColor
        T1Jersey3Button.backgroundColor = homeTeamColor
        T1Jersey4Button.backgroundColor = homeTeamColor
        T1Jersey5Button.backgroundColor = homeTeamColor
        T1Jersey6Button.backgroundColor = homeTeamColor
        T1Jersey7Button.backgroundColor = homeTeamColor
        T1Jersey8Button.backgroundColor = homeTeamColor
        T1Jersey9Button.backgroundColor = homeTeamColor
        T1Jersey10Button.backgroundColor = homeTeamColor
        T1Jersey11Button.backgroundColor = homeTeamColor
        T1Jersey12Button.backgroundColor = homeTeamColor
        
        T2Jersey1Button.backgroundColor = guestTeamColor
        T2Jersey2Button.backgroundColor = guestTeamColor
        T2Jersey3Button.backgroundColor = guestTeamColor
        T2Jersey4Button.backgroundColor = guestTeamColor
        T2Jersey5Button.backgroundColor = guestTeamColor
        T2Jersey6Button.backgroundColor = guestTeamColor
        T2Jersey7Button.backgroundColor = guestTeamColor
        T2Jersey8Button.backgroundColor = guestTeamColor
        T2Jersey9Button.backgroundColor = guestTeamColor
        T2Jersey10Button.backgroundColor = guestTeamColor
        T2Jersey11Button.backgroundColor = guestTeamColor
        T2Jersey12Button.backgroundColor = guestTeamColor
        
        if homeColorPale == true {
            T1Jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey1Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey2Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey3Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey4Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey5Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey6Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey7Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey8Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey9Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey10Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey11Button.setTitleColor(UIColor.black, for: .normal)
            T1Jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T1Jersey12Button.setTitleColor(UIColor.black, for: .normal)
        } else if homeColorPale == false {
            T1Jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T1Jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        }
        
        if guestColorPale == true {
            T2Jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey1Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey2Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey3Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey4Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey5Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey6Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey7Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey8Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey9Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey10Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey11Button.setTitleColor(UIColor.black, for: .normal)
            T2Jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            T2Jersey12Button.setTitleColor(UIColor.black, for: .normal)
        } else if guestColorPale == false {
            T2Jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            T2Jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        }
    }
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let subVC = segue.destination as! SubstitutionViewController
            subVC.newPlayer = playerToSwitchIn
            subVC.homeTeamColor = homeTeamColor
            subVC.guestTeamColor = guestTeamColor
            subVC.homeColorPale = homeColorPale
            subVC.guestColorPale = guestColorPale
            subVC.tappedAction = Action
            subVC.chosenTeam = chosenTeam
            subVC.quarterLength = quarterLength
            subVC.GameTime = GameTime
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
        //  (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
}



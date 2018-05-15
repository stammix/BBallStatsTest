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
    var currentScoreT1 = 0
    var currentScoreT2 = 0
 
    /*    var t1p1 = "ffa"
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
     */
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

//    static var persistentContainer: NSPersistentContainer {
//        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer
//    }
//    static var viewContext: NSManagedObjectContext {
//        return persistentContainer.viewContext
//    }
    
    
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
        
        T1Jersey1Button.setTitle("\(t1p1)", for: .normal)
        T1Jersey2Button.setTitle("\(t1p2)", for: .normal)
        T1Jersey3Button.setTitle("\(t1p3)", for: .normal)
        T1Jersey4Button.setTitle("\(t1p4)", for: .normal)
        T1Jersey5Button.setTitle("\(t1p5)", for: .normal)
        T1Jersey6Button.setTitle("\(t1p6)", for: .normal)
        T1Jersey7Button.setTitle("\(t1p7)", for: .normal)
        T1Jersey8Button.setTitle("\(t1p8)", for: .normal)
        T1Jersey9Button.setTitle("\(t1p9)", for: .normal)
        T1Jersey10Button.setTitle("\(t1p10)", for: .normal)
        T1Jersey11Button.setTitle("\(t1p11)", for: .normal)
        T1Jersey12Button.setTitle("\(t1p12)", for: .normal)
        T2Jersey1Button.setTitle("\(t2p1)", for: .normal)
        T2Jersey2Button.setTitle("\(t2p2)", for: .normal)
        T2Jersey3Button.setTitle("\(t2p3)", for: .normal)
        T2Jersey4Button.setTitle("\(t2p4)", for: .normal)
        T2Jersey5Button.setTitle("\(t2p5)", for: .normal)
        T2Jersey6Button.setTitle("\(t2p6)", for: .normal)
        T2Jersey7Button.setTitle("\(t2p7)", for: .normal)
        T2Jersey8Button.setTitle("\(t2p8)", for: .normal)
        T2Jersey9Button.setTitle("\(t2p9)", for: .normal)
        T2Jersey10Button.setTitle("\(t2p10)", for: .normal)
        T2Jersey11Button.setTitle("\(t2p11)", for: .normal)
        T2Jersey12Button.setTitle("\(t2p12)", for: .normal)
        
        
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
            override func viewWillAppear(_ animated: Bool) {
                if tappedAction == "2pointer" {
                    pointsOfAction = 2
                } else if tappedAction == "3pointer" {
                    pointsOfAction = 3
                } else if tappedAction == "madeFreeThrow" {
                    pointsOfAction = 1
                }
                print("who2 \(t1p1) + \(t1p2) + \(t1p3) + \(t1p4) + \(t1p5) + \(t1p6) + \(t1p7) + \(t1p8) + \(t1p9) + \(t1p10) + \(t1p11) + \(t1p12)")
                print("who2 \(t2p1) + \(t2p2) + \(t2p3) + \(t2p4) + \(t2p5) + \(t2p6) + \(t2p7) + \(t2p8) + \(t2p9) + \(t2p10) + \(t2p11) + \(t2p12)")
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
            if chosenTeam == 1 {
                subVC.p1 = t1p1
                subVC.p2 = t1p2
                subVC.p3 = t1p3
                subVC.p4 = t1p4
                subVC.p5 = t1p5
            } else {
                subVC.p1 = t2p1
                subVC.p2 = t2p2
                subVC.p3 = t2p3
                subVC.p4 = t2p4
                subVC.p5 = t2p5
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
        
        let gameData = Game(context: context)
        if chosenTeam == 1 {
            gameData.scoreT1 = gameData.scoreT1 + Int32(pointsOfAction)
        } else if chosenTeam == 2 {
            gameData.scoreT2 = gameData.scoreT2 + Int32(pointsOfAction)
        }
        print ("Team1: \(gameData.scoreT1), Team2: \(gameData.scoreT2)")
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
    
//    func requestScore() {
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    let gameData = GameData(context: context)
//    do {
//    let gameScore = try context.fetch(GameData.fetchRequest()) as! [GameData]
//        self.currentScoreT1 = Int(gameData.scoreT1)
//        self.currentScoreT2 = Int(gameData.scoreT2)
//    } catch {
//    print ("tüdülü Error")
//    }
//    }
}



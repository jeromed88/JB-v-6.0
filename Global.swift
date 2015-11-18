//
//  GlobalFuncs.swift
//  JB
//
//  Created by Jerome Elmore on 9/21/15.
//  Copyright © 2015 Jerome Elmore. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion
import GameKit


// var gameVCDelegate : GameViewControllerDelegate? //put back

var assignmentLabel1 = SKLabelNode(fontNamed: "BanglaSangamMN")
var assignmentLabel2 = SKLabelNode(fontNamed: "BanglaSangamMN")
var assignmentLabel3 = SKLabelNode(fontNamed: "BanglaSangamMN")

let notificationBox = SKSpriteNode(imageNamed: "big-button")

//level 1 achievements

let oneA1T: String = "Score 5 Points"
let oneA1C: Int = 50
let oneA2T: String = "Collect 2 Blue Coins"
let oneA2C: Int = 100
let oneA3T: String = "Collect 30 Coins in 60 Seconds"
let oneA3C: Int = 200

let oneA4T: String = "Clear a Low Wall"
let oneA4C: Int = 300
let oneA5T: String = "Score 10 Points"
let oneA5C: Int = 200
let oneA6T: String = "Collect 2 Red Coins"
let oneA6C: Int = 250

let oneA7T: String = "Clear a Vine Wall"
let oneA7C: Int = 300
let oneA8T: String = "Clear a Float Wall"
let oneA8C: Int = 300
let oneA9T: String = "Collect 100 Coins in 3 Minutes"
let oneA9C: Int = 250

let oneA10T: String = "Score 25 Points"
let oneA10C: Int = 500
let oneA11T: String = "Clear 300 Walls"
let oneA11C: Int = 500
let oneA12T: String = "Collect 200 Coins in 5 Minutes"
let oneA12C: Int = 500

let oneA13T: String = "Score 40 Points"
let oneA13C: Int = 500
let oneA14T: String = "Collect 200 Red Coins"
let oneA14C: Int = 500
let oneA15T: String = "Collect 400 Coins in 10 Minutes"
let oneA15C: Int = 500

let oneA16T: String = "Score 50 Points"
let oneA16C: Int = 1000
let oneA17T: String = "Collect 1000 Red Coins"
let oneA17C: Int = 1000
let oneA18T: String = "Collect 500 Coins in 10 Minutes"
let oneA18C: Int = 1000

var skView: SKView!

let stopwatchLabel1 = SKLabelNode(fontNamed: "BanglaSangamMN")
let timerLabel1 = SKLabelNode(fontNamed: "BanglaSangamMN")

var isPlayer1: Bool = false
var opponentReplay: Int = 0
var selfReplay: Int = 0
var noOfCars: Int = 1
var otherPlayerGameOver: Bool = false
var selfGameOver: Bool = false
var timerOnLocal: Bool = false
var otherPlayerScore: Int = 0

var viewController: GameViewController! // for old gamecenter
//var gcViewController: GKMatchmakerViewController! // not used
var navController: UINavigationController!
var homeScreenController: UIViewController!


//zPosition constants:

let worldZPos: CGFloat = 0

let distantWorldZPos: CGFloat = 0// x
let skyZPos: CGFloat = -1
let sunZPos: CGFloat = 0 // x
let distantCloudZPos: CGFloat = 1 // x
let mountainsZPos: CGFloat = 2 // x
let closeMountainsZPos: CGFloat = 2.4

let midWorldZPos: CGFloat = 3 // x
let midCloudZPos: CGFloat = 0
let hillsZPos: CGFloat = 1 // x

let backWallTreeZPos: CGFloat = -0.5
let backgroundLayerZPos: CGFloat = 5 // x
let backWallZPos: CGFloat = 0 // x
let floorZPos: CGFloat = 6 // x // member of self
let barrelZPos: CGFloat = 1.5 // x
let coinZPos: CGFloat = 2 // x
let spikeZPos: CGFloat = -2 // x // member of platform/vplatform
let floorForbidZPos: CGFloat = 4 // x
let platformZPos: CGFloat = 5 //x
let platformSlotZPos: CGFloat = 6
let gaugeZPos: CGFloat = -1// member of bird
let birdZPos: CGFloat = 7 // x
let selffrontWallZPos: CGFloat = 13 // member of self 
let frontWallZPos: CGFloat = 9 // x
let frontWindowZPos: CGFloat = 9.5
    
let interfaceButtonsZPos: CGFloat = 15

let pauseScreenZPos: CGFloat = 16//x // member of self
let pauseScreenButtonZPos: CGFloat =  1//x // member of pausescreen
    
let storeScreenZPos: CGFloat =  18//x  // member of self
let storeScreenButtonZPos: CGFloat = 1 //x // member of storescreen
    
let coinChoiceScreenZPos: CGFloat = 20  //x //member of self
let cCSButtonZPos: CGFloat = 1   //x //member of coinChoiceScreen
    
let scoreScreenZPos: CGFloat = 22  //x //member of self 
let scoreScreenButtonZPos: CGFloat = 1  //x //member of scorescreen

//end zPosition variables

func flippedTextureWithImageNamed(name:NSString) -> SKTexture
    
{
    let image = UIImage(named:name as String)
    
    UIGraphicsBeginImageContext(image!.size);
    let context = UIGraphicsGetCurrentContext()
    
    CGContextTranslateCTM(context, image!.size.width, image!.size.height)
    CGContextScaleCTM(context, -1.0, -1.0)
    
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, image!.size.width, image!.size.height), image!.CGImage)
    
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    
    return SKTexture(image: newImage)
}

func saveHighscore(score: Int) {
    
    //check if user is signed in
    if GKLocalPlayer.localPlayer().authenticated {
        
        print("GameState.sharedInstance.highScore: \(GameState.sharedInstance.highScore)")
        if score >= GameState.sharedInstance.highScore {
        print("GameState.sharedInstance.highScore: \(GameState.sharedInstance.highScore)")
        let scoreReporter = GKScore(leaderboardIdentifier: "1HighScore") //leaderboard id here
        
        scoreReporter.value = Int64(score) //score variable here (same as above)
        
        let scoreArray: [GKScore] = [scoreReporter]
        
        GKScore.reportScores(scoreArray, withCompletionHandler: {(error : NSError?) -> Void in
            if error != nil {
                
                print("save high score GC error")
        
             //   NSLog(error!.localizedDescription)
            }
            print("finish saveHighScore")
            
            }
        )
        
    }
    
    }
    
}


func updateAchievements(code: String) { // used to have no arguments
    /*
    if GKLocalPlayer.localPlayer().authenticated {
    
    if GameState.sharedInstance.score >= 5 {
let achievement = GKAchievement(identifier: "s5p")

achievement.percentComplete = Double(100)
achievement.showsCompletionBanner = true  // use Game Center's UI

GKAchievement.reportAchievements([achievement], withCompletionHandler: nil)
        
        }
        
    }
*/
    
    
    if GKLocalPlayer.localPlayer().authenticated {
        
        
            let achievement = GKAchievement(identifier: code)
            
            achievement.percentComplete = Double(100)
            achievement.showsCompletionBanner = false  // true to use Game Center's UI
            
            GKAchievement.reportAchievements([achievement], withCompletionHandler: nil)
            
        }
        
    }



func loadAchievements() {
    
    if GKLocalPlayer.localPlayer().authenticated {
        
GKAchievement.loadAchievementsWithCompletionHandler() { achievements, error in
    guard let achievements = achievements else { return }
    
    print(achievements)
        }
}

    
}



func completeAchievement(coins: Int, text: String) {
    
    
    print("completed achievement: add coins and show notification")
    GameState.sharedInstance.saveState()
    
    //notification -- text
    //add coins -- coins
    
    GameState.sharedInstance.coins += coins
    
    
notificationBox.size.width = 1000 // need to update for across devices. put back
    notificationBox.position.x = 768
    notificationBox.position.y = 2048 + notificationBox.size.height/2 + 20
notificationBox.zPosition = interfaceButtonsZPos

    
    let notificationLabel = SKLabelNode(fontNamed: "BanglaSangamMN")
    notificationLabel.horizontalAlignmentMode = .Left
    notificationLabel.fontSize = 35
    notificationLabel.fontColor = UIColor(red: 49/255, green: 79/255, blue: 79/255, alpha: 1.0)
    notificationLabel.position.x = -notificationBox.size.width/2 + 50
    notificationLabel.position.y = 0
notificationLabel.zPosition = 0.1
notificationLabel.text = "\(text) +\(coins)"
    notificationBox.addChild(notificationLabel)

    notificationBox.runAction(SKAction.sequence([SKAction.moveByX(0, y: -(notificationBox.size.height + 40), duration: 0.5), SKAction.waitForDuration(5.0), SKAction.moveByX(0, y: (notificationBox.size.height + 40), duration: 0.5), SKAction.runBlock({
        
        
    notificationLabel.removeFromParent()
    
    
})]))



}

func completeAssignmentBlock() {
    
  
    
    
    if GameState.sharedInstance.oneBlock == 1 && GameState.sharedInstance.oneTime60 == 1 && GameState.sharedInstance.oneBlue2 == 1 && GameState.sharedInstance.oneScore5 == 1 {
        
        
        GameState.sharedInstance.runBlockUpdate = 1 // for level 1
    }

if GameState.sharedInstance.oneBlock == 2 && GameState.sharedInstance.oneLowWall == 1 && GameState.sharedInstance.oneScore10 == 1 && GameState.sharedInstance.oneRed2 == 1 {
        
        
        GameState.sharedInstance.runBlockUpdate = 1
    }

if GameState.sharedInstance.oneBlock == 3 && GameState.sharedInstance.oneFloatWall == 1 && GameState.sharedInstance.oneVineWall == 1 && GameState.sharedInstance.oneTime180 == 1 {
        
        
        GameState.sharedInstance.runBlockUpdate = 1
    }
    
    
    if GameState.sharedInstance.oneBlock == 4 && GameState.sharedInstance.oneScore25 == 1 && GameState.sharedInstance.oneClear300 == 1 && GameState.sharedInstance.oneTime300 == 1 {
        
        
        GameState.sharedInstance.runBlockUpdate = 1
    }
    
    if GameState.sharedInstance.oneBlock == 5 && GameState.sharedInstance.oneScore40 == 1 && GameState.sharedInstance.oneColl200 == 1 && GameState.sharedInstance.oneTime600 == 1 {
        
        
        GameState.sharedInstance.runBlockUpdate = 1
    }
    

    
    
}


func checkAchievementsOne(score: Int, coins: Int, wallType: String) {
    
  //  print("GameState.sharedInstance.oneBlock: \(GameState.sharedInstance.oneBlock)")



//universal ones:

    
    if score > 0 {
        
        GameState.sharedInstance.wallsCleared += score
        
    }

    
    if coins == 10 {
        
        GameState.sharedInstance.redCollected += 1
        
    }
    
    if GameState.sharedInstance.oneBlock == 1 {
    if GameState.sharedInstance.oneScore5%100 > 9 {
        
        
        if GameState.sharedInstance.score >= 5 {
            
            completeAchievement(oneA1C, text: oneA1T)
            
            updateAchievements("s5p")//update achievement
            
            
            
            GameState.sharedInstance.oneScore5 = 1
            
        }
        
    }
    
    if GameState.sharedInstance.oneBlue2%100 > 9 {
        
        
        if coins == 3 {
            
            GameState.sharedInstance.oneBlue2 += 100
            
        }
        
        if GameState.sharedInstance.oneBlue2/100 >= 3 {
            
            completeAchievement(oneA2C, text: oneA2T)
            
            
            updateAchievements("needto add code")//update achievement
            
           
            
            GameState.sharedInstance.oneBlue2 = 1
        }
        
    }
    
    if GameState.sharedInstance.oneTime60 > 100 {
        
        //add code to start and stop timer (add 10 to sharedInstance and change the running #)
   
            
            GameState.sharedInstance.oneTime60 += 100*coins
            
        
        timerLabel1.text = "\((GameState.sharedInstance.oneTime60 - 110)/100) / 30"
        
        
        if GameState.sharedInstance.oneTime60 >= 3110 {
            
            completeAchievement(oneA3C, text: oneA3T)
            
            stopwatchLabel1.removeAllActions()
            timerLabel1.removeFromParent()
            stopwatchLabel1.removeFromParent()
            GameState.sharedInstance.timer1running = -1
            updateAchievements("needto add code")//update achievement
             GameState.sharedInstance.oneTime60 = 1
           
        }
        
        
        }
        
        
        
        
        
        
    }
    
    
    //check if first block is complete
    
    if GameState.sharedInstance.oneBlock == 2 {
        
      if GameState.sharedInstance.oneLowWall%100 > 9 {
        
        if wallType == "lowwall" {
            
            completeAchievement(oneA4C, text: oneA4T)
            
            updateAchievements("needto add code")//update achievement
         
            GameState.sharedInstance.oneLowWall = 1

    
}

        }

if GameState.sharedInstance.oneScore10%100 > 9 {


if GameState.sharedInstance.score >= 10 {
            
            completeAchievement(oneA5C, text: oneA5T)
            
            updateAchievements("needto add code")//update achievement
            
            
            
            GameState.sharedInstance.oneScore10 = 1
            
        }



}

if GameState.sharedInstance.oneRed2%100 > 9 {

if coins == 10 {
            
            GameState.sharedInstance.oneRed2 += 100
            
        }
        
        if GameState.sharedInstance.oneRed2/100 >= 3 {
            
            completeAchievement(oneA6C, text: oneA6T)
            
            
            updateAchievements("needto add code")//update achievement
            
           
            
            GameState.sharedInstance.oneRed2 = 1
        }




}


        
        
        
    }
    
        if GameState.sharedInstance.oneBlock == 3 {
            
            
            
            
            if GameState.sharedInstance.oneVineWall%100 > 9 {
                
                if wallType == "vine" {
                    
                    completeAchievement(oneA7C, text: oneA7T)
                    
                    updateAchievements("needto add code")//update achievement
                    
                    GameState.sharedInstance.oneVineWall = 1
                    
                    
                }
                
            }

if GameState.sharedInstance.oneFloatWall%100 > 9 {
                
                if wallType == "float" {
                    
                    completeAchievement(oneA8C, text: oneA8T)
                    
                    updateAchievements("needto add code")//update achievement
                    
                    GameState.sharedInstance.oneFloatWall = 1
                    
                    
                }
                
            }

            if GameState.sharedInstance.oneTime180 > 100 {
                
                //add code to start and stop timer (add 10 to sharedInstance and change the running #)
                
                
                GameState.sharedInstance.oneTime180 += 100*coins
                
                
                timerLabel1.text = "\((GameState.sharedInstance.oneTime180 - 110)/100) / 100"
                
                
                if GameState.sharedInstance.oneTime180 >= 10110 {
                    
                    completeAchievement(oneA9C, text: oneA9T)
                    
                    stopwatchLabel1.removeAllActions()
                    timerLabel1.removeFromParent()
                    stopwatchLabel1.removeFromParent()
                    GameState.sharedInstance.timer1running = -1
                    updateAchievements("needto add code")//update achievement
                    GameState.sharedInstance.oneTime180 = 1
                    
                }
                
                
            }
            
            
            
            
    }

    if GameState.sharedInstance.oneBlock == 4 {
        
        
     
if GameState.sharedInstance.oneScore25%100 > 9 {


if GameState.sharedInstance.score >= 25 {
            
            completeAchievement(oneA10C, text: oneA10T)
            
            updateAchievements("needto add code")//update achievement
            
            
            
            GameState.sharedInstance.oneScore25 = 1
            
        }



}

if GameState.sharedInstance.oneClear300%100 > 9 {
    
    var wallsClearAmount: Int = 0
    
    if GameState.sharedInstance.wallsCleared >= 300 {
        
        wallsClearAmount = 300
        
    } else {
        
        
        wallsClearAmount = GameState.sharedInstance.wallsCleared
        
    }

assignmentLabel2.text = "\(oneA11T) \(wallsClearAmount) / 300 +\(oneA11C)"




if GameState.sharedInstance.wallsCleared >= 300 {
            
            completeAchievement(oneA11C, text: oneA11T)
            
            updateAchievements("needto add code")//update achievement
            
            
            
            GameState.sharedInstance.oneClear300 = 1
            
        }



}

if GameState.sharedInstance.oneTime300 > 100 {
                
              
                
                
                GameState.sharedInstance.oneTime300 += 100*coins
                
                
                timerLabel1.text = "\((GameState.sharedInstance.oneTime300 - 110)/100) / 200"
                
                
                if GameState.sharedInstance.oneTime300 >= 20110 { //20110
                    
                    completeAchievement(oneA12C, text: oneA12T)
                    
                    stopwatchLabel1.removeAllActions()
                    timerLabel1.removeFromParent()
                    stopwatchLabel1.removeFromParent()
                    GameState.sharedInstance.timer1running = -1
                    updateAchievements("needto add code")//update achievement
                    GameState.sharedInstance.oneTime300 = 1
                    
                }
                
                
            }
            



       
        
    }












if GameState.sharedInstance.oneBlock == 5 {
        
        
     
if GameState.sharedInstance.oneScore40%100 > 9 {


if GameState.sharedInstance.score >= 40 {
            
            completeAchievement(oneA13C, text: oneA13T)
            
            updateAchievements("needto add code")//update achievement
            
            
            
            GameState.sharedInstance.oneScore40 = 1
            
        }



}

if GameState.sharedInstance.oneColl200%100 > 9 {
    
    var redAmount1: Int = 0
    
    if GameState.sharedInstance.redCollected >= 200 {
        
   redAmount1 = 200
        
    } else {
        
        
  redAmount1 = GameState.sharedInstance.redCollected
        
    }

assignmentLabel2.text = "\(oneA14T) \(redAmount1) / 200 +\(oneA14C)"




if GameState.sharedInstance.redCollected >= 200 { // 200
            
            completeAchievement(oneA14C, text: oneA14T)
            
            updateAchievements("needto add code")//update achievement
            
            
            
            GameState.sharedInstance.oneColl200 = 1
            
        }



}

if GameState.sharedInstance.oneTime600 > 100 {
                
                //add code to start and stop timer (add 10 to sharedInstance and change the running #)
                
                
                GameState.sharedInstance.oneTime600 += 100*coins
                
                
                timerLabel1.text = "\((GameState.sharedInstance.oneTime600 - 110)/100) / 400"
                
                
                if GameState.sharedInstance.oneTime600 >= 40110 { //40110
                    
                    completeAchievement(oneA12C, text: oneA12T)
                    
                    stopwatchLabel1.removeAllActions()
                    timerLabel1.removeFromParent()
                    stopwatchLabel1.removeFromParent()
                    GameState.sharedInstance.timer1running = -1
                    updateAchievements("needto add code")//update achievement
                    GameState.sharedInstance.oneTime600 = 1
                    
                }
                
                
            }
            



       
        
    }




if GameState.sharedInstance.oneBlock == 6 {
        
        
     
if GameState.sharedInstance.oneScore50%100 > 9 {


if GameState.sharedInstance.score >= 50 {
            
            completeAchievement(oneA16C, text: oneA16T)
            
            updateAchievements("needto add code")//update achievement
            
            
            
            GameState.sharedInstance.oneScore50 = 1
            
        }



}

if GameState.sharedInstance.oneColl1000%100 > 9 {
    
    
    var redAmount2: Int = 0
    
    
    if GameState.sharedInstance.redCollected >= 1000 {
        
        redAmount2 = 1000
        
    } else {
        
        
        redAmount2 = GameState.sharedInstance.redCollected
    }

assignmentLabel2.text = "\(oneA17T) \(redAmount2) / 1000 +\(oneA17C)"




if GameState.sharedInstance.redCollected >= 1000 { // 1000
            
            completeAchievement(oneA17C, text: oneA17T)
            
            updateAchievements("needto add code")//update achievement
            
            
            
            GameState.sharedInstance.oneColl1000 = 1
            
        }



}

if GameState.sharedInstance.oneTime600b > 100 {
                
                //add code to start and stop timer (add 10 to sharedInstance and change the running #)
                
                
                GameState.sharedInstance.oneTime600b += 100*coins
                
                
                timerLabel1.text = "\((GameState.sharedInstance.oneTime600b - 110)/100) / 500"
                
                
                if GameState.sharedInstance.oneTime600b >= 50110 { //50110
                    
                    completeAchievement(oneA18C, text: oneA18T)
                    
                    stopwatchLabel1.removeAllActions()
                    timerLabel1.removeFromParent()
                    GameState.sharedInstance.timer1running = -1
                    stopwatchLabel1.removeFromParent()
                    updateAchievements("needto add code")//update achievement
                    GameState.sharedInstance.oneTime600b = 1
                    
                }
                
                
            }
            



       
        
    }




GameState.sharedInstance.saveState()

}

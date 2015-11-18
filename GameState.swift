//
//  GameState.swift
//  Jump Bird v11.0
//
//  Created by Jerome Elmore on 3/22/15.
//  Copyright (c) 2015 Jerome Elmore. All rights reserved.
//

import Foundation

class GameState {
    
    
    //Load startscreen
    
    var loadLevel: Int
    
    //Score and Coins:
    
    var score: Int
    var highScore: Int
    var coins: Int
    
    //Powerups:
    
    var firstCoin: Int
    var firstCoinRound: Int
    var coinMult: Int
    var secondLife: Int
    var coingradient: Double
    var coingradstart: Double
    var beginLastRound: NSTimeInterval
    var oneCoinUpg: Int
    var yelCoinUpg: Int
    var bluCoinUpg: Int
    var redCoinUpg: Int
    var coinUpgOrder: Int
    var checkpointunlock: Int
    var checkpointround: Int
    var checkpointHS: Int
    
    
    //achievements
    
    var runBlockUpdate: Int
    
    var wallsCleared: Int
    var redCollected: Int
    
    //level 1
    var oneScore5: Int
    var oneBlue2: Int
    var oneTime60: Int
    
    var oneLowWall: Int
    var oneScore10: Int
    var oneRed2: Int

    var oneVineWall: Int
    var oneFloatWall: Int
    var oneTime180: Int
    
    var oneScore25: Int
    var oneClear300: Int
    var oneTime300: Int
    
    var oneScore40: Int
    var oneColl200: Int
    
    var oneTime600: Int
    var oneScore50: Int
    var oneColl1000: Int
    
     var oneTime600b: Int
    
    
    var oneBlock: Int
    var runNextBlockAnimation: Int
    var timer1running: Int 
    
    
    var twoBlock: Int
    
    var threeBlock: Int
    
    // costumes
    
    var costumechoice: Int
    
    
    
    
    
    
    class var sharedInstance: GameState {
        struct Singleton {
            static let instance = GameState()
        }
        
        return Singleton.instance
    }
    
    init() {
        
        
        // Init
        
        loadLevel = 0
        score = 0
        highScore = 0
        coins = 0
        firstCoin = 0
        firstCoinRound = 0
        coinMult = 1
        oneCoinUpg = 0
        secondLife = 0
        coingradient = 0
        coingradstart = 0
        beginLastRound = 0
        yelCoinUpg = 1
        bluCoinUpg = 1
        redCoinUpg = 1
        coinUpgOrder = 0
        checkpointunlock = 0
        checkpointround = 0
        checkpointHS = 0
        
        oneBlock = 1
        runNextBlockAnimation = 0
        timer1running = -1
        
        
        //achievements
        
        runBlockUpdate = 0
        wallsCleared = 0
        redCollected = 0
        
      // running digits(unlimited) & active (one digit) & completed (one digit). Start all assignments as active (10) and manage which ones show up with oneBlock (level 1), twoBlock (level 2), threeBlock (level3)
        
        
        
        oneScore5 = 110
        oneBlue2 = 110
        oneTime60 = 10
        
        oneLowWall = 110
        oneScore10 = 110
        oneRed2 = 110
        
        oneTime180 = 10
        oneVineWall = 110
        oneFloatWall = 110
        
        oneScore25 = 110
        oneClear300 = 0
        oneTime300 = 10
        
        oneScore40 = 110
        oneColl200 = 0
        oneTime600 = 10
        oneScore50 = 110
        oneColl1000 = 0
        oneTime600b = 10
        
        costumechoice = 1  // 0 = no costume, base monkey; 1 = mage costume
        twoBlock = 1
        threeBlock = 1
        
        
        // Load game state
        let defaults = NSUserDefaults.standardUserDefaults()
        
        loadLevel = defaults.integerForKey("loadLevel")
        coins = defaults.integerForKey("coins")
        
        
        firstCoin = defaults.integerForKey("firstCoin")
        firstCoinRound = defaults.integerForKey("firstCoinRound")
        if defaults.integerForKey("coinMult") > 1 {
        coinMult = defaults.integerForKey("coinMult")
        } else {
            coinMult = 1
        }
        
        secondLife = defaults.integerForKey("secondLife")
        coingradient = defaults.doubleForKey("coingradient")
        coingradstart = defaults.doubleForKey("coingradstart")
        beginLastRound = defaults.doubleForKey("beginLastRound")
        oneCoinUpg = defaults.integerForKey("oneCoinUpg")
        
        if defaults.integerForKey("yelCoinUpg") == 0 {
            yelCoinUpg = 1
        } else {
            yelCoinUpg = defaults.integerForKey("yelCoinUpg")
        }
        
        if defaults.integerForKey("bluCoinUpg") == 0 {
            bluCoinUpg = 1
        } else {
            bluCoinUpg = defaults.integerForKey("bluCoinUpg")
        }
        
        if defaults.integerForKey("redCoinUpg") == 0 {
            redCoinUpg = 1
        } else {
            redCoinUpg = defaults.integerForKey("redCoinUpg")
            
        }
    
    
        coinUpgOrder = defaults.integerForKey("coinUpgOrder")
        checkpointunlock = defaults.integerForKey("checkpointunlock")
        checkpointround = defaults.integerForKey("checkpointround")
        checkpointHS = defaults.integerForKey("checkpointHS")
        highScore = defaults.integerForKey("highScore")
        
        
        if defaults.integerForKey("oneBlock") != 0 {
            
            oneBlock = defaults.integerForKey("oneBlock")
            
        }
        
        if defaults.integerForKey("oneScore5") != 0 {
        
        oneScore5 = defaults.integerForKey("oneScore5")
            
        }
        
        if defaults.integerForKey("oneBlue2") != 0 {
            
        oneBlue2 = defaults.integerForKey("oneBlue2")
            
        }
        
        if defaults.integerForKey("oneTime60") != 0 {
            
        oneTime60 = defaults.integerForKey("oneTime60")
            
        }
        
        if defaults.integerForKey("oneLowWall") != 0 {
            
            oneLowWall = defaults.integerForKey("oneLowWall")
            
        }
        
        
        if defaults.integerForKey("oneScore10") != 0 {
            
            oneScore10 = defaults.integerForKey("oneScore10")
            
        }
        
        if defaults.integerForKey("oneRed2") != 0 {
            
            oneRed2 = defaults.integerForKey("oneRed2")
            
        }
        
        
        if defaults.integerForKey("oneTime180") != 0 {
            
            oneTime180 = defaults.integerForKey("oneTime180")
            
        }
        
        if defaults.integerForKey("oneVineWall") != 0 {
            
            oneVineWall = defaults.integerForKey("oneVineWall")
            
        }
        
        if defaults.integerForKey("oneFloatWall") != 0 {
            
            oneFloatWall = defaults.integerForKey("oneFloatWall")
            
        }
        
        if defaults.integerForKey("oneScore25") != 0 {
            
            oneScore25 = defaults.integerForKey("oneScore25")
            
        }
        
         if defaults.integerForKey("oneClear300") != 0 {
            
            oneClear300 = defaults.integerForKey("oneClear300")
            
        }
        
        
        if defaults.integerForKey("oneTime300") != 0 {
            
            oneTime300 = defaults.integerForKey("oneTime300")
            
        }
        
        
        if defaults.integerForKey("oneColl200") != 0 {
            
            oneColl200 = defaults.integerForKey("oneColl200")
            
        }       
            if defaults.integerForKey("oneColl1000") != 0 {
                
                
                 oneColl1000 = defaults.integerForKey("oneColl1000")
                
            }
        
        
        runBlockUpdate = defaults.integerForKey("runBlockUpdate")
     wallsCleared = defaults.integerForKey("wallsCleared")
     redCollected = defaults.integerForKey("redCollected")
        
     
        
        
        if defaults.integerForKey("oneScore40") != 0 {
            
        oneScore40 = defaults.integerForKey("oneScore40")
            
        }
        
       
         if defaults.integerForKey("oneTime600") != 0 {
        
        oneTime600 = defaults.integerForKey("oneTime600")
            
        }
        
        
        if defaults.integerForKey("oneScore50") != 0 {
        
        oneScore50 = defaults.integerForKey("oneScore50")
        
        
        }
        
        if defaults.integerForKey("oneTime600b") != 0 {
            
            oneTime600b = defaults.integerForKey("oneTime600b")
            
        }
        
        
        
        
        runNextBlockAnimation = defaults.integerForKey("runNextBlockAnimation")
        
        if defaults.integerForKey("timer1running") != 0 {
        timer1running = defaults.integerForKey("timer1running")
        }
        
        
        
        costumechoice = defaults.integerForKey("costumechoice")
        
        
        if defaults.integerForKey("twoBlock") != 0 {
            
        twoBlock = defaults.integerForKey("twoBlock")
            
        }
        
        if defaults.integerForKey("threeBlock") != 0 {
            
        threeBlock = defaults.integerForKey("threeBlock")
            
        }
        
    }
    
    func saveState() {
        // Update highScore if the current score is greater
    //    highScore = max(score, highScore) // PUT BACK
        
        // Store in user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setInteger(loadLevel, forKey: "loadLevel")
        defaults.setInteger(coins, forKey: "coins")
        defaults.setInteger(firstCoin, forKey: "firstCoin")
        defaults.setInteger(firstCoinRound, forKey: "firstCoinRound")
        defaults.setInteger(coinMult, forKey: "coinMult")
        defaults.setInteger(secondLife, forKey: "secondLife")
        defaults.setDouble(coingradient, forKey: "coingradient")
        defaults.setDouble(coingradstart, forKey: "coingradstart")
        defaults.setDouble(beginLastRound, forKey: "beginLastRound")
        defaults.setInteger(oneCoinUpg, forKey: "oneCoinUpg")
        defaults.setInteger(yelCoinUpg, forKey: "yelCoinUpg")
        defaults.setInteger(bluCoinUpg, forKey: "bluCoinUpg")
        defaults.setInteger(redCoinUpg, forKey: "redCoinUpg")
        defaults.setInteger(coinUpgOrder, forKey: "coinUpgOrder")
        defaults.setInteger(checkpointunlock, forKey: "checkpointunlock")
        defaults.setInteger(checkpointround, forKey: "checkpointround")
        defaults.setInteger(checkpointHS, forKey: "checkpointHS")
        defaults.setInteger(highScore, forKey: "highScore")

        
        defaults.setInteger(runBlockUpdate, forKey: "runBlockUpdate")
        defaults.setInteger(wallsCleared, forKey: "wallsCleared")
        
        defaults.setInteger(oneBlock, forKey: "oneBlock")
        
        defaults.setInteger(oneScore5, forKey: "oneScore5")
        defaults.setInteger(oneBlue2, forKey: "oneBlue2")
        defaults.setInteger(oneTime60, forKey: "oneTime60")
        
        defaults.setInteger(oneLowWall, forKey: "oneLowWall")
        defaults.setInteger(oneScore10, forKey: "oneScore10")
        defaults.setInteger(oneRed2, forKey: "oneRed2")
         
        
        defaults.setInteger(runNextBlockAnimation, forKey: "runNextBlockAnimation")
        defaults.setInteger(timer1running, forKey: "timer1running")
        
        defaults.setInteger(oneTime180, forKey: "oneTime180")
        defaults.setInteger(oneVineWall, forKey: "oneVineWall")
        defaults.setInteger(oneFloatWall, forKey: "oneFloatWall")
        
        defaults.setInteger(oneScore25, forKey: "oneScore25")
        defaults.setInteger(oneClear300, forKey: "oneClear300")
        defaults.setInteger(oneTime300, forKey: "oneTime300")
        
        defaults.setInteger(redCollected, forKey: "redCollected")
        defaults.setInteger(oneScore40, forKey: "oneScore40")
        defaults.setInteger(oneColl200, forKey: "oneColl200")
        defaults.setInteger(oneTime600, forKey: "oneTime600")
        defaults.setInteger(oneScore50, forKey: "oneScore50")
        defaults.setInteger(oneColl1000, forKey: "oneColl1000")
        defaults.setInteger(oneTime600b, forKey: "oneTime600b")
        
        defaults.setInteger(costumechoice, forKey: "costumechoice")
        
        defaults.setInteger(twoBlock, forKey: "twoBlock")
        defaults.setInteger(threeBlock, forKey: "threeBlock")
        
        
        NSUserDefaults.standardUserDefaults().synchronize()
        
      //  updateAchievements() Removed for assigning tasks in blocks of 3. If want hidden achievements (that exist outside of 3 blocks) will need to add that in.
    }

    
}


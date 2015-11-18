//
//  SlidingWallsTwo.swift
//  Jump Bird
//
//  Created by Jerome Elmore.
//  Copyright (c) 2015 Jerome Elmore. All rights reserved.
//


//Check master list in phone for other problems and recommendations.


/*

import SpriteKit

class SlidingWallsTwo: SKScene, SKPhysicsContactDelegate {



private var bird2: SKSpriteNode!

var worldNode: SKNode!
var starttime: Double = 0
var endtime: Double = 0
var jumppower: Double = 0

//let bird2 = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))


let spikedetector1 = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
let spikedetector2 = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))

let birdimage = SKSpriteNode(imageNamed: "bird") //SKSpriteNode(imageNamed: "Bird")
var tempplatform: SKNode!
var tempvplatform: SKNode!
var breakingwall: SKNode!

let rock = SKTexture(imageNamed: "rock")
let emitterNode = SKEmitterNode()
var testvar: CGFloat = 100


var bird2con: CGFloat = 1
var bird2begincon: CGFloat = 0
var bird2conv: CGFloat = 0
var bird2beginconv: CGFloat = 0
var breakwallcon: CGFloat = 0
var firstswadjust: CGFloat = 120

var bird2y: CGFloat = 901// 901 for fast start //701 //701 for tests// 1200 // 1500
var bird2x: CGFloat =  1850 //1850 // all that follows is for bird2 in backgroundLayer, not self: 1850 // 2250 for 1600 make3 // 2050//1850 for fast start with make3size = 1300 //1500 //for opening walls test: 2300//was 1500 for normal//890 for most tests //800 for some older tests maybe // for reverse slip test: 1500 //800
var startjx: CGFloat = 0 // defined, but not used
var newtouch: CGFloat = 1 // Fixed to going from running to sliding on a skip
var runpos: CGFloat = 1
var cornerland: CGFloat = 0
var undotest: CGFloat = 1
var novj: CGFloat = 0
var newAnchorPoint: CGFloat = 0
var adjustcounter: CGFloat = 0
var maxylanding: CGFloat = 0
var birdtrigger5: CGFloat = 0
var birdtrigger34: CGFloat = 0
var lowestplatformpos: CGFloat = -624
var highestplatformpos: CGFloat = 8
var platformyinc: CGFloat = 100 // the maximum y position above the current platform that the next platform will be
var bird5concheck: CGFloat = 0
var everyotherclick: CGFloat = 0
var turnoffjump: CGFloat = 0
var fallthroughtest: CGFloat = 1
var previousvelocity: CGFloat = 0
var turnoffsmoothe: CGFloat = 0
var firstplatformcontact: CGFloat = 0
var firstvplatformcontact: CGFloat = 0
var birdfalling: CGFloat = 0
var runningthisframe: CGFloat = 0
var spikecontact: CGFloat = 0
var markbreakwallcon: CGFloat = 0
var markremovebreakwall: CGFloat = 0
var trianglePath = CGPathCreateMutable()
var spikeConPath = CGPathCreateMutable()
var reposition: CGFloat = 0
var touchonpause: Int = 0
var secondlives: CGFloat = 0
var usedsecondlives: CGFloat = 0
var checkpointmode: Int = 0
var checkpointmove: Int = 0



var swmaxy: CGFloat = 1750// was CGFloat // was 1848 // highest height the bottom of vplatform goes (not including spike)
var swminy: CGFloat = 700 //was CGFloat
var swgap: CGFloat = 325 // was 350 // gap is technically swgap + 2
var maxPHeight: CGFloat = 0
var minPHeight: CGFloat = 0



var waiting: SKAction = SKAction.waitForDuration(1.0)

var dypriorframe: CGFloat = 0
var dyprior2frames: CGFloat = 0
var firstframe: CGFloat = 0

var yellowCoinBase: Int = 1
var bluCoinBase: Int = 3
var redCoinBase: Int = 10

var platformheight: CGFloat = 2048 // must be 2048 for tests
var platformwidth: CGFloat = 50 //was 50// must be 150 for tests
var vplatformheight: CGFloat = 2048 // must be 2048 for tests
var vplatformwidth: CGFloat = 50 // was 50// must be 150 for tests
var spikewidth: CGFloat = 50 // was 50
var spikeheight: CGFloat = 50
var coinheight: CGFloat = 50 - 4
var coinwidth: CGFloat = 50 - 4
var preventssdeath: CGFloat = 0
var pssdcounter: CGFloat = 2
var placeholder1: Int = -1
var placeholder2: Int = -1
var placeholder3: Int = -1
var placeholder4: Int = -1
var closepos: Int = -1
var platformcount: Int = 0
var platformMinNA: CGFloat = 230 //330 for identical width and first run // was 1 for testing//was 340, raised for testing
var platformMaxNA: CGFloat = 580 //380 for identical width and first run// was 370, // was 600 for testing// raised for testing
var difOne: CGFloat = 0
var difTwo: CGFloat = 0
var difThree: CGFloat = 0
var difOneWidth: CGFloat = 0
var difTwoWidth: CGFloat = 0
var difThreeWidth: CGFloat = 0
var makeOne: Int = 1
var makeTwo: Int = 0
var makeThree: Int = 0

var difPer: CGFloat = 0.8

var difMaxPos: CGFloat = 400
var difMinPos: CGFloat = 350
var difLowPos: CGFloat = 0
var difPos: CGFloat = 0


var difMaxPos1200: CGFloat = 390 //350
var difMinPos1200: CGFloat = 320 //320
var difLowPos1200: CGFloat = -325
var difMaxPos1350: CGFloat = 420 //400
var difMinPos1350: CGFloat = 350 //350
var difLowPos1350: CGFloat = -325
var difMaxPos1500: CGFloat = 460 //420
var difMinPos1500: CGFloat = 390 //390
var difLowPos1500: CGFloat = -325
var LFW: CGFloat = 0
var maxIncrease: CGFloat = 600

var closegaptime: NSTimeInterval = 7 // was 7
var gapclosed: Bool = false
var deaththisframe: CGFloat = 0

var fall2time: NSTimeInterval = 0.25
var frontClosed: Int = 0


let scorescreen = SKSpriteNode(texture: SKTexture(imageNamed: "oldbarrier2"))
let pausescreen = SKSpriteNode(texture: SKTexture(imageNamed: "oldbarrier2"))
let storescreen = SKSpriteNode(texture: SKTexture(imageNamed: "oldbarrier2"))
let coinchoicescreen = SKSpriteNode(texture: SKTexture(imageNamed: "oldbarrier2"))
let replaybutton = SKSpriteNode(texture: SKTexture(imageNamed: "PlayButton"))
let replaybutton2 = SKSpriteNode(texture: SKTexture(imageNamed: "PlayButton"))
let pausebutton = SKSpriteNode(texture: SKTexture(imageNamed: "Pause"))
let storebutton = SKSpriteNode(texture: SKTexture(imageNamed: "Coin"))
let backbuttonpause = SKSpriteNode(texture: SKTexture(imageNamed: "Back"))
let backbuttonstore = SKSpriteNode(texture: SKTexture(imageNamed: "Back"))
let backbuttoncoinscreen = SKSpriteNode(texture: SKTexture(imageNamed: "Back"))
let buySecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "secondLifeButton"))

// BUTTONS TO REMOVE

let freecoins = SKSpriteNode(texture: SKTexture(imageNamed: "Coin")) // remove, gives free coins. PUT BACK
let wipecleanbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Cancel")) // REMOVE, RESETS THE GAME PUT BACK

// END BUTTONS TO REMOVE

//StoreButtons:

let buymultbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buyslbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buyOneCoinUpgButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buySingleSecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buyCheckpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buyStackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))



let multbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Mult"))
let secondLifeButton = SKSpriteNode(imageNamed: "unlimitedsecondlivestwo") // UnlimitedSecondLives
let oneCoinUpgButton = SKSpriteNode(texture: SKTexture(imageNamed: "individualcoinupgrade")) // Individualcoinupgrade
let singleSecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "secondLifeButton"))
let scrambledCheckpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "ScrambledCheckpoint"))
let checkpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "Checkpoint"))
let hiddenStackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "Hidden"))
let stackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "StackableLives"))




var gpaused: Bool = false
var gstore: Bool = false
var gcoinchoice: Bool = false
var firstCoin: CGFloat = 0
var shortStart: CGFloat = 0
var costOfFirstCoinUpg = 150
var costOfSecondCoinUpg = 800
var costOfThirdCoinUpg = 1000
var costOfCheckpoint = 600
var costOfSecondLife = 100
var costOfCoinMultOne = 800
var costOfCoinMultTwo = 3000
var costOfCoinMultThree = 10000
var costOfUnlSecLives = 2000
var costOfStackableLife = 4000

let yellowCoinChoice: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
let blueCoinChoice: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
let redCoinChoice: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")

let yellowBar: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
let blueBar: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
let redBar: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")

let upgradeBarOne: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let upgradeBarTwo: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let upgradeBarThree: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let upgradeBarFour: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let upgradeBarFive: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")

//  var coinUpgOrder: CGFloat = 0

var oneUpgOrder: Int = 0
var twoUpgOrder: Int = 0
var threeUpgOrder: Int = 0



//  let RightBirdPB = SKSpriteNode(texture: SKTexture(imageNamed: "RightBirdPB"))

var make3size: CGFloat = 1300 //1100 // 1450 tryout // was 1300
var sml: CGFloat = 0

let platformst2 = SKSpriteNode(imageNamed: "barrier2")
let platformst1 = SKSpriteNode(imageNamed: "barrier")
let platformst3 = SKSpriteNode(imageNamed: "oldbarrier2")

let blueC = SKSpriteNode(imageNamed: "BlueC")
let blackC = SKSpriteNode(imageNamed: "BlackC")

let platform1: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform2: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform3: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform4: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform5: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform6: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform7: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform8: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform9: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform10: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform11: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let platform12: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")




let coin0: SKSpriteNode = SKSpriteNode(imageNamed: "coin")


let coin1: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin2: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin3: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin4: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin5: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin6: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin7: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin8: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin9: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin10: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin11: SKSpriteNode = SKSpriteNode(imageNamed: "coin")
let coin12: SKSpriteNode = SKSpriteNode(imageNamed: "coin")

let coin21: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin22: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin23: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin24: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin25: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin26: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin27: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin28: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin29: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin210: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin211: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")
let coin212: SKSpriteNode = SKSpriteNode(imageNamed: "coin2")

let coin31: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin32: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin33: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin34: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin35: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin36: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin37: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin38: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin39: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin310: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin311: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")
let coin312: SKSpriteNode = SKSpriteNode(imageNamed: "coin3")

let breakwall1: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall2: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall3: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall4: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall5: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall6: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall7: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall8: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall9: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall10: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall11: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let breakwall12: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")

let xplatform1: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let xplatform2: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let xplatform3: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let xplatform4: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let xplatform5: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
//   let platform10: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")

let vplatform1: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform2: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform3: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform4: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform5: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform6: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform7: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform8: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform9: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform10: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform11: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")
let vplatform12: SKSpriteNode = SKSpriteNode(imageNamed: "barrier2")

let xvplatform1: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let xvplatform2: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let xvplatform3: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let xvplatform4: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")
let xvplatform5: SKSpriteNode = SKSpriteNode(imageNamed: "Tree")


let spikespr1: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr2: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr3: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr4: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr5: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr6: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr7: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr8: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr9: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr10: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr11: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr12: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr13: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr14: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr15: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr16: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr17: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr18: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr19: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr20: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr21: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr22: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr23: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr24: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr25: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr26: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr27: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr28: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr29: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr30: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr31: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr32: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr33: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr34: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr35: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr36: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr37: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr38: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr39: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr40: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr41: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")
let spikespr42: SKSpriteNode = SKSpriteNode(imageNamed: "Spike")


let dartsspr1: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr2: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr3: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr4: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr5: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr6: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr7: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr8: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr9: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr10: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr11: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr12: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr13: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr14: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr15: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr16: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr17: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr18: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr19: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr20: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr21: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr22: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr23: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr24: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr25: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr26: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr27: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr28: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr29: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")
let dartsspr30: SKSpriteNode = SKSpriteNode(imageNamed: "Stalagmite")

let dartduct1: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct2: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct3: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct4: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct5: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct6: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct7: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct8: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct9: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct10: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct11: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct12: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct13: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct14: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct15: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct16: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct17: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct18: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct19: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct20: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct21: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct22: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct23: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct24: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct25: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct26: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct27: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct28: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct29: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let dartduct30: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")

let dartcatcher1: SKSpriteNode = SKSpriteNode(imageNamed: "barrier")
let dartcatcher2: SKSpriteNode = SKSpriteNode(imageNamed: "barrier")
let dartcatcher3: SKSpriteNode = SKSpriteNode(imageNamed: "barrier")
let dartcatcher4: SKSpriteNode = SKSpriteNode(imageNamed: "barrier")

let tree1: SKSpriteNode = SKSpriteNode(imageNamed: "Trunk")
let tree2: SKSpriteNode = SKSpriteNode(imageNamed: "Trunk")
let tree3: SKSpriteNode = SKSpriteNode(imageNamed: "Trunk")
let tree4: SKSpriteNode = SKSpriteNode(imageNamed: "Trunk")

let breakwallphysicsbody: SKSpriteNode = SKSpriteNode(imageNamed: "transparent")

//Navigation:

var Navigationmodeenabled: Bool = true
let rightarrow: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let leftarrow: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let uparrow: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let downarrow: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
let hidearrows: SKSpriteNode = SKSpriteNode(imageNamed: "SpikeSignPost")
var navigating: CGFloat = 0
var turnoffnavigating: CGFloat = 1
var hidearrowscheck: CGFloat = 0
var stoprolldice: CGFloat = 0

//End Navigation

//Print:

let printOn: Int = 0

let halfpipe: SKSpriteNode = SKSpriteNode(imageNamed: "HalfPipe")

var posA: CGFloat = 0
var posB: CGFloat = 0
var posC: CGFloat = 0
var posD: CGFloat = 0
var posE: CGFloat = 0
var posF: CGFloat = 0
var posG: CGFloat = 0
var posH: CGFloat = 0
var posI: CGFloat = 0
var posJ: CGFloat = 0
var posK: CGFloat = 0
var posL: CGFloat = 0

var posAs: CGFloat = 0
var posBs: CGFloat = 0
var posCs: CGFloat = 0
var posDs: CGFloat = 0
var posEs: CGFloat = 0
var posFs: CGFloat = 0
var posGs: CGFloat = 0
var posHs: CGFloat = 0
var posIs: CGFloat = 0
var posJs: CGFloat = 0
var posKs: CGFloat = 0
var posLs: CGFloat = 0

var bonustimecheck: CGFloat = 0


let gauge = SKSpriteNode(imageNamed: "Circle0")
var ground = SKSpriteNode(imageNamed: "barrier")
var ceiling = SKSpriteNode(imageNamed: "barrier")
var facingdirection: Double = 1

let playableRect: CGRect
var jumping: Bool = false
var sliding: Bool = false
var running: Bool = true
var atrest: Bool = false
var scrollcounter: CGFloat = 0
let backgroundLayer = SKNode()
var topfloor: CGFloat = 0
var gameover: Bool = false


var scrollcount: CGFloat = 1 // keeps count of how many obstacle sets passed





let gameoverbarrier = SKSpriteNode(imageNamed: "barrier")
let cleanupbarrier = SKSpriteNode(imageNamed: "barrier")

// var score = 0
var scoreLabel = SKLabelNode()
var highScoreLabel = SKLabelNode()
var coinLabel = SKLabelNode()
var screenScoreLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
var screenHighScoreLabel = SKLabelNode(fontNamed: "Noteworthy-Bold")
var gamestarttime = CFAbsoluteTimeGetCurrent()
var elapsedgametime: NSTimeInterval = 0

var miniCoinLabel1 = SKLabelNode(fontNamed: "ChalkboardSE-Bold") //  was AvenirNextCondensed-Heavy // was ChalkboardSE-Bold// was AmericanTypewriter-CondensedBold
var miniCoinLabel2 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
var miniCoinLabel3 = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
var minicycle: Int = 0

var allcoinmultlabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
var secondlifelabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
var individcoinupglabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
var individseclifelabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
var checkpointlabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")
var stackableliveslabel = SKLabelNode(fontNamed: "ChalkboardSE-Bold")


var beginLabel = SKLabelNode()

var dart1: CGFloat = 0
var dart2: CGFloat = 0
var dart3: CGFloat = 0

var spike1: CGFloat = 0
var spike2: CGFloat = 0
var spike3: CGFloat = 0

var pressure = 0

var solidspike = 0
var vspike = 0

var obstaclebonustime: NSTimeInterval = 0
var obstacle1bonustime: NSTimeInterval = 0
var obstacle2bonustime: NSTimeInterval = 0
var obstacle3bonustime: NSTimeInterval = 0

var customdart1start: CGFloat = 0.1
var customdart1count: CGFloat = 0
var firstdelay: CGFloat = 1

var cycle: Int = -1
var xcycle: Int = -1

var dartarraypos: Int = 0
var spikearraypos: Int = 0

let righttext: SKTexture = SKTexture(imageNamed: "Bird") // was "Bird"// was RightBird
let lefttext: SKTexture = SKTexture(imageNamed: "LeftBird") // was LeftBird
let rightresttext: SKTexture = SKTexture(imageNamed: "LeftRestBirdNew") // was LeftRestBirdNew // was RightBird
let leftresttext: SKTexture = SKTexture(imageNamed: "RightRestBirdNew") // was RightRestBirdNew // was LeftBird

let rightslidetext: SKTexture = SKTexture(imageNamed: "RightSlideBirdNew") // was RightSlideBirdNew
let leftslidetext: SKTexture = SKTexture(imageNamed: "LeftSlideBirdNew") // was LeftSlideBirdNew

var flytextr: SKTexture = SKTexture(imageNamed: "SimpleJumpRight3") // was SimpleJumpRight3 // was SimpleJumpRight
var flytextl: SKTexture = SKTexture(imageNamed: "SimpleJumpLeft3") // was SimpleJumpLeft3 // was SimpleJumpLeft
//  var flytextu: SKTexture = SKTexture(imageNamed: "JumpBirdU")
//   var flytext: SKTexture = SKTexture(imageNamed: "JumpBird")

var righttexture: [SKTexture] = []
var lefttexture: [SKTexture] = []
var flytextureR: [SKTexture] = []
var flytextureL: [SKTexture] = []
var rightslidetexture: [SKTexture] = []
var leftslidetexture: [SKTexture] = []
var leftresttexture: [SKTexture] = []
var rightresttexture: [SKTexture] = []

var score0: [CGFloat] = []
var score1: [CGFloat] = []
var score2: [CGFloat] = []
var score3: [CGFloat] = []

var checkfirstplat: CGFloat = 0

var vh1: CGFloat = 0
var vh2: CGFloat = 0
var vh3: CGFloat = 0
var ph1: CGFloat = 0
var ph2: CGFloat = 0
var ph3: CGFloat = 0

var vw1: CGFloat = 0
var vw2: CGFloat = 0
var vw3: CGFloat = 0
var pw1: CGFloat = 0
var pw2: CGFloat = 0
var pw3: CGFloat = 0

var bonustimecheck1: CGFloat = 0
var bonustimecheck2: CGFloat = 0
var bonustimecheck3: CGFloat = 0

var xposlastscore: CGFloat = 0
var timelastscore: CFTimeInterval = 0
var oldscore: Int = 0
var turnoffrocks: Int = 0

var initialcount: CGFloat = 0 // was 0, for initial barriers

// var scoreVar: CGFloat = []


//let gaugeAnimation: SKAction




struct PhysicsCategory {
static let bird: UInt32 = 0b1
static let block: UInt32 = 0b10
static let floor: UInt32 = 0b100
static let danger: UInt32 = 0b1000
static let dart: UInt32 = 0b10000
static let dartcatcher: UInt32 = 0b100000
static let vplatform: UInt32 = 0b1000000
static let outline: UInt32 = 0b10000000
static let slidespike: UInt32 = 0b100000000
static let coin: UInt32 = 0b1000000000
static let cleanup: UInt32 = 0b10000000000
}




required init(coder aDecoder: NSCoder) {
fatalError("init(coder:) has not been implemented")
}

func checkpointroundanimation() {

scoreLabel.text = "0"
gpaused = true


blueC.size.height = 300
blueC.size.width = 300
blackC.size.height = 300
blackC.size.width = 300
blueC.zPosition = 7
blackC.zPosition = 7
blueC.name = "label"
blackC.name = "label"

blueC.position.x = self.size.width + blueC.size.width
blueC.position.y = self.size.height/2
blackC.position.x = 0 - blackC.size.width
blackC.position.y = self.size.height/2

self.addChild(blueC)
self.addChild(blackC)

blueC.runAction(SKAction.sequence([SKAction.waitForDuration(1.0), SKAction.moveToX(self.size.width/2, duration: 0.5), SKAction.waitForDuration(1.0), SKAction.moveToX(0 - blueC.size.width/2, duration: 0.5)]))
blackC.runAction(SKAction.sequence([SKAction.waitForDuration(1.0), SKAction.moveToX(self.size.width/2, duration: 0.5), SKAction.waitForDuration(1.0), SKAction.runBlock({

self.gpaused = false
self.blackC.runAction(SKAction.moveToX(self.size.width + self.blackC.size.width, duration: 0.5))


}), SKAction.runBlock({

var updatescorecounter: Int = 0
updatescorecounter = Int(floor(CGFloat(GameState.sharedInstance.score)/5))
//      let indexs: Int = 0

for indexs in 0...4 {
//put if statement for changing to dart here, so we won't have to enumerate later.

self.blackC.runAction(SKAction.sequence([SKAction.waitForDuration(0.1*NSTimeInterval(indexs)), SKAction.runBlock({

self.scoreLabel.text = "\(indexs*updatescorecounter)"

if indexs == 4 {
self.scoreLabel.text = "\(GameState.sharedInstance.checkpointHS)"
//   SKAction.waitForDuration(0.1)
}

})]))}




})]))

}
//



func death() {

// *** // *** print("death() begin")

if deaththisframe == 0 {

if (secondlives == 0 || usedsecondlives == 1) && gameover == false {




//turns on danger gameover
//  println("slidespike death")
gameover = true
GameState.sharedInstance.saveState()

//TURNS ON SCORESCREEN:

if GameState.sharedInstance.highScore >= 10 {

buySecondLifeButton.size.width = 100
buySecondLifeButton.size.height = 100
buySecondLifeButton.position.x = -scorescreen.size.width/2
buySecondLifeButton.position.x += replaybutton.size.width/2
buySecondLifeButton.position.x += 250

buySecondLifeButton.position.y = -scorescreen.size.height/2
buySecondLifeButton.position.y += replaybutton.size.height/2
buySecondLifeButton.position.y += 50

buySecondLifeButton.zPosition = 0



if buySecondLifeButton.parent == nil {

scorescreen.addChild(buySecondLifeButton)

if individseclifelabel.parent == nil {


}

}



if buySecondLifeButton.parent != nil && checkpointmode == 1 {

buySecondLifeButton.removeFromParent()
individseclifelabel.removeFromParent()

}



if individseclifelabel.parent == nil && checkpointmode == 0 {
individseclifelabel.fontColor = SKColor.yellowColor()
individseclifelabel.colorBlendFactor = 0.25
individseclifelabel.fontSize = 40
individseclifelabel.name = "storelabel"
individseclifelabel.zPosition = 0
individseclifelabel.position.x = buySecondLifeButton.position.x - 150
individseclifelabel.position.y = buySecondLifeButton.position.y
individseclifelabel.text = "\(costOfSecondLife)"
scorescreen.addChild(individseclifelabel)
}
}

if buyStackableLivesButton.parent == nil && GameState.sharedInstance.coins >= 500 {



buyStackableLivesButton.size.width = 100
buyStackableLivesButton.size.height = 100
buyStackableLivesButton.position.x = -scorescreen.size.width/2
buyStackableLivesButton.position.x += replaybutton.size.width/2
buyStackableLivesButton.position.x += 250


buyStackableLivesButton.position.y = -scorescreen.size.height/2
buyStackableLivesButton.position.y += replaybutton.size.height/2

buyStackableLivesButton.position.y -= 150
buyStackableLivesButton.zPosition = 0
scorescreen.addChild(buyStackableLivesButton)
}

if stackableliveslabel.parent == nil && buyStackableLivesButton.parent != nil {
stackableliveslabel.fontColor = SKColor.yellowColor()
stackableliveslabel.colorBlendFactor = 0.25
stackableliveslabel.fontSize = 40
stackableliveslabel.name = "storelabel"
stackableliveslabel.zPosition = 0
stackableliveslabel.position.x = buyStackableLivesButton.position.x - 150
stackableliveslabel.position.y = buyStackableLivesButton.position.y
stackableliveslabel.text = "\(costOfStackableLife)"
scorescreen.addChild(stackableliveslabel)
}

if GameState.sharedInstance.coins < costOfStackableLife {

buyStackableLivesButton.alpha = 0.5
stackableliveslabel.alpha = 0.5

} else {

buyStackableLivesButton.alpha = 1.0
stackableliveslabel.alpha = 1.0

}

if GameState.sharedInstance.coins < costOfSecondLife {

buySecondLifeButton.alpha = 0.5
individseclifelabel.alpha = 0.5

} else {

buySecondLifeButton.alpha = 1.0
individseclifelabel.alpha = 1.0

}



scorescreen.size.width = 800
scorescreen.size.height = 1500
scorescreen.position.x = bird2.position.x
scorescreen.position.y = -500
scorescreen.zPosition = 10
scorescreen.name = "scorescreen"
backgroundLayer.addChild(scorescreen) //some kind of problem with this, being added twice PUT BACK but fix first

replaybutton2.removeFromParent()
replaybutton2.size.width = 150
replaybutton2.size.height = 150
replaybutton2.position.x = -scorescreen.size.width/2
replaybutton2.position.x += replaybutton.size.width/2
replaybutton2.position.x += CGFloat(50)

replaybutton2.position.y = -scorescreen.size.height/2
replaybutton2.position.y += replaybutton.size.height/2
replaybutton2.position.y += 50

replaybutton2.zPosition = 0
scorescreen.addChild(replaybutton2) //some kind of problem with this, being added twice PUT BACK but fix first

screenScoreLabel.removeFromParent()
screenScoreLabel = SKLabelNode(text: "Score: \(GameState.sharedInstance.score)")
screenScoreLabel.position.x = 0
screenScoreLabel.position.y = 400
screenScoreLabel.fontColor = SKColor.blackColor()
//  screenScoreLabel.fontName = NoteWorthy
screenScoreLabel.fontSize = 65
scorescreen.addChild(screenScoreLabel)

screenHighScoreLabel.removeFromParent()
screenHighScoreLabel = SKLabelNode(text: "High Score: \(GameState.sharedInstance.highScore)")
screenHighScoreLabel.position.x = 0
screenHighScoreLabel.position.y = 100
screenHighScoreLabel.fontColor = SKColor.blackColor()
//    screenhighScoreLabel.fontName = NoteWorthy
screenHighScoreLabel.fontSize = 65
scorescreen.addChild(screenHighScoreLabel)


scorescreen.runAction(SKAction.moveToY(self.size.height/2, duration: 1))
//   replaybutton.runAction(SKAction.moveToY(self.size.height - 1200, duration: 1))


if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.checkpointunlock == 1 {

GameState.sharedInstance.checkpointround = GameState.sharedInstance.checkpointround + 1

if GameState.sharedInstance.score > GameState.sharedInstance.checkpointHS && checkpointmode == 0 {

GameState.sharedInstance.checkpointHS = GameState.sharedInstance.score

}

GameState.sharedInstance.saveState()
} //CHECKPOINTPUTBACK

bird2.runAction(SKAction.removeFromParent())
//  bird2.paused = true
}

if secondlives == 1 && usedsecondlives == 0 {

secondliferepo()


}

}
deaththisframe = 1
}



func checkshutgaploss(checknode: Int) {

// *** print("checkshutgaploss start")
if bird2.position.x < platforms[checknode].position.x {
gapclosed = true
// death()
platforms[checknode].physicsBody!.angularDamping = CGFloat(closepos)
vplatforms[checknode].physicsBody!.angularDamping = CGFloat(closepos)

if GameState.sharedInstance.score <= 5 {
coins[checknode].hidden = true
}

if GameState.sharedInstance.score > 5 && GameState.sharedInstance.score <= 10  {
coins2[checknode].hidden = true
}

if GameState.sharedInstance.score > 10 {
coins3[checknode].hidden = true
}

}

//otherwise do nothing
// *** print("checkshutgaploss end")

}


func resetbird() {

reposition = 0
running = false
sliding = false
atrest = false
jumping = true
bird2con = 0
facingdirection = 1
birdimage.alpha = 1
timelastscore = CFAbsoluteTimeGetCurrent()
// *** print("resetbird")
bird2.physicsBody!.velocity.dx = 100
bird2.physicsBody!.velocity.dy = 0
bird2.physicsBody!.affectedByGravity = true
bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart | PhysicsCategory.slidespike

}

func secondliferepo() {

reposition = 1
birdimage.alpha = 0.5
bird2con = 0
bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0

if closepos > -1 {

bird2.runAction(SKAction.sequence([SKAction.moveToX(platforms[closepos].position.x - 0.5*make3size/3 - 20, duration: 0.50), SKAction.moveTo(CGPoint(x: platforms[closepos].position.x - 0.5*make3size/3 - 20, y: CGRectGetMaxY(ground.frame) + 150), duration: 0.5), SKAction.runBlock({self.resetbird()})]))

if gapclosed == false {
platforms[closepos].runAction(SKAction.sequence([SKAction.moveToY(platforms[closepos].physicsBody!.charge - swgap/2, duration: 1.0), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")

vplatforms[closepos].runAction(SKAction.sequence([SKAction.moveToY(vplatforms[closepos].physicsBody!.charge + swgap/2, duration: 1.0), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time)]), withKey: "Fall2")
}
}

if closepos == -1 {
//   bird2.runAction(SKAction.moveToX(platformst3.position.x - 20, duration: 0.5))

bird2.runAction(SKAction.sequence([ SKAction.moveTo(CGPoint(x: platformst3.position.x - 20, y: CGRectGetMaxY(platformst3.frame) + 150), duration: 0.5), SKAction.runBlock({self.resetbird()})]))
//SKAction.waitForDuration(0.5),
}
//    bird2.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.waitForDuration(0.1), SKAction.hide(bird2), SKAction.waitForDuration(0.1), SKAction.unhide(bird2)])), withKey: "Blink")

gameover = false

secondlives = 0
}

func updateUpgMeters() {

yellowBar.size.width = 50
yellowBar.size.height = 50
blueBar.size.width = 50
blueBar.size.height = 50
redBar.size.width = 50
redBar.size.height = 50
upgradeBarOne.size.width = 50
upgradeBarOne.size.height = 50
upgradeBarTwo.size.width = 50
upgradeBarTwo.size.height = 50
upgradeBarThree.size.width = 50
upgradeBarThree.size.height = 50
upgradeBarFour.size.width = 50
upgradeBarFour.size.height = 50
upgradeBarFive.size.width = 50
upgradeBarFive.size.height = 50

/*
var costOfFirstCoinUpg = 100
var costOfSecondCoinUpg = 400
var costOfThirdCoinUpg = 500
var costOfCheckpoint = 300
var costOfSecondLife = 50
var costOfCoinMultOne = 400
var costOfCoinMultTwo = 1500
var costOfCoinMultThree = 5000
var costOfUnlSecLives = 1000
var costOfStackableLife = 2000
*/
yellowCoinChoice.removeFromParent()
blueCoinChoice.removeFromParent()
redCoinChoice.removeFromParent()


if GameState.sharedInstance.yelCoinUpg == 1 {
coinchoicescreen.addChild(yellowCoinChoice)
}

if GameState.sharedInstance.bluCoinUpg == 1 {
coinchoicescreen.addChild(blueCoinChoice)
}

if GameState.sharedInstance.redCoinUpg == 1 {
coinchoicescreen.addChild(redCoinChoice)
}

allcoinmultlabel.fontColor = SKColor.yellowColor()
allcoinmultlabel.colorBlendFactor = 0.25
allcoinmultlabel.fontSize = 40
allcoinmultlabel.name = "storelabel"
allcoinmultlabel.zPosition = 0


secondlifelabel.fontColor = SKColor.yellowColor()
secondlifelabel.colorBlendFactor = 0.25
secondlifelabel.fontSize = 40
secondlifelabel.name = "storelabel"
secondlifelabel.zPosition = 0

individcoinupglabel.fontColor = SKColor.yellowColor()
individcoinupglabel.colorBlendFactor = 0.25
individcoinupglabel.fontSize = 40
individcoinupglabel.name = "storelabel"
individcoinupglabel.zPosition = 0





checkpointlabel.fontColor = SKColor.yellowColor()
checkpointlabel.colorBlendFactor = 0.25
checkpointlabel.fontSize = 40
checkpointlabel.name = "storelabel"
checkpointlabel.zPosition = 0



storescreen.size.width = 800
storescreen.size.height = 1500
storescreen.name = "storescreen"

if GameState.sharedInstance.oneCoinUpg == 0 {
individcoinupglabel.text = "\(costOfFirstCoinUpg)"
}

if GameState.sharedInstance.oneCoinUpg == 1 {
individcoinupglabel.text = "\(costOfSecondCoinUpg)"
}

if GameState.sharedInstance.oneCoinUpg == 2 {
individcoinupglabel.text = "\(costOfThirdCoinUpg)"
}

if GameState.sharedInstance.oneCoinUpg == 3 {
individcoinupglabel.text = " "
}

if GameState.sharedInstance.coinMult == 1 {

allcoinmultlabel.text = "\(costOfCoinMultOne)"

}

if GameState.sharedInstance.coinMult == 2 {

allcoinmultlabel.text = "\(costOfCoinMultTwo)"

}

if GameState.sharedInstance.coinMult == 5 {

allcoinmultlabel.text = "\(costOfCoinMultThree)"

}

if GameState.sharedInstance.coinMult == 10 {

allcoinmultlabel.text = " "

}

if GameState.sharedInstance.checkpointunlock == 0 {

checkpointlabel.text = "\(costOfCheckpoint)"
}

if GameState.sharedInstance.checkpointunlock == 1 {

checkpointlabel.text = " "
}

if GameState.sharedInstance.secondLife == 0 {

secondlifelabel.text = "\(costOfUnlSecLives)"
}

if GameState.sharedInstance.secondLife == 1 {

secondlifelabel.text = " "
}

if oneUpgOrder >= 100 && oneUpgOrder < 200 {

yellowBar.removeFromParent()
yellowBar.position.x = -100
yellowBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(yellowBar)

}

if oneUpgOrder >= 200 && oneUpgOrder < 300  {


blueBar.removeFromParent()
blueBar.position.x = -100
blueBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(blueBar)

}

if oneUpgOrder >= 300 {


redBar.removeFromParent()
redBar.position.x = -100
redBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(redBar)

}

if twoUpgOrder >= 10 && twoUpgOrder < 20  {

yellowBar.removeFromParent()
yellowBar.position.x = 0
yellowBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(yellowBar)

}

if twoUpgOrder >= 20 && twoUpgOrder < 30 {


blueBar.removeFromParent()
blueBar.position.x = 0
blueBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(blueBar)

}

if twoUpgOrder >= 30 {


redBar.removeFromParent()
redBar.position.x = 0
redBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(redBar)

}

if threeUpgOrder == 1 {

yellowBar.removeFromParent()
yellowBar.position.x = 100
yellowBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(yellowBar)

}

if threeUpgOrder == 2 {


blueBar.removeFromParent()
blueBar.position.x = 100
blueBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(blueBar)

}

if threeUpgOrder == 3 {


redBar.removeFromParent()
redBar.position.x = 100
redBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
storescreen.addChild(redBar)

}

if GameState.sharedInstance.checkpointunlock == 1 {

upgradeBarOne.removeFromParent()
upgradeBarOne.position.x = 0
upgradeBarOne.position.y = checkpointButton.position.y
storescreen.addChild(upgradeBarOne)
}

if GameState.sharedInstance.coinMult > 1 {

upgradeBarTwo.removeFromParent()
upgradeBarTwo.position.x = -100
upgradeBarTwo.position.y = multbutton.position.y
storescreen.addChild(upgradeBarTwo)
}

if GameState.sharedInstance.coinMult > 4 {

upgradeBarThree.removeFromParent()
upgradeBarThree.position.x = 0
upgradeBarThree.position.y = multbutton.position.y
storescreen.addChild(upgradeBarThree)
}

if GameState.sharedInstance.coinMult > 9 {

upgradeBarFour.removeFromParent()
upgradeBarFour.position.x = 100
upgradeBarFour.position.y = multbutton.position.y
storescreen.addChild(upgradeBarFour)
}

if GameState.sharedInstance.secondLife == 1 {

upgradeBarFive.removeFromParent()
upgradeBarFive.position.x = 0
upgradeBarFive.position.y = secondLifeButton.position.y
storescreen.addChild(upgradeBarFive)
}
}

func wipeclean() { // REMOVE RESETS ALL UPGRADES


GameState.sharedInstance.firstCoin = 0
GameState.sharedInstance.firstCoinRound = 0
GameState.sharedInstance.yelCoinUpg = 1
GameState.sharedInstance.bluCoinUpg = 1
GameState.sharedInstance.redCoinUpg = 1
GameState.sharedInstance.coinUpgOrder = 0
GameState.sharedInstance.oneCoinUpg = 0
GameState.sharedInstance.coinMult = 1
GameState.sharedInstance.secondLife = 0
GameState.sharedInstance.coins = 0
GameState.sharedInstance.highScore = 0
GameState.sharedInstance.score = 0
GameState.sharedInstance.checkpointround = 0
GameState.sharedInstance.checkpointunlock = 0
GameState.sharedInstance.checkpointHS = 0
GameState.sharedInstance.saveState()
yellowBar.removeFromParent()
blueBar.removeFromParent()
redBar.removeFromParent()
upgradeBarOne.removeFromParent()
upgradeBarTwo.removeFromParent()
upgradeBarThree.removeFromParent()
upgradeBarFour.removeFromParent()
upgradeBarFive.removeFromParent()
coinLabel.text = "\(GameState.sharedInstance.coins)"
scoreLabel.text = "\(GameState.sharedInstance.score)"
highScoreLabel.text = "\(GameState.sharedInstance.highScore)"
}


var platforms: Array<SKSpriteNode!> = []
var breakwalls: Array<SKSpriteNode!> = []
var vplatforms: Array<SKSpriteNode!> = []
var xplatforms: Array<SKSpriteNode!> = []
var xvplatforms: Array<SKSpriteNode!> = []
var spikes: Array<SKSpriteNode!> = []
var darts: Array<SKSpriteNode!> = []
var dartducts: Array<SKSpriteNode!> = []
var dartcatchers: Array<SKSpriteNode!> = []
var trees: Array<SKSpriteNode!> = []
var coins: Array<SKSpriteNode!> = []
var coins2: Array<SKSpriteNode!> = []
var coins3: Array<SKSpriteNode!> = []
var minicoinlabels: Array<SKLabelNode!> = []


var scorescreenwidth: CGFloat = 800
var replaybuttonwidth: CGFloat = 150
var scorescreenheight: CGFloat = 1500
var replaybuttonheight: CGFloat = 150





override init(size: CGSize) {
/* let maxAspectRatio1:CGFloat = 16.0/9.0
let playableHeight1 = size.width / maxAspectRatio1
let playableMargin1 = (size.height-playableHeight1)/2.0 */
playableRect = CGRect(x: 0, y: (2048/2),
width: 1536,
height: 2048)
super.init(size: size)
}



override func didMoveToView(view: SKView) {
/* Setup your scene here */
//   println("\(self.size.width) \(self.size.width/7)")
// *** print("MaxY: \(platform11.position))")
/*   let maxAspectRatio:CGFloat = 16.0/9.0
let playableHeight = size.width / maxAspectRatio
let playableMargin = (size.height - playableHeight)/2.0 */


/*for fallthrough test

bird2.runAction(SKAction.moveToX(3570, duration: 5))
*/

// RESET HIGH SCORE:    GameState.sharedInstance.highScore = 0




//reset initial values on transitiontogame():


self.physicsWorld.speed = 1.0
self.speed = 1


self.view!.multipleTouchEnabled = false

bird2 = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))

if GameState.sharedInstance.highScore >= 5 {


if GameState.sharedInstance.firstCoinRound > 3 {

firstCoin = CGFloat.random(min: 0, max: 1)
//    GameState.sharedInstance.firstCoinRound = GameState.sharedInstance.firstCoinRound + 1
//    GameState.sharedInstance.saveState()
}


if GameState.sharedInstance.firstCoinRound == 3 {

firstCoin = 0.95
GameState.sharedInstance.firstCoinRound = GameState.sharedInstance.firstCoinRound + 1
GameState.sharedInstance.saveState()
}

if GameState.sharedInstance.firstCoinRound == 2 {

firstCoin = 0
GameState.sharedInstance.firstCoinRound = GameState.sharedInstance.firstCoinRound + 1
GameState.sharedInstance.saveState()
}

if GameState.sharedInstance.firstCoinRound == 1 {

firstCoin = 0.7
GameState.sharedInstance.firstCoinRound = GameState.sharedInstance.firstCoinRound + 1
GameState.sharedInstance.saveState()
}


if GameState.sharedInstance.firstCoinRound == 0 {

firstCoin = 0
GameState.sharedInstance.firstCoinRound = GameState.sharedInstance.firstCoinRound + 1
GameState.sharedInstance.saveState()
}


// *** print("firstCoin: \(firstCoin)")

}

//test firstcoin:
// firstCoin = 1

starttime = 0
endtime = 0
jumppower = 0


testvar = 100


bird2con = 1
bird2begincon = 0
bird2conv = 0
bird2beginconv = 0
breakwallcon = 0
firstswadjust = 120

bird2y = 901// 901 for fast start //701 //701 for tests// 1200 // 1500
bird2x =  1850 //1850 // all that follows is for bird2 in backgroundLayer, not self: 1850 // 2250 for 1600 make3 // 2050//1850 for fast start with make3size = 1300 //1500 //for opening walls test: 2300//was 1500 for normal//890 for most tests //800 for some older tests maybe // for reverse slip test: 1500 //800
startjx = 0 // defined, but not used
newtouch = 1 // Fixed to going from running to sliding on a skip
runpos = 1
cornerland = 0
undotest = 1
novj = 0
newAnchorPoint = 0
adjustcounter = 0
maxylanding = 0
birdtrigger5 = 0
birdtrigger34 = 0
lowestplatformpos = -624
highestplatformpos = 8
platformyinc = 100 // the maximum y position above the current platform that the next platform will be
bird5concheck = 0
everyotherclick = 0
turnoffjump = 0
fallthroughtest = 1
previousvelocity = 0
turnoffsmoothe = 0
firstplatformcontact = 0
firstvplatformcontact = 0
birdfalling = 0
runningthisframe = 0
spikecontact = 0
markbreakwallcon = 0
markremovebreakwall = 0
reposition = 0


secondlives = 0
usedsecondlives = 0
checkpointmode = 0
checkpointmove = 0





swmaxy = 1750// was CGFloat // was 1848 // highest height the bottom of vplatform goes (not including spike)
swminy = 700 //was CGFloat
swgap = 325 // was 350 // gap is technically swgap + 2

maxPHeight = swmaxy - swgap/2 - platformheight/2 //maximum platform height upon placement, before gap opens, y pos of top of platform  // -249 + 460 + 6 // was
minPHeight = swminy - platformheight/2 + swgap/2 //minimum platform height upon placement, before gap opens, y pos of bottom of platform -250



dypriorframe = 0
dyprior2frames = 0
firstframe = 0

yellowCoinBase = 1
bluCoinBase = 3
redCoinBase = 10

platformheight = 2048 // must be 2048 for tests
platformwidth = 50 // must be 150 for tests
vplatformheight = 2048 // must be 2048 for tests
vplatformwidth = 50 // must be 150 for tests
spikewidth = 50 // was 50
spikeheight = 50
coinheight = 50 - 4
coinwidth = 50 - 4
preventssdeath = 0
pssdcounter = 2
placeholder1 = -1
placeholder2 = -1
placeholder3 = -1
placeholder4 = -1
closepos = -1
platformcount = 0
platformMinNA = 230 //330 // was 1 for testing//was 340, raised for testing
platformMaxNA = 580 //380 // was 370, // was 600 for testing// raised for testing
closegaptime = 7 // was 7

fall2time = 0.25
frontClosed = 0

difOne = 0
difTwo = 0
difThree = 0
difOneWidth = 0
difTwoWidth = 0
difThreeWidth = 0
makeOne = 1
makeTwo = 0
makeThree = 0

difPer = 0.8

difMaxPos = 0
difMinPos = 0


difMaxPos1200 = 390 //350
difMinPos1200 = 320 //320

difMaxPos1350 = 420 //400
difMinPos1350 = 350 //350

difMaxPos1500 = 460 //420
difMinPos1500 = 390 //390









gpaused = false
gstore = false
gcoinchoice = false

shortStart = 0
costOfFirstCoinUpg = 100 // was 100 first run
costOfSecondCoinUpg = 300 // was 300 first run
costOfThirdCoinUpg = 500 // was 500 first run
costOfSecondLife = 100 // was 25 first run


//  coinUpgOrder = 0

oneUpgOrder = 0
twoUpgOrder = 0
threeUpgOrder = 0



//  let RightBirdPB = SKSpriteNode(texture: SKTexture(imageNamed: "RightBirdPB"))

make3size = 1300 //1100 // 1450 tryout // was 1300
sml = 0



//Navigation:


navigating = 0
turnoffnavigating = 1
hidearrowscheck = 0
stoprolldice = 0

//End Navigation



posA = 0
posB = 0
posC = 0
posD = 0
posE = 0
posF = 0
posG = 0
posH = 0
posI = 0
posJ = 0
posK = 0
posL = 0

posAs = 0
posBs = 0
posCs = 0
posDs = 0
posEs = 0
posFs = 0
posGs = 0
posHs = 0
posIs = 0
posJs = 0
posKs = 0
posLs = 0

bonustimecheck = 0


facingdirection = 1


jumping = false
sliding = false
running = true
atrest = false
scrollcounter = 0

topfloor = 0
gameover = false


scrollcount = 1 // keeps count of how many obstacle sets passed







// score = 0

gamestarttime = CFAbsoluteTimeGetCurrent()
elapsedgametime = 0





dart1 = 0
dart2 = 0
dart3 = 0

spike1 = 0
spike2 = 0
spike3 = 0

pressure = 0

solidspike = 0
vspike = 0

obstaclebonustime = 0
obstacle1bonustime = 0
obstacle2bonustime = 0
obstacle3bonustime = 0

customdart1start = 0.1
customdart1count = 0
firstdelay = 1

cycle = -1
xcycle = -1

dartarraypos = 0
spikearraypos = 0


//  flytextu: SKTexture = SKTexture(imageNamed: "JumpBirdU")
//   flytext: SKTexture = SKTexture(imageNamed: "JumpBird")

righttexture = []
lefttexture = []
flytextureR = []
flytextureL = []
rightslidetexture = []
leftslidetexture = []
leftresttexture = []
rightresttexture = []

score0 = []
score1 = []
score2 = []
score3 = []

checkfirstplat = 0

vh1 = 0
vh2 = 0
vh3 = 0
ph1 = 0
ph2 = 0
ph3 = 0

vw1 = 0
vw2 = 0
vw3 = 0
pw1 = 0
pw2 = 0
pw3 = 0

bonustimecheck1 = 0
bonustimecheck2 = 0
bonustimecheck3 = 0

xposlastscore = 0
timelastscore = 0
oldscore = 0
turnoffrocks = 0

initialcount = 0 // was 0, for initial barriers

// scoreVar = []


//let gaugeAnimation: SKAction











// end reset initial values on transitiontogame()

self.size.width = 1536
self.size.height = 2048

worldNode = SKNode()
worldNode.zPosition = 0
addChild(worldNode)
worldNode.position.x = 0
worldNode.position.y = 0
// anchorPoint = CGPointMake(0.5,0.5)

backgroundColor = SKColor.whiteColor()

// *** print("checkpoint round before checking for checkpoint mode: \(GameState.sharedInstance.checkpointround)")


if GameState.sharedInstance.checkpointunlock == 1 {

if GameState.sharedInstance.checkpointround == 1 {

GameState.sharedInstance.checkpointHS = 0
}

if GameState.sharedInstance.checkpointround > 3 {

checkpointmode = 1

GameState.sharedInstance.checkpointround = 0
platformcount = GameState.sharedInstance.checkpointHS
checkpointroundanimation()

}

}//CHECKPOINTPUTBACK






freecoins.position.x = 400
freecoins.position.y = 100// REMOVE PUT BACK
freecoins.zPosition = 6
freecoins.size.width = 100
freecoins.size.height = 100
self.addChild(freecoins)



wipecleanbutton.position.x = 350 // REMOVE PUT BACK
wipecleanbutton.position.y = 100
wipecleanbutton.zPosition = 6
wipecleanbutton.size.width = 100
wipecleanbutton.size.height = 100
self.addChild(wipecleanbutton)





ground.size.width = size.width
ground.size.height = 300 // was 100
ground.position.x = size.width/2
ground.position.y = 0.1*ground.size.height
ground.physicsBody = SKPhysicsBody(rectangleOfSize: ground.size)
ground.physicsBody!.dynamic = false
ground.physicsBody!.friction = 0
ground.physicsBody!.restitution = 0
ground.physicsBody!.categoryBitMask = PhysicsCategory.floor
ground.physicsBody!.contactTestBitMask = PhysicsCategory.bird
ground.physicsBody?.collisionBitMask = PhysicsCategory.bird
ground.zPosition = 4
ground.name = "floor"
addChild(ground)

ceiling.size.width = size.width
ceiling.size.height = 100
ceiling.position.x = size.width/2
ceiling.position.y = size.height + ceiling.size.height/2
ceiling.physicsBody = SKPhysicsBody(rectangleOfSize:ceiling.size)
ceiling.physicsBody!.dynamic = false
ceiling.physicsBody!.friction = 0
ceiling.physicsBody!.restitution = 0
ceiling.physicsBody!.categoryBitMask = PhysicsCategory.outline
ceiling.physicsBody!.contactTestBitMask = 0
ceiling.physicsBody?.collisionBitMask = PhysicsCategory.bird
ceiling.zPosition = 4
ceiling.name = "ceiling"
addChild(ceiling)




gameoverbarrier.size.width = 30
gameoverbarrier.size.height = self.size.height
gameoverbarrier.position.x = gameoverbarrier.size.width/2
gameoverbarrier.position.y = CGFloat(self.size.height)/2
gameoverbarrier.physicsBody = SKPhysicsBody(rectangleOfSize: gameoverbarrier.frame.size)
gameoverbarrier.physicsBody!.dynamic = false
gameoverbarrier.physicsBody!.categoryBitMask = PhysicsCategory.danger
gameoverbarrier.physicsBody!.contactTestBitMask = PhysicsCategory.bird
gameoverbarrier.physicsBody?.collisionBitMask = PhysicsCategory.bird
gameoverbarrier.zPosition = 4
gameoverbarrier.name = "gameoverbarrier"
backgroundLayer.addChild(gameoverbarrier)

breakwallphysicsbody.size.width = platformwidth

breakwallphysicsbody.size.height = swgap + 2


scoreLabel.text = "0"
scoreLabel.position.x = 300
scoreLabel.position.y = self.size.height-400
scoreLabel.fontColor = SKColor.blackColor()
addChild(scoreLabel)

miniCoinLabel1.text = "+1"
miniCoinLabel1.fontColor = SKColor.yellowColor()
miniCoinLabel1.colorBlendFactor = 0.25
miniCoinLabel1.fontSize = 40
miniCoinLabel1.name = "miniCoinLabel"
miniCoinLabel1.zPosition = 6
miniCoinLabel1.zRotation = 3.14159/8

miniCoinLabel2.text = "+1"
miniCoinLabel2.fontColor = SKColor.yellowColor()
miniCoinLabel2.colorBlendFactor = 0.25
miniCoinLabel2.fontSize = 40
miniCoinLabel2.name = "miniCoinLabel"
miniCoinLabel2.zPosition = 6
miniCoinLabel2.zRotation = 3.14159/8

miniCoinLabel3.text = "+1"
miniCoinLabel3.fontColor = SKColor.yellowColor()
miniCoinLabel3.colorBlendFactor = 0.25
miniCoinLabel3.fontSize = 40
miniCoinLabel3.name = "miniCoinLabel"
miniCoinLabel3.zPosition = 6
miniCoinLabel3.zRotation = 3.14159/8

minicycle = 0

coinLabel = SKLabelNode(text: "\(GameState.sharedInstance.coins)")
coinLabel.position.x = 300
coinLabel.position.y = self.size.height - 600
coinLabel.zPosition = 5
coinLabel.fontColor = SKColor.orangeColor()
addChild(coinLabel)

highScoreLabel = SKLabelNode(text: "\(GameState.sharedInstance.highScore)")
highScoreLabel.position.x = 300
highScoreLabel.position.y = self.size.height - 500
highScoreLabel.fontColor = SKColor.blackColor()
addChild(highScoreLabel) //PUT BACK but might be a problem with adding it twice

beginLabel = SKLabelNode(text: "Begin Game")

topfloor = CGRectGetMaxY(ground.frame)

backgroundLayer.zPosition = 0
worldNode.addChild(backgroundLayer)



for i in 0...2 {
let background = SKSpriteNode(imageNamed: "transparent") // "background"
background.anchorPoint.x = 0
background.anchorPoint.y = 0
background.position.x = CGFloat(i)*self.size.width
background.position.y = 0
background.name = "background"
background.size = CGSize(width: size.width, height: size.height)
background.zPosition = 1
background.hidden = false
backgroundLayer.addChild(background)

}








//Test Navigator Buttons:

if Navigationmodeenabled == true {

rightarrow.size.width = 100
leftarrow.size.width = 100
uparrow.size.width = 100
downarrow.size.width = 100
hidearrows.size.width = 200
hidearrows.hidden = true

rightarrow.size.height = 100
leftarrow.size.height = 100
uparrow.size.height = 100
downarrow.size.height = 100
hidearrows.size.height = 200

rightarrow.position.x = self.size.width - 300
rightarrow.position.y = self.size.height/2
leftarrow.position.x = 300
leftarrow.position.y = self.size.height/2
uparrow.position.x = self.size.width/2
uparrow.position.y = self.size.height - 100

downarrow.position.x = self.size.width/2
downarrow.position.y = 100

hidearrows.position.x = 250
hidearrows.position.y = self.size.height - 50

rightarrow.zPosition = 7
leftarrow.zPosition = 7
uparrow.zPosition = 7
downarrow.zPosition = 7
hidearrows.zPosition = 7

/*   self.addChild(rightarrow)
self.addChild(leftarrow)
self.addChild(uparrow)
self.addChild(downarrow) */
self.addChild(hidearrows)

}


//End Test Navigator Buttons

//Extra replay button:
/*
replaybutton.size.width = 150
replaybutton.size.height = 150
replaybutton.position = CGPoint(x: replaybutton.size.width/2 , y: self.size.height - replaybutton.size.height/2)
replaybutton.zPosition = 202
self.addChild(replaybutton) //some kind of problem with this, being added twice PUT BACK but fix first

*/
pausebutton.size.width = 150
pausebutton.size.height = 150
pausebutton.position.x = pausebutton.size.width/2 + 500
pausebutton.position.y = self.size.height - pausebutton.size.height/2
pausebutton.zPosition = 7
self.addChild(pausebutton) //some kind of problem with this, being added twice PUT BACK but fix first


CGPathMoveToPoint(trianglePath, nil, -spikewidth/2, -spikeheight/2)
CGPathAddLineToPoint(trianglePath, nil, spikewidth/2 - 2, -spikeheight/2)
CGPathAddLineToPoint(trianglePath, nil, 0, spikeheight/2)
CGPathAddLineToPoint(trianglePath, nil, -spikewidth/2 + 2, -spikeheight/2)






birdimage.texture?.filteringMode = .Nearest

birdimage.anchorPoint.x = 0.5
birdimage.anchorPoint.y = 0.5

birdimage.size.width = 140 // was 140 // was 130
birdimage.size.height = 140 // was 140
birdimage.zPosition = 5
//
//        bird1.position = CGPoint(x: bird2x, y: bird2y + 190)
bird2.position.x = bird2x
bird2.position.y = bird2y + 70

//CGPoint(x: bird2x, y: bird2y + 70)//(x: 0, y: size.height - 200 - 0.5*bird.size.height + 0.5*bird2.size.height - 800)

//  self.convertPoint(CGPoint(x: platformst3.position.x, y: 900), fromNode: self.backgroundLayer)

//        bird1.size.width = 70
bird2.size.width = 70 // was 130
//        bird1.size.height = 90
bird2.size.height = 140 //was 140

//  spikedetector1.position = CGPoint(x: bird2.position.x, y: bird2.position.y)
spikedetector1.size.height = 0.75*birdimage.size.height
spikedetector1.size.width = 0.5*birdimage.size.width
//   spikedetector2.position = CGPoint(x: bird2.position.x - 0.25*birdimage.size.width, y: bird2.position.y - (1/8)*birdimage.size.height)
spikedetector2.size.height = 0.75*birdimage.size.height
spikedetector2.size.width = 0.5*birdimage.size.width
spikedetector1.zPosition = 0
spikedetector2.zPosition = 0
spikedetector1.name = "spikedetector"
spikedetector2.name = "spikedetector"

spikedetector1.physicsBody = SKPhysicsBody(texture: SKTexture(imageNamed: "SimpleJumpRight3"), size: birdimage.size)
spikedetector2.physicsBody = SKPhysicsBody(rectangleOfSize: spikedetector2.size)
spikedetector1.physicsBody?.allowsRotation = false
spikedetector2.physicsBody?.allowsRotation = false

spikedetector1.physicsBody?.categoryBitMask = 0
spikedetector2.physicsBody?.categoryBitMask = 0
spikedetector1.physicsBody?.collisionBitMask = 0
spikedetector2.physicsBody?.collisionBitMask = 0
spikedetector1.physicsBody?.contactTestBitMask = PhysicsCategory.slidespike
spikedetector2.physicsBody?.contactTestBitMask = PhysicsCategory.slidespike

//  self.backgroundLayer.addChild(spikedetector1)
//   self.backgroundLayer.addChild(spikedetector2)

CGPathMoveToPoint(spikeConPath, nil, -birdimage.size.width/2, -birdimage.size.height/2) //
CGPathAddLineToPoint(spikeConPath, nil, 0, -birdimage.size.height/2)//
CGPathAddLineToPoint(spikeConPath, nil, 0, -birdimage.size.height/4)//
CGPathAddLineToPoint(spikeConPath, nil, birdimage.size.width/2, -birdimage.size.height/4) //
CGPathAddLineToPoint(spikeConPath, nil, birdimage.size.width/2, birdimage.size.height/2)
CGPathAddLineToPoint(spikeConPath, nil, 0, birdimage.size.height/2)
CGPathAddLineToPoint(spikeConPath, nil, 0, birdimage.size.height/4)
CGPathAddLineToPoint(spikeConPath, nil, -birdimage.size.width/2, birdimage.size.height/4)
CGPathAddLineToPoint(spikeConPath, nil, -birdimage.size.width/2, -birdimage.size.height/2)

//   birdimage.physicsBody = SKPhysicsBody(polygonFromPath: spikeConPath)
//   birdimage.physicsBody?.categoryBitMask = PhysicsCategory.bird
//   birdimage.physicsBody?.contactTestBitMask = PhysicsCategory.slidespike
//   birdimage.physicsBody?.affectedByGravity = false
//   birdimage.physicsBody?.allowsRotation = false

//        bird1.physicsBody = SKPhysicsBody(rectangleOfSize: bird1.size)
bird2.physicsBody = SKPhysicsBody(rectangleOfSize: bird2.size)

//        bird1.physicsBody!.dynamic = true
bird2.physicsBody!.dynamic = true
//       bird1.physicsBody?.mass = 0.0
bird2.physicsBody?.mass = 10000.0
//      bird1.physicsBody?.allowsRotation = false
bird2.physicsBody?.allowsRotation = false
//      bird1.physicsBody?.restitution = 0.0
bird2.physicsBody?.restitution = 0.0
//     bird1.physicsBody?.friction = 0.0
bird2.physicsBody?.friction = 0.0
//     bird1.physicsBody?.affectedByGravity = true
bird2.physicsBody?.affectedByGravity = true


//      bird1.physicsBody!.categoryBitMask = PhysicsCategory.bird
bird2.physicsBody!.categoryBitMask = PhysicsCategory.bird
//       bird1.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.dart
bird2.physicsBody!.contactTestBitMask = 0//PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart
//       bird1.physicsBody!.collisionBitMask = 0 //PhysicsCategory.block
bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline

//  bird1.physicsBody!.usesPreciseCollisionDetection = true
bird2.physicsBody!.usesPreciseCollisionDetection = true
//     bird1.zPosition = 1000
bird2.zPosition = 5
//       bird1.name = "bird1"
bird2.name = "bird2"


self.backgroundLayer.addChild(bird2)

bird2.addChild(birdimage)




gauge.size.width = 300
gauge.size.height = 300
gauge.zPosition = 5
gauge.alpha = 0.7
bird2.addChild(gauge)




score0 = [posA, posB, posC]
score1 = [posD, posE, posF]
score2 = [posG, posH, posI]
score3 = [posJ, posK, posL]


/* Old Node Deletion Test:

let birdmove = SKAction.moveByX(100*self.size.width, y: 500, duration: 200)
let revbirdmove = birdmove.reversedAction()
bird.runAction(SKAction.sequence([SKAction.waitForDuration(3), birdmove, SKAction.waitForDuration(3), revbirdmove])) */

//     func finishmove() {
//   println("finishmove")
//     }

//Skip Tutorial:
//      bird.physicsBody!.collisionBitMask = 0
//   bird.physicsBody!.contactTestBitMask = 0 // TAKE THIS OUT

//  bird.runAction(SKAction.sequence([SKAction.waitForDuration(3),SKAction.moveTo(CGPoint(x:2.2*self.size.width, y: 500), duration: 1)]))



//PUT BACK     bird.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger

physicsWorld.gravity = CGVector(dx: 0, dy: -16.0) //  -12.0
physicsWorld.contactDelegate = self
startblock()


platforms = [platform1, platform2, platform3, platform4, platform5, platform6, platform7, platform8, platform9, platform10, platform11, platform12]

coins = [coin1, coin2, coin3, coin4, coin5, coin6, coin7, coin8, coin9, coin10, coin11, coin12]

coins2 = [coin21, coin22, coin23, coin24, coin25, coin26, coin27, coin28, coin29, coin210, coin211, coin212]

coins3 = [coin31, coin32, coin33, coin34, coin35, coin36, coin37, coin38, coin39, coin310, coin311, coin312]

minicoinlabels = [miniCoinLabel1, miniCoinLabel2, miniCoinLabel3]

breakwalls = [self.breakwall1, self.breakwall2, self.breakwall3, self.breakwall4, self.breakwall5, self.breakwall6, self.breakwall7, self.breakwall8, self.breakwall9, self.breakwall10, self.breakwall11, self.breakwall12]

xplatforms = [self.xplatform1, self.xplatform2, self.xplatform3, self.xplatform4, self.xplatform5]

vplatforms = [self.vplatform1, self.vplatform2, self.vplatform3, self.vplatform4, self.vplatform5, self.vplatform6, self.vplatform7, self.vplatform8, self.vplatform9, self.vplatform10, self.vplatform11, self.vplatform12]

xvplatforms = [self.xvplatform1, self.xvplatform2, self.xvplatform3, self.xvplatform4, self.xvplatform5]

spikes = [self.spikespr1, self.spikespr2, self.spikespr3, self.spikespr4, self.spikespr5, self.spikespr6, self.spikespr7, self.spikespr8, self.spikespr9, self.spikespr10, self.spikespr11, self.spikespr12, self.spikespr13, self.spikespr14, self.spikespr15, self.spikespr16, self.spikespr17, self.spikespr18, self.spikespr19, self.spikespr20, self.spikespr21, self.spikespr22, self.spikespr23, self.spikespr24, self.spikespr25, self.spikespr26, self.spikespr27, self.spikespr28, self.spikespr29, self.spikespr30, self.spikespr31, self.spikespr32, self.spikespr33, self.spikespr34, self.spikespr35, self.spikespr36, self.spikespr37, self.spikespr38, self.spikespr39, self.spikespr40, self.spikespr41, self.spikespr42]

darts = [self.dartsspr1, self.dartsspr2, self.dartsspr3, self.dartsspr4, self.dartsspr5, self.dartsspr6, self.dartsspr7, self.dartsspr8, self.dartsspr9, self.dartsspr10, self.dartsspr11, self.dartsspr12, self.dartsspr13, self.dartsspr14, self.dartsspr15, self.dartsspr16, self.dartsspr17, self.dartsspr18, self.dartsspr19, self.dartsspr20, self.dartsspr21, self.dartsspr22, self.dartsspr23, self.dartsspr24, self.dartsspr25, self.dartsspr26, self.dartsspr27, self.dartsspr28, self.dartsspr29, self.dartsspr30]

dartducts = [self.dartduct1, self.dartduct2, self.dartduct3, self.dartduct4, self.dartduct5, self.dartduct6, self.dartduct7, self.dartduct8, self.dartduct9, self.dartduct10, self.dartduct11, self.dartduct12, self.dartduct13, self.dartduct14, self.dartduct15, self.dartduct16, self.dartduct17, self.dartduct18, self.dartduct19, self.dartduct20, self.dartduct21, self.dartduct22, self.dartduct23, self.dartduct24, self.dartduct25, self.dartduct26, self.dartduct27, self.dartduct28, self.dartduct29, self.dartduct30]

dartcatchers = [self.dartcatcher1, self.dartcatcher2, self.dartcatcher3, self.dartcatcher4]

trees = [self.tree1, self.tree2, self.tree3, self.tree4]

cleanupbarrier.size.height = 3000
cleanupbarrier.size.width = 50
cleanupbarrier.position.x = -1500
cleanupbarrier.position.y = self.size.height/2
cleanupbarrier.physicsBody = SKPhysicsBody(rectangleOfSize: cleanupbarrier.size)
cleanupbarrier.physicsBody!.categoryBitMask = PhysicsCategory.cleanup
cleanupbarrier.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.dart | PhysicsCategory.coin | PhysicsCategory.slidespike | PhysicsCategory.vplatform
cleanupbarrier.physicsBody!.collisionBitMask = 0
cleanupbarrier.physicsBody!.affectedByGravity = false
cleanupbarrier.physicsBody!.dynamic = true
cleanupbarrier.name = "cleanup"
self.addChild(cleanupbarrier)



if GameState.sharedInstance.secondLife == 1 {

secondlives = 1
}



//   if CFAbsoluteTimeGetCurrent() - Gamestate.sharedInstance.beginLastRound > 10 {

//Pause Screen Buttons:
replaybutton.size.width = replaybuttonwidth
replaybutton.size.height = replaybuttonheight
replaybutton.position.x = -pausescreen.size.width/2
replaybutton.position.x += replaybutton.size.width/2
replaybutton.position.x += 50

replaybutton.position.y = -pausescreen.size.height/2
replaybutton.position.y += replaybutton.size.height/2
replaybutton.position.y += 50
replaybutton.zPosition = 0
pausescreen.addChild(replaybutton) //some kind of problem with this, being added twice PUT BACK but fix first

storebutton.size.width = 150
storebutton.size.height = 150
storebutton.position.x = pausescreen.size.width/2 - storebutton.size.width/2 - 50
storebutton.position.y = 0
storebutton.zPosition = 0
pausescreen.addChild(storebutton)

backbuttonpause.size.width = 150
backbuttonpause.size.height = 150
backbuttonpause.position.x = pausescreen.size.width/2 - backbuttonpause.size.width/2 - 50
backbuttonpause.position.y = -300
backbuttonpause.zPosition = 0
pausescreen.addChild(backbuttonpause)

//End Pause Screen Buttons

//Store Screen Buttons and Labels:

oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10






/*
if GameState.sharedInstance.oneCoinUpg == 0 {
individcoinupglabel.text = "\(costOfFirstCoinUpg)"
}

if GameState.sharedInstance.oneCoinUpg == 1 {
individcoinupglabel.text = "\(costOfSecondCoinUpg)"
}

if GameState.sharedInstance.oneCoinUpg == 2 {
individcoinupglabel.text = "\(costOfThirdCoinUpg)"
}
*/



storescreen.size.width = 800
storescreen.size.height = 1500
storescreen.name = "storescreen"

oneCoinUpgButton.size.width = 100
oneCoinUpgButton.size.height = 100
oneCoinUpgButton.position.x = -200
oneCoinUpgButton.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
oneCoinUpgButton.zPosition = 0
storescreen.addChild(oneCoinUpgButton)

scrambledCheckpointButton.size.width = 100
scrambledCheckpointButton.size.height = 100
scrambledCheckpointButton.position.x = -200
scrambledCheckpointButton.position.y = storescreen.size.height/2 - scrambledCheckpointButton.size.height/2 - 2*100 - 80 - 2*multbutton.size.height
scrambledCheckpointButton.zPosition = 0
storescreen.addChild(scrambledCheckpointButton)

buyCheckpointButton.size.width = 150
buyCheckpointButton.size.height = 100
buyCheckpointButton.position.x = 200
buyCheckpointButton.position.y = storescreen.size.height/2 - buyCheckpointButton.size.height/2 - 2*100 - 80 - 2*multbutton.size.height
buyCheckpointButton.zPosition = 0
storescreen.addChild(buyCheckpointButton)




buyOneCoinUpgButton.size.width = 150
buyOneCoinUpgButton.size.height = 100
buyOneCoinUpgButton.position.x = 200
buyOneCoinUpgButton.position.y = storescreen.size.height/2 - buyOneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
buyOneCoinUpgButton.zPosition = 0
storescreen.addChild(buyOneCoinUpgButton)















/*
singleSecondLifeButton.size.width = 100
singleSecondLifeButton.size.height = 100
singleSecondLifeButton.position = CGPoint(x: -200, y: storescreen.size.height/2 - singleSecondLifeButton.size.height/2 - 2*100 - 80 - 2*singleSecondLifeButton.size.height)
singleSecondLifeButton.zPosition = 1000002
storescreen.addChild(singleSecondLifeButton)

buySingleSecondLifeButton.size.width = 150
buySingleSecondLifeButton.size.height = 100
buySingleSecondLifeButton.position = CGPoint(x: 200, y: storescreen.size.height/2 - buySingleSecondLifeButton.size.height/2 - 2*100 - 80 - 2*buySingleSecondLifeButton.size.height)
buySingleSecondLifeButton.zPosition = 1000002
storescreen.addChild(buySingleSecondLifeButton)
*/
//  individcoinupglabel.position = CGPoint(x: buyOneCoinUpgButton.position.x, y: buyOneCoinUpgButton.position.y + 50)
//   storescreen.addChild(individcoinupglabel)

multbutton.size.width = 100
multbutton.size.height = 100
multbutton.position.x = -200
multbutton.position.y = storescreen.size.height/2 - multbutton.size.height/2 - 3*100 - 80 - 3*multbutton.size.height
multbutton.zPosition = 0
storescreen.addChild(multbutton)

buymultbutton.size.width = 150
buymultbutton.size.height = 100
buymultbutton.position.x = 200
buymultbutton.position.y = storescreen.size.height/2 - buymultbutton.size.height/2 - 3*100 - 80 - 3*multbutton.size.height
buymultbutton.zPosition = 0
storescreen.addChild(buymultbutton)

//    individcoinupglabel.position = CGPoint(x: buyOneCoinUpgButton.position.x, y: buyOneCoinUpgButton.position.y + 50)
//     storescreen.addChild(individcoinupglabel)

secondLifeButton.size.width = 100
secondLifeButton.size.height = 100
secondLifeButton.position.x = -200
secondLifeButton.position.y = storescreen.size.height/2 - secondLifeButton.size.height/2 - 4*100 - 80 - 4*multbutton.size.height
secondLifeButton.zPosition = 0
storescreen.addChild(secondLifeButton)

buyslbutton.size.width = 150
buyslbutton.size.height = 100
buyslbutton.position.x = 200
buyslbutton.position.y = storescreen.size.height/2 - buyslbutton.size.height/2 - 4*100 - 80 - 4*multbutton.size.height
buyslbutton.zPosition = 0
storescreen.addChild(buyslbutton)

//    individcoinupglabel.position = CGPoint(x: buyOneCoinUpgButton.position.x, y: buyOneCoinUpgButton.position.y + 10)
//     storescreen.addChild(individcoinupglabel)


//    individcoinupglabel.position = CGPoint(x: buyOneCoinUpgButton.position.x, y: buyOneCoinUpgButton.position.y + 50)
//    storescreen.addChild(individcoinupglabel)

/* MOVED TO SCORESCREEN
hiddenStackableLivesButton.size.width = 100
hiddenStackableLivesButton.size.height = 100
hiddenStackableLivesButton.position = CGPoint(x: -200, y: storescreen.size.height/2 - hiddenStackableLivesButton.size.height/2 - 5*100 - 80 - 6*multbutton.size.height)
hiddenStackableLivesButton.zPosition = 1000002
storescreen.addChild(hiddenStackableLivesButton)

buyStackableLivesButton.size.width = 150
buyStackableLivesButton.size.height = 100
buyStackableLivesButton.position = CGPoint(x: 200 , y: storescreen.size.height/2 - buyStackableLivesButton.size.height/2 - 5*100 - 80 - 6*multbutton.size.height)
buyStackableLivesButton.zPosition = 1000002
storescreen.addChild(buyStackableLivesButton)
*/
//    individcoinupglabel.position = CGPoint(x: buyOneCoinUpgButton.position.x, y: buyOneCoinUpgButton.position.y + 50)
//    storescreen.addChild(individcoinupglabel)



backbuttonstore.size.width = 150
backbuttonstore.size.height = 100
backbuttonstore.position.x = -200
backbuttonstore.position.y = storescreen.size.height/2 - backbuttonstore.size.height/2 - 100
backbuttonstore.zPosition = 0
storescreen.addChild(backbuttonstore)

individcoinupglabel.position.x = buyOneCoinUpgButton.position.x - 150
individcoinupglabel.position.y = buyOneCoinUpgButton.position.y
secondlifelabel.position.x = buyslbutton.position.x - 150
secondlifelabel.position.y = buyslbutton.position.y
checkpointlabel.position.x = buyCheckpointButton.position.x - 150
checkpointlabel.position.y = buyCheckpointButton.position.y
allcoinmultlabel.position.x = buymultbutton.position.x - 150
allcoinmultlabel.position.y = buymultbutton.position.y


storescreen.addChild(individcoinupglabel)
storescreen.addChild(secondlifelabel)
storescreen.addChild(checkpointlabel)
storescreen.addChild(allcoinmultlabel)

updateUpgMeters()

//Coinscreen buttons:

yellowCoinChoice.size.height = 100
yellowCoinChoice.size.width = 100
blueCoinChoice.size.height = 100
blueCoinChoice.size.height = 100
redCoinChoice.size.height = 100
redCoinChoice.size.width = 100
yellowCoinChoice.position.x = -100
yellowCoinChoice.position.y = 0
blueCoinChoice.position.x = 0
blueCoinChoice.position.y = 0
redCoinChoice.position.x = 100
redCoinChoice.position.y = 0

/*
if GameState.sharedInstance.yelCoinUpg == 1 {
coinchoicescreen.addChild(yellowCoinChoice)
}

if GameState.sharedInstance.bluCoinUpg == 1 {
coinchoicescreen.addChild(blueCoinChoice)
}

if GameState.sharedInstance.redCoinUpg == 1 {
coinchoicescreen.addChild(redCoinChoice)
} */

backbuttoncoinscreen.size.width = 100
backbuttoncoinscreen.size.height = 75
backbuttoncoinscreen.position.x = 0
backbuttoncoinscreen.position.y = -75
backbuttoncoinscreen.zPosition = 0
coinchoicescreen.addChild(backbuttoncoinscreen)




/*
let oneCoinUpgButton = SKSpriteNode(texture: SKTexture(imageNamed: "individual coin upgrade"))

let singleSecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "secondLifeButton"))
let multbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Mult"))
let secondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "Unlimited Second Lives"))


let scrambledCheckpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "ScrambledCheckpoint"))
let checkpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "Checkpoint"))
let hiddenStackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "Hidden"))
let stackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "StackableLives"))
*/
}


/*    TO FLIP PHYSICS BODY OF BIRD, FOR LATER POSSIBLY:
func flippedTextureWithImageNamed(name:NSString) -> SKTexture
{
let image = UIImage(named:name)

UIGraphicsBeginImageContext(image.size);
let context = UIGraphicsGetCurrentContext()

CGContextTranslateCTM(context, image.size.width, image.size.height)
CGContextScaleCTM(context, -1.0, -1.0)

CGContextDrawImage(context, CGRectMake(0.0, 0.0, image.size.width, image.size.height), image.CGImage)

let newImage = UIGraphicsGetImageFromCurrentImageContext()
UIGraphicsEndImageContext();

return SKTexture(image: newImage)
}*/


func moveBackground() {





//OLD WAY OF DELETING OLD NODES. CLEANUP BARRIER USED INSTEAD.
/*
backgroundLayer.enumerateChildNodesWithName("*") { node, _ in // skip this for now, don't recall this taking too much time.

if node.name != "emitter" && node.name != "miniCoinLabel" && node.name != "label" {

let todelete = node as! SKSpriteNode
let todeletepos = self.backgroundLayer.convertPoint(todelete.position, toNode: self)



if todeletepos.x < -(self.make3size) && todelete.name != "gameoverbarrier" && todelete.name != "background" { // was -(self.make3size)/8



todelete.paused = false
todelete.removeAllActions()
todelete.physicsBody?.restitution = 0.2
todelete.physicsBody?.angularDamping = 0.1
todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil


let pchildren = todelete.children as! [SKSpriteNode]

for pchild in pchildren {

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.runAction(SKAction.removeFromParent())

}

todelete.runAction(SKAction.removeFromParent())

}
}
}
*/

/*    backgroundLayer.enumerateChildNodesWithName("background") { node, _ in
let backgrounda = node as SKSpriteNode
let backgroundScreenPos = self.backgroundLayer.convertPoint(backgrounda.position, toNode: self) */


//   if checkscrollcount < scrollcount {




//self.cleanupbarrier.runAction(SKAction.moveTo(CGPoint(x: self.bird.position.x - 2048, y: self.size.height/2), duration: 1.0))







/*{ (node, stop) -> Void in
if node.position.x > backgrounda.position.x {
node.removeFromParent()
}
}
)*/



//  if backgroundScreenPos.x <= -make3size {







if (GameState.sharedInstance.score > Int(self.scrollcount*3) - 2 && checkpointmode == 0) || (checkpointmode == 1 && (GameState.sharedInstance.score - GameState.sharedInstance.checkpointHS) > (Int(self.scrollcount*3) - 2)) || initialcount < 2 { // self.bird2.position.x > self.scrollcount*self.make3size + self.make3size/2

//VAR PLATFORMS, BREAKWALLS, XPLATFORMS, ETC. GO HERE: PUT BACK


if printOn == 1 {
// *** print("ran movebackground: self.bird2.position.x > self.scrollcount*self.make3size + self.make3size/2 || initialcount < 2")

// *** print("bird2.position.x: \(bird2.position.x)")
}

var shrink: CGFloat = 1




//  prinln("testtttt \(platform4.size.height) does equal \(platforms[cycle+4].size.height)")


if initialcount == 2 {
self.scrollcount = self.scrollcount + 1
}

func make3(blocks: String) {
let g = blocks.startIndex.advancedBy(0)
let a: Character = blocks[g]
let h = blocks.startIndex.advancedBy(1)
let b: Character = blocks[h]
let i = blocks.startIndex.advancedBy(2)
let c: Character = blocks[i]
let j = blocks.startIndex.advancedBy(3)
let d: Character = blocks[j]
let k = blocks.startIndex.advancedBy(4)
let e: Character = blocks[k]
let l = blocks.startIndex.advancedBy(5)
let f: Character = blocks[l]

let on: Character = "1"

if printOn == 1 {
// *** print("runmake3: cycle: \(cycle) platformcount: \(platformcount) bird2position: \(bird2.position) scrollcount: \(scrollcount) checkpointmode: \(checkpointmode) GameState.sharedInstance.score: \(GameState.sharedInstance.score) GameState.sharedInstance.checkpointHS: \(GameState.sharedInstance.checkpointHS) GameState.sharedInstance.checkpointunlock: \(GameState.sharedInstance.checkpointunlock)")
}




if makeOne == 1 {
if cycle < 3 {

cycle++

} else {

cycle = 0

}

}

var previousbarrier1: Int = 0

if cycle != 0 {

previousbarrier1 = cycle + 8 - 1

} else {

previousbarrier1 = cycle + 8 + 3

}

if bird2.position.x <= bird2x + 5 {
previousbarrier1 = cycle - 1 + 4



}


var cpos: Int = cycle
cpos += 4

var cpos2: Int = cycle
cpos2 += 8

if makeOne == 1 {








if difOne <= difPer || (platforms[previousbarrier1].physicsBody!.charge + difPos > maxPHeight && LFW == 0) {
sml = CGFloat.random(min: 0, max: 1)

if sml > 0.82 {

make3size = CGFloat.random(min: 1401, max: 1700)
}

if sml >= 0.18 && sml <= 0.82 {

make3size = CGFloat.random(min: 1250, max: 1400)
}

if sml < 0.18 {

make3size = CGFloat.random(min: 1100, max: 1249)

}
}
// // *** print("checkmark1")

if difOne > difPer {

if platforms[previousbarrier1].physicsBody!.charge + difPos <= maxPHeight || LFW == 1 {



if difOneWidth <= 0.33 {

make3size = 1200

}

if difOneWidth > 0.33 && difOneWidth <= 0.66 {

make3size = 1350

}

if difOneWidth > 0.66 {

make3size = 1500

}

difOneWidth = make3size
if printOn == 1 {
// *** print("make3size: \(make3size)")
}

} else {

difTwo = 10

}
}
if printOn == 1 {
// *** print("platformwidth = \(platformwidth)")
// *** print("vplatformwidth = \(vplatformwidth)")
}
}


if a == on {

if vw1 != 0 {
vplatforms[cycle].size.width = vw1

} else { vplatforms[cycle].size.width = vplatformwidth }


if vh1 != 0 {
vplatforms[cycle].size.height = vh1

} else { vplatforms[cycle].size.height = vplatformheight }

vplatforms[cycle].zPosition = 3

if vplatforms[cycle+7].parent == nil && GameState.sharedInstance.score < 2 { // -1 +8

vplatforms[cycle].position.x = vplatforms[cycle+3].position.x + make3size/3 //-1+4
vplatforms[cycle].position.y = self.size.height - vplatforms[cycle].size.height/2

} else {

if cycle > 0 {

vplatforms[cycle].position.x = vplatforms[cycle+7].position.x + make3size/3 // - 1 + 8
vplatforms[cycle].position.y = self.size.height - vplatforms[cycle].size.height/2

}
if cycle == 0 {

vplatforms[cycle].position.x = vplatforms[cycle+11].position.x + make3size/3 // 3+8
vplatforms[cycle].position.y =  self.size.height - vplatforms[cycle].size.height/2
}

}



vplatforms[cycle].name = "vplatform"
self.backgroundLayer.addChild(vplatforms[cycle])
}


if d == on {

// // *** print("pw1: \(pw1)")
// // *** print("sample width1: \(platforms[cycle].size.width)")
platforms[cycle].size.width = platformwidth //shrink*make3size/12

if pw1 != 0 {
platforms[cycle].size.width = pw1
}
//   // *** print("sample width2: \(platforms[cycle].size.width)")
//  // *** print("pw1: \(pw1)")

platforms[cycle].size.height = platformheight //CGFloat.random(min: 600, max: 800)    //700
platforms[cycle].position.y = CGFloat.random(min: lowestplatformpos, max: highestplatformpos)
//   // *** print("platforms[cycle].size.height: \(platforms[cycle].size.height)")

//  /* PUT BACK WITH REVISIONS
if checkfirstplat == 1 && ph1 == 0{

//       if platforms[cycle-1+8].position.y >= 1200 && ph1 == 0{
//           platforms[cycle].size.height = 400 //CGFloat.random(min: 600, max: 1100)
//       }

//  CONSIDER PUT BACK. GOES FROM HIGH PLATFORM TO LOW PLATFORM    //          if CGRectGetMaxY(platforms[cycle-1+8]) < 1200 && platforms[cycle-1+8].size.height > 400 && ph1 == 0{
//              platforms[cycle].size.height = CGFloat.random(min: 599, max: 800)//was: max: platforms[cycle-1+8].size.height + 100)
//          } else {
//               platforms[cycle].size.height = 500
//     }








if platforms[cycle+7].position.y <= highestplatformpos - platformyinc  { // 8 - 1

platforms[cycle].position.y = CGFloat.random(min: lowestplatformpos, max: platforms[cycle+7].position.y + platformyinc) // 8 - 1

} else {
platforms[cycle].position.y = CGFloat.random(min: lowestplatformpos, max: highestplatformpos)
}
}

/*else {
platforms[cycle].size.height = 600
} */

if ph1 != 0 {
platforms[cycle].size.height = ph1
}

platforms[cycle].zPosition = 3

//  // *** print("sample width2: \(platforms[cycle].size.width)")

if platforms[cycle+7].parent == nil && GameState.sharedInstance.score < 2 { // -1 + 8

platforms[cycle].position.x = platforms[cycle+3].position.x + make3size/3 // -1 + 4

platforms[cycle].position.y = self.size.height - platforms[cycle].size.height/2


} else {

if cycle > 0 {

platforms[cycle].position.x = platforms[cycle+7].position.x + make3size/3 // - 1 + 8

platforms[cycle].position.y = self.size.height - platforms[cycle].size.height/2

}

if cycle == 0 {

platforms[cycle].position.x = platforms[cycle+11].position.x + make3size/3  // +3 + 8

platforms[cycle].position.y = self.size.height - platforms[cycle].size.height/2

}

}

platforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: platforms[cycle].size)
platforms[cycle].physicsBody!.dynamic = false
platforms[cycle].physicsBody!.usesPreciseCollisionDetection = true
platforms[cycle].physicsBody!.friction = 0
platforms[cycle].physicsBody!.restitution = 0
platforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
platforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
platforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
platforms[cycle].name = "platform"
self.backgroundLayer.addChild(platforms[cycle])

checkfirstplat = 1
// // *** print(" platform1 height\(platforms[cycle].size.height)")
// // *** print("sample width3: \(platforms[cycle].size.width)")
}

if b == on {










if difTwo <= difPer || (platforms[cycle].physicsBody!.charge + difPos > maxPHeight && LFW == 0) {

sml = CGFloat.random(min: 0, max: 1)

if sml > 0.82 {

make3size = CGFloat.random(min: 1401, max: 1700)
}

if sml >= 0.18 && sml <= 0.82 {

make3size = CGFloat.random(min: 1250, max: 1400)
}

if sml < 0.18 {

make3size = CGFloat.random(min: 1100, max: 1249)

}
}



if difTwo > difPer {

if platforms[cycle].physicsBody!.charge + difPos <= maxPHeight || LFW == 1 {

//difTwoWidth = 0//CGFloat.random(min: 0, max: 1.00)

//println("difTwoWidth: \(difTwoWidth)")

if difTwoWidth <= 0.33 {

make3size = 1200

}

if difTwoWidth > 0.33 && difTwoWidth <= 0.66 {

make3size = 1350

}

if difTwoWidth > 0.66 {

make3size = 1500

}

difTwoWidth = make3size
//   // *** print("make3size: \(make3size)")

} else {

difThree = 10

}


}








if vw2 != 0 {
vplatforms[cpos].size.width = vw2

} else { vplatforms[cpos].size.width = vplatformwidth }


if vh2 != 0 {
vplatforms[cpos].size.height = vh2

} else { vplatforms[cpos].size.height = vplatformheight }


vplatforms[cpos].zPosition = 3


vplatforms[cycle].zPosition = 3

if vplatforms[cycle].parent == nil {

vplatforms[cpos].position.x = vplatforms[cycle+3].position.x + make3size/3 // -1 +4
vplatforms[cpos].position.y = self.size.height - vplatforms[cpos].size.height/2

} else {

vplatforms[cpos].position.x = vplatforms[cycle].position.x + make3size/3

vplatforms[cpos].position.y = self.size.height - vplatforms[cpos].size.height/2

}

vplatforms[cycle+4].name = "vplatform"
self.backgroundLayer.addChild(vplatforms[cpos])
}



if e == on {

platforms[cpos].size.width = platformwidth   //shrink*make3size/12

if pw2 != 0 {
platforms[cpos].size.width = pw2
}

platforms[cpos].size.height = platformheight

platforms[cpos].position.y = CGFloat.random(min: lowestplatformpos, max: highestplatformpos) //700




//    /*    PUT BACK WITH REVISIONS

if checkfirstplat == 1 && ph2 == 0{

//       if platforms[cycle-1+8].position.y >= 1200 && ph1 == 0{
//           platforms[cycle].size.height = 400 //CGFloat.random(min: 600, max: 1100)
//       }

//  CONSIDER PUT BACK. GOES FROM HIGH PLATFORM TO LOW PLATFORM    //          if CGRectGetMaxY(platforms[cycle-1+8]) < 1200 && platforms[cycle-1+8].size.height > 400 && ph1 == 0{
//              platforms[cycle].size.height = CGFloat.random(min: 599, max: 800)//was: max: platforms[cycle-1+8].size.height + 100)
//          } else {
//               platforms[cycle].size.height = 500
//     }

//






if platforms[cycle].position.y <= highestplatformpos - platformyinc  {

platforms[cpos].position.y = CGFloat.random(min: lowestplatformpos, max: platforms[cycle].position.y + platformyinc)

} else {
platforms[cpos].position.y = CGFloat.random(min: lowestplatformpos, max: highestplatformpos)
}
}



if checkfirstplat == 1 && ph2 != 0 { //was just ph2 != 0 , changed 6/27/2015
platforms[cpos].size.height = ph2
}

platforms[cpos].zPosition = 3

if platforms[cycle].parent == nil {

platforms[cpos].position.x = platforms[cycle].position.x + make3size/3

platforms[cpos].position.y = self.size.height - platforms[cpos].size.height/2

} else {

platforms[cpos].position.x = platforms[cycle].position.x + make3size/3

platforms[cpos].position.y = self.size.height - platforms[cpos].size.height/2
}



platforms[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: platforms[cpos].size)
platforms[cpos].physicsBody!.dynamic = false
platforms[cpos].physicsBody!.usesPreciseCollisionDetection = true
platforms[cpos].physicsBody!.friction = 0
platforms[cpos].physicsBody!.restitution = 0
platforms[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
platforms[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
platforms[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
platforms[cpos].name = "platform"
self.backgroundLayer.addChild(platforms[cpos])

checkfirstplat == 1

}

if c == on {





//// *** print("make3size: \(make3size)")



if difThree <= difPer || (platforms[cycle+4].physicsBody!.charge + difMaxPos > maxPHeight && LFW == 0) {

sml = CGFloat.random(min: 0, max: 1)

if sml > 0.82 {

make3size = CGFloat.random(min: 1401, max: 1700)
}

if sml >= 0.18 && sml <= 0.82 {

make3size = CGFloat.random(min: 1250, max: 1400)
}

if sml < 0.18 {

make3size = CGFloat.random(min: 1100, max: 1249)

}
}

if difThree > difPer {

if platforms[cycle+4].physicsBody!.charge + difPos <= maxPHeight || LFW == 1 {

//difThreeWidth = 0//CGFloat.random(min: 0, max: 1.00)

//// *** print("difThreeWidth: \(difThreeWidth)")

if difThreeWidth <= 0.33 {

make3size = 1200

}

if difThreeWidth > 0.33 && difThreeWidth <= 0.66 {

make3size = 1350

}

if difThreeWidth > 0.66 {

make3size = 1500

}

difThreeWidth = make3size

if printOn == 1 {
// *** print("make3size: \(make3size)")
}

} else {
difOne = 10

}

}







if vw3 != 0 {
vplatforms[cpos2].size.width = vw3

} else { vplatforms[cpos2].size.width = vplatformwidth }


if vh3 != 0 {
vplatforms[cpos2].size.height = vh3

} else { vplatforms[cpos2].size.height = vplatformheight }





vplatforms[cpos2].zPosition = 3


vplatforms[cycle].zPosition = 3

if vplatforms[cpos].parent == nil {

vplatforms[cpos2].position.x = vplatforms[cycle+3].position.x + make3size/3 //-1 + 4

vplatforms[cpos2].position.y = self.size.height - vplatforms[cpos2].size.height/2

} else {

vplatforms[cpos2].position.x = vplatforms[cpos].position.x + make3size/3

vplatforms[cpos2].position.y = self.size.height - vplatforms[cpos2].size.height/2

}

vplatforms[cpos2].name = "vplatform"
self.backgroundLayer.addChild(vplatforms[cpos2])
}



if f == on {



if printOn == 1 {
// *** print(" cycle inside of make func: \(self.cycle)")
}

platforms[cpos2].size.width = platformwidth //shrink*make3size/12

if pw3 != 0 {
platforms[cpos2].size.width = pw3
}

if platforms[cpos].parent == nil {
platforms[cpos2].position.y = CGFloat.random(min: -624, max: 8)

//  platforms[cpos2].size.height = CGFloat.random(min: 600, max: 800)
}

platforms[cpos2].position.y = 8//CGFloat.random(min: -624, max: 8)



//          PUT BACK WITH REVISION

if checkfirstplat == 1 && ph3 == 0{



//       if platforms[cycle-1+8].position.y >= 1200 && ph1 == 0{
//           platforms[cycle].size.height = 400 //CGFloat.random(min: 600, max: 1100)
//       }

//  CONSIDER PUT BACK. GOES FROM HIGH PLATFORM TO LOW PLATFORM    //          if CGRectGetMaxY(platforms[cycle-1+8]) < 1200 && platforms[cycle-1+8].size.height > 400 && ph1 == 0{
//              platforms[cycle].size.height = CGFloat.random(min: 599, max: 800)//was: max: platforms[cycle-1+8].size.height + 100)
//          } else {
//               platforms[cycle].size.height = 500
//     }

//






if platforms[cpos].position.y <= highestplatformpos - platformyinc  {

platforms[cpos2].position.y = CGFloat.random(min: lowestplatformpos, max: platforms[cpos].position.y + platformyinc)

} else {
platforms[cpos2].position.y = CGFloat.random(min: lowestplatformpos, max: highestplatformpos)
}
}



//



/*   switch platforms[cpos].size.height {
//   case nil:
//       platforms[cpos2].size.height = CGFloat.random(min: 600, max: 800)
case >1000:
platforms[cpos2].size.height = CGFloat.random(min: 200, max: 1100)
default:
platforms[cpos2].size.height = random(min: 200, max: CGRectGetMaxY(platforms[cpos]) + 100)
} */

if ph3 != 0 && checkfirstplat == 1   { //was just ph3 != 0, updated 6/27/2015
platforms[cpos2].size.height = ph3
}

//  platforms[cpos2].position.y = platforms[cpos2].size.height/2
platforms[cpos2].zPosition = 3

if platforms[cpos].parent == nil {

platforms[cpos2].position.x = platforms[cycle+3].position.x + make3size/3 // + 3

platforms[cpos2].position.y = self.size.height - platforms[cpos2].size.height/2

} else {

platforms[cpos2].position.x = platforms[cpos].position.x + make3size/3

platforms[cpos2].position.y = self.size.height - platforms[cpos2].size.height/2

}


platforms[cpos2].physicsBody = SKPhysicsBody(rectangleOfSize: platforms[cpos2].size)
platforms[cpos2].physicsBody!.dynamic = false
platforms[cpos2].physicsBody!.usesPreciseCollisionDetection = true
platforms[cpos2].physicsBody!.friction = 0
platforms[cpos2].physicsBody!.restitution = 0
platforms[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.block
platforms[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
platforms[cpos2].physicsBody!.collisionBitMask = PhysicsCategory.bird
platforms[cpos2].name = "platform"
self.backgroundLayer.addChild(platforms[cpos2])




checkfirstplat == 1
}


}




self.dart1 = (CGFloat.random(min: 0.01, max: 1))
self.dart2 = (CGFloat.random(min: 0.01, max: 1))
self.dart3 = (CGFloat.random(min: 0.01, max: 1))


var rolldice: CGFloat = 3//-0.5


if initialcount == 2 && GameState.sharedInstance.score < 0 { // was < 3

rolldice = -1 // min: 1.21, max: 2.00 0.3, 1.04 PUT BACK
}


if initialcount == 2  { //&& GameState.sharedInstance.score >= 3

rolldice = 3 // 1.0 for darts// 3 for sliding walls //(CGFloat.random(min: 3, max: 3.01)) // min: 1.21, max: 2.00 0.3, 1.04 PUT BACK
}
if printOn == 1 {
// *** print("rolldice = \(rolldice)")
}
/*  DIFFERENT RANGE OF ROLLDICE:

if initialcount == 2 && scrollcount <= 8 {

rolldice = (CGFloat.random(min: 0, max: 1.04)) // 1.04 PUT BACK
}

if initialcount == 2 && scrollcount > 8 {

rolldice = (CGFloat.random(min: 0, max: 1.3)) //1.3 PUT BACK
}

if initialcount == 2 && scrollcount > 8 && GameState.sharedInstance.score > 35 {

rolldice = (CGFloat.random(min: 0, max: 1.35)) // 1.35 PUT BACK
}*/



func firstbarriers() {

// infinite bounce test  vh1 = 4000
//  ph1 = 1025 // 830// was 850 // was 835 //
//    ph1 = 1050
//   ph2 = 600
//   ph3 = 650
//    pw1 = 150
// *** print("cycle after initialcount platform \(cycle)")
ph1 = 0
ph2 = 0
ph3 = 0
pw1 = 0

let cpos: Int = cycle + 4
let cpos2: Int = cycle + 8

// Testing sliding walls opening:


//normal DO NOT CHANGE, SOME OF THE TESTS DEPEND ON THIS STAYING THE SAME!


//   ********** DO NOT CHANGE ***********

platforms[cpos2].position.x = make3size + 5*make3size/6 //DO NOT CHANGE
platforms[cpos].position.x = make3size + 1*make3size/2 //DO NOT CHANGE
platforms[cycle].position.x = make3size + make3size/6 //DO NOT CHANGE

platforms[cpos2].position.y = -200 //DO NOT CHANGE
platforms[cpos].position.y = -150 //DO NOT CHANGE
platforms[cycle].position.y = -100 //DO NOT CHANGE


//   ********* END DO NOT CHANGE *********



//   platforms[cpos2].position.x = make3size + 5*make3size/6 + 300
//    platforms[cycle].position.x = platformst2.position.x + make3size/3 //- firstswadjust// make3size + make3size/6 + 300
platforms[cpos].position.x = platformst3.position.x + make3size/3//- firstswadjust//make3size + 1*make3size/2 + 500

// platforms[cycle].size.width = 150


platformcount = platformcount + 1
// *** print("platformcount: \(platformcount)")

platforms[cpos].physicsBody!.linearDamping = 15000
platforms[cpos].physicsBody!.angularDamping = 0.1




platforms[cpos].position.y = 200




vplatforms[cpos].position.x = platforms[cpos].position.x
vplatforms[cpos].position.y = platforms[cpos].position.y + 2048 + swgap - 2
vplatforms[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cpos].size)
vplatforms[cpos].physicsBody!.dynamic = false
vplatforms[cpos].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[cpos].physicsBody!.friction = 0
vplatforms[cpos].physicsBody!.restitution = 0
vplatforms[cpos].name = "vplatform"
vplatforms[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
vplatforms[cpos].physicsBody!.linearDamping = 15000


vplatforms[cpos].physicsBody!.angularDamping = 0.1


spikes[self.spikearraypos].size.width = spikewidth // was 42 8/3/15
spikes[self.spikearraypos].size.height = spikeheight // was 42 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0
spikes[self.spikearraypos].position.y = platformheight/2 + spikes[self.spikearraypos].size.height/2 - 3
//CGPoint(x: platforms[self.cycle].position.x , y: CGRectGetMaxY(platforms[self.cycle].frame) + 25)


// spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)

spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike //.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].anchorPoint.x = 0.50
spikes[self.spikearraypos].anchorPoint.y = 0.50
spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(0, duration: 0))

//  self.backgroundLayer.addChild(spikes[self.spikearraypos])
platforms[cpos].addChild(spikes[self.spikearraypos]) //REMOVED FOR opening walls TEST PUT BACK


// *** print("firstCoin: \(firstCoin)")

vplatforms[cpos].physicsBody!.charge = vplatforms[cpos].position.y
platforms[cpos].physicsBody!.charge = platforms[cpos].position.y
//TURNS ON FIRST COIN:


if GameState.sharedInstance.highScore >= 5 {

if firstCoin >= 0.9 {

coins[cpos2].size.height = coinheight
coins[cpos2].size.width = coinwidth
coins[cpos2].position.x = vplatforms[cpos].position.x + 3*coinwidth/2
coins[cpos2].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap/2
coins[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[cpos2].physicsBody!.collisionBitMask = 0
coins[cpos2].physicsBody!.affectedByGravity = false
coins[cpos2].physicsBody!.angularDamping = CGFloat(cycle)
coins[cpos2].name = "coin"
coins[cpos2].zPosition = 2
backgroundLayer.addChild(coins[cpos2])

coins[cpos].size.height = coinheight
coins[cpos].size.width = coinwidth
coins[cpos].position.x = vplatforms[cpos].position.x
coins[cpos].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap/3
coins[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[cpos].physicsBody!.collisionBitMask = 0
coins[cpos].physicsBody!.affectedByGravity = false
coins[cpos].physicsBody!.angularDamping = CGFloat(cycle)
coins[cpos].name = "coin"
coins[cpos].zPosition = 2
backgroundLayer.addChild(coins[cpos])

coins[cycle].size.height = coinheight
coins[cycle].size.width = coinwidth
coins[cycle].position.x = vplatforms[cpos].position.x
coins[cycle].position.y = CGRectGetMinY(vplatforms[cpos].frame) - 2*swgap/3
coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[cycle].physicsBody!.collisionBitMask = 0
coins[cycle].physicsBody!.affectedByGravity = false
coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
coins[cycle].name = "coin"
coins[cycle].zPosition = 2
backgroundLayer.addChild(coins[cycle])

}

if firstCoin >= 0.6 && firstCoin < 0.9 {



coins[cpos].size.height = coinheight
coins[cpos].size.width = coinwidth
coins[cpos].position.x = vplatforms[cpos].position.x
coins[cpos].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap/3
coins[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[cpos].physicsBody!.collisionBitMask = 0
coins[cpos].physicsBody!.affectedByGravity = false
coins[cpos].physicsBody!.angularDamping = CGFloat(cycle)
coins[cpos].name = "coin"
coins[cpos].zPosition = 2
backgroundLayer.addChild(coins[cpos])

coins[cycle].size.height = coinheight
coins[cycle].size.width = coinwidth
coins[cycle].position.x = vplatforms[cpos].position.x
coins[cycle].position.y = CGRectGetMinY(vplatforms[cpos].frame) - 2*swgap/3
coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[cycle].physicsBody!.collisionBitMask = 0
coins[cycle].physicsBody!.affectedByGravity = false
coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
coins[cycle].name = "coin"
coins[cycle].zPosition = 2
backgroundLayer.addChild(coins[cycle])

}

if firstCoin >= 0.5 && firstCoin < 0.6 {




coins[cycle].size.height = coinheight
coins[cycle].size.width = coinwidth
coins[cycle].position.x = vplatforms[cpos].position.x
coins[cycle].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap/2
coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[cycle].physicsBody!.collisionBitMask = 0
coins[cycle].physicsBody!.affectedByGravity = false
coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
coins[cycle].name = "coin"
coins[cycle].zPosition = 2
backgroundLayer.addChild(coins[cycle])

}



}


//END TURNS ON FIRSTCOIN

//  println("spikearraypos: \(spikearraypos)")


if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}

//   println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0
spikes[self.spikearraypos].position.y = -platformheight/2 - spikes[self.spikearraypos].size.height/2

// spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike //.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].zRotation = 3.14159265
spikes[self.spikearraypos].anchorPoint.x = 0.50
spikes[self.spikearraypos].anchorPoint.y = 0.50

//self.backgroundLayer.addChild(spikes[self.spikearraypos])

vplatforms[cpos].addChild(spikes[self.spikearraypos]) //REMOVED FOR opening walls TEST PUT BACK


if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}



//   println("spikearraypos: \(spikearraypos)")








//contact platforms quickly for platform lowering test:

/*
platforms[cpos].position.x = make3size + 1*make3size/2 + 150
*/

//atrest corner land test:
/*
platforms[cycle].position.y = -850
platforms[cycle].position.x = make3size + make3size/6 + 50
*/
//Land into atrest test (use with infinite touch test): Appears to jump as though in a slide, but really it does an atrest jump and then immediately after a slide jump, it's just too fast to see. No problems with this now, but is a useful scenario to test. Previous problem with this (also, with any slide with infinite jump test on) was that bird2con was not getting turned off as soon as a jump occurred, so slide would go from on to off, then back on again because bird2con still ='d 1. + 280


//  Also, + 295 for going directly from floor run to sliding on platform (no jump frame in between)

//move infinite jump test to beginning of update function, right after the println("update") line

/*
platforms[cpos2].position.y = -200
platforms[cpos].position.y = -500
platforms[cycle].position.y = -10000
platforms[cpos].position.x = make3size + 1*make3size/2 + 280 // 280 for atrest test 295 for going directly from floor run to sliding on platform (no jump frame in between)                platforms[cpos2].position.x = make3size + 1*make3size/2 + 10000

undotest = 0
*/



//Run aground test (use with infinite touch test): This was fixed by turning off the floor contact bitmask. Take out THE CONTACT AND COLLISION BITMASK IN INFINITE JUMP TEST TO RETEST. Problem with this test is, floor contact begins and ends in the same frame. Maybe this was an issue when didbegincontact decided what the state was instead of didfinishupdate. If moving run function back to didBeginContact, will need to keep an eye out for this.

//I also took out the contact and collision bitmask in infinite jump for the floor (see the put back notes in the infinite jump test). This way, the bird could contact the floor and collide with it. No problems though, with or without this change.



/*
platforms[cpos2].position.y = -500
platforms[cpos].position.y = -500
platforms[cycle].position.y = -10000
platforms[cpos].position.x = make3size + 1*make3size/2 + 275 //290// 228 // old numbers, something changed, maybe startblock height?86.4 // + 87 worked once or twice
everyotherclick = 0
undotest = 0


*/
/*
platforms[cpos2].position.y = -500
platforms[cpos].position.y = -500
platforms[cycle].position.y = -10000
platforms[cpos].position.x = make3size + 1*make3size/2 + 276.5// 228 // old numbers, something changed, maybe startblock height?86.4 // + 87 worked once or twice
everyotherclick = 0
undotest = 0
*/

//Reverse facingdirection horizontal skip test (use with infinite touch test):

/*


platforms[cpos2].position.y = -400
platforms[cpos].position.y = 100
platforms[cycle].position.y = 0 // -370

platforms[cycle].position.x = make3size + make3size/6 - 168

platforms[cpos2].position.y = -400
platforms[cpos].position.y = 100
platforms[cycle].position.y =  -550

platforms[cycle].position.x = make3size + make3size/6 - 155 // - 168
platforms[cpos].position.x = make3size + 1*make3size/2 + 150



undotest = 0
*/

//slip test (use with infinite touch test): Passes, though has different results each time (between landing on platform and flying past.)
/*
platforms[cpos2].position.y = -400
platforms[cpos].position.y = -1000
platforms[cycle].position.y = -177 //205
platforms[cycle].position.x = make3size + make3size/6 + 70

undotest = 0
*/

//slip test 2 - not sure what this is.
/*
platforms[cpos2].position.y = -200
platforms[cpos].position.y = -1000
platforms[cycle].position.y = -225 //205
platforms[cycle].position.x = make3size + make3size/6 + 70
*/






//false slide test (use with infinite touch test):
/*
platforms[cpos2].position.y = -400
platforms[cpos].position.y = -1000
platforms[cycle].position.y = 190 //205
platforms[cycle].position.x = make3size + make3size/6 + 70

undotest = 0

*/

//slide over the top test (use with infinite touch test): -- Haven't seen this behavior in some time. I think I fixed this awhile ago. I don't know what the issue was.
/*
platforms[cpos2].position.y = -500
platforms[cpos].position.y = -500
platforms[cycle].position.y = 45


undotest = 0 */

//fall through test (click button once lined up with vplatform at the right. jumppower will adjust. Need to put back all the parts of this test to run. Search for fallthroughtest.) Passed now that the two platforms that were too close together have been taken care of (one platform removed).

/*
platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + 1*make3size/2
platforms[cycle].position.x = make3size + make3size/6

platforms[cpos2].position.y = 0
platforms[cpos].position.y = -150
platforms[cycle].position.y = -100



*/

//   makes platform lower immediately due to double contact test. Also causes bird to fall through sometimes (usually when platforms[cycle].position.y = 44, because bird4 is still making contact when bird5 starts to make contact. By the time bird4 ends, bird5 is already in contact, preventing bird5con from being set to 1.

/*
platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + 1*make3size/2
platforms[cycle].position.x = make3size + make3size/6

platforms[cpos2].position.y = 0
platforms[cpos].position.y = -150
platforms[cycle].position.y =  32//46 for falling through test and comment out below line // 47 for platform lowers immediately test and uncomment the below line

platforms[cycle].position.x = make3size + make3size/6 - 150 //
*/


//  flies over platform, makes contact but does not collide. Tests to see that platform does not lower.

/*
platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + 1*make3size/2
platforms[cycle].position.x = make3size + make3size/6

platforms[cpos2].position.y = 0
platforms[cpos].position.y = -150
platforms[cycle].position.y = -22.73
*/

//   contact broken while sliding test. Seems to be related to falling platforms.  Bird catches up with platform, but platform outpaces it instantly, then bird catches up to it again. Before, when bird4 and bird2 con were set to 0 or 1 instead of ++ and -- (the way they are now), it would register the re-contact first, set it to 1, then register the breaking of contact second setting to 0 (not sure why this was reversed, things seem to be able to happen in any order within the same part of a frame, though). Now, contact is still broken again because the platforms fall the instant the bird2 makes contact again, but contact is re-established. So, at this point the only thing that needs to change for this issue is making the platforms fall at the correct time (1.5 seconds after initial contact).


/*
platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + 1*make3size/2
platforms[cycle].position.x = make3size + make3size/6

platforms[cpos2].position.y = 0
platforms[cpos].position.y = -150
platforms[cycle].position.y = 50 // was 46


*/

//test of extra contacts (to see if extra contacts made when jumping into middle of bird4 so that the bird did not rise above the platform it was sliding on for a moment.  I also used screen processing project to test for contacts)
/*
platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + 1*make3size/2
platforms[cycle].position.x = make3size + make3size/6

platforms[cpos2].position.y = 0
platforms[cpos].position.y = -150
platforms[cycle].position.y = 90
*/






//landing on corner after rising above platform on slide test.  Bird2con begins and ends in the same frame, leaving bitmask unchanged. Does not work every time. Verify that bird2 contact begins and ends in the same frame.

//with bird2x = 701
//REMOVE FALLING ACTION LIKE THE FALL THROUGH TEST. NOT SURE IF THIS TEST WILL WORK IF FALLING OCCURS.

/*
platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + 1*make3size/2
platforms[cycle].position.x = make3size + make3size/6 - 140//make3size + make3size/6

platforms[cpos2].position.y = 0
platforms[cpos].position.y = -150
platforms[cycle].position.y = -25.5 //43.5
*/





//Slide collision with run contact test.

//  To manually set DY = the previous frame's' DY - 28 [AVG CHANGE IN VELOCITY WITH -12.0 GRAVITY], search for the word smoothe and uncomment those areas. Works with previousvelocity and smoothe being turned on, then turning off (not set up long term, just set up for this one test). The smoothe test worked well, could not tell that anything out of place was happening. Also, the right line of bird2 was overlapping into the platform, so it was clear that a collision had occured at the bottom of the bird and not the side (a run collision had been made).
/*

//set jumppower = 0.13

platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + 1*make3size/2
platforms[cycle].position.x = make3size + make3size/6 + 65//make3size + make3size/6

platforms[cpos2].position.y = 0
platforms[cpos].position.y = -150
platforms[cycle].position.y = -600 //43.5

*/

//Slide contact with run collision test.

//Set jumppower = 0.21:

//comment out the previous make3("000111") and the normal platform specs

/*

make3("000011")
platforms[cpos2].position.x = make3size + 5*make3size/6
platforms[cpos].position.x = make3size + make3size/6 + 230
//  platforms[cycle].position.x = /make3size + make3size/6
//
platforms[cpos2].position.y = 0
platforms[cpos].position.y = -300// -500 for test
//   platforms[cycle].position.y = -600 //43.5
*/

//horizontal skip test. contact being made and ended in same frame. Collision made, but run doesn't get set, so slides off the edge:

/*
//set jumppower = 0.21

platforms[cpos2].position.y = -400
platforms[cpos].position.y = -1000
platforms[cycle].position.y = -177 //205
platforms[cycle].position.x = make3size + make3size/6 - 141

*/


//double slide vplatform test, use with infinite jump test. Turn off make3 from above.

/*
make3("100000")
// set jump power in infinite jump test to 0.01

vplatforms[cycle].position.y = 600
//  vplatforms[cpos].position.y = 600
//  vplatforms[cpos2].position.y = 600

//  platforms[cpos2].position.x = make3size + 5*make3size/6 //DO NOT CHANGE
//  platforms[cpos].position.x = make3size + 1*make3size/2 //DO NOT CHANGE
vplatforms[cycle].position.x = make3size + make3size/6
vplatforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle].size)
vplatforms[cycle].physicsBody!.dynamic = false
vplatforms[cycle].physicsBody!.usesPreciseCollisionDetection = false
vplatforms[cycle].physicsBody!.friction = 0
vplatforms[cycle].physicsBody!.restitution = 0
vplatforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird

undotest = 0

*/


//make sure atrest == false when landing on top of platform overlapping with floor:

/*
platforms[cpos2].position.y = -400
platforms[cpos].position.y = -1000
platforms[cycle].position.y = -964 //205
platforms[cycle].position.x = make3size + make3size/6 - 100

*/

//Landing on ground very close to platform then jumping on platform test, to make sure sliding works with no jump frame in between:

//if turn undotest = 0, tests what happens when jump immediately
//if turn undotest = 1, tests what happens when doesn't jump immediately.
/*
platforms[cpos2].position.y = -400
platforms[cpos].position.y = -1000

platforms[cpos2].position.x = make3size + make3size/6 + 675
platforms[cycle].position.y = -1000 //205
// platforms[cycle].position.x = make3size + make3size/6 - 100

// undotest = 0

*/


// End testing sliding walls opening
//
if cycle == 0 {


posB = CGRectGetMaxX(platforms[cpos].frame)


}

if cycle == 1 {


posE = CGRectGetMaxX(platforms[cpos].frame)

}

if cycle == 2 {


posH = CGRectGetMaxX(platforms[cpos].frame)


}

if cycle == 3 {


posK = CGRectGetMaxX(platforms[cpos].frame)


}

initialcount = initialcount + 1


//JUMP ONTO TOO TALL PLATFORM, JUMP OFF OF VPLATFORM AND LAND ON PLATFORM INITIAL:
/*

var rolldicea =  0.51//CGFloat.random(min:0, max:1) //

if rolldicea < 0.5 {
make3("000111")

platforms[cycle+8].position.x = 2*make3size + 5*make3size/6
platforms[cycle+4].position.x = 2*make3size + 1*make3size/2
platforms[cycle].position.x = 2*make3size + make3size/6

if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(platforms[cycle+4].frame)
posC = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(platforms[cycle+4].frame)
posF = CGRectGetMaxX(platforms[cycle+8].frame)
println("score1: \(score1)")
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(platforms[cycle+4].frame)
posI = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(platforms[cycle+4].frame)
posL = CGRectGetMaxX(platforms[cycle+8].frame)

}


//   scoreVar[cycle][0] = CGRectGetMaxX(platforms[cycle].frame)
//   scoreVar[cycle][1] = CGRectGetMaxX(platforms[cycle].frame)
//   scoreVar[cycle][2] = CGRectGetMaxX(platforms[cycle].frame)
//   println("scorevar cycle: \(scoreVar[cycle][0])")
//   println("scorevar calc: \(CGRectGetMaxX(platforms[cycle].frame))")

/*    platform1.size.width = shrink*make3size/7
platform1.size.height = 1600
platform1.zPosition = 100
platform1.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: -100), fromNode: self)
platform1.physicsBody = SKPhysicsBody(rectangleOfSize: platform1.size)
platform1.physicsBody!.usesPreciseCollisionDetection = true
platform1.physicsBody!.dynamic = false
platform1.physicsBody!.friction = 0
platform1.physicsBody!.restitution = 0
platform1.physicsBody!.categoryBitMask = PhysicsCategory.block
platform1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform1.name = "platform"
self.backgroundLayer.addChild(platform1)


platform2.size.width = shrink*make3size/7
platform2.size.height = 700
platform2.zPosition = 100
platform2.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/3 + make3size/6, y: platform2.size.height/2), fromNode: self)
platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform2.physicsBody!.dynamic = false
platform2.physicsBody!.usesPreciseCollisionDetection = true
platform2.physicsBody!.friction = 0
platform2.physicsBody!.restitution = 0
platform2.physicsBody!.categoryBitMask = PhysicsCategory.block
platform2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform2.name = "platform"
self.backgroundLayer.addChild(platform2)

platform3.size.width = shrink*make3size/7
platform3.size.height = 700
platform3.zPosition = 100
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 2*make3size/3 + make3size/6, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = true
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3) */


//let dartcatcher = SKSpriteNode(imageNamed: "barrier")



dartcatchers[self.cycle].size.width = make3size
dartcatchers[self.cycle].size.height = 60
dartcatchers[self.cycle].position = CGPoint(x:  platforms[self.cycle].position.x + 1024, y: -100)//-100 - dartcatchers[self.cycle].size.height/2) //  // x: make3size/2 +  ///self.backgroundLayer.convertPoint(    , fromNode: self)
println("\(self.cycle)")
dartcatchers[self.cycle].physicsBody = SKPhysicsBody(rectangleOfSize: dartcatchers[self.cycle].size)
dartcatchers[self.cycle].physicsBody!.dynamic = false
dartcatchers[self.cycle].physicsBody!.friction = 0
dartcatchers[self.cycle].physicsBody!.restitution = 0
dartcatchers[self.cycle].physicsBody!.categoryBitMask = PhysicsCategory.dartcatcher
dartcatchers[self.cycle].physicsBody!.contactTestBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].physicsBody?.collisionBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].zPosition = 1
self.backgroundLayer.addChild(dartcatchers[self.cycle])



if self.dart1 > 0.0 { // was 0.5
darts[self.dartarraypos].position = CGPoint(x: (CGRectGetMaxX(platforms[self.cycle].frame)  + CGRectGetMinX(platforms[self.cycle+4].frame))/2, y: -50)
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 100
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 //CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.friction = CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "dart"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position = CGPoint(x: darts[self.dartarraypos].position.x, y: 250)
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 100
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
// println("\(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

}

if self.dart2 > 0.0 { // was 0.5
darts[self.dartarraypos].position = CGPoint(x: (CGRectGetMaxX(platforms[self.cycle+4].frame) + CGRectGetMinX(platforms[self.cycle+8].frame))/2, y: -50)
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 100
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 // CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.friction = CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "dart"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position = CGPoint(x: darts[self.dartarraypos].position.x, y: 250)
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 100
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
//  println("\(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

}

if self.dart3 > 0.0 { // > 0.5
darts[self.dartarraypos].position = CGPoint(x: ceil(CGRectGetMaxX(platforms[self.cycle+6].frame)/2048)*2048, y: -50) //self.scrollcount*2048 + 3*2048
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 100
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 //CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.friction = CGFloat.random(min: 275, max: 350)*0.0001 // *0.0001
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "dart" // "inbtwdart"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position = CGPoint(x: darts[self.dartarraypos].position.x, y: 250)
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 100
dartducts[self.dartarraypos].name = "inbtwduct"
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
println("inbtw dart position: \(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

}


} else {

//   ph1 = 1200
//    ph2 = 700
//    ph3 = 1200

println("ph1: \(ph1) ph2: \(ph2) ph3: \(ph3)")




//    println("ph1: \(ph1) ph2: \(ph2) ph3: \(ph3)")
//   println("platforms[cycle].size.height: \(platforms[cycle].size.height) platforms[cycle+4].size.height: \(platforms[cycle+4].size.height) platforms[cycle+8].size.height: \(platforms[cycle+8].size.height)" )

//    println("cycle anchorpoint: \(platforms[cycle].anchorPoint) cycle+4 anchorpoint: \(platforms[cycle+4].anchorPoint) cycle+8 anchorpoint: \(platforms[cycle+8].anchorPoint)")


/*fallthroughtest:

make3("010111") (remove make3 below)
platforms[cycle].position.y = -100 // -100
platforms[cycle+4].position.y = -400
platforms[cycle+8].position.y = -300 // -100

vplatforms[cycle+4].position.y = 2048

platforms[cycle+8].position.x = 2*make3size + 1*make3size/2 + make3size/6 // 5/6*
vplatforms[cycle+4].position.x = 2*make3size + make3size/6
platforms[cycle+4].position.x = 2*make3size + make3size/6
platforms[cycle].position.x = 2*make3size + 5*make3size/6
*/

*/
//more initial platforms:


/*

make3("000111")
platforms[cycle+8].position.x = 2*make3size + 5*make3size/6 + 300
platforms[cycle+4].position.x = 2*make3size + 1*make3size/2 + 300
platforms[cycle].position.x = 2*make3size + make3size/6 + 300

platforms[cycle+8].position.y = -500
platforms[cycle+4].position.y = -300
platforms[cycle].position.y = -100


*/







// slide on too tall platform, slide on vplatform, land on falling platform:

/*

println("makes3 010101")
make3("010101")
platforms[cycle].position.y = -400 // -100
//      platforms[cycle+4].position.y = -4000
platforms[cycle+8].position.y = 100
// -100

vplatforms[cycle+4].position.y = 2048// 2048 //2048

platforms[cycle+8].position.x = 2*make3size + 1*make3size/2 + make3size/6 + 100 // 5/6*
vplatforms[cycle+4].position.x = 2*make3size + make3size/6 + 125
//      platforms[cycle+4].position.x = 2*make3size + make3size/6
platforms[cycle].position.x = 2*make3size + make3size/6 + 125





//       vplatforms[self.cycle+4].size.height = 950
//       vplatforms[self.cycle+4].position.y = self.size.height - vplatforms[self.cycle+4].size.height/2

//self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/2.2, y: self.size.height - vplatforms[self.cycle+4].size.height/2), fromNode: self)
vplatforms[self.cycle+4].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[self.cycle+4].size)
vplatforms[self.cycle+4].physicsBody!.dynamic = false
vplatforms[self.cycle+4].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[self.cycle+4].physicsBody!.friction = 0
vplatforms[self.cycle+4].physicsBody!.mass = 100
vplatforms[self.cycle+4].physicsBody!.restitution = 0
vplatforms[self.cycle+4].physicsBody!.categoryBitMask = PhysicsCategory.block //& PhysicsCategory.vplatform
vplatforms[self.cycle+4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[self.cycle+4].physicsBody!.collisionBitMask = PhysicsCategory.bird

println("vplatform physicscategory: \(vplatforms[self.cycle+4].physicsBody?.categoryBitMask)")

Trees[self.cycle].size.height = self.size.height - CGRectGetMaxY(self.ground.frame)
Trees[self.cycle].size.width = 375
Trees[self.cycle].position.x = (CGRectGetMinX(vplatforms[self.cycle+4].frame) + CGRectGetMaxX(platforms[self.cycle].frame))/2 - 200
Trees[self.cycle].position.y = CGFloat(self.size.height)*CGFloat(0.5) + CGFloat(0.5)*CGFloat(CGRectGetMaxY(self.ground.frame))
Trees[self.cycle].zPosition = 90

self.backgroundLayer.addChild(Trees[self.cycle])





if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(platforms[cycle+4].frame)
posC = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(platforms[cycle+4].frame)
posF = CGRectGetMaxX(platforms[cycle+8].frame)
//  println("score1: \(score1)")
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(platforms[cycle+4].frame)
posI = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(platforms[cycle+4].frame)
posL = CGRectGetMaxX(platforms[cycle+8].frame)

}



//  End slide on too tall platform

}

*/

initialcount = initialcount + 1
self.vspike = 1
}



/* let dart1sprite = SKSpriteNode(texture: SKTexture(imageNamed: "Stalagmite"))
let dart2sprite = SKSpriteNode(texture: SKTexture(imageNamed: "Stalagmite"))
let dart3sprite = SKSpriteNode(texture: SKTexture(imageNamed: "Stalagmite"))
let dart4sprite = SKSpriteNode(texture: SKTexture(imageNamed: "Stalagmite")) */

/* let dartduct1 = SKSpriteNode(imageNamed:"SpikeSignPost")
let dartduct2 = SKSpriteNode(imageNamed:"SpikeSignPost")
let dartduct3 = SKSpriteNode(imageNamed:"SpikeSignPost")
let dartduct4 = SKSpriteNode(imageNamed:"SpikeSignPost") */

//let platform1 = SKSpriteNode(imageNamed: "barrier")
//   let platform2 = SKSpriteNode(imageNamed: "barrier")
//  let platform3 = SKSpriteNode(imageNamed: "barrier")

// self.endormid = 1
// self.setgameoverbarrier()

/*GameState.sharedInstance.score = GameState.sharedInstance.score + 1
GameState.sharedInstance.scoreLabel.text = String(GameState.sharedInstance.score) */


/*     if GameState.sharedInstance.score == 5 {


self.beginLabel.position = CGPoint(x: make3size/2, y: self.size.height - 500)
self.beginLabel.fontColor = SKColor.blueColor()
self.beginLabel.fontSize = 72
self.addChild(self.beginLabel)

} else if GameState.sharedInstance.score == 10 {

self.beginLabel.text = "Faster"

} else if GameState.sharedInstance.score == 20 {
self.beginLabel.text = "Fastest"
} */



//    backgrounda.position = CGPoint(x: backgrounda.position.x + make3size*3, y: 0)
/*
if GameState.sharedInstance.score == 100000 { //GameState.sharedInstance.score == 6 || GameState.sharedInstance.score == 7 || GameState.sharedInstance.score == 8 FIX THIS -- JUST WANTED TO GET THIS OBSTACLE OUT OF THE WAY. PUT BACK ~ BUT NOT REALLY, JUST FIX IT SOMEHOW


let platform2 = SKSpriteNode(imageNamed: "barrier")
let platform3 = SKSpriteNode(imageNamed: "barrier")
let spike1 = SKSpriteNode(imageNamed: "Spike")
let spike2 = SKSpriteNode(imageNamed: "Spike")
let spike3 = SKSpriteNode(imageNamed: "Spike")
let spike4 = SKSpriteNode(imageNamed: "Spike")
let spike5 = SKSpriteNode(imageNamed: "Spike")


var pos2: CGFloat = make3size*2
pos2 += make3size/3
pos2 += make3size/6

platform2.size.width = make3size/8
platform2.size.height = 1450
platform2.zPosition = 3
platform2.position = self.backgroundLayer.convertPoint(CGPoint(x: pos2, y: self.size.height - platform3.size.height/2), fromNode: self)
platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform2.physicsBody!.dynamic = false
platform2.physicsBody!.usesPreciseCollisionDetection = false
platform2.physicsBody!.friction = 0
platform2.physicsBody!.restitution = 0
platform2.physicsBody!.categoryBitMask = PhysicsCategory.block
platform2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform2.name = "platform"
self.backgroundLayer.addChild(platform2)

platform3.size.width = make3size/8
platform3.size.height = 1150
platform3.zPosition = 3



var pos3: CGFloat = make3size*2
pos3 += 2*make3size/3
pos3 += make3size/6
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: pos3, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = false
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3)

spike1.size.width = 50
spike1.size.height = 50
spike1.zPosition = 2
spike1.position.x = CGRectGetMaxX(platform2.frame) + spike1.size.width/2
spike1.position.y = CGRectGetMinY(platform2.frame) + spike1.size.height
//  spike1.physicsBody = SKPhysicsBody(rectangleOfSize: spike1.size) // MAY NEED TO MAKE THIS A TRIANGLE
spike1.physicsBody = SKPhysicsBody(texture: spike1.texture, size: spike1.size)
spike1.physicsBody!.dynamic = false
spike1.physicsBody?.affectedByGravity = false
spike1.physicsBody!.categoryBitMask = PhysicsCategory.danger
spike1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
spike1.runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
spike1.name = "obstacle1"
self.backgroundLayer.addChild(spike1)

spike2.size.width = 50
spike2.size.height = 50
spike2.zPosition = 2
spike2.position.x = CGRectGetMaxX(platform2.frame) + spike2.size.width/2
spike2.position.y = CGRectGetMinY(platform2.frame) + 300


spike2.physicsBody = SKPhysicsBody(texture: spike2.texture, size: spike2.size) // MAY NEED TO DEFINE THE TRIANGLE INSTEAD OF AUTOMATICALLY DETECTING IT IF PERFORMANCE IS SLOW
spike2.physicsBody!.dynamic = false
spike2.physicsBody?.affectedByGravity = false
spike2.physicsBody!.categoryBitMask = PhysicsCategory.danger
spike2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
spike2.runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
self.backgroundLayer.addChild(spike2)

spike3.size.width = 50
spike3.size.height = 50
spike3.zPosition = 2
spike3.position.x = CGRectGetMaxX(platform2.frame) + spike3.size.width/2
spike3.position.y = CGRectGetMinY(platform2.frame) + 600

spike3.physicsBody = SKPhysicsBody(texture: spike3.texture, size: spike3.size) // MAY NEED TO DEFINE THE TRIANGLE INSTEAD OF AUTOMATICALLY DETECTING IT IF PERFORMANCE IS SLOW                        spike3.physicsBody!.dynamic = false
spike3.physicsBody?.affectedByGravity = false
spike3.physicsBody!.categoryBitMask = PhysicsCategory.danger
spike3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
spike3.runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
self.backgroundLayer.addChild(spike3)

spike4.size.width = 50
spike4.size.height = 50
spike4.zPosition = 2
spike4.position.x = CGRectGetMinX(platform3.frame) - spike4.size.width/2
spike4.position.y = CGRectGetMinY(platform2.frame) + 150
spike4.physicsBody = SKPhysicsBody(texture: spike4.texture, size: spike4.size) // MAY NEED TO DEFINE THE TRIANGLE INSTEAD OF AUTOMATICALLY DETECTING IT IF PERFORMANCE IS SLOW
spike4.physicsBody!.dynamic = false
spike4.physicsBody?.affectedByGravity = false
spike4.physicsBody!.categoryBitMask = PhysicsCategory.danger
spike4.physicsBody!.contactTestBitMask = PhysicsCategory.bird
spike4.runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
self.backgroundLayer.addChild(spike4)

spike5.size.width = 50
spike5.size.height = 50
spike5.zPosition = 2
spike5.position.x = CGRectGetMinX(platform3.frame) - spike5.size.width/2

spike5.position.y = CGRectGetMinY(platform2.frame) + 450
spike5.physicsBody = SKPhysicsBody(texture: spike5.texture, size: spike5.size) // MAY NEED TO DEFINE THE TRIANGLE INSTEAD OF AUTOMATICALLY DETECTING IT IF PERFORMANCE IS SLOW
spike5.physicsBody!.dynamic = false
spike5.physicsBody?.affectedByGravity = false
spike5.physicsBody!.categoryBitMask = PhysicsCategory.danger
spike5.physicsBody!.contactTestBitMask = PhysicsCategory.bird
spike5.runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
self.backgroundLayer.addChild(spike5)


}*/

// if GameState.sharedInstance.score != 6 && GameState.sharedInstance.score != 7 {

/*   if GameState.sharedInstance.score == 24 || GameState.sharedInstance.score == 25 || GameState.sharedInstance.score == 26 || rolldice > 1.3 {

if bonustimecheck1 != 0 && bonustimecheck2 != 0 && bonustimecheck3 == 0 {
bonustimecheck3 = bird2.position.x + 2048 + 1024
obstacle3bonustime = 5
}

if bonustimecheck1 != 0 && bonustimecheck2 == 0 {
bonustimecheck2 = bird2.position.x + 2048 + 1024
obstacle2bonustime = 5
}

if bonustimecheck1 == 0 {
bonustimecheck1 = bird2.position.x + 2048 + 1024
obstacle1bonustime = 5
}






pw1 = 50
pw2 = 50
pw3 = 50

ph1 = 900
ph2 = 750
ph3 = 575

make3("111111")

vplatforms[cycle].size.width = 50
vplatforms[cycle].size.height = 1000
vplatforms[cycle].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/12, y: 1536 - vplatforms[cycle].size.height/2), fromNode: self)
vplatforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle].size)
vplatforms[cycle].physicsBody!.dynamic = false
vplatforms[cycle].physicsBody!.usesPreciseCollisionDetection = false
vplatforms[cycle].physicsBody!.friction = 0
vplatforms[cycle].physicsBody!.restitution = 0
vplatforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
vplatforms[cycle+4].size.width = 50
vplatforms[cycle+4].size.height = 500
vplatforms[cycle+4].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 3*make3size/12, y: 1536 - vplatforms[cycle+4].size.height/2), fromNode: self)
vplatforms[cycle+4].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle+4].size)
vplatforms[cycle+4].physicsBody!.dynamic = false
vplatforms[cycle+4].physicsBody!.usesPreciseCollisionDetection = false
vplatforms[cycle+4].physicsBody!.friction = 0
vplatforms[cycle+4].physicsBody!.restitution = 0
vplatforms[cycle+4].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle+4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle+4].physicsBody!.collisionBitMask = PhysicsCategory.bird
vplatforms[cycle+8].size.width = 50
vplatforms[cycle+8].size.height = 800
vplatforms[cycle+8].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 4.5*make3size/12, y: 1536 - vplatforms[cycle].size.height/2), fromNode: self)

platforms[cycle].size.width = 50
platforms[cycle].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 6*make3size/12, y: platforms[cycle].size.height/2), fromNode: self)
platforms[cycle+4].size.width = 50
platforms[cycle+4].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 3*make3size/12, y: CGRectGetMinY(vplatforms[cycle+4].frame) - 600), fromNode: self)
platforms[cycle+8].size.width = 50
platforms[cycle+8].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 4.5*make3size/12, y: CGRectGetMinY(vplatforms[cycle+8].frame) - 600), fromNode: self)
vplatforms[cycle+8].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle+8].size)
vplatforms[cycle+8].physicsBody!.dynamic = false
vplatforms[cycle+8].physicsBody!.usesPreciseCollisionDetection = false
vplatforms[cycle+8].physicsBody!.friction = 0
vplatforms[cycle+8].physicsBody!.restitution = 0
vplatforms[cycle+8].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle+8].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle+8].physicsBody!.collisionBitMask = PhysicsCategory.bird

spikes[self.spikearraypos].size.width = 40
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 3*make3size/12, y: CGRectGetMaxY(platforms[cycle+4].frame) + spikes[spikearraypos].size.height/2), fromNode: self)


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(texture: spikes[self.spikearraypos].texture, size: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
//spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}

spikes[self.spikearraypos].size.width = 40
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 4.5*make3size/12, y: CGRectGetMaxY(platforms[cycle+8].frame) + spikes[spikearraypos].size.height/2), fromNode: self)


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(texture: spikes[self.spikearraypos].texture, size: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
//spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}

spikes[self.spikearraypos].size.width = 40
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 6*make3size/12, y: CGRectGetMaxY(platforms[cycle].frame) + spikes[spikearraypos].size.height/2), fromNode: self)


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(texture: spikes[self.spikearraypos].texture, size: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
//spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}


pw1 = 0
pw2 = 0
pw3 = 0
ph1 = 0
ph2 = 0
ph3 = 0

if xcycle < 3 {

xcycle++

} else {

xcycle = 0

}

xplatforms[xcycle].size.width = 500
xplatforms[xcycle].size.height = 600
xplatforms[xcycle].zPosition = 100
xplatforms[xcycle].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 5*make3size/6, y: xplatforms[xcycle].size.height/2), fromNode: self)
xplatforms[xcycle].physicsBody = SKPhysicsBody(rectangleOfSize: xplatforms[xcycle].size)
xplatforms[xcycle].physicsBody!.dynamic = false
xplatforms[xcycle].physicsBody!.usesPreciseCollisionDetection = true
xplatforms[xcycle].physicsBody!.friction = 0
xplatforms[xcycle].physicsBody!.restitution = 0
xplatforms[xcycle].physicsBody!.categoryBitMask = PhysicsCategory.block
xplatforms[xcycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
xplatforms[xcycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
xplatforms[xcycle].name = "platform"
self.backgroundLayer.addChild(xplatforms[xcycle])

//ADD SCORE
}
*/

//Old Sliding walls
/*
if rolldice > 1.2 && rolldice < 3.0 {
//  pw1 = 50 + 228
//  pw2 = 50 + 228
//   pw3 = 50 + 228

//   ph1 = 1100
//   ph2 = 750
//   ph3 = 575

make3("111111")
println("vplatformwidth: \(vplatformwidth) vplatformheight: \(vplatformheight)")
println("platformwidth: \(platformwidth) platformheight: \(platformheight)")

vplatforms[cycle].size.width = vplatformwidth
vplatforms[cycle].size.height = vplatformheight //
vplatforms[cycle].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/12, y: 2048), fromNode: self)
vplatforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle].size)
vplatforms[cycle].physicsBody!.dynamic = false
vplatforms[cycle].physicsBody!.mass = 100
vplatforms[cycle].physicsBody!.usesPreciseCollisionDetection = false
vplatforms[cycle].physicsBody!.friction = 0
vplatforms[cycle].physicsBody!.restitution = 0
vplatforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
vplatforms[cycle+4].size.width = vplatformwidth
vplatforms[cycle+4].size.height = vplatformheight
vplatforms[cycle+4].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 5*make3size/12, y: 2400 - vplatforms[cycle+4].size.height/2), fromNode: self)
vplatforms[cycle+4].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle+4].size)
vplatforms[cycle+4].physicsBody!.dynamic = false
vplatforms[cycle+4].physicsBody!.mass = 100
vplatforms[cycle+4].physicsBody!.usesPreciseCollisionDetection = false
vplatforms[cycle+4].physicsBody!.friction = 0

vplatforms[cycle+4].physicsBody!.restitution = 0
vplatforms[cycle+4].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle+4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle+4].physicsBody!.collisionBitMask = PhysicsCategory.bird
vplatforms[cycle+8].size.width = vplatformwidth
vplatforms[cycle+8].size.height = vplatformheight
vplatforms[cycle+8].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 9*make3size/12, y: 2000 - vplatforms[cycle+8].size.height/2), fromNode: self) //1500

//last platform:
platforms[cycle].size.width = platformwidth
platforms[cycle].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size, y: platforms[cycle].size.height/2 - 200), fromNode: self)
//first platform:
platforms[cycle+4].size.width = platformwidth
platforms[cycle+4].position.x = vplatforms[cycle+4].position.x

platforms[cycle+4].position.y = CGRectGetMinY(vplatforms[cycle+4].frame) - platforms[cycle+4].size.height/2 - 250
platforms[cycle+8].size.width = platformwidth
platforms[cycle+8].position.x = vplatforms[cycle+8].position.x
platforms[cycle+8].position.y = CGRectGetMinY(vplatforms[cycle+8].frame) - platforms[cycle+8].size.height/2 - 250
//Why is this y - 450 when the cycle+4 y is - 650? Seems to be needed, but why are they different? Are they going off old sizes or something?
vplatforms[cycle+8].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle+8].size)
vplatforms[cycle+8].physicsBody!.dynamic = false
vplatforms[cycle+8].physicsBody!.usesPreciseCollisionDetection = false
vplatforms[cycle+8].physicsBody!.friction = 0
vplatforms[cycle+8].physicsBody!.mass = 100
vplatforms[cycle+8].physicsBody!.restitution = 0
vplatforms[cycle+8].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle+8].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle+8].physicsBody!.collisionBitMask = PhysicsCategory.bird


pw1 = 0
pw2 = 0
pw3 = 0
ph1 = 0
ph2 = 0
ph3 = 0


//ADD SCORE
}
*/

//3 darts in a pattern:
/*

if rolldice > 1.04 && rolldice <= 1.2  { // && GameState.sharedInstance.score != 6 && GameState.sharedInstance.score != 7 && GameState.sharedInstance.score != 8 //&& GameState.sharedInstance.score != 24 && GameState.sharedInstance.score != 25 && GameState.sharedInstance.score != 26

make3("000111")


/*   let platform1 = SKSpriteNode(imageNamed: "barrier")
let platform2 = SKSpriteNode(imageNamed: "barrier")
let platform3 = SKSpriteNode(imageNamed: "barrier")

if GameState.sharedInstance.score > 10 {
shrink = 0.7
} */

/* platform1.size.width = shrink*make3size/7
platform1.size.height = 1600
platform1.zPosition = 100
platform1.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: -100), fromNode: self)
platform1.physicsBody = SKPhysicsBody(rectangleOfSize: platform1.size)
platform1.physicsBody!.usesPreciseCollisionDetection = true
platform1.physicsBody!.dynamic = false
platform1.physicsBody!.friction = 0
platform1.physicsBody!.restitution = 0
platform1.physicsBody!.categoryBitMask = PhysicsCategory.block
platform1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform1.name = "platform"
self.backgroundLayer.addChild(platform1) */






/*  platform3.size.width = shrink*make3size/7
platform3.size.height = 700
platform3.zPosition = 100
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 2*make3size/3 + make3size/6, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = true
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3)

let distance = CGRectGetMaxX(platform1.frame) - CGRectGetMinX(platform2.frame) - 25*2 */

//let dartcatcher = SKSpriteNode(imageNamed: "barrier")

if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(platforms[cycle+4].frame)
posC = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(platforms[cycle+4].frame)
posF = CGRectGetMaxX(platforms[cycle+8].frame)
println("score1: \(score1)")
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(platforms[cycle+4].frame)
posI = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(platforms[cycle+4].frame)
posL = CGRectGetMaxX(platforms[cycle+8].frame)

}

dartcatchers[self.cycle].size.width = make3size
dartcatchers[self.cycle].size.height = 60
dartcatchers[self.cycle].position.x = platforms[self.cycle].position.x + 1024//-100 - dartcatchers[self.cycle].size.height/2) //  // x: make3size/2 +  ///self.backgroundLayer.convertPoint(    , fromNode: self)

dartcatchers[self.cycle].position.y = -100
println("\(self.cycle)")
dartcatchers[self.cycle].physicsBody = SKPhysicsBody(rectangleOfSize: dartcatchers[self.cycle].size)
dartcatchers[self.cycle].physicsBody!.dynamic = false
dartcatchers[self.cycle].physicsBody!.friction = 0
dartcatchers[self.cycle].physicsBody!.restitution = 0
dartcatchers[self.cycle].physicsBody!.categoryBitMask = PhysicsCategory.dartcatcher
dartcatchers[self.cycle].physicsBody!.contactTestBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].physicsBody?.collisionBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].zPosition = 2
self.backgroundLayer.addChild(dartcatchers[self.cycle])

self.customdart1count = self.customdart1count + 1





darts[self.dartarraypos].position.x = CGRectGetMaxX(platforms[self.cycle].frame) + darts[self.dartarraypos].size.width

darts[self.dartarraypos].position.y = -50
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 2
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.restitution = 0 // self.customdart1count*0.0001 //CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.angularDamping = 0
darts[self.dartarraypos].physicsBody!.allowsRotation = true
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "customdart1"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position.x =  darts[self.dartarraypos].position.x

dartducts[self.dartarraypos].position.y = 250
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 3
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
// println("\(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

darts[self.dartarraypos].position.x = (CGRectGetMaxX(platforms[self.cycle].frame) + CGRectGetMinX(platforms[self.cycle+4].frame))/2
darts[self.dartarraypos].position.y = -50

darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 2
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 // self.customdart1count*0.0001  //CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.angularDamping = 0.00004
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "customdart1"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position.x = darts[self.dartarraypos].position.x
dartducts[self.dartarraypos].position.y = 250
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 3
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
// println("\(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

darts[self.dartarraypos].position.x = CGRectGetMinX(platforms[self.cycle+4].frame) - darts[self.dartarraypos].size.width

darts[self.dartarraypos].position.y = -50

darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 2
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 // self.customdart1count*0.0001  //CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.angularDamping = 0.00008
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "customdart1"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position.x = darts[self.dartarraypos].position.x
dartducts[self.dartarraypos].position.y = 250
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 3
self.backgroundLayer.addChild(dartducts[self.dartarraypos])

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

darts[self.dartarraypos].position.x = (CGRectGetMaxX(platforms[self.cycle+4].frame)  + CGRectGetMinX(platforms[self.cycle+8].frame))/2
darts[self.dartarraypos].position.y = -50
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 2
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 // CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.friction = CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "dart"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position.x =  darts[self.dartarraypos].position.x

dartducts[self.dartarraypos].position.y = 250
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 3
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
//  println("\(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

}
*/




//    println("\(dart3sprite.position)")






/*  if self.backgroundA1count < self.scrollcount - 1 {
self.backgroundA1count = self.scrollcount + 2
} else if self.backgroundA2count < self.scrollcount - 1 {
self.backgroundA2count = self.scrollcount + 2
} else if self.backgroundA3count < self.scrollcount - 1 {
self.backgroundA3count = self.scrollcount + 2
} else if self.backgroundA4count < self.scrollcount - 1 {
self.backgroundA4count = self.scrollcount + 2
} */


/*  if self.backgroundA1count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA1count = self.scrollcount + 2
self.setA = 1
}

if self.backgroundA2count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA2count = self.scrollcount + 2
self.setA = 1
}

if self.backgroundA3count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA3count = self.scrollcount + 2
self.setA = 1
}

if self.backgroundA4count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA4count = self.scrollcount + 2
self.setA = 1
} */





//rolldice >= 3

func slidingwalls() {

//> 1.2 && rolldice <= 1.3 { // && GameState.sharedInstance.score != 6 && GameState.sharedInstance.score != 7 && GameState.sharedInstance.score != 8 //&& GameState.sharedInstance.score != 24 && GameState.sharedInstance.score != 25 && GameState.sharedInstance.score != 26

/*  vh1 = 1100
vh2 = 1100
vh3 = 1100

ph1 = 1100
ph2 = 1100
ph3 = 1100

pw1 = 50
pw2 = 50
pw3 = 50

vw1 = 50
vw2 = 50
vw3 = 50 */



//  println("pw1 before make: \(pw1)")
//    println("pw2 before make: \(pw2)")

//    println("pre platformcount: \(platformcount)")


//   make3("100100") for opening walls test

//     println("pw1 after make: \(pw1)")
//     println("pw2 after make: \(pw2)")

// *** print("start sliding walls")




ph1 = 0
ph2 = 0
ph3 = 0
var cpos: Int = cycle
cpos += 4

var cpos2: Int = cycle
cpos2 += 8

//   platforms[self.cycle].name = "vplatform" // to turn off 'dx = 0'
//  platforms[self.cycle].color = UIColor.blueColor()
//    platforms[self.cycle].colorBlendFactor = 1.0f

//    platforms[cpos].name = "vplatform" // to turn off 'dx = 0'


//      println("finished make3")

platforms[cycle].physicsBody!.linearDamping = 15000
platforms[cycle].physicsBody!.angularDamping = CGFloat(cycle)






//     platforms[cycle].position.y = swmaxy - swgap/2 - platformheight/2 - 435// For opening walls test, when swmaxy = 1650, swgap = 350, platformheight = 2048. REMOVE FOR NORMAL, PUT BACK
//         platforms[cycle].position.x = platforms[cycle].position.x - firstswadjust + 450// For opening walls test, when swmaxy = 1650, swgap = 350, platformheight = 2048. REMOVE FOR NORMAL, PUT BACK


// REMOVED FOR OPENING WALLS TEST. PUT BACK:



let totalLength: CGFloat = swmaxy - swminy - 0.5*swgap - CGFloat(platformMaxNA) + CGFloat(platformMinNA) //total useable length, excluding NA area// was swmaxy - (swminy - 1) - (platformMaxNA - platformMinNA + 1), but simplified it for spritekit
var platformBeforeFirst: Int = 0
var platformBeforeSecond: Int = 0
var platformBeforeThird: Int = 0

var secondMax1: CGFloat = 0
var secondMin1: CGFloat = 0
var secondMax2: CGFloat = 0
var secondMin2: CGFloat = 0
var secondMax3: CGFloat = 0
var secondMin3: CGFloat = 0
var gateOne: CGFloat = 0
var gateTwo: CGFloat = 0
var gateThree: CGFloat = 0


// *** print("maxPheight: \(maxPHeight)")

// *** print("minPheight: \(minPHeight)")

if makeOne == 1 {

if cycle != 0 {

platformBeforeFirst = cycle - 1 + 8

} else {

platformBeforeFirst = cycle + 3 + 8 // was + 2 + 8 by mistake
}

if difOne <= difPer {


if platforms[platformBeforeFirst].parent != nil {
// *** print("platforms[platformBeforeFirst].physicsBody!.charge: \(platforms[platformBeforeFirst].physicsBody!.charge)")
// *** print("platformMinNA: \(platformMinNA)")
// *** print("maxPHeight: \(maxPHeight)")

if platforms[platformBeforeFirst].physicsBody!.charge + platformMinNA > maxPHeight { // if no critical area to worry about. Critical area is only higher than previous platform

platforms[cycle].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - platformMaxNA - 50)
// *** print("no critical area")
} else {

if platforms[platformBeforeFirst].physicsBody!.charge + platformMinNA <= maxPHeight {

secondMin1 = platforms[platformBeforeFirst].physicsBody!.charge + platformMaxNA + 1
secondMax1 = platforms[platformBeforeFirst].physicsBody!.charge + platformMinNA - 1

// *** print("secondMin1: \(secondMin1)")
// *** print("secondMax1: \(secondMax1)")


gateOne = CGFloat.random(min: 0, max: totalLength)

// *** print("totalLength: \(totalLength)")
// *** print("gateTwo: \(gateOne)")

// *** print("minPHeight: \(minPHeight)")

if gateOne > (secondMax1 - minPHeight) && maxPHeight > secondMin1 {


if maxPHeight - platforms[platformBeforeFirst].physicsBody!.charge > maxIncrease {

platforms[cycle].physicsBody!.charge = CGFloat.random(min: secondMin1, max: platforms[platformBeforeFirst].physicsBody!.charge + maxIncrease)
}

if maxPHeight - platforms[platformBeforeFirst].physicsBody!.charge <= maxIncrease {
platforms[cycle].physicsBody!.charge = CGFloat.random(min: secondMin1, max: maxPHeight)

}
// println("1 platforms[cycle].physicsBody!.charge: \(platforms[cycle].physicsBody!.charge)")
} else {

platforms[cycle].physicsBody!.charge = CGFloat.random(min: minPHeight, max: secondMax1)
//   println("2 platforms[cycle].physicsBody!.charge: \(platforms[cycle].physicsBody!.charge)")
}

}

}

}
}

if difOne > difPer && difTwo < 9 && LFW == 0 {



platforms[cycle].physicsBody!.charge = platforms[platformBeforeFirst].physicsBody!.charge + difPos



}

if difOne > difPer && difTwo < 9 && LFW == 1 {

platforms[cycle].physicsBody!.charge = difLowPos

}



if difTwo > 9 {

// *** print("ran difTwo == 10")
platforms[cycle].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - difMaxPos1500 - 5) // goes by highest difMaxPos


}



}




if makeTwo == 1 {


platforms[cpos].physicsBody!.angularDamping = CGFloat(cycle + 4) // REMOVED FOR OPENING WALLS TEST. PUT BACK

platforms[cpos].physicsBody!.linearDamping = 15000 // REMOVED FOR OPENING WALLS TEST. PUT BACK




// *** print("finished first platform charge")

if cycle != 0 {

platformBeforeSecond = cycle //- 1 + 8

} else {

platformBeforeSecond = cycle //+ 2 + 8
}

if difTwo <= difPer {

if platforms[platformBeforeSecond].parent != nil {

// *** print("platforms[platformBeforeSecond].physicsBody!.charge: \(platforms[platformBeforeSecond].physicsBody!.charge)")
// *** print("platformMinNA: \(platformMinNA)")
// *** print("maxPHeight: \(maxPHeight)")


if platforms[platformBeforeSecond].physicsBody!.charge + platformMinNA > maxPHeight { // if no critical area to worry about. Critical area is only higher than previous platform

platforms[cpos].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - platformMaxNA - 50)
// *** print("no critical area")

} else {

if platforms[platformBeforeSecond].physicsBody!.charge + platformMinNA <= maxPHeight {

secondMin2 = platforms[platformBeforeSecond].physicsBody!.charge + platformMaxNA + 1
secondMax2 = platforms[platformBeforeSecond].physicsBody!.charge + platformMinNA - 1

// *** print("secondMin2: \(secondMin2)")
// *** print("secondMax2: \(secondMax2)")


gateTwo = CGFloat.random(min: 0, max: totalLength)

// *** print("totalLength: \(totalLength)")
// *** print("gateTwo: \(gateTwo)")

// *** print("minPHeight: \(minPHeight)")

if gateTwo > (secondMax2 - minPHeight) && maxPHeight > secondMin2 {

if maxPHeight - platforms[platformBeforeSecond].physicsBody!.charge > maxIncrease {

platforms[cpos].physicsBody!.charge = CGFloat.random(min: secondMin2, max: platforms[platformBeforeSecond].physicsBody!.charge + maxIncrease)


}

if maxPHeight - platforms[platformBeforeSecond].physicsBody!.charge <= maxIncrease {


platforms[cpos].physicsBody!.charge = CGFloat.random(min: secondMin2, max: maxPHeight)
// *** print("1 platforms[cpos].physicsBody!.charge: \(platforms[cpos].physicsBody!.charge)")

}



} else {

platforms[cpos].physicsBody!.charge = CGFloat.random(min: minPHeight, max: secondMax2)
// *** print("2 platforms[cpos].physicsBody!.charge: \(platforms[cpos].physicsBody!.charge)")
}

}

}

}
}




//platforms[cpos].physicsBody!.charge = platforms[cycle].physicsBody!.charge + 310 // for test




if difTwo > difPer && difThree < 9 && LFW == 0{





platforms[cpos].physicsBody!.charge = platforms[platformBeforeSecond].physicsBody!.charge + difPos


}

if difTwo > difPer && difThree < 9 && LFW == 1 {





platforms[cpos].physicsBody!.charge = difLowPos


}




if difThree > 9 {

// *** print("ran difThree == 10")
platforms[cycle+4].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - difMaxPos1500 - 5) // goes by highest difMaxPos


}
}



if makeThree == 1 {

platforms[cpos2].physicsBody!.linearDamping = 15000 // REMOVED FOR OPENING WALLS TEST. PUT BACK
platforms[cpos2].physicsBody!.angularDamping = CGFloat(cycle + 8) // REMOVED FOR OPENING WALLS TEST. PUT BACK




// *** print("finished second platform charge")

if cycle != 0 {

platformBeforeThird = cycle + 4//- 1 + 8

} else {

platformBeforeThird = cycle + 4//+ 2 + 8
}


if difThree <= difPer {





if platforms[platformBeforeThird].parent != nil {

// *** print("platforms[platformBeforeThird].physicsBody!.charge: \(platforms[platformBeforeThird].physicsBody!.charge)")
// *** print("platformMinNA: \(platformMinNA)")
// *** print("maxPHeight: \(maxPHeight)")

if platforms[platformBeforeThird].physicsBody!.charge + platformMinNA > maxPHeight { // if no critical area to worry about. Critical area is only higher than previous platform
// *** print("no critical area")
platforms[cpos2].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - platformMaxNA - 50)

} else {

if platforms[platformBeforeThird].physicsBody!.charge + platformMinNA <= maxPHeight {

secondMin3 = platforms[platformBeforeThird].physicsBody!.charge + platformMaxNA + 1
secondMax3 = platforms[platformBeforeThird].physicsBody!.charge + platformMinNA - 1

// *** print("secondMin3: \(secondMin3)")
// *** print("secondMax3: \(secondMax3)")

gateThree = CGFloat.random(min: 0, max: totalLength)

// *** print("totalLength: \(totalLength)")
// *** print("gateThree: \(gateThree)")

// *** print("minPHeight: \(minPHeight)")

if gateThree > (secondMax3 - minPHeight) && maxPHeight > secondMin3 {

if maxPHeight - platforms[platformBeforeThird].physicsBody!.charge > maxIncrease {

platforms[cpos2].physicsBody!.charge = CGFloat.random(min: secondMin3, max: platforms[platformBeforeThird].physicsBody!.charge + maxIncrease)

}

if maxPHeight - platforms[platformBeforeThird].physicsBody!.charge <= maxIncrease {

platforms[cpos2].physicsBody!.charge = CGFloat.random(min: secondMin3, max: maxPHeight)

}


// *** print("1 platforms[cpos2].physicsBody!.charge: \(platforms[cpos2].physicsBody!.charge)")



} else {

platforms[cpos2].physicsBody!.charge = CGFloat.random(min: minPHeight, max: secondMax3)
// *** print("2 platforms[cpos2].physicsBody!.charge: \(platforms[cpos2].physicsBody!.charge)")
}

}

}

}
}


//platforms[cpos2].physicsBody!.charge = platforms[cpos].physicsBody!.charge + 310

// *** print("difOne before checking for 10 on makeThree: \(difOne)")

if difThree > difPer && difOne < 9 && LFW == 0 {





platforms[cpos2].physicsBody!.charge = platforms[platformBeforeThird].physicsBody!.charge + difPos


}


if difThree > difPer && difOne < 9 && LFW == 1 {





platforms[cpos2].physicsBody!.charge = difLowPos


}




if difOne > 9 {

// *** print("ran difOne == 10")
platforms[cycle+8].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - difMaxPos1500 - 5) // goes by highest difMaxPos


}



// *** print("finished third  platform charge")



if platforms[platformBeforeFirst].parent != nil {
// *** print("Y Pos difference P1 and P3(-1): \(platforms[cycle].physicsBody!.charge - platforms[platformBeforeFirst].physicsBody!.charge) P2 an P1: \(platforms[cpos].physicsBody!.charge - platforms[cycle].physicsBody!.charge) P3 and P2: \(platforms[cpos2].physicsBody!.charge - platforms[cpos].physicsBody!.charge)")
}

if platforms[platformBeforeFirst].parent == nil {
// *** print("Y Pos difference P2 an P1: \(platforms[cpos].physicsBody!.charge - platforms[cycle].physicsBody!.charge) P3 and P2: \(platforms[cpos2].physicsBody!.charge - platforms[cpos].physicsBody!.charge)")
}

//swmaxy - platformheight/2 - swgap //REMOVED FOR TEST PUT BACK
//    platforms[cpos].physicsBody!.charge = CGFloat.random(min: swminy - platformheight/2 + swgap/2, max: swmaxy - swgap/2 - platformheight/2)
//     platforms[cpos2].physicsBody!.charge = CGFloat.random(min: swminy - platformheight/2 + swgap/2, max: swmaxy - swgap/2 - platformheight/2) //swminy - platformheight/2

//DIFFICULTY TESTING:
/*
platforms[cycle].physicsBody!.charge = 0
platforms[cpos].physicsBody!.charge = 320
platforms[cpos2].physicsBody!.charge = 640
*/
//END DIFFICULTY TESTING

platforms[cycle].position.y = platforms[cycle].physicsBody!.charge
platforms[cpos].position.y = platforms[cpos].physicsBody!.charge
platforms[cpos2].position.y = platforms[cpos2].physicsBody!.charge

/* // REMOVED FOR VARIABLE WIDTH
platforms[cycle].position.x = platforms[cycle].position.x - firstswadjust //REMOVED FOR TEST PUT BACK
platforms[cpos].position.x = platforms[cpos].position.x - firstswadjust
platforms[cpos2].position.x  = platforms[cpos2].position.x - firstswadjust


vplatforms[cpos].position.x = platforms[cpos].position.x
vplatforms[cpos2].position.x = platforms[cpos2].position.x

vplatforms[self.cycle].position.x = platforms[self.cycle].position.x
*/

vplatforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle].size)
vplatforms[cycle].physicsBody!.dynamic = false
vplatforms[cycle].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[cycle].physicsBody!.friction = 0
vplatforms[cycle].physicsBody!.restitution = 0
vplatforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
vplatforms[self.cycle].position.y = platforms[self.cycle].position.y + 2048 - 2 //+ swgap
vplatforms[self.cycle].physicsBody!.linearDamping = 15000
vplatforms[cycle].name = "vplatform"
vplatforms[cycle].physicsBody!.angularDamping = CGFloat(cycle)

// Take out spikes for opening walls test
vplatforms[cpos].position.y = platforms[cpos].position.y + 2048 - 2//+ swgap
vplatforms[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cpos].size)
vplatforms[cpos].physicsBody!.dynamic = false
vplatforms[cpos].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[cpos].physicsBody!.friction = 0
vplatforms[cpos].physicsBody!.restitution = 0
vplatforms[cpos].name = "vplatform"
vplatforms[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
vplatforms[cpos].physicsBody!.linearDamping = 15000

vplatforms[cpos2].position.y = platforms[cpos2].position.y + 2048 - 2//+ swgap
vplatforms[cpos2].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cpos2].size)
vplatforms[cpos2].physicsBody!.dynamic = false
vplatforms[cpos2].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[cpos2].physicsBody!.friction = 0
vplatforms[cpos2].physicsBody!.linearDamping = 15000
vplatforms[cpos2].physicsBody!.restitution = 0
vplatforms[cpos2].name = "vplatform"
vplatforms[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cpos2].physicsBody!.collisionBitMask = PhysicsCategory.bird


vplatforms[cpos].physicsBody!.angularDamping = CGFloat(cycle + 4)
vplatforms[cpos2].physicsBody!.angularDamping = CGFloat(cycle + 8)

vplatforms[cycle].physicsBody!.charge = vplatforms[cycle].position.y
vplatforms[cpos].physicsBody!.charge = vplatforms[cpos].position.y
vplatforms[cpos2].physicsBody!.charge = vplatforms[cpos2].position.y


platforms[cycle].position.y = size.height/2
platforms[cpos].position.y = size.height/2
platforms[cpos2].position.y = size.height/2



platformcount = platformcount + 1
// *** print("platformcount: \(platformcount)")

if platformcount <= 5 {

coins[cycle].size.height = coinheight
coins[cycle].size.width = coinwidth
coins[cycle].position.x = vplatforms[cycle].position.x
coins[cycle].position.y = CGRectGetMinY(vplatforms[cycle].frame)

coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cycle].physicsBody!.contactTestBitMask = 0
coins[cycle].physicsBody!.collisionBitMask = 0
coins[cycle].physicsBody!.affectedByGravity = false
coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
coins[cycle].name = "coin"
coins[cycle].zPosition = 2
coins[cycle].hidden = true
backgroundLayer.addChild(coins[cycle])
// *** print("coin1pos: \(coins[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")


}

if platformcount > 5 && platformcount <= 10 {

coins2[cycle].size.height = coinheight
coins2[cycle].size.width = coinwidth
coins2[cycle].position.x = vplatforms[cycle].position.x
coins2[cycle].position.y = CGRectGetMinY(vplatforms[cycle].frame)
coins2[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins2[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins2[cycle].physicsBody!.contactTestBitMask = 0
coins2[cycle].physicsBody!.collisionBitMask = 0
coins2[cycle].physicsBody!.affectedByGravity = false
coins2[cycle].physicsBody!.angularDamping = CGFloat(cycle)
coins2[cycle].name = "coin2"
coins2[cycle].zPosition = 2
coins2[cycle].hidden = true
backgroundLayer.addChild(coins2[cycle])
// *** print("coin1pos: \(coins2[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")


}

if platformcount > 10 {

coins3[cycle].size.height = coinheight
coins3[cycle].size.width = coinwidth
coins3[cycle].position.x = vplatforms[cycle].position.x

coins3[cycle].position.y = CGRectGetMinY(vplatforms[cycle].frame)

coins3[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins3[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins3[cycle].physicsBody!.contactTestBitMask = 0
coins3[cycle].physicsBody!.collisionBitMask = 0
coins3[cycle].physicsBody!.affectedByGravity = false
coins3[cycle].physicsBody!.angularDamping = CGFloat(cycle)
coins3[cycle].name = "coin3"
coins3[cycle].zPosition = 2
coins3[cycle].hidden = true
backgroundLayer.addChild(coins3[cycle])
// *** print("coin1pos: \(coins3[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")


}

platformcount = platformcount + 1
// *** print("platformcount: \(platformcount)")
if platformcount <= 5 {

coins[cpos].size.height = coinheight
coins[cpos].size.width = coinwidth
coins[cpos].position.x = vplatforms[cpos].position.x
coins[cpos].position.y = CGRectGetMinY(vplatforms[cpos].frame)
coins[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cpos].physicsBody!.contactTestBitMask = 0
coins[cpos].physicsBody!.collisionBitMask = 0
coins[cpos].physicsBody!.affectedByGravity = false
coins[cpos].physicsBody!.angularDamping = CGFloat(cpos)
coins[cpos].name = "coin"
coins[cpos].zPosition = 2
coins[cpos].hidden = true
backgroundLayer.addChild(coins[cpos])

}

if platformcount > 5 && platformcount <= 10 {

coins2[cpos].size.height = coinheight
coins2[cpos].size.width = coinwidth
coins2[cpos].position.x = vplatforms[cpos].position.x
coins2[cpos].position.y = CGRectGetMinY(vplatforms[cpos].frame)
coins2[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins2[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins2[cpos].physicsBody!.contactTestBitMask = 0
coins2[cpos].physicsBody!.collisionBitMask = 0
coins2[cpos].physicsBody!.affectedByGravity = false
coins2[cpos].physicsBody!.angularDamping = CGFloat(cpos)
coins2[cpos].name = "coin2"
coins2[cpos].zPosition = 2
coins2[cpos].hidden = true
backgroundLayer.addChild(coins2[cpos])

}

if platformcount > 10 {

coins3[cpos].size.height = coinheight
coins3[cpos].size.width = coinwidth
coins3[cpos].position.x = vplatforms[cpos].position.x
coins3[cpos].position.y = CGRectGetMinY(vplatforms[cpos].frame)
coins3[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins3[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins3[cpos].physicsBody!.contactTestBitMask = 0
coins3[cpos].physicsBody!.collisionBitMask = 0
coins3[cpos].physicsBody!.affectedByGravity = false
coins3[cpos].physicsBody!.angularDamping = CGFloat(cpos)
coins3[cpos].name = "coin3"
coins3[cpos].zPosition = 2
coins3[cpos].hidden = true
backgroundLayer.addChild(coins3[cpos])

}

platformcount = platformcount + 1
// *** print("platformcount: \(platformcount)")
if platformcount <= 5 {

coins[cpos2].size.height = coinheight
coins[cpos2].size.width = coinwidth
coins[cpos2].position.x = vplatforms[cpos2].position.x
coins[cpos2].position.y = CGRectGetMinY(vplatforms[cpos2].frame)
coins[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins[cpos2].physicsBody!.contactTestBitMask = 0
coins[cpos2].physicsBody!.collisionBitMask = 0
coins[cpos2].physicsBody!.affectedByGravity = false
coins[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
coins[cpos2].name = "coin"
coins[cpos2].zPosition = 2
coins[cpos2].hidden = true


backgroundLayer.addChild(coins[cpos2])
}

if platformcount > 5 && platformcount <= 10 {

coins2[cpos2].size.height = coinheight
coins2[cpos2].size.width = coinwidth
coins2[cpos2].position.x = vplatforms[cpos2].position.x
coins2[cpos2].position.y = CGRectGetMinY(vplatforms[cpos2].frame)
coins2[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins2[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins2[cpos2].physicsBody!.contactTestBitMask = 0
coins2[cpos2].physicsBody!.collisionBitMask = 0
coins2[cpos2].physicsBody!.affectedByGravity = false
coins2[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
coins2[cpos2].name = "coin2"
coins2[cpos2].zPosition = 2
coins2[cpos2].hidden = true

backgroundLayer.addChild(coins2[cpos2])
}

if platformcount > 10 {

coins3[cpos2].size.height = coinheight
coins3[cpos2].size.width = coinwidth
coins3[cpos2].position.x = vplatforms[cpos2].position.x
coins3[cpos2].position.y = CGRectGetMinY(vplatforms[cpos2].frame)
coins3[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
coins3[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
coins3[cpos2].physicsBody!.contactTestBitMask = 0
coins3[cpos2].physicsBody!.collisionBitMask = 0
coins3[cpos2].physicsBody!.affectedByGravity = false
coins3[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
coins3[cpos2].name = "coin3"
coins3[cpos2].zPosition = 2
coins3[cpos2].hidden = true

backgroundLayer.addChild(coins3[cpos2])
}


// *** print("post platformcount: \(platformcount)")
// End take out extras for opening walls test

/*
var extracontact: CGFloat = 0

breakwalls[cycle].size.height = swgap + 2
breakwalls[cycle].size.width = platformwidth + extracontact
breakwalls[cycle].zPosition = 100000
breakwalls[cycle].position.y = CGRectGetMaxY(platforms[cycle].frame) + breakwalls[cycle].size.height/2
breakwalls[cycle].position.x = platforms[cycle].position.x
breakwalls[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: breakwallphysicsbody.size)
breakwalls[cycle].physicsBody!.dynamic = false
breakwalls[cycle].physicsBody!.usesPreciseCollisionDetection = true
breakwalls[cycle].physicsBody!.friction = 0
breakwalls[cycle].physicsBody!.restitution = 0
breakwalls[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
breakwalls[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
breakwalls[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
breakwalls[cycle].name = "breakwall"

breakwalls[cpos].size.height = swgap + 2
breakwalls[cpos].size.width = platformwidth + extracontact
breakwalls[cpos].zPosition = 100000
breakwalls[cpos].position.y = CGRectGetMaxY(platforms[cpos].frame) + breakwalls[cpos].size.height/2
breakwalls[cpos].position.x = platforms[cpos].position.x
breakwalls[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: breakwallphysicsbody.size)
breakwalls[cpos].physicsBody!.dynamic = false
breakwalls[cpos].physicsBody!.usesPreciseCollisionDetection = true
breakwalls[cpos].physicsBody!.friction = 0
breakwalls[cpos].physicsBody!.restitution = 0
breakwalls[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
breakwalls[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
breakwalls[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
breakwalls[cpos].name = "breakwall"

breakwalls[cpos2].size.height = swgap + 2
breakwalls[cpos2].size.width = platformwidth + extracontact
breakwalls[cpos2].zPosition = 100000
breakwalls[cpos2].position.y = CGRectGetMaxY(platforms[cpos2].frame) + breakwalls[cpos2].size.height/2
breakwalls[cpos2].position.x = platforms[cpos2].position.x
breakwalls[cpos2].physicsBody = SKPhysicsBody(rectangleOfSize: breakwallphysicsbody.size)
breakwalls[cpos2].physicsBody!.dynamic = false
breakwalls[cpos2].physicsBody!.usesPreciseCollisionDetection = true
breakwalls[cpos2].physicsBody!.friction = 0
breakwalls[cpos2].physicsBody!.restitution = 0
breakwalls[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.block
breakwalls[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
breakwalls[cpos2].physicsBody!.collisionBitMask = PhysicsCategory.bird
breakwalls[cpos2].name = "breakwall"

self.backgroundLayer.addChild(breakwalls[cycle])
self.backgroundLayer.addChild(breakwalls[cpos])
self.backgroundLayer.addChild(breakwalls[cpos2])

*/

// *** print("correct meeting? vplatform bottom: \(CGRectGetMinY(vplatforms[self.cycle].frame)) platform top: \(CGRectGetMaxY(platforms[self.cycle].frame))")



spikes[self.spikearraypos].size.width = spikewidth // was 42 8/3/15
spikes[self.spikearraypos].size.height = spikeheight // was 42 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0

spikes[self.spikearraypos].position.y = platformheight/2 - 3 + (spikes[self.spikearraypos].size.height)/2

//CGPoint(x: platforms[self.cycle].position.x , y: CGRectGetMaxY(platforms[self.cycle].frame) + 25)


//spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike //.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].physicsBody!.collisionBitMask = 0
//  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))

//  self.backgroundLayer.addChild(spikes[self.spikearraypos])
spikes[self.spikearraypos].name = "spike"
platforms[self.cycle].addChild(spikes[self.spikearraypos])


//     println("spikearraypos: \(spikearraypos)")

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}



spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0
spikes[self.spikearraypos].position.y = -vplatformheight/2 - spikes[self.spikearraypos].size.height/2


// spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].physicsBody!.collisionBitMask = 0
//  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159, duration: 0))
spikes[self.spikearraypos].zRotation = 3.14159265
spikes[self.spikearraypos].name = "spike"
vplatforms[self.cycle].addChild(spikes[self.spikearraypos])




if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}





// Take out spikes for opening walls test

//     println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0
spikes[self.spikearraypos].position.y = platformheight/2 + spikes[self.spikearraypos].size.height/2 - 3




// spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike //.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].physicsBody!.collisionBitMask = 0
//  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
//self.backgroundLayer.addChild(spikes[self.spikearraypos])
spikes[self.spikearraypos].name = "spike"
platforms[cpos].addChild(spikes[self.spikearraypos])


if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}
//       println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0

spikes[self.spikearraypos].position.y = platformheight/2 + spikes[self.spikearraypos].size.height/2 - 3


//   spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike //.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].physicsBody!.collisionBitMask = 0
//  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
// self.backgroundLayer.addChild(spikes[self.spikearraypos])
spikes[self.spikearraypos].name = "spike"
platforms[cpos2].addChild(spikes[self.spikearraypos])



if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}
//       println("spikearraypos: \(spikearraypos)")
//        println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0
spikes[self.spikearraypos].position.y = -vplatformheight/2 - spikes[self.spikearraypos].size.height/2


//     spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].physicsBody!.collisionBitMask = 0
//  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
spikes[self.spikearraypos].zRotation = 3.14159265
spikes[self.spikearraypos].name = "spike"
vplatforms[cpos].addChild(spikes[self.spikearraypos])




if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}
//        println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = 0
spikes[self.spikearraypos].position.y = -vplatformheight/2 - spikes[self.spikearraypos].size.height/2


//    spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].physicsBody!.collisionBitMask = 0
//  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
spikes[self.spikearraypos].zRotation = 3.14159265
spikes[self.spikearraypos].name = "spike"
vplatforms[cpos2].addChild(spikes[self.spikearraypos])




if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0


}


//      println("spikearraypos: \(spikearraypos)")

//End take out spikes for opening walls test

if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(platforms[cpos].frame)
posC = CGRectGetMaxX(platforms[cpos2].frame)

posAs = 1
posBs = 1

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(platforms[cpos].frame)
posF = CGRectGetMaxX(platforms[cpos2].frame)
// *** print("score1: \(score1)")

posDs = 1
posEs = 1
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(platforms[cpos].frame)
posI = CGRectGetMaxX(platforms[cpos2].frame)

posGs = 1
posHs = 1

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(platforms[cpos].frame)
posL = CGRectGetMaxX(platforms[cpos2].frame)

posJs = 1
posKs = 1

}

vh1 = 0
vh2 = 0
vh3 = 0

pw1 = 0
pw2 = 0
pw3 = 0

vw1 = 0
vw2 = 0
vw3 = 0

ph1 = 0
ph2 = 0
ph3 = 0

/*let platform1 = SKSpriteNode(imageNamed: "barrier")
let platform2 = SKSpriteNode(imageNamed: "barrier")
let platform3 = SKSpriteNode(imageNamed: "barrier")
let platform4 = SKSpriteNode(imageNamed: "barrier")
let platform5 = SKSpriteNode(imageNamed: "barrier") */

/*  if GameState.sharedInstance.score > 10 {
shrink = 0.7
}*/

/*    platform1.size.width = shrink*make3size/7
platform1.size.height = 1600
platform1.zPosition = 100
platform1.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: -100), fromNode: self)
platform1.physicsBody = SKPhysicsBody(rectangleOfSize: platform1.size)
platform1.physicsBody!.usesPreciseCollisionDetection = true
platform1.physicsBody!.dynamic = false
platform1.physicsBody!.friction = 0
platform1.physicsBody!.restitution = 0
platform1.physicsBody!.categoryBitMask = PhysicsCategory.block
platform1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform1.name = "platform"
self.backgroundLayer.addChild(platform1)


platform2.size.width = shrink*make3size/7
platform2.size.height = 600
platform2.zPosition = 100
platform2.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: self.size.height - platform2.size.height/2), fromNode: self)
platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform2.physicsBody!.dynamic = false
platform2.physicsBody!.usesPreciseCollisionDetection = true
platform2.physicsBody!.friction = 0
platform2.physicsBody!.restitution = 0
platform2.physicsBody!.categoryBitMask = PhysicsCategory.block
platform2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform2.name = "platform"
self.backgroundLayer.addChild(platform2)

platform3.size.width = shrink*make3size/7
platform3.size.height = 700
platform3.zPosition = 100
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/3 + make3size/6, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = true
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3)

platform4.size.width = shrink*make3size/7
platform4.size.height = 600
platform4.zPosition = 100
platform4.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/3 + make3size/6, y: self.size.height - platform4.size.height/2), fromNode: self)
platform4.physicsBody = SKPhysicsBody(rectangleOfSize: platform4.size)
platform4.physicsBody!.dynamic = false
platform4.physicsBody!.usesPreciseCollisionDetection = true
platform4.physicsBody!.friction = 0
platform4.physicsBody!.restitution = 0
platform4.physicsBody!.categoryBitMask = PhysicsCategory.block
platform4.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform4.name = "platform"
self.backgroundLayer.addChild(platform4)

platform5.size.width = shrink*make3size/7
platform5.size.height = 700
platform5.zPosition = 100
platform5.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 2*make3size/3 + make3size/6, y: platform3.size.height/2), fromNode: self)
platform5.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform5.physicsBody!.dynamic = false
platform5.physicsBody!.usesPreciseCollisionDetection = true
platform5.physicsBody!.friction = 0
platform5.physicsBody!.restitution = 0
platform5.physicsBody!.categoryBitMask = PhysicsCategory.block
platform5.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform5.name = "platform"
self.backgroundLayer.addChild(platform5) */
}
}


/*if rolldice == -1 {

// slide on too tall platform, slide on vplatform, land on falling platform:


println("makes3 100101")
make3("100101")

platforms[cycle].position.y = -400 // -100
vplatforms[cycle].position.y = 2048// 2048 //2048
//      platforms[cycle+4].position.y = -4000
platforms[cycle+8].position.y = 300



platforms[cycle].position.x = platforms[cycle].position.x + 300
vplatforms[cycle].position.x = vplatforms[cycle].position.x + 300
platforms[cycle+8].position.x = platforms[cycle+8].position.x // 5/6*
//      platforms[cycle+4].position.x = 2*make3size + make3size/6






//       vplatforms[self.cycle+4].size.height = 950
//       vplatforms[self.cycle+4].position.y = self.size.height - vplatforms[self.cycle+4].size.height/2

//self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/2.2, y: self.size.height - vplatforms[self.cycle+4].size.height/2), fromNode: self)
vplatforms[self.cycle].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[self.cycle].size)
vplatforms[self.cycle].physicsBody!.dynamic = false
vplatforms[self.cycle].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[self.cycle].physicsBody!.friction = 0
vplatforms[self.cycle].physicsBody!.mass = 100
vplatforms[self.cycle].physicsBody!.restitution = 0
vplatforms[self.cycle].physicsBody!.categoryBitMask = PhysicsCategory.block //& PhysicsCategory.vplatform
vplatforms[self.cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[self.cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird

println("vplatform physicscategory: \(vplatforms[self.cycle].physicsBody?.categoryBitMask)")

trees[self.cycle].size.height = self.size.height - CGRectGetMaxY(self.ground.frame)
trees[self.cycle].size.width = 375
trees[self.cycle].position.x = (CGRectGetMinX(vplatforms[self.cycle].frame) + CGRectGetMaxX(platforms[self.cycle].frame))/2 - 200
trees[self.cycle].position.y = CGFloat(self.size.height)*CGFloat(0.5) + CGFloat(0.5)*CGFloat(CGRectGetMaxY(self.ground.frame))
trees[self.cycle].zPosition = 2

self.backgroundLayer.addChild(trees[self.cycle])


//End slide on too tall platform
} */

/*if rolldice > 10000 {//> 1.2 && rolldice <= 1.3 { // && GameState.sharedInstance.score != 6 && GameState.sharedInstance.score != 7 && GameState.sharedInstance.score != 8 //&& GameState.sharedInstance.score != 24 && GameState.sharedInstance.score != 25 && GameState.sharedInstance.score != 26


pw1 = 228
pw2 = 228

make3("110111")

platforms[self.cycle].name = "vplatform" // to turn off 'dx = 0'
//  platforms[self.cycle].color = UIColor.blueColor()
//    platforms[self.cycle].colorBlendFactor = 1.0f

platforms[self.cycle+4].name = "vplatform" // to turn off 'dx = 0'
vplatforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle].size)
vplatforms[cycle].physicsBody!.dynamic = false
vplatforms[cycle].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[cycle].physicsBody!.friction = 0
vplatforms[cycle].physicsBody!.restitution = 0
vplatforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird

vplatforms[self.cycle].position.y = platforms[self.cycle].position.y + 900

vplatforms[self.cycle+4].position.y = platforms[self.cycle+4].position.y + 900
vplatforms[self.cycle+4].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[self.cycle+4].size)
vplatforms[self.cycle+4].physicsBody!.dynamic = false
vplatforms[self.cycle+4].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[self.cycle+4].physicsBody!.friction = 0
vplatforms[self.cycle+4].physicsBody!.restitution = 0
vplatforms[self.cycle+4].name = "vplatform"
vplatforms[self.cycle+4].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[self.cycle+4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[self.cycle+4].physicsBody!.collisionBitMask = PhysicsCategory.bird

if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(platforms[cycle+4].frame)
posC = CGRectGetMaxX(platforms[cycle+8].frame)

posAs = 1
posBs = 1

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(platforms[cycle+4].frame)
posF = CGRectGetMaxX(platforms[cycle+8].frame)
println("score1: \(score1)")

posDs = 1
posEs = 1
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(platforms[cycle+4].frame)
posI = CGRectGetMaxX(platforms[cycle+8].frame)

posGs = 1
posHs = 1

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(platforms[cycle+4].frame)
posL = CGRectGetMaxX(platforms[cycle+8].frame)

posJs = 1
posKs = 1

}

pw1 = 0
pw2 = 0

/*let platform1 = SKSpriteNode(imageNamed: "barrier")
let platform2 = SKSpriteNode(imageNamed: "barrier")
let platform3 = SKSpriteNode(imageNamed: "barrier")
let platform4 = SKSpriteNode(imageNamed: "barrier")
let platform5 = SKSpriteNode(imageNamed: "barrier") */

/*  if GameState.sharedInstance.score > 10 {
shrink = 0.7
}*/

/*    platform1.size.width = shrink*make3size/7
platform1.size.height = 1600
platform1.zPosition = 100
platform1.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: -100), fromNode: self)
platform1.physicsBody = SKPhysicsBody(rectangleOfSize: platform1.size)
platform1.physicsBody!.usesPreciseCollisionDetection = true
platform1.physicsBody!.dynamic = false
platform1.physicsBody!.friction = 0
platform1.physicsBody!.restitution = 0
platform1.physicsBody!.categoryBitMask = PhysicsCategory.block
platform1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform1.name = "platform"
self.backgroundLayer.addChild(platform1)


platform2.size.width = shrink*make3size/7
platform2.size.height = 600
platform2.zPosition = 100
platform2.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: self.size.height - platform2.size.height/2), fromNode: self)
platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform2.physicsBody!.dynamic = false
platform2.physicsBody!.usesPreciseCollisionDetection = true
platform2.physicsBody!.friction = 0
platform2.physicsBody!.restitution = 0
platform2.physicsBody!.categoryBitMask = PhysicsCategory.block
platform2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform2.name = "platform"
self.backgroundLayer.addChild(platform2)

platform3.size.width = shrink*make3size/7
platform3.size.height = 700
platform3.zPosition = 100
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/3 + make3size/6, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = true
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3)

platform4.size.width = shrink*make3size/7
platform4.size.height = 600
platform4.zPosition = 100
platform4.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/3 + make3size/6, y: self.size.height - platform4.size.height/2), fromNode: self)
platform4.physicsBody = SKPhysicsBody(rectangleOfSize: platform4.size)
platform4.physicsBody!.dynamic = false
platform4.physicsBody!.usesPreciseCollisionDetection = true
platform4.physicsBody!.friction = 0
platform4.physicsBody!.restitution = 0
platform4.physicsBody!.categoryBitMask = PhysicsCategory.block
platform4.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform4.name = "platform"
self.backgroundLayer.addChild(platform4)

platform5.size.width = shrink*make3size/7
platform5.size.height = 700
platform5.zPosition = 100
platform5.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 2*make3size/3 + make3size/6, y: platform3.size.height/2), fromNode: self)
platform5.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform5.physicsBody!.dynamic = false
platform5.physicsBody!.usesPreciseCollisionDetection = true
platform5.physicsBody!.friction = 0
platform5.physicsBody!.restitution = 0
platform5.physicsBody!.categoryBitMask = PhysicsCategory.block
platform5.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform5.name = "platform"
self.backgroundLayer.addChild(platform5) */
}








/*
if rolldice >= 0.4 && rolldice <= 1.04 { // && GameState.sharedInstance.score != 6 && GameState.sharedInstance.score != 7 && GameState.sharedInstance.score != 8 //&& GameState.sharedInstance.score != 24 && GameState.sharedInstance.score != 25 && GameState.sharedInstance.score != 26


/*  let platform1 = SKSpriteNode(imageNamed: "barrier")
let platform2 = SKSpriteNode(imageNamed: "barrier")
let platform3 = SKSpriteNode(imageNamed: "barrier")

if GameState.sharedInstance.score > 10 {
shrink = 0.7
} */
//    println("\(darts[self.dartarraypos].position)")
//     println("DC 0: \(CGRectGetMaxX(dartcatchers[0].frame)) DC1: \(CGRectGetMaxX(dartcatchers[1].frame)) DC2: \(CGRectGetMaxX(dartcatchers[2].frame)) DC3: \(CGRectGetMaxX(dartcatchers[3].frame))")

make3("000111")

platforms[cycle].position.y = CGFloat.random(min: -348, max: 200)
platforms[cycle+4].position.y = CGFloat.random(min: -348, max: 0)
platforms[cycle+8].position.y = CGFloat.random(min: -348, max: 0)

if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(platforms[cycle+4].frame)
posC = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(platforms[cycle+4].frame)
posF = CGRectGetMaxX(platforms[cycle+8].frame)
println("score1: \(score1)")
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(platforms[cycle+4].frame)
posI = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(platforms[cycle+4].frame)
posL = CGRectGetMaxX(platforms[cycle+8].frame)

}


//   scoreVar[cycle][0] = CGRectGetMaxX(platforms[cycle].frame)
//   scoreVar[cycle][1] = CGRectGetMaxX(platforms[cycle].frame)
//   scoreVar[cycle][2] = CGRectGetMaxX(platforms[cycle].frame)
//   println("scorevar cycle: \(scoreVar[cycle][0])")
//   println("scorevar calc: \(CGRectGetMaxX(platforms[cycle].frame))")

/*    platform1.size.width = shrink*make3size/7
platform1.size.height = 1600
platform1.zPosition = 100
platform1.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: -100), fromNode: self)
platform1.physicsBody = SKPhysicsBody(rectangleOfSize: platform1.size)
platform1.physicsBody!.usesPreciseCollisionDetection = true
platform1.physicsBody!.dynamic = false
platform1.physicsBody!.friction = 0
platform1.physicsBody!.restitution = 0
platform1.physicsBody!.categoryBitMask = PhysicsCategory.block
platform1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform1.name = "platform"
self.backgroundLayer.addChild(platform1)


platform2.size.width = shrink*make3size/7
platform2.size.height = 700
platform2.zPosition = 100
platform2.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/3 + make3size/6, y: platform2.size.height/2), fromNode: self)
platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform2.physicsBody!.dynamic = false
platform2.physicsBody!.usesPreciseCollisionDetection = true
platform2.physicsBody!.friction = 0
platform2.physicsBody!.restitution = 0
platform2.physicsBody!.categoryBitMask = PhysicsCategory.block
platform2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform2.name = "platform"
self.backgroundLayer.addChild(platform2)

platform3.size.width = shrink*make3size/7
platform3.size.height = 700
platform3.zPosition = 100
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 2*make3size/3 + make3size/6, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = true
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3) */


//let dartcatcher = SKSpriteNode(imageNamed: "barrier")



dartcatchers[self.cycle].size.width = make3size
dartcatchers[self.cycle].size.height = 60
dartcatchers[self.cycle].position.x = platforms[self.cycle].position.x + 1024

dartcatchers[self.cycle].position.y = -100 //-100 - dartcatchers[self.cycle].size.height/2) //  // x: make3size/2 +  ///self.backgroundLayer.convertPoint(    , fromNode: self)





println("\(self.cycle)")
dartcatchers[self.cycle].physicsBody = SKPhysicsBody(rectangleOfSize: dartcatchers[self.cycle].size)
dartcatchers[self.cycle].physicsBody!.dynamic = false
dartcatchers[self.cycle].physicsBody!.friction = 0
dartcatchers[self.cycle].physicsBody!.restitution = 0
dartcatchers[self.cycle].physicsBody!.categoryBitMask = PhysicsCategory.dartcatcher
dartcatchers[self.cycle].physicsBody!.contactTestBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].physicsBody?.collisionBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].zPosition = 2
self.backgroundLayer.addChild(dartcatchers[self.cycle])



if self.dart1 > 0.0 { // was 0.5
darts[self.dartarraypos].position.x = (CGRectGetMaxX(platforms[self.cycle].frame)  + CGRectGetMinX(platforms[self.cycle+4].frame))/2

darts[self.dartarraypos].position.y = -50
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 2
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 //CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.friction = CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "dart"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position.x = darts[self.dartarraypos].position.x

dartducts[self.dartarraypos].position.y = 250

dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 2
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
// println("\(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

}

if self.dart2 > 0.0 { // was 0.5
darts[self.dartarraypos].position.x = (CGRectGetMaxX(platforms[self.cycle+4].frame) + CGRectGetMinX(platforms[self.cycle+8].frame))/2

darts[self.dartarraypos].position.y = -50
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 2
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 // CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.friction = CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "dart"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position.x = darts[self.dartarraypos].position.x

dartducts[self.dartarraypos].position.y = 250
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 3
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
//  println("\(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

}

if self.dart3 > 0.0 { // > 0.5
darts[self.dartarraypos].position.x = ceil(CGRectGetMaxX(platforms[self.cycle+6].frame)/2048)*2048

darts[self.dartarraypos].position.y = -50 //self.scrollcount*2048 + 3*2048
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size)
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 2
darts[self.dartarraypos].physicsBody!.dynamic = true
darts[self.dartarraypos].physicsBody!.restitution = 0 //CGFloat.random(min: 275, max: 350)*0.0001
darts[self.dartarraypos].physicsBody!.friction = CGFloat.random(min: 275, max: 350)*0.0001 // *0.0001
darts[self.dartarraypos].physicsBody!.allowsRotation = false
darts[self.dartarraypos].physicsBody!.mass = 0.160000011324883
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.dart
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird | PhysicsCategory.dartcatcher
darts[self.dartarraypos].physicsBody!.collisionBitMask = PhysicsCategory.dartcatcher
darts[self.dartarraypos].name = "dart" // "inbtwdart"
self.backgroundLayer.addChild(darts[self.dartarraypos])
dartducts[self.dartarraypos].position.x = darts[self.dartarraypos].position.x

dartducts[self.dartarraypos].position.y = 250
dartducts[self.dartarraypos].size.width = 50
dartducts[self.dartarraypos].size.height = 50
dartducts[self.dartarraypos].zPosition = 3
dartducts[self.dartarraypos].name = "inbtwduct"
self.backgroundLayer.addChild(dartducts[self.dartarraypos])
println("inbtw dart position: \(darts[self.dartarraypos].position)")

if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

}


/*  if self.backgroundA1count < self.scrollcount - 1 {
self.backgroundA1count = self.scrollcount + 2
} else if self.backgroundA2count < self.scrollcount - 1 {
self.backgroundA2count = self.scrollcount + 2
} else if self.backgroundA3count < self.scrollcount - 1 {
self.backgroundA3count = self.scrollcount + 2
} else if self.backgroundA4count < self.scrollcount - 1 {
self.backgroundA4count = self.scrollcount + 2
} */


/*  if self.backgroundA1count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA1count = self.scrollcount + 2
self.setA = 1
}

if self.backgroundA2count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA2count = self.scrollcount + 2
self.setA = 1
}

if self.backgroundA3count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA3count = self.scrollcount + 2
self.setA = 1
}

if self.backgroundA4count < self.scrollcount - 1 && self.setA == 0 {
self.backgroundA4count = self.scrollcount + 2
self.setA = 1
} */
}




/*

if rolldice >= 0.3 && rolldice <= 0.4  { // && GameState.sharedInstance.score != 6 && GameState.sharedInstance.score != 7 && GameState.sharedInstance.score != 8 //&& GameState.sharedInstance.score != 24 && GameState.sharedInstance.score != 25 && GameState.sharedInstance.score != 26


/* let platform1 = SKSpriteNode(imageNamed: "barrier")
let platform2 = SKSpriteNode(imageNamed: "barrier")
let platform3 = SKSpriteNode(imageNamed: "barrier") */

if GameState.sharedInstance.score > 10 {
//  shrink = 0.7
}

if self.vspike > 3 {

ph3 = 1000
}


make3("010101")

ph3 = 0

if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(vplatforms[cycle+4].frame)
posC = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(vplatforms[cycle+4].frame)
posF = CGRectGetMaxX(platforms[cycle+8].frame)
println("score1: \(score1)")
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(vplatforms[cycle+4].frame)
posI = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(vplatforms[cycle+4].frame)
posL = CGRectGetMaxX(platforms[cycle+8].frame)

}


vplatforms[self.cycle+4].size.height = 950
vplatforms[self.cycle+4].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/2.2, y: self.size.height - vplatforms[self.cycle+4].size.height/2), fromNode: self)
vplatforms[self.cycle+4].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[self.cycle+4].size)
vplatforms[self.cycle+4].physicsBody!.dynamic = false
vplatforms[self.cycle+4].physicsBody!.usesPreciseCollisionDetection = true
vplatforms[self.cycle+4].physicsBody!.friction = 0
vplatforms[self.cycle+4].physicsBody!.restitution = 0
vplatforms[self.cycle+4].physicsBody!.categoryBitMask = PhysicsCategory.block
vplatforms[self.cycle+4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
vplatforms[self.cycle+4].physicsBody!.collisionBitMask = PhysicsCategory.bird

trees[self.cycle].size.height = self.size.height - CGRectGetMaxY(self.ground.frame)
trees[self.cycle].size.width = 375
trees[self.cycle].position.x = (CGRectGetMinX(vplatforms[self.cycle+4].frame) + CGRectGetMaxX(platforms[self.cycle].frame))/2 - 200
trees[self.cycle].position.y = CGFloat(self.size.height)*CGFloat(0.5) + CGFloat(0.5)*CGFloat(CGRectGetMaxY(self.ground.frame))
trees[self.cycle].zPosition = 2

self.backgroundLayer.addChild(trees[self.cycle])






/*  platform2.size.width = shrink*make3size/5
platform2.size.height = 700
platform2.zPosition = 100
platform2.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: platform2.size.height/2), fromNode: self)
platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform2.physicsBody!.dynamic = false
platform2.physicsBody!.usesPreciseCollisionDetection = false
platform2.physicsBody!.friction = 0
platform2.physicsBody!.restitution = 0
platform2.physicsBody!.categoryBitMask = PhysicsCategory.block
platform2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform2.name = "platform"
self.backgroundLayer.addChild(platform2)

platform1.size.width = make3size/20
platform1.size.height = 1025
platform1.zPosition = 100
platform1.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/2.2, y: self.size.height - platform1.size.height/2), fromNode: self) // was x: make3size*2 + platform1.size.width
platform1.physicsBody = SKPhysicsBody(rectangleOfSize: platform1.size)
platform1.physicsBody!.usesPreciseCollisionDetection = false
platform1.physicsBody!.dynamic = false
platform1.physicsBody!.friction = 0
platform1.physicsBody!.restitution = 0
platform1.physicsBody!.categoryBitMask = PhysicsCategory.block
platform1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform1.name = "vplatform"
self.backgroundLayer.addChild(platform1) */




/*let spike = SKSpriteNode(imageNamed: "Spike")
let dart = SKSpriteNode(imageNamed: "Stalagmite")*/

/* BEGIN SPIKES
self.spike1 = 0.6 //CGFloat.random(min: 0, max: 1)

if self.spike1 > 0.5 {

if self.vspike > 3 {



/*     old, to make dart instead of spike [ dart did not shoot though, there is an error]
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 100
darts[self.dartarraypos].position = CGPoint(x: CGRectGetMaxX(vplatforms[self.cycle+4].frame) + darts[self.dartarraypos].size.width/2, y: CGRectGetMinY(vplatforms[self.cycle+4].frame) + 200 ) // CGRectGetMaxX(platforms[self.cycle+4].frame) + spike.size.width/2

//self.backgroundLayer.convertPoint(CGPoint(x: maxx + spikesize/2, y: self.topfloor + spike.size.height/2), fromNode: self) // not sure about this position
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
darts[self.dartarraypos].physicsBody!.dynamic = false
darts[self.dartarraypos].physicsBody?.affectedByGravity = false
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
darts[self.dartarraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
darts[self.dartarraypos].name = "sidedart"
self.backgroundLayer.addChild(darts[self.dartarraypos])


if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

} */

spikes[self.spikearraypos].size.width = 50
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMinX(platforms[self.cycle+8].frame) - 25, y: CGRectGetMaxY(ground.frame) + spikes[self.spikearraypos].size.width/2 )


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
//   spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])




if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}


if self.vspike == 4 {
self.vspike = self.vspike + 1
}

//      platforms[self.cycle+8].runAction(SKAction.removeFromParent())

//     to increase height/

//       ph3 = 1200

println("cycle before make3000001 adjustment : \(self.cycle)")

/*      if cycle == 0 { // MAKE SURE THIS IS SUFFICIENT TO RESET THE EXTRA CYCLE! AND DOES NOT MESS UP SCORING

cycle = 3

} else {

cycle = cycle - 1

} */
println("platforms[cycle+8] has parent: \(platforms[cycle+8].parent)")
println("cycle after make3000001 adjustment : \(self.cycle)")


//       make3("000001")

//     ph3 = 0

spikes[self.spikearraypos].size.width = 50
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMinX(platforms[self.cycle+8].frame) - 25, y: 975)


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])




if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}



}


if self.vspike > 2 {



/*     old, to make dart instead of spike [ dart did not shoot though, there is an error]
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 100
darts[self.dartarraypos].position = CGPoint(x: CGRectGetMaxX(vplatforms[self.cycle+4].frame) + darts[self.dartarraypos].size.width/2, y: CGRectGetMinY(vplatforms[self.cycle+4].frame) + 200 ) // CGRectGetMaxX(platforms[self.cycle+4].frame) + spike.size.width/2

//self.backgroundLayer.convertPoint(CGPoint(x: maxx + spikesize/2, y: self.topfloor + spike.size.height/2), fromNode: self) // not sure about this position
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
darts[self.dartarraypos].physicsBody!.dynamic = false
darts[self.dartarraypos].physicsBody?.affectedByGravity = false
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
darts[self.dartarraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
darts[self.dartarraypos].name = "sidedart"
self.backgroundLayer.addChild(darts[self.dartarraypos])


if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

} */

spikes[self.spikearraypos].size.width = 50
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMinX(vplatforms[self.cycle+4].frame) - 100, y: CGRectGetMaxY(ground.frame) + spikes[self.spikearraypos].size.width/2 )


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
//  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}


if self.vspike == 3 {
self.vspike = self.vspike + 1
}
}

if self.vspike > 1 {



/*     old, to make dart instead of spike [ dart did not shoot though, there is an error]
darts[self.dartarraypos].size.width = 50
darts[self.dartarraypos].size.height = 50
darts[self.dartarraypos].zPosition = 100
darts[self.dartarraypos].position = CGPoint(x: CGRectGetMaxX(vplatforms[self.cycle+4].frame) + darts[self.dartarraypos].size.width/2, y: CGRectGetMinY(vplatforms[self.cycle+4].frame) + 200 ) // CGRectGetMaxX(platforms[self.cycle+4].frame) + spike.size.width/2

//self.backgroundLayer.convertPoint(CGPoint(x: maxx + spikesize/2, y: self.topfloor + spike.size.height/2), fromNode: self) // not sure about this position
darts[self.dartarraypos].physicsBody = SKPhysicsBody(rectangleOfSize: darts[self.dartarraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
darts[self.dartarraypos].physicsBody!.dynamic = false
darts[self.dartarraypos].physicsBody?.affectedByGravity = false
darts[self.dartarraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
darts[self.dartarraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
darts[self.dartarraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
darts[self.dartarraypos].name = "sidedart"
self.backgroundLayer.addChild(darts[self.dartarraypos])


if self.dartarraypos < 29 {
self.dartarraypos++

} else {
self.dartarraypos = 0
}

} */

spikes[self.spikearraypos].size.width = 50
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMinX(vplatforms[self.cycle+4].frame) - spikes[self.spikearraypos].size.width/2, y: CGRectGetMinY(vplatforms[self.cycle+4].frame) + spikes[self.spikearraypos].size.width/2 )


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}


if self.vspike == 2 {
self.vspike = self.vspike + 1
}
}

//     var chance2 = CGFloat.random(min: 0, max:1)


if self.vspike > 0  {

spikes[self.spikearraypos].size.width = 50
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = 100
spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMaxX(vplatforms[self.cycle+4].frame) + spikes[self.spikearraypos].size.width/2, y: CGRectGetMinY(vplatforms[self.cycle+4].frame) + 200 )


spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}


if self.vspike == 1 {
self.vspike = self.vspike + 1
}

}



/*         platform3.size.width = shrink*make3size/5
platform3.size.height = 700
platform3.zPosition = 100
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + 5*make3size/6, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = true
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3) */

/* if self.backgroundB1count < self.scrollcount - 1 {
self.backgroundB1count = self.scrollcount + 2
} else if self.backgroundB2count < self.scrollcount - 1 {
self.backgroundB2count = self.scrollcount + 2
} else if self.backgroundB3count < self.scrollcount - 1 {
self.backgroundB3count = self.scrollcount + 2
} else if self.backgroundB4count < self.scrollcount - 1 {
self.backgroundB4count = self.scrollcount + 2
} */


/* if self.backgroundB1count < self.scrollcount - 1 && self.setB == 0 {
self.backgroundB1count = self.scrollcount + 2
self.setB = 1
}

if self.backgroundB2count < self.scrollcount - 1 && self.setB == 0 {
self.backgroundB2count = self.scrollcount + 2
self.setB = 1
}

if self.backgroundB3count < self.scrollcount - 1 && self.setB == 0 {
self.backgroundB3count = self.scrollcount + 2
self.setB = 1
}

if self.backgroundB4count < self.scrollcount - 1 && self.setB == 0 {
self.backgroundB4count = self.scrollcount + 2
self.setB = 1
} */

if self.vspike == 0 {
self.vspike == 1
}
}*/
}
*/
/*
if rolldice < 0.3 && rolldice > 0.0  { // && GameState.sharedInstance.score != 6 && GameState.sharedInstance.score != 7 && GameState.sharedInstance.score != 8 //&& GameState.sharedInstance.score != 24 && GameState.sharedInstance.score != 25 && GameState.sharedInstance.score != 26

/*  let platform1 = SKSpriteNode(imageNamed: "barrier")
let platform2 = SKSpriteNode(imageNamed: "barrier")
let platform3 = SKSpriteNode(imageNamed: "barrier")*/
// let spikesignpost = SKSpriteNode(imageNamed:"SpikeSignPost")

/*   if GameState.sharedInstance.score > 10 {
shrink = 0.7
}

platform1.size.width = shrink*make3size/8
platform1.size.height = 700
platform1.zPosition = 100
platform1.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6, y: platform1.size.height/2), fromNode: self)
platform1.physicsBody = SKPhysicsBody(rectangleOfSize: platform1.size)
platform1.physicsBody!.usesPreciseCollisionDetection = false
platform1.physicsBody!.dynamic = false
platform1.physicsBody!.friction = 0
platform1.physicsBody!.restitution = 0
platform1.physicsBody!.categoryBitMask = PhysicsCategory.block
platform1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform1.name = "platform"
self.backgroundLayer.addChild(platform1)

platform2.size.width = shrink*make3size/8
platform2.size.height = 700
platform2.zPosition = 100
platform2.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6 + make3size/3, y: platform2.size.height/2), fromNode: self)
platform2.physicsBody = SKPhysicsBody(rectangleOfSize: platform2.size)
platform2.physicsBody!.dynamic = false
platform2.physicsBody!.usesPreciseCollisionDetection = false
platform2.physicsBody!.friction = 0
platform2.physicsBody!.restitution = 0
platform2.physicsBody!.categoryBitMask = PhysicsCategory.block
platform2.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform2.name = "platform"
self.backgroundLayer.addChild(platform2)

platform3.size.width = shrink*make3size/8
platform3.size.height = 700
platform3.zPosition = 100
platform3.position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/6 + 2*make3size/3, y: platform3.size.height/2), fromNode: self)
platform3.physicsBody = SKPhysicsBody(rectangleOfSize: platform3.size)
platform3.physicsBody!.dynamic = false
platform3.physicsBody!.usesPreciseCollisionDetection = false
platform3.physicsBody!.friction = 0
platform3.physicsBody!.restitution = 0
platform3.physicsBody!.categoryBitMask = PhysicsCategory.block
platform3.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platform3.name = "platform"
self.backgroundLayer.addChild(platform3) */

/*   spikesignpost.size.width = 300
spikesignpost.size.height = 300
spikesignpost.zPosition = 99
spikesignpost.position = CGPoint(x: CGRectGetMaxX(platform1.frame)/2 + CGRectGetMinX(platform2.frame)/2 - make3size/2, y: 1100)
spikesignpost.physicsBody = SKPhysicsBody(rectangleOfSize: spikesignpost.size)
spikesignpost.physicsBody!.dynamic = false
spikesignpost.physicsBody!.categoryBitMask = PhysicsCategory.inert
spikesignpost.physicsBody!.contactTestBitMask = 0
spikesignpost.physicsBody!.collisionBitMask = 0
self.backgroundLayer.addChild(spikesignpost) */

make3("000111")

if cycle == 0 {

posA = CGRectGetMaxX(platforms[cycle].frame)
posB = CGRectGetMaxX(platforms[cycle+4].frame)
posC = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 1 {

posD = CGRectGetMaxX(platforms[cycle].frame)
posE = CGRectGetMaxX(platforms[cycle+4].frame)
posF = CGRectGetMaxX(platforms[cycle+8].frame)
println("score1: \(score1)")
}

if cycle == 2 {

posG = CGRectGetMaxX(platforms[cycle].frame)
posH = CGRectGetMaxX(platforms[cycle+4].frame)
posI = CGRectGetMaxX(platforms[cycle+8].frame)

}

if cycle == 3 {

posJ = CGRectGetMaxX(platforms[cycle].frame)
posK = CGRectGetMaxX(platforms[cycle+4].frame)
posL = CGRectGetMaxX(platforms[cycle+8].frame)

}


let maxx1 = CGFloat(CGRectGetMaxX(platforms[self.cycle].frame))
let minx1 = CGFloat(CGRectGetMinX(platforms[self.cycle+4].frame))
let distance1 = CGFloat(minx1 - maxx1)
let prespikesize1 = CGFloat(50 + 10*2)
let premaxspikeno1 = CGFloat(floor(distance1/prespikesize1))
let maxspikeno1 = Int(premaxspikeno1)
let spikesize1 = distance1/premaxspikeno1

// println("distance: \(distance) spikesize: \(spikesize) premaxspikeno: \(premaxspikeno) maxspikeno: \(maxspikeno)")
for index11 in 0...(maxspikeno1 - 1) {
//put if statement for changing to dart here, so we won't have to enumerate later.

let index12 = CGFloat(index11)
spikes[self.spikearraypos].size.width = 50
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = maxx1 + spikesize1/2 + spikesize1*(index12)

spikes[self.spikearraypos].position.y = self.topfloor + spikes[self.spikearraypos].size.height/2

//self.backgroundLayer.convertPoint(CGPoint(x: maxx + spikesize/2, y: self.topfloor + spike.size.height/2), fromNode: self) // not sure about this position
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody!.usesPreciseCollisionDetection = false
spikes[self.spikearraypos].physicsBody!.friction = 0
spikes[self.spikearraypos].physicsBody!.allowsRotation = false
spikes[self.spikearraypos].physicsBody!.restitution = 0
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].name = "Spike"
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}

}

let maxx2 = CGFloat(CGRectGetMaxX(platforms[self.cycle+4].frame))
let minx2 = CGFloat(CGRectGetMinX(platforms[self.cycle+8].frame))
let distance2 = CGFloat(minx2 - maxx2)
let prespikesize2 = CGFloat(50 + 10*2)
let premaxspikeno2 = CGFloat(floor(distance2/prespikesize2))
let maxspikeno2 = Int(premaxspikeno2)
let spikesize2 = distance2/premaxspikeno2

// println("distance: \(distance) spikesize: \(spikesize) premaxspikeno: \(premaxspikeno) maxspikeno: \(maxspikeno)")

for index21 in 0...(maxspikeno2 - 1) {


let index22 = CGFloat(index21)
spikes[self.spikearraypos].size.width = 50
spikes[self.spikearraypos].size.height = 50
spikes[self.spikearraypos].zPosition = -1
spikes[self.spikearraypos].position.x = maxx2 + spikesize2/2 + spikesize1*(index22)

spikes[self.spikearraypos].position.y = self.topfloor + spikes[self.spikearraypos].size.height/2

//self.backgroundLayer.convertPoint(CGPoint(x: maxx + spikesize/2, y: self.topfloor + spike.size.height/2), fromNode: self) // not sure about this position
spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
spikes[self.spikearraypos].physicsBody!.dynamic = false
spikes[self.spikearraypos].physicsBody!.usesPreciseCollisionDetection = false
spikes[self.spikearraypos].physicsBody!.friction = 0
spikes[self.spikearraypos].physicsBody!.restitution = 0
spikes[self.spikearraypos].physicsBody!.allowsRotation = false
spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
spikes[self.spikearraypos].name = "Spike"
self.backgroundLayer.addChild(spikes[self.spikearraypos])

if self.spikearraypos < 41 {
self.spikearraypos++
} else {
self.spikearraypos = 0
}
}

if self.solidspike > 0 {


dartcatchers[self.cycle].size.width = make3size*1.5
dartcatchers[self.cycle].size.height = 60
dartcatchers[self.cycle].position = self.backgroundLayer.convertPoint(CGPoint(x: make3size*2 + make3size/2, y: -100 - dartcatchers[self.cycle].size.height/2), fromNode: self)
dartcatchers[self.cycle].physicsBody = SKPhysicsBody(rectangleOfSize: dartcatchers[self.cycle].size)
dartcatchers[self.cycle].physicsBody!.dynamic = false
dartcatchers[self.cycle].physicsBody!.friction = 0
dartcatchers[self.cycle].physicsBody!.restitution = 0
dartcatchers[self.cycle].physicsBody!.categoryBitMask = PhysicsCategory.dartcatcher
dartcatchers[self.cycle].physicsBody!.contactTestBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].physicsBody?.collisionBitMask = PhysicsCategory.dart
dartcatchers[self.cycle].zPosition = 2
self.backgroundLayer.addChild(dartcatchers[self.cycle])


self.solidspike = 1
}
}
/*  if self.backgroundC1count < self.scrollcount - 1 {
self.backgroundC1count = self.scrollcount + 2
} else {

// if self.backgroundC2count < self.scrollcount - 1 {
self.backgroundC2count = self.scrollcount + 2
// } else {
//     if self.backgroundC3count < self.scrollcount - 1 {
//   self.backgroundC3count = self.scrollcount + 2
//       } else {
//           if self.backgroundC4count < self.scrollcount - 1 {
//    self.backgroundC4count = self.scrollcount + 2
//   }
*/

/*    if self.backgroundC1count >= self.scrollcount - 1 {

if self.backgroundC2count >= self.scrollcount - 1 {

if self.backgroundC3count >= self.scrollcount - 1 {

self.backgroundC4count = self.scrollcount + 2

} else {

self.backgroundC3count = self.scrollcount + 2

}
} else {
self.backgroundC2count = self.scrollcount + 2
}
} else {
self.backgroundC1count = self.scrollcount + 2 } */

/* if self.backgroundC1count < self.scrollcount - 1 && self.setC == 0 {
self.backgroundC1count = self.scrollcount + 2
self.setC = 1
}

if self.backgroundC2count < self.scrollcount - 1 && self.setC == 0 {
self.backgroundC2count = self.scrollcount + 2
self.setC = 1
}

if self.backgroundC3count < self.scrollcount - 1 && self.setC == 0 {
self.backgroundC3count = self.scrollcount + 2
self.setC = 1
}

if self.backgroundC4count < self.scrollcount - 1 && self.setC == 0 {
self.backgroundC4count = self.scrollcount + 2
self.setC = 1
} */




*/


*/

//}





}*/
//   }
//     }


if initialcount < 2 {
make3("010010") // PUT BACK not commented out REMOVED FOR opening walls TEST

firstbarriers()

}


if rolldice >= 3 && stoprolldice == 0 {



if GameState.sharedInstance.score == 0 && checkpointmode == 0 { //not working, need to update so that first rolldice is correct, where the first barrier does not refer to cycle -1 + 8

difOne = 0
} else {

// *** print("difOne: \(difOne)")
if difOne < 9 {
difOne = CGFloat.random(min: 0, max: 1)
}



}

// *** print("about to run makeOne")

if difOne > difPer && difOne < 9 { // only redefines width and max/min if not passed from the prior barrier


difOneWidth = 1 // CGFloat.random(min: 0, max: 1.00)

// *** print("difOneWidth: \(difOneWidth)")

if difOneWidth <= 0.33 {


difMaxPos = difMaxPos1200
difMinPos = difMinPos1200
difLowPos = difLowPos1200
}

if difOneWidth > 0.33 && difOneWidth <= 0.66 {


difMaxPos = difMaxPos1350
difMinPos = difMinPos1350
difLowPos = difLowPos1350
}

if difOneWidth > 0.66 {


difMaxPos = difMaxPos1500
difMinPos = difMinPos1500
difLowPos = difLowPos1500

}

var difTypeOne: CGFloat = 0
difTypeOne = CGFloat.random(min: 0, max: 1)

if  difTypeOne > 0.60 {

difPos = difMaxPos
LFW = 0

}

if difTypeOne > 0.20 && difTypeOne <= 0.60 {

difPos = difMinPos
LFW = 0

}


if difTypeOne <= 0.20 { //<= 0.20

LFW = 1

}

}


if difOne > 9 {
difOne = 1
difOneWidth = difThreeWidth // passing from prior miss
}
// *** print("difPos: \(difPos)")
// *** print("difOneWidth: \(difOneWidth)")

makeOne = 1
make3("100100")

// *** print("difTwo after makeOne make3: \(difTwo)")
slidingwalls()
makeOne = 0

// *** print("platform charge after slidingwalls: \(platforms[cycle].physicsBody!.charge)")


if cycle == 0 && platforms[cycle+3+8].parent != nil {
// *** print("previous platform charge after sliding walls: \(platforms[cycle+3+8].physicsBody!.charge)")

} else {

if platforms[cycle-1+8].parent != nil {
// *** print("previous platform charge after sliding walls: \(platforms[cycle-1+8].physicsBody!.charge)")
}

}
// *** print("platformposition cycle: \(platforms[cycle].position)")
// *** print("difMaxPos: \(difMaxPos)")
// *** print("difMinPos: \(difMinPos)")
// *** print("make3size: \(make3size)")






// *** print("ran makeOne")


// *** print("difTwo: \(difTwo)")
if difTwo < 9 {
difTwo = CGFloat.random(min: 0, max: 1)

}









// *** print("about to run makeTwo")

if difTwo > difPer && difTwo < 9 {


difTwoWidth = CGFloat.random(min: 0, max: 1.00)

// *** print("difTwoWidth: \(difTwoWidth)")

if difTwoWidth <= 0.33 {

difMaxPos = difMaxPos1200
difMinPos = difMinPos1200
difLowPos = difLowPos1200
}

if difTwoWidth > 0.33 && difTwoWidth <= 0.66 {

difMaxPos = difMaxPos1350
difMinPos = difMinPos1350
difLowPos = difLowPos1350
}

if difTwoWidth > 0.66 {

difMaxPos = difMaxPos1500
difMinPos = difMinPos1500
difLowPos = difLowPos1500
}




var difTypeTwo: CGFloat = 0
difTypeTwo = CGFloat.random(min: 0, max: 1)

if  difTypeTwo > 0.60 {

difPos = difMaxPos
LFW = 0

}

if difTypeTwo > 0.20 && difTypeTwo <= 0.60 {

difPos = difMinPos
LFW = 0

}


if difTypeTwo <= 0.20 { //<= 0.20

LFW = 1

}





}

if difTwo > 9 {
difTwo = 1
difTwoWidth = difOneWidth
}


make3("010010")
// *** print("difThree after makeTwo make3: \(difThree)")

// *** print("difPos: \(difPos)")
// *** print("difTwoWidth: \(difTwoWidth)")
makeTwo = 1
slidingwalls()
makeTwo = 0

// *** print("ran makeTwo")

// *** print("platform charge after slidingwalls: \(platforms[cycle+4].physicsBody!.charge)")
// *** print("previous platform charge after sliding walls: \(platforms[cycle].physicsBody!.charge)")
// *** print("platformposition cycle+4: \(platforms[cycle+4].position)")

// *** print("difMaxPos: \(difMaxPos)")
// *** print("difMinPos: \(difMinPos)")
// *** print("make3size: \(make3size)")

// *** print("difThree: \(difThree)")

if difThree < 9 {
difThree = CGFloat.random(min: 0, max: 1)
}


// *** print("about to run makeThree")


if difThree > difPer && difThree < 9 {

difThreeWidth = CGFloat.random(min: 0, max: 1.00)

// *** print("difThreeWidth: \(difThreeWidth)")

if difThreeWidth <= 0.33 {

difMaxPos = difMaxPos1200
difMinPos = difMinPos1200
difLowPos = difLowPos1200

}

if difThreeWidth > 0.33 && difTwoWidth <= 0.66 {

difMaxPos = difMaxPos1350
difMinPos = difMinPos1350
difLowPos = difLowPos1350

}

if difThreeWidth > 0.66 {

difMaxPos = difMaxPos1500
difMinPos = difMinPos1500
difLowPos = difLowPos1500

}



var difTypeThree: CGFloat = 0
difTypeThree = CGFloat.random(min: 0, max: 1)

if  difTypeThree > 0.60 {

difPos = difMaxPos
LFW = 0

}

if difTypeThree > 0.20 && difTypeThree <= 0.60 {

difPos = difMinPos
LFW = 0

}


if difTypeThree <= 0.20 { //<= 0.20

LFW = 1

}


}

if difThree > 9 {

difThree = 1
difThreeWidth = difTwoWidth

}

// *** print("difThree before makeThree run \(difThree)")
make3("001001")
// *** print("difOne after makeThree make3: \(difOne)")

// *** print("difPos: \(difPos)")
// *** print("difThreeWidth: \(difThreeWidth)")
makeThree = 1
slidingwalls()
makeThree = 0
// *** print("ran makeThree")

// *** print("platform charge after slidingwalls: \(platforms[cycle+8].physicsBody!.charge)")

// *** print("platform charge after slidingwalls: \(platforms[cycle+8].physicsBody!.charge)")
// *** print("previous platform charge after sliding walls: \(platforms[cycle+4].physicsBody!.charge)")



// *** print("platformposition cycle+8: \(platforms[cycle+8].position)")

// *** print("difMaxPos: \(difMaxPos)")
// *** print("difMinPos: \(difMinPos)")
// *** print("make3size: \(make3size)")




// *** print("TEST1: platforms[cycle].position.x: \(platforms[cycle].position.x)")
// *** print("TEST2: platforms[cycle+4].position.x: \(platforms[cycle+4].position.x)")
// *** print("TEST3: platforms[cycle+8].position.x: \(platforms[cycle+8].position.x)")

// *** print("TEST1: platforms[cycle].physicsBody!.charge: \(platforms[cycle].physicsBody!.charge)")
// *** print("TEST2: platforms[cycle+4].physicsBody!.charge: \(platforms[cycle+4].physicsBody!.charge)")
// *** print("TEST3: platforms[cycle+8].physicsBody!.charge: \(platforms[cycle+8].physicsBody!.charge)")



//   make3("111111") // take out for opening walls test. PUt back
//   slidingwalls()

}


}





}

//


func startblock() {


var st2: CGFloat = make3size
st2 += make3size/6
st2 -= 122



platformst2.size.width = size.width/8
platformst2.size.height = 1600// infinite bounce test: 6000 // was 1600

platformst2.zPosition = 3
platformst2.position = self.backgroundLayer.convertPoint(CGPoint(x: st2, y: -100), fromNode: self) // for opening walls test: was x: make3size + make3size/6 + 800 // for normal: make3size + make3size/6 - 122


platformst2.physicsBody = SKPhysicsBody(rectangleOfSize: platformst2.size)
platformst2.physicsBody!.dynamic = false
platformst2.physicsBody!.friction = 0
platformst2.physicsBody!.restitution = 0
platformst2.physicsBody!.categoryBitMask = PhysicsCategory.block
platformst2.physicsBody!.contactTestBitMask = 0// PhysicsCategory.bird
platformst2.physicsBody!.collisionBitMask = PhysicsCategory.bird
platformst2.name = "platform"
backgroundLayer.addChild(platformst2)

platformst1.size.height = 2000
platformst1.zPosition = 3
platformst1.position = self.backgroundLayer.convertPoint(CGPoint(x: platformst2.position.x - 700, y: self.size.height/2), fromNode: self) //x: make3size*2 +
platformst1.size.width = size.width/5
platformst1.physicsBody = SKPhysicsBody(rectangleOfSize: platformst1.size)
platformst1.physicsBody!.dynamic = false
platformst1.physicsBody!.friction = 0
platformst1.physicsBody!.restitution = 0
platformst1.physicsBody!.categoryBitMask = PhysicsCategory.block
platformst1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
platformst1.physicsBody!.collisionBitMask = PhysicsCategory.bird
platformst1.name = "platform"
backgroundLayer.addChild(platformst1)

platformst3.size.width = 150
platformst3.size.height = 1024// infinite bounce test: 6000 // was 1600

platformst3.zPosition = 3
platformst3.position.x = platformst2.position.x + make3size/3
platformst3.position.y = 412


platformst3.physicsBody = SKPhysicsBody(rectangleOfSize: platformst3.size)
platformst3.physicsBody!.dynamic = false
platformst3.physicsBody!.friction = 0

platformst3.physicsBody!.restitution = 0
platformst3.physicsBody!.categoryBitMask = PhysicsCategory.block
platformst3.physicsBody!.contactTestBitMask = 0// PhysicsCategory.bird
platformst3.physicsBody!.collisionBitMask = PhysicsCategory.bird
platformst3.name = "platform"
backgroundLayer.addChild(platformst3)

platformst1.physicsBody!.linearDamping = 15000
platformst2.physicsBody!.linearDamping = 15000
platformst3.physicsBody!.linearDamping = 15000

}




override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
/* Called when a touch begins */

//    undotest = 1

let touch = touches.first as? UITouch!

let touchLocation = touch?.locationInNode(self)



if pausebutton.containsPoint(touchLocation!) {
touchonpause = 1
}

if touchonpause == 0 && gpaused == false {
starttime = CFAbsoluteTimeGetCurrent()
//   println("touchesbegan")

// *** print("touchesBegan")

var textures: [SKTexture] = []
var circle8texture: [SKTexture] = []
circle8texture.append(SKTexture(imageNamed: "Circle8"))

for i in 1...7 {
textures.append(SKTexture(imageNamed: "Circle\(i)"))
}

gauge.removeAllActions()
gauge.runAction(SKAction.sequence([SKAction.animateWithTextures(textures, timePerFrame: 0.0375), SKAction.repeatActionForever(SKAction.animateWithTextures(circle8texture, timePerFrame: 10000000))])) //was timeperframe 0.5

}

if gcoinchoice == true {

let touch4 = touches.first as? UITouch!



let touchLocation4 = touch4?.locationInNode(coinchoicescreen)


if yellowCoinChoice.containsPoint(touchLocation4!) && GameState.sharedInstance.yelCoinUpg == 1 {

GameState.sharedInstance.yelCoinUpg = 2


if GameState.sharedInstance.oneCoinUpg == 0 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfFirstCoinUpg
GameState.sharedInstance.coinUpgOrder = 100
oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: yellow:)")
}

if GameState.sharedInstance.oneCoinUpg == 1 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfSecondCoinUpg
GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 10
oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: yellow:)")
}

if GameState.sharedInstance.oneCoinUpg == 2 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfThirdCoinUpg
GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 1
oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: yellow:)")
}

GameState.sharedInstance.oneCoinUpg = GameState.sharedInstance.oneCoinUpg + 1
updateUpgMeters()
GameState.sharedInstance.saveState()
// *** print("yellow coin upgrade complete")
coinLabel.text = String(GameState.sharedInstance.coins)
//       coinchoicescreen.removeFromParent()
//   gcoinchoice = false

}

if blueCoinChoice.containsPoint(touchLocation4!) && GameState.sharedInstance.bluCoinUpg == 1 {

GameState.sharedInstance.bluCoinUpg = 2


if GameState.sharedInstance.oneCoinUpg == 0 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfFirstCoinUpg
GameState.sharedInstance.coinUpgOrder = 200

oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: blue:)")
}

if GameState.sharedInstance.oneCoinUpg == 1 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfSecondCoinUpg
GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 20

oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: blue:)")
}

if GameState.sharedInstance.oneCoinUpg == 2 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfThirdCoinUpg
GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 2

oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: blue:)")
}

GameState.sharedInstance.oneCoinUpg = GameState.sharedInstance.oneCoinUpg + 1
updateUpgMeters()
GameState.sharedInstance.saveState()
// *** print("blue coin upgrade complete")
coinLabel.text = String(GameState.sharedInstance.coins)
//     coinchoicescreen.removeFromParent()
//    gcoinchoice = false

}

if redCoinChoice.containsPoint(touchLocation4!) && GameState.sharedInstance.redCoinUpg == 1 {

GameState.sharedInstance.redCoinUpg = 2


if GameState.sharedInstance.oneCoinUpg == 0 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfFirstCoinUpg
GameState.sharedInstance.coinUpgOrder = 300

oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: red:)")
}

if GameState.sharedInstance.oneCoinUpg == 1 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfSecondCoinUpg
GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 30

oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: red:)")
}

if GameState.sharedInstance.oneCoinUpg == 2 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfThirdCoinUpg
GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 3

oneUpgOrder = GameState.sharedInstance.coinUpgOrder
twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
GameState.sharedInstance.saveState()

// *** print("upgrade coin: red:)")
}

GameState.sharedInstance.oneCoinUpg = GameState.sharedInstance.oneCoinUpg + 1
updateUpgMeters()
GameState.sharedInstance.saveState()
// *** print("red coin upgrade complete")
coinLabel.text = String(GameState.sharedInstance.coins)
//     coinchoicescreen.removeFromParent()
//    gcoinchoice = false

}
}






//Test Navigator

if rightarrow.containsPoint(touchLocation!) && downarrow.parent != nil {

bird2.physicsBody!.collisionBitMask = 0
bird2.physicsBody!.contactTestBitMask = 0
bird2.physicsBody!.categoryBitMask = 0
bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0
bird2.physicsBody!.affectedByGravity = false
bird2.removeActionForKey("Fall")
bird2.runAction(SKAction.moveByX(6144, y: 0, duration: 4.0), withKey: "Navigate")
bird2con = 0
navigating = 1
turnoffnavigating = 0

bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0
}


if leftarrow.containsPoint(touchLocation!) && downarrow.parent != nil {

bird2.physicsBody!.collisionBitMask = 0
bird2.physicsBody!.contactTestBitMask = 0
bird2.physicsBody!.categoryBitMask = 0
bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0
bird2.physicsBody!.affectedByGravity = false
bird2.removeActionForKey("Fall")
bird2.runAction(SKAction.moveByX(-1000, y: 0, duration: 1.0), withKey: "Navigate")
bird2con = 0
navigating = 1
turnoffnavigating = 0

// *** print("navigate on")
}


if uparrow.containsPoint(touchLocation!) && downarrow.parent != nil {

bird2.physicsBody!.collisionBitMask = 0
bird2.physicsBody!.contactTestBitMask = 0
bird2.physicsBody!.categoryBitMask = 0
bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0
bird2.physicsBody!.affectedByGravity = false
bird2.removeActionForKey("Fall")
bird2.runAction(SKAction.moveByX(0, y: 2048, duration: 4.0), withKey: "Navigate")
bird2con = 0

navigating = 1
turnoffnavigating = 0
// *** print("navigate on")
}

if downarrow.containsPoint(touchLocation!) && downarrow.parent != nil {

bird2.physicsBody!.collisionBitMask = 0
bird2.physicsBody!.contactTestBitMask = 0
bird2.physicsBody!.categoryBitMask = 0
bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0
bird2.physicsBody!.affectedByGravity = false
bird2.removeActionForKey("Fall")
bird2.runAction(SKAction.moveByX(0, y: -2048, duration: 4.0), withKey: "Navigate")
bird2con = 0

navigating = 1
turnoffnavigating = 0
// *** print("navigate on")

}



if navigating == 1 {

backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in

let pauseplatform = node as! SKSpriteNode




pauseplatform.paused = true

}

backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in

let pausevplatform = node as! SKSpriteNode




pausevplatform.paused = true

}


}

if hidearrows.containsPoint(touchLocation!) && rightarrow.parent == nil && hidearrowscheck == 0 {

self.addChild(rightarrow)
self.addChild(leftarrow)
self.addChild(uparrow)
self.addChild(downarrow)
navigating = 1
//   turnoffnavigating = 1
hidearrowscheck = 1
}

if hidearrows.containsPoint(touchLocation!) && rightarrow.parent != nil && hidearrowscheck == 0 {

rightarrow.removeFromParent()
leftarrow.removeFromParent()
uparrow.removeFromParent()
downarrow.removeFromParent()
navigating = 1
//    turnoffnavigating = 1
hidearrowscheck = 1
}






if downarrow.containsPoint(touchLocation!) == false && uparrow.containsPoint(touchLocation!) == false && leftarrow.containsPoint(touchLocation!) == false && rightarrow.containsPoint(touchLocation!) == false && hidearrows.containsPoint(touchLocation!) == false && navigating == 1 {

turnoffnavigating = 1
bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart | PhysicsCategory.slidespike
bird2.physicsBody!.categoryBitMask = PhysicsCategory.bird
bird2.physicsBody!.affectedByGravity = true
bird2.physicsBody!.velocity.dx = 100
newtouch = 1

// *** print("set dx = 100 from navigating")

//   stoprolldice = 1 //TO PAUSE ROLLDICE. UNCOMMENT, USE NAVIGATOR TO MOVE TO WHEREVER, THEN HIT A NON-NAVIGATOR AREA TO STOP ROLLDICE.
}





//End Test Navigator




}




override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {

// *** print("touchesEnded")

//reset game REMOVE PUT BACK

let touch0 = touches.first as? UITouch!

let touchLocation0 = touch0?.locationInNode(self)

if wipecleanbutton.containsPoint(touchLocation0!) {

wipeclean()
}


//Stop Navigation:


if navigating == 1 && bird2.parent == nil {

bird2.position.x = bird2.position.x - 150
backgroundLayer.addChild(bird2)
bird2.hidden = false
}

if navigating == 1 {


bird2.removeActionForKey("Navigate")



}

if navigating == 0 || turnoffnavigating == 1 {


backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in

let pauseplatform = node as! SKSpriteNode




pauseplatform.paused = false

}

backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in

let pausevplatform = node as! SKSpriteNode




pausevplatform.paused = false

}


}






//End Stop Navigation

//Jumps:

func jumpcheck() {

if navigating == 0 && touchonpause == 0 && gpaused == false {

//  bird2.actionForKey("Fall").

//   bird2.runAction(waiting)

//   var durattionnn: NSTimeInterval = 0

//   if let fallAction: SKAction = actionForKey("Fall") {

//    durattionnn = bird2.fallAction.duration

//    println("duration: \(durattionnn)")

//   }


/* bird1.physicsBody!.affectedByGravity = true
bird2.physicsBody!.affectedByGravity = true
bird3.physicsBody!.affectedByGravity = true
bird4.physicsBody!.affectedByGravity = true
bird5.physicsBody!.affectedByGravity = true
bird6.physicsBody!.affectedByGravity = true
bird7.physicsBody!.affectedByGravity = true
bird8.physicsBody!.affectedByGravity = true */

// // *** print("novj at start of touchesend: \(novj)")
bird2.removeActionForKey("Fall")
birdfalling = 0

if jumping == false {
bird2.physicsBody!.velocity.dy = 0 //THIS IS NEW, TRYING THIS OUT TO SEE IF THIS WILL PREVENT THE RUNNING AGROUND AND JUMPING UP ERROR THAT HAPPENS WHEN ENDING THE TOUCH CLOSE TO SLIDING TO AN ATREST POSITION.
//  // *** print("if jumping ==false, bird2 velocity dy = 0")
}

endtime = CFAbsoluteTimeGetCurrent()
//   println("touchended")

jumppower = endtime - starttime

gauge.removeAllActions()
var textures: [SKTexture] = []
textures.append(SKTexture(imageNamed: "Circle0"))

gauge.runAction(SKAction.animateWithTextures(textures, timePerFrame: 1))

//  animateWithTextures(SKTexture(imageNamed: "Circle0")))



if jumppower > 0.3 { // was 0.3
jumppower = 0.3

}
//   // *** print("jumppower: \(jumppower)")

/* if jumppower < 0.2 {  // SHOULD CHANGE ANIMATION BECAUE OF THIS. START OUT WITH 3 OR SO BARS THAT HOLDS FOR ONE SECOND, THEN THE REMAINING BARS POPULATE AS NORMAL. OR, LESSEN THE TOTAL NUMBER OF BARS AND DELAY WHEN THEY SHOW UP. OR: INSTEAD OF STARTING WITH 3 BARS, WHICH WILL BE CONFUSING, COMBINE THE FIRST 3 BARS INTO ONE AND MAKE A SOLID COLOR(?)  OR GIVE IT A GRADIENT, BUT NO SPACES SO IT IS A SOLID BAR. // was 0.2
jumppower = 0.2
}*/


/*   if fallthroughtest == 1 {

jumppower = 0.124
}

fallthroughtest = 0 */

// jumppower = 0.21 //for test PUT BACK (Make sure to COMMENT OUT)
//   jumppower = 0.13 // for test PUT BACK (Make sure to COMMENT OUT)


//function: NORMAL JUMP



if (jumping == false && atrest == false) || bird2.physicsBody!.affectedByGravity == false || novj == 1 {




//  bird.physicsBody?.applyImpulse(CGVector(dx: facingdirection*jumppower*200, dy: jumppower*200))
//    println("hello \(facingdirection*jumppower*200)")
//    println("hello \(facingdirection*jumppower*20)")

if cornerland == 0 {
bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
//   // *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")

}

bird2.physicsBody!.affectedByGravity = true
newtouch = 1
//  // *** print("newtouch = 1")
startjx = bird2.position.x

bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.dart | PhysicsCategory.floor | PhysicsCategory.slidespike


if breakwallcon > 0 {



breakingwall.physicsBody!.dynamic = true
breakingwall.physicsBody!.velocity.dx = CGFloat(300.0*facingdirection)
breakingwall.physicsBody!.affectedByGravity = true
//      breakingwall.runAction(SKAction.sequence([SKAction.waitForDuration(1.5),SKAction.runBlock({self.Removebreakwall(self.breakingwall)})]))



}




if sliding == true { // when you spam clicking, sometimes the direction gets messed up. For example, when you jump off a wall, you head right, but after you land you head left.


facingdirection = -1*facingdirection



pssdcounter = 3
preventssdeath = 1

bird2.physicsBody!.collisionBitMask = PhysicsCategory.danger | PhysicsCategory.outline // Needed to exclude floor to prevent running aground
bird2.physicsBody!.contactTestBitMask = PhysicsCategory.danger | PhysicsCategory.dart
//  // *** print("change collision bitmask: \(bird2.physicsBody!.contactTestBitMask)")
//  // *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")


sliding = false // causing an issue with triggering sliding again. Is this needed? REMOVED 7/16/2015. I added this back when I added the bird2con = 0 qualifier below 7/17/2015.
}
//  // *** print("jumppower: \(jumppower)")
bird2.physicsBody?.velocity = CGVector(dx: facingdirection*(jumppower*1750 + 214.5444), dy: jumppower*3200 + 575.22) //(dx: facingdirection*(jumppower*1533.33 + 460), dy: jumppower*1866.67 + 560)//facingdirection*jumppower*2300, dy: jumppower*2800 // 9.8: dx *1950 dy *2400, 14.7: dx 2700 dy 2900 12.0: dx 1950 dy 2500
//  birdimage.anchorPoint = CGPoint(x: 0.5, y: 0.4)

//   bird7.physicsBody!.collisionBitMask = 0
//   bird8.physicsBody!.collisionBitMask = 0
//   bird7.physicsBody!.contactTestBitMask = 0 //PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart
//   bird8.physicsBody!.contactTestBitMask = 0








bird2con = 0

running = false
jumping = true
sliding = false
atrest = false



bird5concheck = 0
// // *** print("bird5concheck set to 0")
runpos = 1
// // *** print("bird2con set to 0 in touches ended function")
// // *** print("bird2velocitydx: \(bird2.physicsBody?.velocity.dx)")
//  // *** print("bird2velocitydy: \(bird2.physicsBody?.velocity.dy)")
// // *** print(" touchesended state assessment, normal jump: atrest: \(atrest) ")


if facingdirection == -1 {

flytextureL.append(flytextl)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureL, timePerFrame: 1000000)))

} else {

flytextureR.append(flytextr)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureR, timePerFrame: 1000000)))
}
}

//END function: NORMAL JUMP

//function: ATREST JUMP

if atrest == true && novj == 0 {
//  bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger


bird2.physicsBody?.velocity = CGVector(dx: 0, dy: jumppower*3200 + 575.22) //  dy: jumppower*2625 + 575.22)
sliding = true
running = false
jumping = false
atrest = false

//          bird5con = 0
bird5concheck = 1
//  // *** print("bird5concheck set to 1")
newtouch = 0
//  // *** print("atrest jump")




/*   if abs(bird2.physicsBody!.velocity.dx) > 5 {

bird2.physicsBody?.velocity = CGVector(dx: bird2.physicsBody!.velocity.dx, dy: bird2.physicsBody!.velocity.dy) // was dy: jumppower*2800


sliding = false
running = false
jumping = true
atrest = false
newtouch = 1

if cornerland == 0 {
bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
}
}

if abs(bird2.physicsBody!.velocity.dx) < 5 {

bird2.physicsBody?.velocity = CGVector(dx: 0, dy: jumppower*2300 + 504) // was dy: jumppower*2800


sliding = true
running = false
jumping = false
atrest = false

bird5con = 0
bird5concheck = 1
newtouch = 0
} */


//  bird7.physicsBody!.collisionBitMask = 0
//  bird8.physicsBody!.collisionBitMask = 0
//  bird7.physicsBody!.contactTestBitMask = 0 //PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart
//  bird8.physicsBody!.contactTestBitMask = 0
bird2.physicsBody!.affectedByGravity = true

if facingdirection == -1 {

rightslidetexture.append(rightslidetext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightslidetexture, timePerFrame: 1000000)))

} else {

leftslidetexture.append(leftslidetext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftslidetexture, timePerFrame: 1000000)))
}



}
//end function: ATREST JUMP



novj = 0
}
}

jumpcheck()


if turnoffnavigating == 1 {

navigating = 0
// *** print("navigate off")

}


let touch = touches.first as? UITouch!

let touchLocation = touch?.locationInNode(self)



if freecoins.containsPoint(touchLocation!) {

GameState.sharedInstance.coins = GameState.sharedInstance.coins + 100
coinLabel.text = "\(GameState.sharedInstance.coins)"
}



func pausegame() {
backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in

let pauseplatform = node as! SKSpriteNode




pauseplatform.paused = true

}

backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in

let pausevplatform = node as! SKSpriteNode




pausevplatform.paused = true

}


pausescreen.size.width = 800
pausescreen.size.height = 1500
pausescreen.position.x = bird2.position.x

pausescreen.position.y = self.size.height/2
pausescreen.zPosition = 8
pausescreen.name = "pausescreen"
//some kind of problem with this, being added twice PUT BACK but fix first



screenScoreLabel.removeFromParent()
screenScoreLabel = SKLabelNode(text: "Score: \(GameState.sharedInstance.score)")
screenScoreLabel.position.x = 0
screenScoreLabel.position.y = 400
screenScoreLabel.fontColor = SKColor.blackColor()
//  screenScoreLabel.fontName = NoteWorthy
screenScoreLabel.fontSize = 65
pausescreen.addChild(screenScoreLabel)

screenHighScoreLabel.removeFromParent()
screenHighScoreLabel = SKLabelNode(text: "High Score: \(GameState.sharedInstance.highScore)")
screenHighScoreLabel.position.x = 0
screenHighScoreLabel.position.y = 100
screenHighScoreLabel.fontColor = SKColor.blackColor()
//    screenhighScoreLabel.fontName = NoteWorthy
screenHighScoreLabel.fontSize = 65
pausescreen.addChild(screenHighScoreLabel)


backgroundLayer.addChild(pausescreen)

gpaused = true
//    scene.view?.paused = true
self.speed = 0
self.physicsWorld.speed = 0
touchonpause = 0

//   replaybutton.runAction(SKAction.moveToY(self.size.height - 1200, duration: 1))
}

if pausebutton.containsPoint(touchLocation!) && gpaused == false && touchonpause == 1 {

pausegame()

}

func transitiontogame() {
//  // *** print("began running transition to game")


bird2.position.x = bird2x
bird2.position.y = bird2y + 70

/*  backgroundLayer.enumerateChildNodesWithName("*") { node, _ in // skip this for now, don't recall this taking too much time.

if node.name != "emitter" && node.name != "miniCoinLabel" {

let todelete = node as! SKSpriteNode

todelete.paused = false
todelete.removeAllActions()
todelete.physicsBody?.restitution = 0.2
todelete.physicsBody?.angularDamping = 0.1
todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil


let pchildren = todelete.children as! [SKSpriteNode]

for pchild in pchildren {

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.runAction(SKAction.removeFromParent())

}

todelete.runAction(SKAction.removeFromParent())


}
//  self.backgroundLayer.removeAllChildren()




}*/
self.backgroundLayer.removeAllChildren()
self.removeAllChildren()

//  var transition: SKTransition = SKTransition.flipHorizontalWithDuration(1)
//   var scene: SKScene = TransitionScene(size: size)
//   scene.scaleMode = scaleMode

// self.paused = true
//    self.view?.presentScene(scene, transition: transition)


// // *** print("ran transition to game")




GameState.sharedInstance.score = 0
self.runAction(SKAction.sequence([SKAction.waitForDuration(0), SKAction.runBlock({


let transition: SKTransition = SKTransition.fadeWithColor(UIColor.blueColor(), duration: 0.5)
let scene: SKScene = GameScene(size: self.size)
scene.scaleMode = self.scaleMode
self.view?.presentScene(scene, transition: transition)



})]))

}

//Score Screen Button Clicks:



if gameover == true {

let touch5 = touches.first as? UITouch!


let touchLocation5 = touch5?.locationInNode(scorescreen)

if buySecondLifeButton.containsPoint(touchLocation5!) && usedsecondlives == 0 && GameState.sharedInstance.coins >= costOfSecondLife && GameState.sharedInstance.secondLife == 0 {

if bird2.parent == nil {
backgroundLayer.addChild(bird2)
}

scorescreen.removeFromParent()

secondliferepo()
GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfSecondLife
coinLabel.text = "\(GameState.sharedInstance.coins)"

usedsecondlives = 1
buySecondLifeButton.alpha = 0.5


}

if buyStackableLivesButton.containsPoint(touchLocation5!) && GameState.sharedInstance.coins >= costOfStackableLife {

if bird2.parent == nil {
backgroundLayer.addChild(bird2)
}

scorescreen.removeFromParent()

secondliferepo()
GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfStackableLife
coinLabel.text = "\(GameState.sharedInstance.coins)"

if GameState.sharedInstance.coins < costOfStackableLife {

buyStackableLivesButton.alpha = 0.5

}


}

if replaybutton2.containsPoint(touchLocation5!)  {

// *** print("replay")

/* THESE CHANGES ARE MADE WHEN SCORESCREEN COMES UP

if GameState.sharedInstance.score >= 5 {

GameState.sharedInstance.checkpointround = GameState.sharedInstance.checkpointround + 1

if GameState.sharedInstance.score > GameState.sharedInstance.checkpointHS && checkpointmode == 0 {

GameState.sharedInstance.checkpointHS = GameState.sharedInstance.score

}

GameState.sharedInstance.saveState()
}
*/



/* backgroundLayer.enumerateChildNodesWithName("*") { node, _ in // skip this for now, don't recall this taking too much time.
let todelete = node as! SKSpriteNode
let todeletepos = self.backgroundLayer.convertPoint(todelete.position, toNode: self)



todelete.paused = false
todelete.removeAllActions()
todelete.physicsBody?.restitution = 0.2
todelete.physicsBody?.angularDamping = 0.1
todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil


let pchildren = todelete.children as! [SKSpriteNode]

for pchild in pchildren {

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.runAction(SKAction.removeFromParent())

}

todelete.runAction(SKAction.removeFromParent())

}*/




//   self.runAction(SKAction.runBlock(transitiontogame))
transitiontogame()

gameover = false
gpaused = false
}

}



//Pause Button Clicks:

// *** print("replaybutton.containsPoint(touchLocation!): \(replaybutton.containsPoint(touchLocation!) == true)")
// *** print("gameover: \(gameover)")
if gpaused == true {

if gstore == false {
let touch2 = touches.first as? UITouch!

//  let touchLocation2 = touch2?.locationInNode(scorescreen) //PUT BACK for when replay button is in scorescreen again

let touchLocation2 = touch2?.locationInNode(pausescreen)


if replaybutton.containsPoint(touchLocation2!)  {

// *** print("replay")



if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.checkpointunlock == 1 {

GameState.sharedInstance.checkpointround = GameState.sharedInstance.checkpointround + 1

if GameState.sharedInstance.score > GameState.sharedInstance.checkpointHS && checkpointmode == 0 {

GameState.sharedInstance.checkpointHS = GameState.sharedInstance.score

}

GameState.sharedInstance.saveState()
} //CHECKPOINTPUTBACK


/* backgroundLayer.enumerateChildNodesWithName("*") { node, _ in // skip this for now, don't recall this taking too much time.
let todelete = node as! SKSpriteNode
let todeletepos = self.backgroundLayer.convertPoint(todelete.position, toNode: self)



todelete.paused = false
todelete.removeAllActions()
todelete.physicsBody?.restitution = 0.2
todelete.physicsBody?.angularDamping = 0.1
todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil


let pchildren = todelete.children as! [SKSpriteNode]

for pchild in pchildren {

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.runAction(SKAction.removeFromParent())

}

todelete.runAction(SKAction.removeFromParent())

}*/




//   self.runAction(SKAction.runBlock(transitiontogame))


transitiontogame()

self.speed = 1.0
self.physicsWorld.speed = 1.0

gameover = false
gpaused = false
}

if storebutton.containsPoint(touchLocation2!)  {

pausescreen.removeFromParent()

storescreen.size.width = 800
storescreen.size.height = 1500
storescreen.position.x = bird2.position.x

storescreen.position.y = self.size.height/2
storescreen.zPosition = 9

backgroundLayer.addChild(storescreen)



//  gpaused = false
gstore = true

}

if backbuttonpause.containsPoint(touchLocation2!)  {


//    self.view?.paused = false

gpaused = false
pausescreen.removeFromParent()

self.speed = 1.0
self.physicsWorld.speed = 1.0

backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in

let pauseplatform = node as! SKSpriteNode




pauseplatform.paused = false

}

backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in

let pausevplatform = node as! SKSpriteNode




pausevplatform.paused = false

}
}
}

}




//Store Button Clicks:

func storebuttonclicks() {

if gstore == true {

if gcoinchoice == false {

let touch3 = touches.first as? UITouch!

//  let touchLocation2 = touch2?.locationInNode(scorescreen) //PUT BACK for when replay button is in scorescreen again

let touchLocation3 = touch3?.locationInNode(storescreen)



/*
x  let buymultbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
x  let buyslbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buyOneCoinUpgButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buySingleSecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buyCheckpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
let buyStackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy")) */



if buymultbutton.containsPoint(touchLocation3!) {


if GameState.sharedInstance.coins >= costOfCoinMultOne && GameState.sharedInstance.coinMult < 2 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfCoinMultOne
GameState.sharedInstance.coinMult = 2
GameState.sharedInstance.saveState()
// *** print("mult1 upgrade complete")
coinLabel.text = String(GameState.sharedInstance.coins)
updateUpgMeters()
}

if GameState.sharedInstance.coins >= costOfCoinMultTwo && GameState.sharedInstance.coinMult == 2 {
GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfCoinMultTwo
GameState.sharedInstance.coinMult = 5
GameState.sharedInstance.saveState()
// *** print("mult2 upgrade complete")
coinLabel.text = String(GameState.sharedInstance.coins)
updateUpgMeters()
}

if GameState.sharedInstance.coins >= costOfCoinMultThree && GameState.sharedInstance.coinMult == 5 {


GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfCoinMultThree
GameState.sharedInstance.coinMult = 10
GameState.sharedInstance.saveState()
updateUpgMeters()
// *** print("mult3 upgrade complete")
coinLabel.text = String(GameState.sharedInstance.coins)
updateUpgMeters()
}

}



if buyslbutton.containsPoint(touchLocation3!) && GameState.sharedInstance.coins >= costOfUnlSecLives && GameState.sharedInstance.secondLife == 0 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfUnlSecLives
GameState.sharedInstance.secondLife = 1
secondlives = 1
GameState.sharedInstance.saveState()
// *** print("second life upgrade complete")
updateUpgMeters()
coinLabel.text = String(GameState.sharedInstance.coins)

}


if buyOneCoinUpgButton.containsPoint(touchLocation3!) && ((GameState.sharedInstance.coins >= costOfFirstCoinUpg && GameState.sharedInstance.oneCoinUpg == 0) || (GameState.sharedInstance.coins >= costOfSecondCoinUpg && GameState.sharedInstance.oneCoinUpg == 1) || (GameState.sharedInstance.coins >= costOfThirdCoinUpg && GameState.sharedInstance.oneCoinUpg == 2)) {


coinchoicescreen.size.width = 600
coinchoicescreen.size.height = 400
coinchoicescreen.position.x = bird2.position.x
coinchoicescreen.position.y = self.size.height/2
coinchoicescreen.zPosition = 10
coinchoicescreen.name = "coinchoicescren"

backgroundLayer.addChild(coinchoicescreen)


gcoinchoice = true

}


if buyCheckpointButton.containsPoint(touchLocation3!) && GameState.sharedInstance.coins >= costOfCheckpoint && GameState.sharedInstance.checkpointunlock == 0 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfCheckpoint
GameState.sharedInstance.checkpointunlock = 1
GameState.sharedInstance.saveState()
// *** print("checkpoint upgrade complete")
updateUpgMeters()
coinLabel.text = String(GameState.sharedInstance.coins)

}

/*    if buyStackableLivesButton.containsPoint(touchLocation3!) && GameState.sharedInstance.coins >= 2000 {

GameState.sharedInstance.coins = GameState.sharedInstance.coins - 2000
GameState.sharedInstance.stackableLives = GameState.sharedInstance.stackableLives + 1
GameState.sharedInstance.saveState()
println("stackableLives upgrade complete")
coinLabel.text = String(GameState.sharedInstance.coins)

} */

if backbuttonstore.containsPoint(touchLocation3!) {


storescreen.removeFromParent()
backgroundLayer.addChild(pausescreen)
gstore = false
gpaused = true

}
}
}
}

storebuttonclicks()

//Coin Choice Screen
if gcoinchoice == true {

let touch4 = touches.first as? UITouch!



let touchLocation4 = touch4?.locationInNode(coinchoicescreen)

if backbuttoncoinscreen.containsPoint(touchLocation4!) {

coinchoicescreen.removeFromParent()
gcoinchoice = false

}

}


touchonpause = 0

}


/*   ball.physicsBody?.velocity.dx = 0
println("success")
}*/


override func didFinishUpdate() {

if printOn == 1 {
// *** print("didFinishUpdate")
}


if firstswadjust != 0 {

firstswadjust = 0
}

if checkpointmode == 1 && checkpointmove == 0 {
//   bird2.runAction(SKAction.moveToX(platforms[cycle+4].position.x + 250, duration: 1))
//    bird2.position.y = CGRectGetMaxY(ground.frame) + bird2.size.height/2 + 30

GameState.sharedInstance.score = GameState.sharedInstance.checkpointHS

//   scoreLabel.text = "\(GameState.sharedInstance.score)"

checkpointmove = 1

} //CHECKPOINTPUTBACK

func centerViewOn(centerOn: CGFloat) {
let x = centerOn

worldNode.position.x = -x

//    spikedetector1.position.x = bird2.position.x + 0.25*birdimage.size.width
//     spikedetector1.position.y = bird2.position.y + (1/8)*birdimage.size.height
//     spikedetector2.position.x = bird2.position.x - 0.25*birdimage.size.width
//     spikedetector2.position.y = bird2.position.y - (1/8)*birdimage.size.height




/*  if (sliding == true && facingdirection == 1) || (atrest == true && facingdirection == 1) || (running == true && facingdirection == -1) {
worldNode.position.x =  worldNode.position.x - ((worldNode.position.x) - (-x + 450))/10
}

if (sliding == true && facingdirection == -1) || (atrest == true && facingdirection == -1) || (running == true && facingdirection == 1) {
worldNode.position.x =  worldNode.position.x - ((worldNode.position.x) - (-x - 450))/10
} */


}

// if running == true || sliding == true || atrest == true {
centerViewOn(bird2.position.x - self.size.width/2)

// }





if jumping == false || (jumping == true && bird2.physicsBody!.collisionBitMask != 142){ // ADD AND A VARIABLE == 0

if bird2.physicsBody!.affectedByGravity == true && bird2con == 0 && bird2conv == 0 && breakwallcon == 0 {




if jumping == false {

if facingdirection == -1 {

flytextureL.append(flytextl)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureL, timePerFrame: 1000000)))

} else {

flytextureR.append(flytextr)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureR, timePerFrame: 1000000)))
}
}


jumping = true
running = false
sliding = false
atrest = false

if newtouch == 1 {
bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.block | PhysicsCategory.outline
// *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")

}
cornerland = 0

// *** print("jumping")

/* if cornerland == 1 {
bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.block | PhysicsCategory.outline
cornerland = 0
} */







}
}


//FUNCTION: STATE CHANGE TO ATREST

if atrest == false && birdfalling == 0 && abs(bird2.physicsBody!.velocity.dx) < 50 && runningthisframe == 0 {

if bird2con > 5 {

bird2.physicsBody!.affectedByGravity = true
// *** print("atrest")
// *** print("bird2con after atrest triggered: \(bird2con)")
//    birdimage.anchorPoint = CGPoint(x: 0.5, y: newAnchorPoint)
adjustcounter = 0
bird2.removeActionForKey("Fall")
birdfalling = 0
bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
bird2.physicsBody!.velocity.dx = 0.00000000000000

jumping = false
running = false
sliding = false
atrest = true




if facingdirection == -1 {

leftresttexture.append(leftresttext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftresttexture, timePerFrame: 1000000)))

} else {

rightresttexture.append(rightresttext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightresttexture, timePerFrame: 1000000)))
}

}
}

//ENDFUNCTION: STATE CHANGE TO ATREST

//FUNCTIONS: CANCEL FALSE FALL ACTIONS AND SET BIRDFALLING STATE

//cancels fall action if collision not made - platforms

if firstplatformcontact == 1 && abs(bird2.physicsBody!.velocity.dx) > 50 {

tempplatform.removeActionForKey("Fall")
bird2.removeActionForKey("Fall")
birdfalling = 0

firstplatformcontact = 0
// *** print("platform fall removed 1")


}

if firstplatformcontact == 1 && abs(bird2.physicsBody!.velocity.dx) <= 50 {

firstplatformcontact = 0

if bird2.hasActions() == true {

birdfalling = 1

}

}

//cancels fall action if collision not made - vplatforms

if firstvplatformcontact == 1 && abs(bird2.physicsBody!.velocity.dx) > 50 {

tempvplatform.removeActionForKey("Fall")
bird2.removeActionForKey("Fall")
// *** print("vplatform fall removed 1")

birdfalling = 0

firstvplatformcontact = 0

}

if firstvplatformcontact == 1 && abs(bird2.physicsBody!.velocity.dx) <= 50 {

firstvplatformcontact = 0

if bird2.hasActions() == true {

birdfalling = 1

}

}

//End function: Cancel False Fall Actions

//Function: cancel floor run fall

if bird2con == 2 {

bird2.removeActionForKey("Fall")
birdfalling = 0
}

//End function: cancel floor run fall


//   }


//Function: slide spike check

if spikecontact == 1 && preventssdeath == 0 && abs(bird2.physicsBody!.velocity.dx) > 50 && running == false && breakwallcon == 0 && gameover == false && reposition == 0 {



//     TURNS ON SLIDESPIKE DEATH. PUT BACK:
// *** print("slidespikedeath")
//
//   death()

//  Function: end spike check
}
}

override func didApplyConstraints() {
if printOn == 1 {
// *** print("didApplyConstraints")
}
}


override func didSimulatePhysics() {

if printOn == 1 {
// *** print("didSimulatePhysics")
// *** print("velocity at beginning of didSimulatePhysics: dx: \(bird2.physicsBody!.velocity.dx) dy: \(bird2.physicsBody!.velocity.dy)")

// *** print("pssdcounter: \(pssdcounter)")
}



if pssdcounter > 0 {

if pssdcounter == 1 {

// *** print("pssdrun")
preventssdeath = 0

bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.floor

bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.dart | PhysicsCategory.floor | PhysicsCategory.slidespike

}

pssdcounter = pssdcounter - 1



}

func placeholder() {

// // *** print("placeholder1: \(placeholder1)")

if placeholder1 != -1 {

// // *** print("placeholder run")

platforms[placeholder1].position.y = platforms[placeholder1].physicsBody!.charge
//  // *** print("checka1")
vplatforms[placeholder1].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")
//  // *** print("checka2")
platforms[placeholder1].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")
//  // *** print("placeholder run2")
if GameState.sharedInstance.score < 5 {
//  // *** print("checka3")
coins[placeholder1].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[placeholder1].hidden = false
//   // *** print("placeholder run3")
}

if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {
//   // *** print("checka4")
coins2[placeholder1].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins2[placeholder1].hidden = false
}

if GameState.sharedInstance.score >= 10 {
//   // *** print("checka5")
coins3[placeholder1].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins3[placeholder1].hidden = false
}


///   // *** print("checka6")

closepos = placeholder1

//   // *** print("ran open gap p1")
//   // *** print("checka7")
vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
//  // *** print("checka8")
platforms[placeholder1].physicsBody!.angularDamping = 0.1
//  // *** print("vplatform AG after move1: \(vplatforms[placeholder1].physicsBody!.angularDamping)")
//  // *** print("platform AG after move1: \(platforms[placeholder1].physicsBody!.angularDamping)")



placeholder1 = -1
}

//   // *** print("placeholder2: \(placeholder2)")

if placeholder2 != -1 {

//    // *** print("check1")
platforms[placeholder2].position.y = platforms[placeholder2].physicsBody!.charge

//    // *** print("check2")
vplatforms[placeholder2].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")
//   // *** print("check3")


platforms[placeholder2].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")
//    // *** print("check4")
//    // *** print("GameState.sharedInstance.score: \(GameState.sharedInstance.score)")

if GameState.sharedInstance.score < 5 {
//    // *** print("check5")
coins[placeholder2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[placeholder2].hidden = false
//    // *** print("check5b")
}

if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {
////    // *** print("check6")
coins2[placeholder2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins2[placeholder2].hidden = false
//    // *** print("check6b")
}

if GameState.sharedInstance.score >= 10 {
//    // *** print("check7")
coins3[placeholder2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins3[placeholder2].hidden = false
//    // *** print("check7b")
}

closepos = placeholder2

//    // *** print("ran open gap p1")
//    // *** print("check8")
vplatforms[placeholder2].physicsBody!.angularDamping = 0.1
platforms[placeholder2].physicsBody!.angularDamping = 0.1
//    // *** print("vplatform AG after move1: \(vplatforms[placeholder2].physicsBody!.angularDamping)")
//    // *** print("platform AG after move1: \(platforms[placeholder2].physicsBody!.angularDamping)")
placeholder2 = -1



placeholder2 = -1
}
//   // *** print("placeholder3: \(placeholder3)")

if placeholder3 != -1 {
platforms[placeholder3].position.y = platforms[placeholder3].physicsBody!.charge

vplatforms[placeholder3].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")

platforms[placeholder3].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")


if GameState.sharedInstance.score < 5 {

coins[placeholder3].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[placeholder3].hidden = false
}

if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {

coins2[placeholder3].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins2[placeholder3].hidden = false
}

if GameState.sharedInstance.score >= 10 {

coins3[placeholder3].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins3[placeholder3].hidden = false
}

closepos = placeholder3

//  // *** print("ran open gap p1")

vplatforms[placeholder3].physicsBody!.angularDamping = 0.1
platforms[placeholder3].physicsBody!.angularDamping = 0.1
//  // *** print("vplatform AG after move1: \(vplatforms[placeholder3].physicsBody!.angularDamping)")
//  // *** print("platform AG after move1: \(platforms[placeholder3].physicsBody!.angularDamping)")


placeholder3 = -1
}

//   // *** print("placeholder4: \(placeholder4)")
if placeholder4 != -1 {
platforms[placeholder4].position.y = platforms[placeholder4].physicsBody!.charge


vplatforms[placeholder4].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")
platforms[placeholder4].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")


if GameState.sharedInstance.score < 5 {

coins[placeholder4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins[placeholder4].hidden = false
}

if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {

coins2[placeholder4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins2[placeholder4].hidden = false
}

if GameState.sharedInstance.score >= 10 {

coins3[placeholder4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
coins3[placeholder4].hidden = false
}

closepos = placeholder4

//   // *** print("ran open gap p1")

vplatforms[placeholder4].physicsBody!.angularDamping = 0.1
platforms[placeholder4].physicsBody!.angularDamping = 0.1
//  // *** print("vplatform AG after move1: \(vplatforms[placeholder4].physicsBody!.angularDamping)")
//  // *** print("platform AG after move1: \(platforms[placeholder4].physicsBody!.angularDamping)")
placeholder4 = -1

placeholder4 = -1
}

}

placeholder()


//  // *** print("breakcheck")

// FUNCTIONS: PLATFORM RUN AND FLOOR RUN

func runcheck() {

if running == false { //FIXED THIS ADDED THESE IF FALSE STATEMENTS TO ELIMINATE REPEATED DX = 0 AND OTHER COMMANDS

if (bird2con == 1 && bird2.physicsBody!.velocity.dy - dypriorframe > 0 && abs(bird2.physicsBody!.velocity.dx) > 50) || (bird2begincon == 1 && bird2.physicsBody!.velocity.dy - dypriorframe > 0 && abs(bird2.physicsBody!.velocity.dx) > 50) || (bird2begincon == 1 && bird2.physicsBody!.velocity.dy - dyprior2frames > 0 && abs(bird2.physicsBody!.velocity.dx) > 50) {


//Second condition is for when collision is made but contact is made and ended in same frame. First condition is for (have never seen this but just in case) contact made in previous frame but collision made in next frame. Third condition is for if collision was made in previous frame and contact was made in next frame?
if printOn == 1 {
//println("check for alignment2: bird5 pos \(bird5.position.y)  bird2min y: \(CGRectGetMinY(bird2.frame))")
// *** print("running")
// *** print("running dypriorframe: \(dypriorframe)")
// *** print("running dyprior2frames: \(dyprior2frames)")
}
jumping = false
running = true
sliding = false
atrest = false
bird2.physicsBody!.velocity.dx = 0.000000000000
bird2.physicsBody!.velocity.dy = 0.000000000000 //new 5/16/2015
// REMOVED FOR COLLISION & VELOCITY BASED PHYSICS   bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline//new 5/16/2015. Block added during a normal jump (cornerland = 0)
bird2.physicsBody!.affectedByGravity = false
// *** print("running1")
newtouch = 0

runningthisframe = 1
// REMOVED FOR COLLISION & VELOCITY BASED PHYSICS   println("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")


// if bird5con == 0 {
cornerland = 1
//  }

//  if bird5con == 1 {
//           birdimage.anchorPoint = CGPoint(x: 0.5, y: newAnchorPoint)
adjustcounter = 0
//    println("changed anchorPoint birdimage")
//   }


if facingdirection == 1 {

righttexture.append(righttext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(righttexture, timePerFrame: 1000000)))

} else {

lefttexture.append(lefttext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(lefttexture, timePerFrame: 1000000)))
}







}


//  // *** print("breakcheck2")

if (bird2con == 5 && bird2.physicsBody!.velocity.dy < 50) || (bird2con == 3 && atrest == false && abs(bird2.physicsBody!.velocity.dx) > 50) { // removed  && abs(bird2.physicsBody!.velocity.dx) > 50 from first condition. Now, running will run again when bird lowers onto floor from falling platform. But that is ok; just check before running an animation to see if running is already true; if so, don't restart the running animation.

jumping = false
running = true
sliding = false
atrest = false
bird2.physicsBody!.velocity.dx = 0.000000000000 // TOOK OUT FOR AGROUND TEST

//why not add velocity.dy = 0?
bird2.physicsBody!.affectedByGravity = false
// // *** print("running2")
newtouch = 0
bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
// // *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")
bird2.removeActionForKey("Fall")
birdfalling = 0
runningthisframe = 1


// if bird5con == 1 {
//    birdimage.anchorPoint = CGPoint(x: 0.5, y: newAnchorPoint)
adjustcounter = 0
//   println("changed anchorPoint birdimage")
// }

if facingdirection == 1 {

righttexture.append(righttext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(righttexture, timePerFrame: 1000000)))

} else {

lefttexture.append(lefttext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(lefttexture, timePerFrame: 1000000)))
}


}


}
}

runcheck()

// END FUNCTIONS: PLATFORM RUN AND FLOOR RUN


//FUNCTION: SLIDES ON PLATFORM
func slidesonplatform() {

if sliding == false && running == false {


if (bird2begincon == 1 && abs(bird2.physicsBody!.velocity.dx) <= 50) || (bird2con == 1 && abs(bird2.physicsBody!.velocity.dx) <= 50) {

//    if newtouch == 1 {
// *** print("dx velocity before sliding: \(bird2.physicsBody!.velocity.dx)")
bird2.physicsBody!.velocity.dx = 0.000000000000 //PUT BACK FOR NON RUNNING TEST
runpos = 0
bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
jumping = false
running = false
sliding = true
atrest = false
newtouch = 0
//   bird2.physicsBody!.affectedByGravity = true
if printOn == 1 {
// *** print("sliding")
// *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")

// *** print("bird2con after sliding triggered: \(bird2con)")
}

bird2.removeActionForKey("Fall")
birdfalling = 0

if facingdirection == -1 {

rightslidetexture.append(rightslidetext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightslidetexture, timePerFrame: 1000000)))

} else {

leftslidetexture.append(leftslidetext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftslidetexture, timePerFrame: 1000000)))
}

}
}
}
slidesonplatform()





//END FUNCTION: SLIDES ON PLATFORM

//  // *** print("breakcheck3")

//FUNCTION: SLIDES ON VPLATFORM

func slidesonvplatform() {

if (bird2conv == 1 || bird2beginconv == 1) && sliding == false {

if abs(bird2.physicsBody!.velocity.dx) <= 50  { //IS THE DY REQUIREMENT NECESSARY? Removed: && abs(CGFloat(bird2.physicsBody!.velocity.dy)) > 0.01

if printOn == 1 {
// *** print("dx velocity before sliding: \(bird2.physicsBody!.velocity.dx)")
}

bird2.physicsBody!.velocity.dx = 0.000000000000 //PUT BACK FOR NON running TEST
jumping = false
sliding = true
running = false
atrest = false
runpos = 0
bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
newtouch = 0

bird2.removeActionForKey("Fall")
birdfalling = 0
bird5concheck = 1
if printOn == 1 {
// *** print("v slide")
// *** print("bird5concheck set to 1")
// *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")
}

//    self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)

//slide animation:


if facingdirection == -1 {

rightslidetexture.append(rightslidetext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightslidetexture, timePerFrame: 1000000)))

} else {

leftslidetexture.append(leftslidetext)

//    bird.removeAllActions()
birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftslidetexture, timePerFrame: 1000000)))
}

}
}
}
slidesonvplatform()

//END FUNCTION: SLIDES ON VPLATFORM








//test to see if can smoothe dy: PUT BACK
/*
if bird2con == 1 && bird4con == 1 && turnoffsmoothe == 0 {

println("adjust dy")
bird2.physicsBody!.velocity.dy = previousvelocity - 28
turnoffsmoothe = 1
}
*/



/*  newpositionx = bird.position.x


dpx = newpositionx - oldpositionx

if dpx == 0 && contactcounter != 1 {
hitwall = true
}

if abs(dpx) > 0 || contactcounter == 1 {
hitwall = false
}

oldpositionx = newpositionx */
//  run()


/*    backgroundLayer.enumerateChildNodesWithName("customdart1") { node, _ in

let dart = node as SKSpriteNode

// println("enumerate: \(dart.position)")
//  println("first dleay: \(self.firstdelay) customdart1start: \(self.customdart1start) angular damping: \(dart.physicsBody!.angularDamping) restitution: \(dart.physicsBody!.restitution)")
if self.customdart1start >= dart.physicsBody!.restitution*CGFloat(10000) {
self.firstdelay = 0
}

if self.customdart1start < dart.physicsBody!.restitution*CGFloat(10000) {
self.firstdelay = 1
self.customdart1start = self.customdart1start + (1/3)

}


func dename(dart: SKSpriteNode) {
println("fling 2 \(dart.name)")
dart.name = "none"
}

func rename(dart: SKSpriteNode) {
dart.name = "customdart1"
}

func fling2 (dart: SKSpriteNode) {

dart.physicsBody!.applyImpulse((CGVector(dx: 0, dy: 320)))
dart.runAction(SKAction.sequence([SKAction.waitForDuration(1.25),SKAction.runBlock({rename(dart)})]))
}


if dart.position.y > -100 && dart.position.y < 250 {
dart.runAction(SKAction.sequence([SKAction.runBlock({dename(dart)}), SKAction.waitForDuration(NSTimeInterval(0.5 + self.firstdelay*dart.physicsBody!.angularDamping*10000)), SKAction.runBlock({fling2(dart)})]))
}


} */



/*   backgroundLayer.enumerateChildNodesWithName("dart") { node, _ in

let dart = node as SKSpriteNode

// println("enumerate: \(dart.position)")

func dename(dart: SKSpriteNode) {
println("fling \(dart.name)")
dart.name = "none"
}

func rename(dart: SKSpriteNode) {
dart.name = "dart"
}

func fling(dart: SKSpriteNode) {
println("physics body restitution: \(dart.physicsBody?.restitution) mass: \(dart.physicsBody?.mass)")
dart.physicsBody!.applyImpulse((CGVector(dx: 0, dy: dart.physicsBody!.restitution*10000)))
dart.runAction(SKAction.sequence([SKAction.waitForDuration(1.25),SKAction.runBlock({rename(dart)})]))
}



if dart.position.x < self.backgroundLayer.convertPoint(CGPoint(x: self.size.width, y: -100), fromNode: self).x && dart.position.x > self.backgroundLayer.convertPoint(CGPoint(x: 0, y: -100), fromNode: self).x {
if dart.position.y > -100 && dart.position.y < 250 {
dart.runAction(SKAction.sequence([SKAction.runBlock({dename(dart)}), SKAction.waitForDuration(0.5), SKAction.runBlock({fling(dart)})]))
}


}
}

backgroundLayer.enumerateChildNodesWithName("sidedart") { node, _ in
let sidedart = node as SKSpriteNode

if sidedart.position.x < self.bird.position.x && sidedart.position.y < self.bird.position.y {
sidedart.name = "none"
sidedart.runAction(SKAction.sequence([SKAction.moveByX(700 , y: 0, duration: 2), SKAction.removeFromParent()]))
}
} */

/*   backgroundLayer.enumerateChildNodesWithName("starter") { node, _ in

let starter = node as SKSpriteNode
if CGRectGetMaxX(starter.frame) < self.backgroundLayer.convertPoint(CGPoint(x: self.size.width/2 - self.bird.size.width/2, y: -100), fromNode: self).x {
starter.runAction(SKAction.moveTo(CGPoint(x: CGFloat(starter.position.x), y: CGFloat(1548/2)), duration: 1.0))
GameState.sharedInstance.score = GameState.sharedInstance.score + 1
GameState.sharedInstance.scoreLabel.text = String(GameState.sharedInstance.score)
starter.name = "none"
}
}*/
//  // *** print("breakcheck4")



if bird2.position.x > posA && posA > 0 {

GameState.sharedInstance.score = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score


}

GameState.sharedInstance.saveState()


if platforms[11].parent != nil { // 3 + 8
platforms[11].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[11].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[0].removeActionForKey("Fall2")
vplatforms[0].removeActionForKey("Fall2")

platforms[0].runAction(SKAction.moveToY(platforms[0].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[0].runAction(SKAction.moveToY(vplatforms[0].physicsBody!.charge + swgap/2, duration: 0.25))

posA = -1

if posAs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posAs = 0
}
}
if bird2.position.x > posB && posB > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)


xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}

GameState.sharedInstance.saveState()

if platforms[0].parent != nil {
platforms[0].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[0].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")

platforms[4].removeActionForKey("Fall2")
vplatforms[4].removeActionForKey("Fall2")

platforms[4].runAction(SKAction.moveToY(platforms[4].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[4].runAction(SKAction.moveToY(vplatforms[4].physicsBody!.charge + swgap/2, duration: 0.25))
}



posB = -1

if posBs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posBs = 0
}

}
if bird2.position.x > posC && posC > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

GameState.sharedInstance.saveState()

if platforms[4].parent != nil {
platforms[4].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[4].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}


platforms[8].removeActionForKey("Fall2")
vplatforms[8].removeActionForKey("Fall2")

platforms[8].runAction(SKAction.moveToY(platforms[8].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[8].runAction(SKAction.moveToY(vplatforms[8].physicsBody!.charge + swgap/2, duration: 0.25))

posC = -1

if posCs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posCs = 0
}

}
if bird2.position.x > posD && posD > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()


if platforms[8].parent != nil {
platforms[8].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[8].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}


platforms[1].removeActionForKey("Fall2")
vplatforms[1].removeActionForKey("Fall2")

platforms[1].runAction(SKAction.moveToY(platforms[1].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[1].runAction(SKAction.moveToY(vplatforms[1].physicsBody!.charge + swgap/2, duration: 0.25))

posD = -1

if posDs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posDs = 0
}
}
if bird2.position.x > posE && posE > 0 {

// *** print("posE before reset: \(posE)")
GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[1].parent != nil {
platforms[1].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[1].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[5].removeActionForKey("Fall2")
vplatforms[5].removeActionForKey("Fall2")

platforms[5].runAction(SKAction.moveToY(platforms[5].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[5].runAction(SKAction.moveToY(vplatforms[5].physicsBody!.charge + swgap/2, duration: 0.25))

posE = -1

if posEs == 1 && bird2con > 0{
bird2.physicsBody!.velocity.dx = 0.000000000000
posEs = 0
}

}
if bird2.position.x > posF && posF > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[5].parent != nil {
platforms[5].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[5].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[9].removeActionForKey("Fall2")
vplatforms[9].removeActionForKey("Fall2")

platforms[9].runAction(SKAction.moveToY(platforms[9].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[9].runAction(SKAction.moveToY(vplatforms[9].physicsBody!.charge + swgap/2, duration: 0.25))

posF = -1

if posFs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posFs = 0
}
}
if bird2.position.x > posG && posG > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[9].parent != nil {
platforms[9].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[9].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[2].removeActionForKey("Fall2")
vplatforms[2].removeActionForKey("Fall2")

platforms[2].runAction(SKAction.moveToY(platforms[2].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[2].runAction(SKAction.moveToY(vplatforms[2].physicsBody!.charge + swgap/2, duration: 0.25))

posG = -1

if posGs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posGs = 0
}

}
if bird2.position.x > posH && posH > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[2].parent != nil {
platforms[2].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[2].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[6].removeActionForKey("Fall2")
vplatforms[6].removeActionForKey("Fall2")

platforms[6].runAction(SKAction.moveToY(platforms[6].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[6].runAction(SKAction.moveToY(vplatforms[6].physicsBody!.charge + swgap/2, duration: 0.25))

posH = -1

if posHs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posHs = 0
}

}
if bird2.position.x > posI && posI > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[6].parent != nil {
platforms[6].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[6].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[10].removeActionForKey("Fall2")
vplatforms[10].removeActionForKey("Fall2")

platforms[10].runAction(SKAction.moveToY(platforms[10].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[10].runAction(SKAction.moveToY(vplatforms[10].physicsBody!.charge + swgap/2, duration: 0.25))

posI = -1

if posIs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posIs = 0
}

}
if bird2.position.x > posJ && posJ > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[10].parent != nil {
platforms[10].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[10].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[3].removeActionForKey("Fall2")
vplatforms[3].removeActionForKey("Fall2")

platforms[3].runAction(SKAction.moveToY(platforms[3].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[3].runAction(SKAction.moveToY(vplatforms[3].physicsBody!.charge + swgap/2, duration: 0.25))

posJ = -1

if posJs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posJs = 0
}

}
if bird2.position.x > posK && posK > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[3].parent != nil {
platforms[3].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[3].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[7].removeActionForKey("Fall2")
vplatforms[7].removeActionForKey("Fall2")

platforms[7].runAction(SKAction.moveToY(platforms[7].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[7].runAction(SKAction.moveToY(vplatforms[7].physicsBody!.charge + swgap/2, duration: 0.25))

posK = -1

if posKs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posKs = 0
}

}
if bird2.position.x > posL && posL > 0 {

GameState.sharedInstance.score  = GameState.sharedInstance.score + 1
scoreLabel.text = String(GameState.sharedInstance.score)

xposlastscore = bird2.position.x

if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
highScoreLabel.text = String(GameState.sharedInstance.score)
GameState.sharedInstance.highScore = GameState.sharedInstance.score

}
GameState.sharedInstance.saveState()

if platforms[7].parent != nil {
platforms[7].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[7].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
}

platforms[8+3].removeActionForKey("Fall2")
vplatforms[8+3].removeActionForKey("Fall2")

platforms[8+3].runAction(SKAction.moveToY(platforms[8+3].physicsBody!.charge - swgap/2, duration: 0.25))
vplatforms[8+3].runAction(SKAction.moveToY(vplatforms[8+3].physicsBody!.charge + swgap/2, duration: 0.25))

posL = -1

if posLs == 1 && bird2con > 0 {
bird2.physicsBody!.velocity.dx = 0.000000000000
posLs = 0
}

}
//// *** print("breakcheck5")

if GameState.sharedInstance.score == 2 && frontClosed == 0 {

platforms[4].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[4].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
frontClosed = 1
}

}

/*  func run() {


if sliding == false && jumping == false && contactcounter > 0 { // //&& running == true // hitwall == false &&
//if facingdirection > 0 {
/* bird.runAction(SKAction.moveByX(moveincrement, y:0, duration: 3))
SKAction.moveByX(50, y:0, duration:1.0)}*/

bird.physicsBody!.velocity.dx = 0

if facingdirection == 1 {
righttexture.append(righttext)
//  bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(righttexture, timePerFrame: 10000000)))
}

if facingdirection == -1 {
lefttexture.append(lefttext)
// bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(lefttexture, timePerFrame: 10000000)))
}

}

} */






func didBeginContact(contact: SKPhysicsContact) {

if printOn == 1 {
// *** print("didBeginContact")
}

//Function Platform Falling







if contact.bodyA.node?.name == "cleanup" {

//   print("cleanup")
contact.bodyB.node?.paused = false
contact.bodyB.node?.removeAllActions()
contact.bodyB.node?.physicsBody?.restitution = 0.2
contact.bodyB.node?.physicsBody?.angularDamping = 0.1
contact.bodyB.node?.physicsBody?.linearDamping = 0.1
contact.bodyB.node?.name = nil


let pchildren = contact.bodyB.node?.children as! [SKSpriteNode]

for pchild in pchildren {

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.runAction(SKAction.removeFromParent())

}

contact.bodyB.node?.runAction(SKAction.removeFromParent())

}


if contact.bodyB.node?.name == "cleanup" {
//print("cleanup")
contact.bodyA.node?.paused = false
contact.bodyA.node?.removeAllActions()
contact.bodyA.node?.physicsBody?.restitution = 0.2
contact.bodyA.node?.physicsBody?.angularDamping = 0.1
contact.bodyA.node?.physicsBody?.linearDamping = 0.1
contact.bodyA.node?.name = nil


let pchildren = contact.bodyA.node?.children as! [SKSpriteNode]

for pchild in pchildren {

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.runAction(SKAction.removeFromParent())

}

contact.bodyA.node?.runAction(SKAction.removeFromParent())

}


if contact.bodyA.node?.name == "coin" && abs(bird2.physicsBody!.velocity.dx) > 50 {


//     minicoinlabels[minicycle].removeFromParent()


minicoinlabels[minicycle].position.x = contact.bodyA.node!.position.x

minicoinlabels[minicycle].position.y = contact.bodyA.node!.position.y
minicoinlabels[minicycle].removeAllActions()

minicoinlabels[minicycle].text = "+\(yellowCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.yelCoinUpg)"
backgroundLayer.addChild(minicoinlabels[minicycle])
minicoinlabels[minicycle].runAction(SKAction.fadeInWithDuration(0))
minicoinlabels[minicycle].runAction(SKAction.moveTo(CGPoint(x: minicoinlabels[minicycle].position.x + 70, y: minicoinlabels[minicycle].position.y + 70), duration: 0.9))
minicoinlabels[minicycle].runAction(SKAction.sequence([SKAction.fadeOutWithDuration(0.85), SKAction.removeFromParent()]))




if minicycle < 2 {

minicycle++

} else {

minicycle = 0

}


contact.bodyA.node?.removeFromParent()
GameState.sharedInstance.coins = GameState.sharedInstance.coins + yellowCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.yelCoinUpg
coinLabel.text = String(GameState.sharedInstance.coins)



}

if contact.bodyB.node?.name == "coin" && abs(bird2.physicsBody!.velocity.dx) > 50 {


//      minicoinlabels[minicycle].removeFromParent()
minicoinlabels[minicycle].position.x = contact.bodyB.node!.position.x
minicoinlabels[minicycle].position.y = contact.bodyB.node!.position.y
minicoinlabels[minicycle].removeAllActions()
minicoinlabels[minicycle].text = "+\(yellowCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.yelCoinUpg)"
backgroundLayer.addChild(minicoinlabels[minicycle])
minicoinlabels[minicycle].runAction(SKAction.fadeInWithDuration(0))
minicoinlabels[minicycle].runAction(SKAction.moveTo(CGPoint(x: minicoinlabels[minicycle].position.x + 70, y: minicoinlabels[minicycle].position.y + 70), duration: 0.9))
minicoinlabels[minicycle].runAction(SKAction.sequence([SKAction.fadeOutWithDuration(0.85), SKAction.removeFromParent()]))

if minicycle < 2 {

minicycle++

} else {

minicycle = 0

}

contact.bodyB.node?.removeFromParent()
GameState.sharedInstance.coins = GameState.sharedInstance.coins + yellowCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.yelCoinUpg
coinLabel.text = String(GameState.sharedInstance.coins)
}

if contact.bodyA.node?.name == "coin2" && abs(bird2.physicsBody!.velocity.dx) > 50 {

//     minicoinlabels[minicycle].removeFromParent()
minicoinlabels[minicycle].position.x = contact.bodyA.node!.position.x
minicoinlabels[minicycle].position.y = contact.bodyA.node!.position.y
minicoinlabels[minicycle].removeAllActions()

minicoinlabels[minicycle].text = "+\(bluCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.bluCoinUpg)"
backgroundLayer.addChild(minicoinlabels[minicycle])
minicoinlabels[minicycle].runAction(SKAction.fadeInWithDuration(0))
minicoinlabels[minicycle].runAction(SKAction.moveTo(CGPoint(x: minicoinlabels[minicycle].position.x + 70, y: minicoinlabels[minicycle].position.y + 70), duration: 0.9))
minicoinlabels[minicycle].runAction(SKAction.sequence([SKAction.fadeOutWithDuration(0.85), SKAction.removeFromParent()]))

if minicycle < 2 {

minicycle++

} else {

minicycle = 0

}

contact.bodyA.node?.removeFromParent()
GameState.sharedInstance.coins = GameState.sharedInstance.coins + bluCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.bluCoinUpg
coinLabel.text = String(GameState.sharedInstance.coins)

}

if contact.bodyB.node?.name == "coin2" && abs(bird2.physicsBody!.velocity.dx) > 50 {

//      minicoinlabels[minicycle].removeFromParent()
minicoinlabels[minicycle].position.x = contact.bodyB.node!.position.x
minicoinlabels[minicycle].position.y = contact.bodyB.node!.position.y
minicoinlabels[minicycle].removeAllActions()

minicoinlabels[minicycle].text = "+\(bluCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.bluCoinUpg)"
backgroundLayer.addChild(minicoinlabels[minicycle])
minicoinlabels[minicycle].runAction(SKAction.fadeInWithDuration(0))
minicoinlabels[minicycle].runAction(SKAction.moveTo(CGPoint(x: minicoinlabels[minicycle].position.x + 70, y: minicoinlabels[minicycle].position.y + 70), duration: 0.9))
minicoinlabels[minicycle].runAction(SKAction.sequence([SKAction.fadeOutWithDuration(0.85), SKAction.removeFromParent()]))

if minicycle < 2 {

minicycle++

} else {

minicycle = 0

}

contact.bodyB.node?.removeFromParent()
GameState.sharedInstance.coins = GameState.sharedInstance.coins + bluCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.bluCoinUpg
coinLabel.text = String(GameState.sharedInstance.coins)
}

if contact.bodyA.node?.name == "coin3" && abs(bird2.physicsBody!.velocity.dx) > 50 {

//        minicoinlabels[minicycle].removeFromParent()
minicoinlabels[minicycle].position.x = contact.bodyA.node!.position.x
minicoinlabels[minicycle].position.y = contact.bodyA.node!.position.y
minicoinlabels[minicycle].removeAllActions()

minicoinlabels[minicycle].text = "+\(redCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.redCoinUpg)"
backgroundLayer.addChild(minicoinlabels[minicycle])
minicoinlabels[minicycle].runAction(SKAction.fadeInWithDuration(0))
minicoinlabels[minicycle].runAction(SKAction.moveTo(CGPoint(x: minicoinlabels[minicycle].position.x + 70, y: minicoinlabels[minicycle].position.y + 70), duration: 0.9))
minicoinlabels[minicycle].runAction(SKAction.sequence([SKAction.fadeOutWithDuration(0.85), SKAction.removeFromParent()]))


if minicycle < 2 {

minicycle++

} else {

minicycle = 0

}


contact.bodyA.node?.removeFromParent()
GameState.sharedInstance.coins = GameState.sharedInstance.coins + redCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.redCoinUpg
coinLabel.text = String(GameState.sharedInstance.coins)

}

if contact.bodyB.node?.name == "coin3" && abs(bird2.physicsBody!.velocity.dx) > 50 {

//        minicoinlabels[minicycle].removeFromParent()
minicoinlabels[minicycle].position.x = contact.bodyB.node!.position.x

minicoinlabels[minicycle].position.y = contact.bodyB.node!.position.y

minicoinlabels[minicycle].removeAllActions()

minicoinlabels[minicycle].text = "+\(redCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.redCoinUpg)"
backgroundLayer.addChild(minicoinlabels[minicycle])
minicoinlabels[minicycle].runAction(SKAction.fadeInWithDuration(0))
minicoinlabels[minicycle].runAction(SKAction.moveTo(CGPoint(x: minicoinlabels[minicycle].position.x + 70, y: minicoinlabels[minicycle].position.y + 70), duration: 0.9))
minicoinlabels[minicycle].runAction(SKAction.sequence([SKAction.fadeOutWithDuration(0.85), SKAction.removeFromParent()]))

if minicycle < 2 {

minicycle++

} else {

minicycle = 0

}

contact.bodyB.node?.removeFromParent()
GameState.sharedInstance.coins = GameState.sharedInstance.coins + redCoinBase*GameState.sharedInstance.coinMult*GameState.sharedInstance.redCoinUpg
coinLabel.text = String(GameState.sharedInstance.coins)
}


if contact.bodyA.node?.name == "platform" && contact.bodyA.node?.physicsBody!.linearDamping < 14000 {


if contact.bodyA.node?.hasActions() == true {

//   var starttime: NSTimeInterval = NSTimeInterval(contact.bodyA.node?.physicsBody!.mass)

var timecurrent: CGFloat = CGFloat(CFAbsoluteTimeGetCurrent())%100
let timestart: CGFloat = contact.bodyA.node!.physicsBody!.mass

if timecurrent - timestart < 0 {

timecurrent = timecurrent + 100
}

var waittime: CGFloat = 1.0 - (timecurrent - timestart)

// *** print("contact.bodyA.node!.physicsBody!.mass: \(contact.bodyA.node!.physicsBody!.mass)")
// *** print("CFAbsoluteTimeGetCurrent(): \(CFAbsoluteTimeGetCurrent())")
// *** print("(CGFloat(CFAbsoluteTimeGetCurrent())): \(CGFloat(CFAbsoluteTimeGetCurrent()))")
// *** print("waittime: \(waittime)")

if waittime < 0 {
waittime = 0
}


contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(waittime)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")

contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(waittime)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")


}





if contact.bodyA.node?.hasActions() == false {


tempplatform = contact.bodyA.node

// *** print("\(tempplatform)")
firstplatformcontact = 1


contact.bodyA.node?.physicsBody!.mass = CGFloat(CFAbsoluteTimeGetCurrent())%100 // records start time for fall action

// *** print("record mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")
// *** print("actual mass: \(contact.bodyB.node?.physicsBody!.mass)")
// *** print("truncate mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")



contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")

// *** print("run fall 1")
}



}






if contact.bodyB.node?.name == "platform" && contact.bodyB.node?.physicsBody!.linearDamping < 14000 {


if contact.bodyB.node?.hasActions() == true {

var timecurrent: CGFloat = CGFloat(CFAbsoluteTimeGetCurrent())%100
let timestart: CGFloat = contact.bodyB.node!.physicsBody!.mass

if timecurrent - timestart < 0 {

timecurrent = timecurrent + 100
}

var waittime: CGFloat = 1.0 - (timecurrent - timestart)

// *** print("contact.bodyB.node!.physicsBody!.mass: \(contact.bodyB.node!.physicsBody!.mass)")
// *** print("CFAbsoluteTimeGetCurrent(): \((CFAbsoluteTimeGetCurrent()))")
//  println("(CGFloat(CFAbsoluteTimeGetCurrent())): \(CGFloat(CFAbsoluteTimeGetCurrent()))")
// *** print("waittime: \(waittime)")

if waittime < 0 {
waittime = 0
}




contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(waittime)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(waittime)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")

}






if contact.bodyB.node?.hasActions() == false {


tempplatform = contact.bodyB.node
// *** print("\(tempplatform)")
firstplatformcontact = 1

contact.bodyB.node?.physicsBody!.mass = CGFloat(CFAbsoluteTimeGetCurrent())%100 //records start time for fall action

// *** print("record mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")
// *** print("actual mass: \(contact.bodyB.node?.physicsBody!.mass)")
// *** print("truncate mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")

contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")

// *** print("run fall 2")
}


}



//End Function: Platform falling


//Function VPlatform Falling

if contact.bodyA.node?.name == "vplatform" && contact.bodyA.node?.physicsBody!.linearDamping < 14000 {


if contact.bodyA.node?.hasActions() == false {


tempvplatform = contact.bodyA.node

// *** print("\(tempvplatform)")
firstvplatformcontact = 1


contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: 1500, duration: 8)]), withKey: "Fall")
}



}


if contact.bodyB.node?.name == "vplatform" && contact.bodyB.node?.physicsBody!.linearDamping < 14000{


if contact.bodyB.node?.hasActions() == false {

tempvplatform = contact.bodyB.node
// *** print("\(tempvplatform)")
firstvplatformcontact = 1


contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: 1500, duration: 8)]), withKey: "Fall")


}


}


//End Function: Platform falling


/* OLD VPLATFORM FALLING


if contact.bodyA.node?.name == "vplatform" && contact.bodyA.node?.physicsBody!.linearDamping < 10000 {

if contact.bodyB.node?.name == "bird2"  {

if contact.bodyA.node?.physicsBody!.mass > 10000 {

contact.bodyA.node?.runAction(SKAction.sequence([SKAction.moveByX(0, y: 1500, duration: 8)]), withKey: "Fall")

}

if contact.bodyA.node?.physicsBody!.mass < 10000 {

contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: 1500, duration: 8)]), withKey: "Fall") // was duration 1.5

contact.bodyA.node?.physicsBody!.mass = 15000


}

}
}


if contact.bodyB.node?.name == "vplatform" && contact.bodyB.node?.physicsBody!.linearDamping < 10000 {

if contact.bodyA.node?.name == "bird2" {

if contact.bodyB.node?.physicsBody!.mass > 10000 {

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.moveByX(0, y: 1500, duration: 8)]), withKey: "Fall")

}

if contact.bodyB.node?.physicsBody!.mass < 10000 {

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: 1500, duration: 8)]), withKey: "Fall")//was duration 1.5

contact.bodyB.node?.physicsBody!.mass = 15000


}

}


}

END OLD VPLATFORM FALLING */

/* OLD PLATFORM FALLING
if contact.bodyA.node?.name == "platform" && contact.bodyA.node?.physicsBody!.linearDamping < 10000 {

if contact.bodyB.node?.name == "bird2"  {


println("bird2 didbegincontact")

/* if bird2.position.y > CGRectGetMaxY(contact.bodyA.node!.frame) {
newAnchorPoint = -0.00714286*(CGRectGetMaxY(contact.bodyA.node!.frame)-bird2.position.y)
maxylanding = CGRectGetMaxY(contact.bodyA.node!.frame)
} */


if contact.bodyA.node?.physicsBody!.mass > 10000 {

contact.bodyA.node?.runAction(SKAction.sequence([SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")




contact.bodyB.node?.runAction(SKAction.sequence([SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")
println("platform massA0: \(contact.bodyA.node?.physicsBody!.mass)")
//  novj = 1 // novj = 1 PUT BACK AFTER ADDING STIPULATION THAT BIRD5CON = 1, SO THAT DOES NOT TURN ON WHEN AT REST JUMPING UP AND DOWN
}

if contact.bodyA.node?.physicsBody!.mass < 10000 {

contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")//was interval 1.5



//   novj = 1 //   novj = 1 PUT BACK AFTER ADDING STIPULATION THAT BIRD5CON = 1, SO THAT DOES NOT TURN ON WHEN AT REST JUMPING UP AND DOWN

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")// was duration 1.5
println("mass change1")
println("platform massA1: \(contact.bodyA.node?.physicsBody!.mass)")
contact.bodyA.node?.physicsBody!.mass = 15000







}



}
}







if contact.bodyB.node?.name == "platform" && contact.bodyB.node?.physicsBody!.linearDamping < 10000 {

if contact.bodyA.node?.name == "bird2" {

println("bird2 didbegincontact")

/*    if bird2.position.y > CGRectGetMaxY(contact.bodyB.node!.frame) {
newAnchorPoint = -0.00714286*(CGRectGetMaxY(contact.bodyB.node!.frame)-bird2.position.y)
maxylanding = CGRectGetMaxY(contact.bodyB.node!.frame)
} */

if contact.bodyB.node?.physicsBody!.mass > 10000 {

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")

//    novj = 1 //   novj = 1 PUT BACK AFTER ADDING STIPULATION THAT BIRD5CON = 1, SO THAT DOES NOT TURN ON WHEN AT REST JUMPING UP AND DOWN


contact.bodyA.node?.runAction(SKAction.sequence([SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")
println("platform massB0: \(contact.bodyB.node?.physicsBody!.mass)")

}

if contact.bodyB.node?.physicsBody!.mass < 10000 {

contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall") //was interval 1.5


//    novj = 1 //   novj = 1 PUT BACK AFTER ADDING STIPULATION THAT BIRD5CON = 1, SO THAT DOES NOT TURN ON WHEN AT REST JUMPING UP AND DOWN

contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: -1500, duration: 6)]), withKey: "Fall")
println("mass change1")
println("platform massB1: \(contact.bodyB.node?.physicsBody!.mass)")
contact.bodyB.node?.physicsBody!.mass = 15000 // was interval 1.5

}

}
}

END OLD PLATFORM FALLING */

if contact.bodyA.categoryBitMask == PhysicsCategory.slidespike || contact.bodyB.categoryBitMask == PhysicsCategory.slidespike

{
if contact.bodyA.node!.name == "bird2" || contact.bodyB.node!.name == "bird2" {
spikecontact = 1
// *** print("spike contact made")
}

}

if contact.bodyA.node?.name == "bird2" || contact.bodyB.node?.name == "bird2"{
// *** print("bird2begancontact)")

if contact.bodyA.node?.name == "floor" || contact.bodyB.node?.name == "floor" {


bird2con += 5
// *** print("floor contact")



}

if contact.bodyA.node?.name == "vplatform" || contact.bodyB.node?.name == "vplatform" {
bird2conv = bird2conv + 1
// *** print("vplatformcontact")
bird2beginconv = 1
}

if contact.bodyA.node?.name == "platform" || contact.bodyB.node?.name == "platform" {
bird2con = bird2con + 1
bird2begincon = 1
// *** print("platform contact; dx of bird: \(bird2.physicsBody!.velocity.dx)")
// *** print("bird2con: \(bird2con)")




}





if contact.bodyA.node?.name == "platform" {

if contact.bodyA.node?.physicsBody!.angularDamping < 0.09 || contact.bodyA.node?.physicsBody!.angularDamping > 0.11 {

placeholder1 = Int(contact.bodyA.node!.physicsBody!.angularDamping)




}

}



if contact.bodyB.node?.name == "platform" {

if contact.bodyB.node?.physicsBody!.angularDamping < 0.09 || contact.bodyB.node?.physicsBody!.angularDamping > 0.11 {

placeholder2 = Int(contact.bodyB.node!.physicsBody!.angularDamping)



}
}


if contact.bodyA.node?.name == "vplatform" {

if contact.bodyA.node?.physicsBody!.angularDamping < 0.09 || contact.bodyA.node?.physicsBody!.angularDamping > 0.11 {

placeholder3 = Int(contact.bodyA.node!.physicsBody!.angularDamping)




}

}



if contact.bodyB.node?.name == "vplatform" {

if contact.bodyB.node?.physicsBody!.angularDamping < 0.09 || contact.bodyB.node?.physicsBody!.angularDamping > 0.11 {

placeholder4 = Int(contact.bodyB.node!.physicsBody!.angularDamping)



}
}




/*
if sliding == true {
if contact.bodyA.node?.name == "breakwall" {
breakwallcon = breakwallcon + 1

breakingwall = contact.bodyA.node
println("breakwall contact made breakwallcon: \(breakwallcon)")


}

if contact.bodyB.node?.name == "breakwall" {

breakwallcon = breakwallcon + 1

breakingwall = contact.bodyB.node
println("breakwall contact made breakwallcon: \(breakwallcon)")

}
}

if sliding == false {




if contact.bodyA.node?.name == "breakwall" {
breakingwall = contact.bodyA.node
markremovebreakwall = 1
//    contact.bodyA.node?.runAction(SKAction.runBlock({self.Removebreakwall(contact.bodyA.node!)}))


}

if contact.bodyB.node?.name == "breakwall" {

breakingwall = contact.bodyB.node
markremovebreakwall = 1
}
}*/

}


/*

if contact.bodyA.node?.name == "bird6" || contact.bodyB.node?.name == "bird6"
{
bird6con = 1
jumping = false

}

if contact.bodyA.node?.name == "bird7" || contact.bodyB.node?.name == "bird7"
{
bird7con = 1
jumping = false

}

if contact.bodyA.node?.name == "bird8" || contact.bodyB.node?.name == "bird8"
{
bird8con = 1
jumping = false

}*/

/* if contact.bodyA.node?.name == "bird7" || contact.bodyB.node?.name == "bird7"
{
bird2.physicsBody!.affectedByGravity = false

}

if contact.bodyA.node?.name == "bird8" || contact.bodyB.node?.name == "bird8"
{
bird2.physicsBody!.affectedByGravity = false

}
*/



//  println(" \(bird1con) \(bird2con) \(bird3con) \(bird4con) \(bird5con) \(bird6con) \(bird7con) \(bird8con)) ")
// contactcounter = contactcounter + 1

//   println("did begin contact")

//     println("MinY Bird: \(CGRectGetMinY(bird.frame))")
//     println("MaxY Bird: \(CGRectGetMaxY(bird.frame))")
//     println("MaxX Bird: \(CGRectGetMaxX(bird.frame))")
//     println("MinX Bird: \(CGRectGetMinX(bird.frame))")

//   if contact.bodyA.categoryBitMask == PhysicsCategory.bird {

//       println("\(CGRectIsNull(CGRectIntersection(bird.frame, contact.bodyB.node!.frame)))")


//         println("MaxY object: \(CGRectGetMaxY(contact.bodyB.node!.frame))")
//         println("MinY object: \(CGRectGetMinY(contact.bodyB.node!.frame))")
//         println("MaxX object: \(CGRectGetMaxX(contact.bodyB.node!.frame))")
//          println("MinX object: \(CGRectGetMinX(contact.bodyB.node!.frame))")



//      println("width of sprite?: \(contact.bodyA.node!.frame.size.width)")

//         if (CGRectGetMaxX(CGRectIntersection(bird.frame, contact.bodyB.node!.frame)) - CGRectGetMinX(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) > (CGRectGetMaxY(CGRectIntersection(bird.frame, contact.bodyB.node!.frame)) - CGRectGetMinY(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) {

//             println("floor contact ; Width: \(CGRectGetMaxX(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) - \(CGRectGetMinX(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) Height: \(CGRectGetMaxY(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) -  \(CGRectGetMinY(CGRectIntersection(bird.frame, contact.bodyB.node!.frame)))")

//           } else {
//           println("wall contact ; Width: \(CGRectGetMaxX(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) - \(CGRectGetMinX(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) Height: \(CGRectGetMaxY(CGRectIntersection(bird.frame, contact.bodyB.node!.frame))) -  \(CGRectGetMinY(CGRectIntersection(bird.frame, contact.bodyB.node!.frame)))")

//      }



//      }



//   println("ran, stopped dx velocity")

// }

// if facingdirection < 0 {
/*bird.runAction(SKAction.moveByX(-moveincrement, y:0, duration: 3))
SKAction.moveByX(50, y:0, duration:1.0)*/

//  bird.physicsBody!.velocity.dx = -200

//   }
//  }
/* if hitwall == true {
bird.physicsBody!.velocity.dx = 0
}*/

//TURNS ON DARTS
/*
func flinga(dart: SKNode) { //not sure if this can be SKNode or if needs to be SKSpriteNode. If latter, need to figure out how to convert contact.bodyB.node from SKNode to SKSpriteNode.

//     println("physics body friction: \(dart.physicsBody?.friction) mass: \(dart.physicsBody?.mass) impulse: \(dart.physicsBody!.friction*10000)")
dart.physicsBody!.applyImpulse((CGVector(dx: 0, dy: dart.physicsBody!.friction*10000)))


}

func flingb (dart: SKNode) {

dart.physicsBody!.applyImpulse((CGVector(dx: 0, dy: 320)))
println("physics body friction: \(dart.physicsBody?.friction) mass: \(dart.physicsBody?.mass)")

dart.physicsBody!.friction = 320/10000
dart.name = "dart"
}





if contact.bodyA.node?.physicsBody!.categoryBitMask == PhysicsCategory.dartcatcher {

if contact.bodyB.node?.name == "dart" {
contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(0.5)), SKAction.runBlock({flinga(contact.bodyB.node!)})]))

}

if contact.bodyB.node!.name == "customdart1" {
contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(0.5 + contact.bodyB.node!.physicsBody!.angularDamping*10000)), SKAction.runBlock({flingb(contact.bodyB.node!)})]))
}
}


if contact.bodyB.node?.physicsBody!.categoryBitMask == PhysicsCategory.dartcatcher {

if contact.bodyA.node?.name == "dart" {
contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(0.5)), SKAction.runBlock({flinga(contact.bodyA.node!)})]))

}

if contact.bodyA.node!.name == "customdart1" {
contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(0.5 + contact.bodyA.node!.physicsBody!.angularDamping*10000)), SKAction.runBlock({flingb(contact.bodyA.node!)})]))
}
}


*/





/*
let contactMask: UInt32 = contact.bodyA.categoryBitMask
let contactMaskB: UInt32 = contact.bodyB.categoryBitMask

if contact.bodyA.node?.name == "bird2" || contact.bodyB.node?.name == "bird2" {

if bird3con == 0 && bird4con == 0 {


running = true
sliding = false
jumping = false
atrest = false
bird2.physicsBody!.velocity.dx = 0

bird2.physicsBody!.affectedByGravity = false
//   bird7.physicsBody!.collisionBitMask = PhysicsCategory.block
//  bird8.physicsBody!.collisionBitMask = PhysicsCategory.block
//   bird7.physicsBody!.contactTestBitMask = PhysicsCategory.block //PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart
//   bird8.physicsBody!.contactTestBitMask = PhysicsCategory.block
println("ran running")

//  bird2.physicsBody!.affectedByGravity = false
}
}

/* Is this needed? MAYBE PUT BACK
if bird2con == 2 && bird3con == 0 && bird4con == 0 {

running = true
sliding = false
jumping = false
atrest = false

bird1.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dx = 0
bird3.physicsBody!.velocity.dx = 0
bird4.physicsBody!.velocity.dx = 0
bird5.physicsBody!.velocity.dx = 0
bird6.physicsBody!.velocity.dx = 0
bird7.physicsBody!.velocity.dx = 0
bird8.physicsBody!.velocity.dx = 0
} */

if bird3con > 0 || bird4con > 0 {

if contact.bodyA.node?.name == "bird3" || contact.bodyB.node?.name == "bird3" || contact.bodyA.node?.name == "bird4" || contact.bodyB.node?.name == "bird4" {

if  bird2con == 1 { // bird2con == 0 ||

sliding = true
atrest = false
running = false
jumping = false

println("ran sliding")
//  bird2.physicsBody!.velocity.dx = 0
}
}

//  if contact.bodyA.node?.name == "platform" {
//   savedxpos = bird2.position.x
//   }

if bird2con == 2 {

atrest = true
sliding = false
running = false
jumping = false

println("ran atrest")
}
}*/
/* REMOVE OLD ONE BIRD PHYSICS
let contactMaskA: UInt32 = contact.bodyA.categoryBitMask
// | contact.bodyB.categoryBitMask

if contactMask == PhysicsCategory.bird || contactMask == PhysicsCategory.block || contactMask == PhysicsCategory.floor {

contactcounter = contactcounter + 1
cumulativecontactcounter = cumulativecontactcounter + 1

jumping = false


if physicsbody == 1 {
bird.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor
physicsbody = 0
} // moved from after "else { leftslidetext..." just below here.


if abs(bird.physicsBody!.velocity.dx) > 0.01  && contactcounter == 1 && contact.bodyA.node?.name != "vplatform" && contact.bodyB.node?.name != "vplatform" { // REMOVED && abs(bird.physicsBody!.velocity.dy) < 0.01 -- CHECK FOR ERRORS -- KEEP AN EYE OUT FOR THIS. I THINK THIS FINAL ADDITION TO THE ISAFFECTEDBYGRAVITY CHANGE WILL PREVENT SKIPPING, BUT I AM CONCERNED THAT IT WILL INTERFERE WITH THE SLIDING ACTION UNDER SOME CONDITIONS, AS DX WILL BE SET TO
//  if abs(bird.physicsBody!.velocity.dx) < 0.01 && abs(CGFloat(bird.physicsBody!.velocity.dy)) > 0.01 && contactcounter ==

if sliding != true { // ADDED THIS TO FIX THE "AGROUND" ISSUE. MAY BE A PUT BACK IF THERE IS A PROBLEM
jumping = false
sliding = false
running = true
atrest = false

bird.physicsBody!.velocity.dx = 0


cumrunningcounter = cumrunningcounter + 1
}

self.physicsWorld.gravity = CGVector(dx: 0, dy: -12.0)

if physicsbody == 1 {
bird.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor
physicsbody = 0
}

bird.position.x = bird.position.x - bird.physicsBody!.velocity.dx/60

if facingdirection == 1 {
righttexture.append(righttext)
//  bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(righttexture, timePerFrame: 10000000)))
}

if facingdirection == -1 {
lefttexture.append(lefttext)
// bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(lefttexture, timePerFrame: 10000000)))
}



}

if abs(bird.physicsBody!.velocity.dx) < 0.01 && abs(CGFloat(bird.physicsBody!.velocity.dy)) > 0.01 && contactcounter == 1  {
jumping = false
sliding = true
running = false
atrest = false

self.physicsWorld.gravity = CGVector(dx: 0, dy: -9.8)


if facingdirection == -1 {

rightslidetexture.append(rightslidetext)

//    bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightslidetexture, timePerFrame: 1000000)))

} else {

leftslidetexture.append(leftslidetext)

//    bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftslidetexture, timePerFrame: 1000000)))
}




/*
if physicsbody == 1 {
bird.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: bird.size.width, height: bird.size.height))
bird.physicsBody?.mass = 0.1
bird.physicsBody?.allowsRotation = false
bird.physicsBody?.restitution = 0.0
bird.physicsBody?.friction = 0.0
bird.physicsBody!.categoryBitMask = PhysicsCategory.bird
bird.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger
bird.physicsBody!.usesPreciseCollisionDetection = true
physicsbody = 0
}*/



/* Why is this here?     if abs(bird.physicsBody!.velocity.dx) < 0.01 && physicsbody == 0 {
bird.physicsBody!.collisionBitMask = PhysicsCategory.floor
physicsbody = 1
} */

/*   if physicsbody == 0 {
bird.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: bird.size.width - 5, height: bird.size.height))
bird.physicsBody?.mass = 0.1
bird.physicsBody?.allowsRotation = false
bird.physicsBody?.restitution = 0.0
bird.physicsBody?.friction = 0.0
bird.physicsBody!.categoryBitMask = PhysicsCategory.bird
bird.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger
bird.physicsBody!.usesPreciseCollisionDetection = true
physicsbody = 1
}*/
}






if contactcounter == 2 { //abs(bird.physicsBody!.velocity.dx) < 0.01 && abs(bird.physicsBody!.velocity.dy) < 0.01 &&
jumping = false
sliding = false
running = false
atrest = true

self.physicsWorld.gravity = CGVector(dx: 0, dy: -12.0)

if facingdirection == 1 {
rightresttexture.append(rightresttext)
//  bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightresttexture, timePerFrame: 10000000)))
}

if facingdirection == -1 {
leftresttexture.append(leftresttext)
// bird.removeAllActions()
bird.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftresttexture, timePerFrame: 10000000)))
}


if physicsbody == 1 {
bird.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger
physicsbody = 0
}

/*if physicsbody == 1 {
bird.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: bird.size.width, height: bird.size.height))
bird.physicsBody?.mass = 0.1
bird.physicsBody?.allowsRotation = false
bird.physicsBody?.restitution = 0.0
bird.physicsBody?.friction = 0.0
bird.physicsBody!.categoryBitMask = PhysicsCategory.bird
bird.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger
bird.physicsBody!.usesPreciseCollisionDetection = true
physicsbody = 0 */
}


/* if hitwall == true {
bird.physicsBody!.velocity.dx = 0
}*/
}







/*if contactcounter == 1 {
bird.removeAllActions()

}*/





/*    if contact.bodyA.categoryBitMask == PhysicsCategory.floor || contact.bodyB.categoryBitMask == PhysicsCategory.floor || contact.bodyA.categoryBitMask == PhysicsCategory.block || contact.bodyB.categoryBitMask == PhysicsCategory.block {
if contactcounter == 1 {
running = true
sliding = false
jumping = false
atrest = false





if physicsbody == 1 {
bird.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger
physicsbody = 0
}
}

} */

*/

// Begin Death by danger: PUT BACK FOR DEATH BY DANGER

if contact.bodyA.categoryBitMask == PhysicsCategory.danger || contact.bodyB.categoryBitMask == PhysicsCategory.danger
{
if contact.bodyA.node!.name == "bird2" || contact.bodyB.node!.name == "bird2"{

// *** print("danger death")
gameover = true
GameState.sharedInstance.saveState()


scorescreen.size.width = scorescreenwidth
scorescreen.size.height = scorescreenheight
scorescreen.position.x = bird2.position.x

scorescreen.position.y = -500
scorescreen.zPosition = 10
backgroundLayer.addChild(scorescreen) //some kind of problem with this, being added twice PUT BACK but fix first
/*
replaybutton.size.width = 150
replaybutton.size.height = 150
replaybutton.position = CGPoint(x: -scorescreen.size.width/2 + replaybutton.size.width/2 + 50, y: -scorescreen.size.height/2 + replaybutton.size.height/2 + 50)
replaybutton.zPosition = 202
scorescreen.addChild(replaybutton) //some kind of problem with this, being added twice PUT BACK but fix first
*/
screenScoreLabel = SKLabelNode(text: "Score: \(GameState.sharedInstance.score)")
screenScoreLabel.position.x = 0

screenScoreLabel.position.y = 400

screenScoreLabel.fontColor = SKColor.blackColor()
//  screenScoreLabel.fontName = NoteWorthy
screenScoreLabel.fontSize = 65
scorescreen.addChild(screenScoreLabel)

screenHighScoreLabel = SKLabelNode(text: "High Score: \(GameState.sharedInstance.highScore)")
screenHighScoreLabel.position.x = 0

screenHighScoreLabel.position.y = 100


screenHighScoreLabel.fontColor = SKColor.blackColor()
//    screenhighScoreLabel.fontName = NoteWorthy
screenHighScoreLabel.fontSize = 65
scorescreen.addChild(screenHighScoreLabel)

scorescreen.runAction(SKAction.moveToY(self.size.height/2, duration: 1))
//   replaybutton.runAction(SKAction.moveToY(self.size.height - 1200, duration: 1))

bird2.runAction(SKAction.removeFromParent())
//   bird2.paused = true

}


// 3
// from megajump tutorial     let reveal = SKTransition.fadeWithDuration(0.5)
// from megajump tutorial     let endSlidingWallsTwo = EndSlidingWallsTwo(size: self.size)
// from megajump tutorial     self.view!.presentScene(endSlidingWallsTwo, transition: reveal)
}
// END death by danger







if contact.bodyA.categoryBitMask == PhysicsCategory.dart && contact.bodyB.categoryBitMask == PhysicsCategory.bird {

if contact.bodyA.node!.name == "bird2" || contact.bodyA.node!.name == "bird2" {
gameover = true
bird2.runAction(SKAction.removeFromParent()) //turns on danger gameover
//   bird2.paused = true
GameState.sharedInstance.saveState()

// 3
// from megajump tutorial     let reveal = SKTransition.fadeWithDuration(0.5)
// from megajump tutorial     let endSlidingWallsTwo = EndSlidingWallsTwo(size: self.size)
// from megajump tutorial     self.view!.presentScene(endSlidingWallsTwo, transition: reveal)
}
}

if contact.bodyA.categoryBitMask == PhysicsCategory.bird && contact.bodyB.categoryBitMask == PhysicsCategory.dart {

if contact.bodyA.node!.name == "bird2" || contact.bodyA.node!.name == "bird2" {
gameover = true
bird2.runAction(SKAction.removeFromParent())  //turns on danger gameover
//  bird2.paused = true
GameState.sharedInstance.saveState()

// 3
// from megajump tutorial     let reveal = SKTransition.fadeWithDuration(0.5)
// from megajump tutorial     let endSlidingWallsTwo = EndSlidingWallsTwo(size: self.size)
// from megajump tutorial     self.view!.presentScene(endSlidingWallsTwo, transition: reveal)
}
}


}
//PhysicsCategory.floor |
//   if contactMask == PhysicsCategory.bird {

//  }



func didEndContact(contact: SKPhysicsContact) {
//    contactcounter = contactcounter - 1

//    println("did end contact")

// *** print("didendcontact")



if contact.bodyA.node?.name == "bird2" || contact.bodyB.node?.name == "bird2"
{

if contact.bodyA.node?.name == "floor" || contact.bodyB.node?.name == "floor" {

if bird2con > 1 {
bird2con = bird2con - 5
// *** print("bird2endcontact with floor")
}

}

if contact.bodyA.node?.name == "platform" || contact.bodyB.node?.name == "platform" {

if bird2con > 0 { // > 0 because touch function sets it to 0 and do not want to make it negative
bird2con = bird2con - 1 // fixed 7/22
}
// *** print("bird2endcontact with platform")
}

if contact.bodyA.node?.name == "vplatform" || contact.bodyB.node?.name == "vplatform" {
bird2conv = bird2conv - 1
// *** print("vplatform end contact bird 2")
}

if contact.bodyA.node?.name == "breakwall" || contact.bodyB.node?.name == "breakwall" {

markbreakwallcon = 1

// *** print("breakwall end contact bird 2")
}



}






/*

if bird3con + bird2con + bird4con + bird5con + bird6con + bird7con + bird8con == 0 {
jumping = true
}

if bird3con == 1 || bird4con == 1 {

if bird2con == 1 {
running = false
sliding = true
atrest = false
jumping = false
}
}

//animation:

/*
if facingdirection == 1 {
flytextureR.append(flytextr)
// bird.removeAllActions()
bird2.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureR, timePerFrame: 1000000)))
}

if facingdirection == -1 {
flytextureL.append(flytextl)
//    bird.removeAllActions()
bird2.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureL, timePerFrame: 1000000)))

}
*/
*/
}


/*let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask

switch(contactMask) {

case BodyType.bro.rawValue | BodyType.ground.rawValue:
//either the contactMask was the bro type or the ground type
println("contact made")

default:
return*/



override func didEvaluateActions() {

//PUT BACK FOR FALLING THROUGH TEST:
//COMMENT OUT FOR NORMAL. PUT BACK
/*
bird2.removeActionForKey("Fall")
platform1.removeActionForKey("Fall")
platform5.removeActionForKey("Fall")
platform9.removeActionForKey("Fall")

platform2.removeActionForKey("Fall")
platform6.removeActionForKey("Fall")
platform10.removeActionForKey("Fall")

vplatform6.removeActionForKey("Fall")
*/
//END OF FALLING THROUGH TEST

if printOn == 1 {
// *** print("didEvaluateActions")
}

/* if bird.position.x > 2048*CGFloat(scrollcount) {
scrollcount = scrollcount + 1
GameState.sharedInstance.score = GameState.sharedInstance.score + 1
GameState.sharedInstance.scoreLabel.text = String(GameState.sharedInstance.score)
endormid = 0
setgameoverbarrier()

} */

/*backgroundLayer.enumerateChildNodesWithName("platform2") { node, _ in

let platform = node as SKSpriteNode
if platform.position.x < 2048*CGFloat(self.scrollcount - 1) {
platform.runAction(SKAction.moveTo(CGPoint(x: CGFloat(platform.position.x), y: CGFloat(1548/2)), duration: 1.0))
}

} */

//test to smoothe dy while sliding PUT BACK:
/*
previousvelocity = bird2.physicsBody!.velocity.dy
*/

var startpos: CGFloat = 0
startpos = bird2.position.x


/*
func check() {
//println("bird pos: \(bird.position.x) startpos: \(startpos) diff: \(bird.position.x - startpos)")
//println("pressure = \(pressure)")
//println("obstacle bonus time = \(obstacle1bonustime)")


if bird2.position.x > bonustimecheck1 && bonustimecheck1 > 0 && obstaclebonustime == 0 { // && bonustimecheck == 0 NEEDED?
self.gameoverbarrier.removeAllActions()
self.pressure = 0
obstaclebonustime = obstacle1bonustime
}

if bird2.position.x > bonustimecheck1 + 1800 {
bonustimecheck1 = 0
obstaclebonustime = 0
}

if bird2.position.x > bonustimecheck2 && bonustimecheck2 > 0  && obstaclebonustime == 0 { // && bonustimecheck == 0 NEEDED?
self.gameoverbarrier.removeAllActions()
self.pressure = 0
obstaclebonustime = obstacle2bonustime
}

if bird2.position.x > bonustimecheck2 + 1800 {
bonustimecheck2 = 0
obstaclebonustime = 0
}

if bird2.position.x > bonustimecheck3 && bonustimecheck3 > 0  && obstaclebonustime == 0 { // && bonustimecheck == 0 NEEDED?
self.gameoverbarrier.removeAllActions()
self.pressure = 0
obstaclebonustime = obstacle3bonustime
}

if bird2.position.x > bonustimecheck3 + 2048 {
bonustimecheck3 = 0
obstaclebonustime = 0
}


if (bird2.position.x - startpos) < 750 && pressure == 0 && GameState.sharedInstance.score > 0 { // bird.position.x - startpos) < 1500
//   println("game over barrier move and run start")

//     LATEST METHOD FOR BONUS TIME:



/*  if score == 30 && bonustimecheck == 0 {
self.gameoverbarrier.removeAllActions()
self.pressure = 0
self.obstacle1bonustime = 5
bonustimecheck = 1
}

if score == 33 && bonustimecheck == 1 {
self.obstacle1bonustime = 0
bonustimecheck = 0
} */




gameoverbarrier.removeAllActions()
if bird2.position.x - gameoverbarrier.position.x > 1024 {
gameoverbarrier.runAction(SKAction.sequence([SKAction.moveTo(CGPoint(x: bird2.position.x - 1100, y: self.size.height/2), duration: 0), SKAction.moveTo(CGPoint(x: bird2.position.x - 500, y: self.size.height/2), duration: 0.5)])) }

if bird2.position.x - gameoverbarrier.position.x <= 1024 && bird2.position.x - gameoverbarrier.position.x > 500 {
gameoverbarrier.runAction(SKAction.moveTo(CGPoint(x: bird2.position.x - 500, y: self.size.height/2), duration: 0.4))
}

/*self.gameoverbarrier.runAction(SKAction.sequence([SKAction.waitForDuration(1), SKAction.moveTo(self.backgroundLayer.convertPoint(CGPoint(x: self.size.width, y: self.size.height/2), fromNode: self), duration: 3 )]))*/
gameoverbarrier.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.waitForDuration(1 + obstaclebonustime), SKAction.moveByX( 2048, y: 0, duration: 4.5)])))
pressure = 1
// println("pressure (again) = \(pressure)")
//  println("obstacle bonus time (again) = \(obstacle1bonustime)")

}
//   println("pressure1")
/*backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in

let platform = node as SKSpriteNode

if CGRectGetMaxX(platform.frame) < self.bird.position.x && self.bird.position.x - CGRectGetMaxX(platform.frame) < 800 {
// platform.runAction(SKAction.moveTo(CGPoint(x: CGFloat(platform.position.x), y: CGFloat(1548/2)), duration: 1.0))

self.gameoverbarrier.removeAllActions()
self.gameoverbarrier.runAction(SKAction.moveTo(CGPoint(x: CGRectGetMaxX(platform.frame) - 50, y: self.size.height/2), duration: 0.5))
/*self.gameoverbarrier.runAction(SKAction.sequence([SKAction.waitForDuration(1), SKAction.moveTo(self.backgroundLayer.convertPoint(CGPoint(x: self.size.width, y: self.size.height/2), fromNode: self), duration: 3 )]))*/
self.gameoverbarrier.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.waitForDuration(1), SKAction.moveByX( 2048, y: 0, duration: 6)])))

println("platform max x: \(CGRectGetMaxX(platform.frame))")
platform.name = "none"
self.pressure = 1
}

}*/



if pressure == 1 {
if (bird2.position.x - startpos) >= 100 { // was 2048 8/5/15
//  println("gameoverbarrier off")
pressure = 0
self.gameoverbarrier.removeAllActions()
//  println("pressure0")
}
}
}
*/
//   self.runAction(SKAction.sequence([SKAction.waitForDuration(2.5), SKAction.runBlock(check)])) //TURNS ON GAMEOVERBARRIER // waitforDuration(5.0)



/*  backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in

let platform = node as SKSpriteNode
self.backgroundLayer.enumerateChildNodesWithName("inbtwdart") { node, _ in
let inbtwdart = node as SKSpriteNode

if CGRectGetMinX(platform.frame) - inbtwdart.position.x < 500 && CGRectGetMinX(platform.frame) - inbtwdart.position.x > 0 {
//  println("first: \(inbtwdart.position.x)")
inbtwdart.name = "dart"
inbtwdart.position.x = inbtwdart.position.x + CGFloat.random(min: 0, max: CGRectGetMinX(platform.frame) - inbtwdart.size.width/1.5 - ceil((inbtwdart.position.x)/2048)*2048)
//  println("then: \(inbtwdart.position.x)")

/*  self.backgroundLayer.enumerateChildNodesWithName("inbtwduct") { node, _ in
let inbtwduct = node as SKSpriteNode
if CGRectGetMinX(platform.frame) - inbtwduct.position.x < 500 && CGRectGetMinX(platform.frame) - inbtwduct.position.x > 0 {
inbtwduct.name = "duct"
inbtwduct.position.x = inbtwdart.position.x

}
}*/
}
}
} */


/*    backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in

let platform = node as SKSpriteNode
if CGRectGetMaxX(platform.frame) < self.backgroundLayer.convertPoint(CGPoint(x: self.size.width/2 - self.bird.size.width, y: -100), fromNode: self).x {
// platform.runAction(SKAction.moveTo(CGPoint(x: CGFloat(platform.position.x), y: CGFloat(1548/2)), duration: 1.0))



if GameState.sharedInstance.score > 5 {

if GameState.sharedInstance.score > 10 && GameState.sharedInstance.score < 30 {
self.durationA = 3
self.waitintervalA = 0

}

if GameState.sharedInstance.score > 20 {
self.durationA = 3
self.waitintervalA = 0

}

/* MOVED AT INTERVALS BEFORE:

if self.pressure == 1 {
self.gameoverbarrier.removeAllActions() //gameoverbarrier.runAction(SKAction.runBlock(removeAllActions))
self.gameoverbarrier.runAction(SKAction.moveTo(CGPoint(x: CGRectGetMaxX(platform.frame) - 50, y: self.size.height/2), duration: 0.5))
self.gameoverbarrier.runAction(SKAction.sequence([SKAction.waitForDuration(self.waitintervalA), SKAction.moveTo(self.backgroundLayer.convertPoint(CGPoint(x: self.size.width, y: self.size.height/2), fromNode: self), duration: self.durationA)]))
} */
}

/* if scrollcount == backgroundB1count || scrollcount == backgroundB2count || scrollcount == backgroundB3count || scrollcount == backgroundB4count {

gameoverbarrier.removeAllActions() //gameoverbarrier.runAction(SKAction.runBlock(removeAllActions))
gameoverbarrier.runAction(SKAction.moveTo(CGPoint(x: CGRectGetMaxX(platform.frame), y: self.size.height/2), duration: 0.5))
gameoverbarrier.runAction(SKAction.sequence([SKAction.waitForDuration(waitintervalA), SKAction.moveTo(self.backgroundLayer.convertPoint(CGPoint(x: self.size.width, y: self.size.height/2), fromNode: self), duration: durationB)]))
} */

platform.name = "none" */


/*  self.backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in
let vplatform = node as SKSpriteNode
if CGRectGetMinX(vplatform.frame) - CGRectGetMaxX(platform.frame) < 1024 && CGRectGetMinX(vplatform.frame) - CGRectGetMaxX(platform.frame) > 0 {

if GameState.sharedInstance.score > 6 {

if GameState.sharedInstance.score > 10 && GameState.sharedInstance.score < 30 {
self.durationB = 6
self.waitintervalB = 0

}

if GameState.sharedInstance.score > 20 {
self.durationB = 6
self.waitintervalB = 0

}

/* MOVED AT INTERVALS BEFORE:

if self.pressure == 1 {
self.gameoverbarrier.removeAllActions() //gameoverbarrier.runAction(SKAction.runBlock(removeAllActions))
self.gameoverbarrier.runAction(SKAction.moveTo(CGPoint(x: CGRectGetMaxX(platform.frame) - 50, y: self.size.height/2), duration: 0.5))
self.gameoverbarrier.runAction(SKAction.sequence([SKAction.waitForDuration(self.waitintervalB), SKAction.moveTo(self.backgroundLayer.convertPoint(CGPoint(x: 2*self.size.width, y: self.size.height/2), fromNode: self), duration: self.durationB)]))
}*/
}
vplatform.name = "none"
}
}*/

}












override func update(currentTime: CFTimeInterval) {

//     println("platforms2.position.y: \(platform2.position.y) platform6.position.y: \(platform6.position.y) platform10.position.y: \(platform10.position.y)")


//  println("(435%100)%0.01 = \((435%100)%0.01)")

// println("rightarrow parent: \(rightarrow.parent)")


testvar = 0


if printOn == 1 {
// *** print("update")

// *** print("testvar: \(testvar)")
// *** print("bird2.position.x: \(bird2.position.x)")
// *** print("checkpointmode: \(checkpointmode)")
// *** print("checkpointmove: \(checkpointmove)")
// *** print("checkpointround: \(GameState.sharedInstance.checkpointround)")
// *** print("checkpointunlock: \(GameState.sharedInstance.checkpointunlock)")

// *** print("birdimage pos: \(birdimage.position)")
// *** print("bird2 pos: \(bird2.position)")
// *** print("bird2 colBM: \(bird2.physicsBody!.collisionBitMask) and conBM: \(bird2.physicsBody!.contactTestBitMask)")
//GameState.sharedInstance.coinMult = 1
// *** print("cycle: \(cycle)")
// *** print("platform1 pos.y: \(platform1.position.y)")
//  println("Bird2posx: \(bird2.position.x)")
// *** print("initialcount: \(initialcount)")
// *** print("running: \(running) jumping: \(jumping) atrest: \(atrest) sliding: \(sliding) facing: \(facingdirection) newtouch: \(newtouch)")
// *** print("breakwallcon: \(breakwallcon)  bird2con: \(bird2con) bird2conv: \(bird2conv) breakwall")
//     println("emittedNode parent: \(emitterNode.parent) emittedNode position: \(emitterNode.position)")
// *** print("bird2 parent: \(bird2.parent)")
// *** print("xplatform1 parent: \(xplatform1.parent) xplatform1 position: \(xplatform1.position)")

// *** print("bird2gravity: \(bird2.physicsBody!.affectedByGravity)")

// *** print("updatecheck mark")





}
/*
println("posA: \(posA)")
println("posB: \(posB)")
println("posC: \(posC)")
println("posD: \(posD)")
println("posE: \(posE)")
println("posF: \(posF)")
println("posG: \(posG)")
println("posH: \(posH)")
println("posI: \(posI)")
println("posJ: \(posJ)")
println("posK: \(posK)")
println("posL: \(posL)")
*/
// println("platform 6 y pos: \(platform6.position.y)")

/*
println("update")
println("score: \(GameState.sharedInstance.score)")
println("bird2.pos.x: \(bird2.position.x)")
println("CG time: \(CFAbsoluteTimeGetCurrent())")
println("CGFloat CG time: \(CGFloat(CFAbsoluteTimeGetCurrent()))")
println("bird2 has action: \(bird2.hasActions())")
println("birdfalling: \(birdfalling)")
println("dypriorframe: \(dypriorframe)")
println("dyprior2frames: \(dyprior2frames)")

println(" update velocity: dx: \(bird2.physicsBody!.velocity.dx)  dy: \(bird2.physicsBody!.velocity.dy)")
println("update collision bitmask: \(bird2.physicsBody!.collisionBitMask)")
println("update contact bitmask: \(bird2.physicsBody!.contactTestBitMask)")
println("affected by gravity: \(bird2.physicsBody!.affectedByGravity)")

*/



/*
println("GameState.sharedInstance.coinUpgOrder: \(GameState.sharedInstance.coinUpgOrder)")
println("one coin upg: \(GameState.sharedInstance.oneCoinUpg)")
println("yellowupg \(GameState.sharedInstance.yelCoinUpg)")
println("bluupg \(GameState.sharedInstance.bluCoinUpg)")
println("redupg \(GameState.sharedInstance.redCoinUpg)")
println("coinMult: \(GameState.sharedInstance.coinMult)")
println("oneUpgOrder \(oneUpgOrder)")
println("twoUpgOrder \(twoUpgOrder)")
println("threeUpgOrder \(threeUpgOrder)")
*/


//PUT BACK -- REMOOVE









//println("spikedetector1 pos: \(spikedetector1.position)")
//println("spikedetector2 pos: \(spikedetector2.position)")




/*
println("coins: \(GameState.sharedInstance.coins)")
println("coin mult: \(GameState.sharedInstance.coinMult)")
println("secondLifeOn: \(GameState.sharedInstance.secondLife)")
println("secondLives: \(secondlives)")
*/

//    if turnoffrocks == 0 {


//       turnoffrocks = 1
//    }



// GameState.sharedInstance.oneCoinUpg = 0
//  GameState.sharedInstance.saveState()

if oldscore < GameState.sharedInstance.score {


timelastscore = CFAbsoluteTimeGetCurrent()
turnoffrocks = 0
//     emitterNode.removeFromParent()
oldscore = GameState.sharedInstance.score
birdimage.alpha = 1
}


//RESETS DEATH ENABLE

deaththisframe = 0

//END RESETS DEATH ENABLE

//TURNS ON SHUT GAP. OLD, NOW USING SKACTION TO SET

/*
if CFAbsoluteTimeGetCurrent() - timelastscore > 7 && oldscore > 0 && turnoffrocks == 0 {



if secondlives == 0 {
platforms[closepos].runAction(SKAction.moveByX(0, y: swgap/2, duration: fall2time))
vplatforms[closepos].runAction(SKAction.moveByX(0, y: -swgap/2, duration: fall2time))


//Is there any chance of flying through right after the barriers start? if so, need to account for this:
turnoffrocks = 1
}

if secondlives > 0 {
//make an animation or something


timelastscore = CFAbsoluteTimeGetCurrent()
secondlives = secondlives - 1
birdimage.alpha = 0.5
reposition = 1
bird2con = 0
bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0


bird2.runAction(SKAction.sequence([SKAction.moveToX(platforms[closepos].position.x - 0.5*make3size/3 - 20, duration: 0.5), SKAction.moveTo(CGPoint(x: platforms[closepos].position.x - 0.5*make3size/3 - 20, y: CGRectGetMaxY(ground.frame) + 150), duration: 0.5), SKAction.runBlock({self.resetbird()})]))






}


}
*/
// End Shut Gap

//TURNS ON EMITTER:
/*
if CFAbsoluteTimeGetCurrent() - timelastscore > 5 && oldscore > 1 && turnoffrocks == 0 {


emitterNode.name = "emitter"
emitterNode.particleTexture = rock
emitterNode.particleBirthRate = 100
emitterNode.particleSpeed = 10
emitterNode.particleLifetime = 10000
emitterNode.particleScale = 2.5
emitterNode.position = CGPoint(x: size.width/2, y: size.height/2)//CGPoint(x: bird2.position.x, y: bird2.position.y)//CGPoint(x: xposlastscore - 0.5*make3size/3, y: 1500)
emitterNode.yAcceleration = -5
emitterNode.numParticlesToEmit = 50
emitterNode.particleSpeedRange = 0
emitterNode.particleRotationSpeed = 0
emitterNode.particleRotationRange = 0
emitterNode.emissionAngleRange = -0.7
emitterNode.zPosition = 10000000
//  emitterNode.fieldBitMask = fieldMask
addChild(emitterNode)
emitterNode.hidden = false

println("emittedNode parent: \(emitterNode.parent)")
//       xplatform1.position = CGPoint(x: size.width/2, y: size.height/2)
//       xplatform1.zPosition = 10000000
//       addChild(xplatform1)

println("ran emitter")
println("xplatform1 parent: \(xplatform1.parent)")
turnoffrocks = 1
}

*/


/*
var testaction: SKAction! = bird2.actionForKey("Fall")

if testaction != nil {

println("duration: \(testaction.duration)")

testaction.

}
*/


//   println("timing function: \(bird2.runAction(SKActionTimingFunction))")

//println("duration: \(waiting.duration)")

//   var dduration: NSTimeInterval = 0

//    dduration = bird2.actionForKey("Fall").duration
//    println("duration for bird fall: \(dduration)")

//     println("action for Key: \(bird2.actionForKey("Fall"))")
//      let actionforkeyy: SKAction = bird2.actionForKey("Fall")
//       println("actionforkey: \(actionforkeyy)")

if spikecontact == 1{

spikecontact = 0
// *** print("spike contact reset in update")

}

runningthisframe = 0



hidearrowscheck = 0

if firstframe == 1 {
dyprior2frames = dypriorframe
}


dypriorframe = bird2.physicsBody!.velocity.dy


if firstframe == 0 {
firstframe = 1
}


bird2begincon = 0
bird2beginconv = 0

// println("platform1 actions: \(platform1.hasActions())")

//   let filler: SKAction = platform1.actionForKey("Fall")!
//   println("platform1 action type: \(filler)")




//   }

/*


//  run()

*/
//  }







//    self.enumerateChildNodesWithName("*") { node, _ in // skip this for now, don't recall this taking too much time.
//       let names = node as! SKSpriteNode

//      println("name of node: \(names)")

//  }


/*    if fallthroughtest == 1 {

bird2.physicsBody!.collisionBitMask = 0
bird2.physicsBody!.affectedByGravity = false
} */

/* if adjustcounter < 3 {
birdimage.anchorPoint = CGPoint(x: 0.5, y: -0.00714286*(maxylanding-bird2.position.y))

adjustcounter++
} */

//   println("bird5con: \(bird5con)")

//function: TO PREVENT SINKING
if (running == true || bird2.physicsBody!.affectedByGravity == false) && newtouch == 0{ //to prevent sinking 5/16/2015
bird2.physicsBody!.velocity.dy = 0.0000000
bird2.physicsBody!.velocity.dx = 0.0000000
//  // *** print("update dx = 0 and dy = 0")
}

//end function: TO PREVENT SINKING


//function: TO PREVENT SHIFTING //6/27/2015 PUT BACK FOR NON RUNNING TEST // CONSIDER ADDING AN OR STATEMENT THAT WOULD ALLOW THIS TO HAPPEN IF BIRD5CONCHECK WAS 1, BECAUSE SOME SHIFTING HAPPENS WHEN BIRD RISES ABOVE PLATFORM AFTER A SLIDE

if (sliding == true && newtouch == 0) || (jumping == true && newtouch == 0) { //to prevent shifting while sliding, or rising above platform after sliding, or falling from vplatform into a slide.
bird2.physicsBody!.velocity.dx = 0.0000000
// // *** print("update dx = 0")
}

//end function: TO PREVENT SHIFTING

//function: to adjust facing direction

if bird2con + bird2conv == 0 { // to fix spamming clicking problem while sliding and lack of gravity problem // bird3con + bird2con + bird4con + bird5con + bird6con + bird7con + bird8con == 0

//      bird2.physicsBody!.affectedByGravity = true

if facingdirection != 1 {

if bird2.physicsBody!.velocity.dx > 10 {
facingdirection = 1
//          println("ran right fd update")
}
}

if facingdirection != -1 {
if bird2.physicsBody!.velocity.dx < -10 {
facingdirection = -1
//         println("ran left fd update")
}
}

}

//end function: to adjust facing direction

//  println("velocity.dx: \(bird.physicsBody?.velocity.dx) velocity.dy:\(bird.physicsBody?.velocity.dy)")
//   println("novj: \(novj)")
//     println("bird.position.x: \(bird.position.x)")
//  println("gameover pos: \(gameoverbarrier.position.x)")


/*  if sliding == true {

println(

bird2.runAction(SKAction.moveToX(savedxpos, duration: 0.1))
//  bird2.position.x = savedxpos
} */

//  println("contactcounter: \(contactcounter)")
// println("contactcounter: \(cumulativecontactcounter)")
// println("dx: \(bird2.physicsBody?.velocity.dx) dy: \(bird2.physicsBody?.velocity.dy)")


//     println("birdtrigger: \(birdtrigger)")

//   println("coll bitmask: \(bird2.physicsBody!.collisionBitMask)")

//   println("birdtrigger: \(birdtrigger) bird1con: \(bird1con) bird2con: \(bird2con) bird3con: \(bird3con) bird4con: \(bird4con) bird5con: \(bird5con)")
//   println("collisionbm: \(bird.physicsBody!.collisionBitMask)")

//println(" \(bird1con) \(bird2con) \(bird3con) \(bird4con) \(bird5con) \(bird6con) \(bird7con) \(bird8con)) ")
// println("running: \(running) jumping: \(jumping) atrest: \(atrest) sliding: \(sliding) facing: \(facingdirection) newtouch: \(newtouch)")
//   println("running: \(running) sliding: \(sliding) newtouch: \(newtouch)")
//println("bird2grav: \(bird2.physicsBody!.affectedByGravity)")
//  println("newtouch: \(newtouch)")
// println("\(facingdirection)")
/*
//  println("cycle: \(self.cycle)")
//   println("obstaclebonustime: \(obstaclebonustime)")
//  println(" bird.position.x \(bird.position.x)")
//println("bonustimecheck1: \(bonustimecheck1)")
//  println("bonustimecheck2: \(bonustimecheck2)")
//    println("initialcount: \(initialcount)")
// println("scrollcount: \(scrollcount) C1: \(backgroundC1count) C2: \(backgroundC2count) C3: \(backgroundC3count) C4: \(backgroundC4count)")
// println(" gravity: \(physicsWorld.gravity.dy)")

//  println(" hitwall: \(hitwall)")
// if (CFAbsoluteTimeGetCurrent() - gamestart) > delayperiod {
/*     if lastUpdateTime2 > 0 {
dt2 = currentTime - lastUpdateTime2
} else {
dt2 = 0
}
lastUpdateTime2 = currentTime */

if lastUpdateTime > 0 {
dt = currentTime - lastUpdateTime
} else {
dt = 0
}
lastUpdateTime = currentTime
currenttime = currentTime

//   println("\(dt*1000)")
//  makeblocks()

// moveincrement = movedistance*CGFloat(dt)
//  println("\(bird.physicsBody!.velocity.dx)")

//println("dt: \(dt) currentTime: \(currentTime) lastupdatetime: \(lastUpdateTime)")

/*  println("collisionbitmask: \(bird.physicsBody!.collisionBitMask) contactbitmask: \(bird.physicsBody!.contactTestBitMask)")
println("cumrunningcounter: \(cumrunningcounter)") */
*/
moveBackground()


/* old jump test: if jumping == false { // For vertical jump corner test: PUT BACK OLD
bird.physicsBody!.velocity.dy = 0 //THIS IS NEW, TRYING THIS OUT TO SEE IF THIS WILL PREVENT THE RUNNING AGROUND AND JUMPING UP ERROR THAT HAPPENS WHEN ENDING THE TOUCH CLOSE TO SLIDING TO AN ATREST POSITION.
}


//   println("touchended")

jumppower = 0.4

gauge.removeAllActions()




//  animateWithTextures(SKTexture(imageNamed: "Circle0")))





if sliding == true { // when you spam clicking, sometimes the direction gets messed up. For example, when you jump off a wall, you head right, but after you land you head left.
sliding = false
facingdirection = -1*facingdirection

}



if jumping == false && atrest == false {

//  bird.physicsBody?.applyImpulse(CGVector(dx: facingdirection*jumppower*200, dy: jumppower*200))
//    println("hello \(facingdirection*jumppower*200)")
//    println("hello \(facingdirection*jumppower*20)")

bird2.physicsBody?.velocity = CGVector(dx: facingdirection*jumppower*2300, dy: jumppower*2800) // 9.8: dx *1950 dy *2400, 14.7: dx 2700 dy 2900 12.0: dx 1950 dy 2500
//    bird2.physicsBody!.collisionBitMask = 0

//  bird2.physicsBody?.velocity = CGVector(dx: facingdirection*jumppower*2300, dy: jumppower*2800)


//    println("jump normal")
//}
/*  if atrest == true {
bird.physicsBody?.applyImpulse(CGVector(dx: 0, dy: jumppower*270))
println("jump at rest")
} */
bird2.physicsBody!.affectedByGravity = true// NEW 5/2/2015
}

if atrest == true {
bird2.physicsBody?.velocity = CGVector(dx: 0, dy: jumppower*2800)
//  bird2.physicsBody!.collisionBitMask = 0
}   //end old jump test  */
//New Vertical jump (i.e. infinite click) test:
// /*

//turns on infinite jump test:

func infinitejumptest() {

if everyotherclick == 1 {
turnoffjump = -1*turnoffjump
}

if undotest == 0 {

// *** print("infinite jump test")
//    if turnoffjump <= 0 {

if jumping == false {
bird2.physicsBody!.velocity.dy = 0 //THIS IS NEW, TRYING THIS OUT TO SEE IF THIS WILL PREVENT THE RUNNING AGROUND AND JUMPING UP ERROR THAT HAPPENS WHEN ENDING THE TOUCH CLOSE TO SLIDING TO AN ATREST POSITION.

// *** print("update if jumping == false bird2 velocity dy = 0")
}

endtime = CFAbsoluteTimeGetCurrent()
//   println("touchended")

jumppower = endtime - starttime

gauge.removeAllActions()
var textures: [SKTexture] = []
textures.append(SKTexture(imageNamed: "Circle0"))

gauge.runAction(SKAction.animateWithTextures(textures, timePerFrame: 1))

//  animateWithTextures(SKTexture(imageNamed: "Circle0")))



if jumppower > 0.3 { // was 0.4
jumppower = 0.3

}
// *** print("jumppower: \(jumppower)")

/* if jumppower < 0.2 {  // SHOULD CHANGE ANIMATION BECAUE OF THIS. START OUT WITH 3 OR SO BARS THAT HOLDS FOR ONE SECOND, THEN THE REMAINING BARS POPULATE AS NORMAL. OR, LESSEN THE TOTAL NUMBER OF BARS AND DELAY WHEN THEY SHOW UP. OR: INSTEAD OF STARTING WITH 3 BARS, WHICH WILL BE CONFUSING, COMBINE THE FIRST 3 BARS INTO ONE AND MAKE A SOLID COLOR(?)  OR GIVE IT A GRADIENT, BUT NO SPACES SO IT IS A SOLID BAR. // was 0.2
jumppower = 0.2
}*/





// jumppower = 0.01 // FOR VPLATFORM DOUBLE SLIDE TEST

if (jumping == false && atrest == false) || bird2.physicsBody!.affectedByGravity == false || novj == 1 {

//  bird.physicsBody?.applyImpulse(CGVector(dx: facingdirection*jumppower*200, dy: jumppower*200))
//    println("hello \(facingdirection*jumppower*200)")
//    println("hello \(facingdirection*jumppower*20)")

if cornerland == 0 {
bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
// *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")

}

bird2.physicsBody!.affectedByGravity = true
newtouch = 1
// *** print("newtouch = 1")
startjx = bird2.position.x


bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.dart | PhysicsCategory.floor | PhysicsCategory.slidespike

if sliding == true { // when you spam clicking, sometimes the direction gets messed up. For example, when you jump off a wall, you head right, but after you land you head left.


facingdirection = -1*facingdirection


pssdcounter = 3
preventssdeath = 1

bird2.physicsBody!.collisionBitMask = PhysicsCategory.danger | PhysicsCategory.outline // Needed to exclude floor to prevent running aground
bird2.physicsBody!.contactTestBitMask = PhysicsCategory.danger | PhysicsCategory.dart
// *** print("change collision bitmask: \(bird2.physicsBody!.contactTestBitMask)")
// *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")

sliding = false // causing an issue with triggering sliding again. Is this needed? REMOVED 7/16/2015. I added this back when I added the bird2con = 0 qualifier below 7/17/2015.
}

bird2.physicsBody?.velocity = CGVector(dx: facingdirection*(jumppower*1750 + 214.5444), dy: jumppower*9000 + 575.22) // jumppower*2625 + 575.22) // (dx: facingdirection*(jumppower*1533.33 + 460), dy: jumppower*1866.67 + 560)//facingdirection*jumppower*2300, dy: jumppower*2800 // 9.8: dx *1950 dy *2400, 14.7: dx 2700 dy 2900 12.0: dx 1950 dy 2500
//   birdimage.anchorPoint = CGPoint(x: 0.5, y: 0.4)

//   bird7.physicsBody!.collisionBitMask = 0
//   bird8.physicsBody!.collisionBitMask = 0
//   bird7.physicsBody!.contactTestBitMask = 0 //PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart
//   bird8.physicsBody!.contactTestBitMask = 0

bird2con = 0
running = false
jumping = true
sliding = false
atrest = false




bird5concheck = 0
runpos = 1
// *** print("bird5concheck set to 0")
// *** print("bird2con set to 0 in touches ended function")
// *** print("bird2velocitydx: \(bird2.physicsBody?.velocity.dx)")
// *** print("bird2velocitydy: \(bird2.physicsBody?.velocity.dy)")

}

if atrest == true && novj == 0 {
//  bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger


bird2.physicsBody?.velocity = CGVector(dx: 0, dy: jumppower*9000 + 575.22) // CGVector(dx: 0, dy: jumppower*2625 + 575.22)
sliding = true
running = false
jumping = false
atrest = false

//       bird5con = 0
//        bird5concheck = 1

// *** print("bird5concheck infinite jump test: \(bird5concheck)")
newtouch = 0

/*   if abs(bird2.physicsBody!.velocity.dx) > 5 {

bird2.physicsBody?.velocity = CGVector(dx: bird2.physicsBody!.velocity.dx, dy: bird2.physicsBody!.velocity.dy) // was dy: jumppower*2800


sliding = false
running = false
jumping = true
atrest = false
newtouch = 1

if cornerland == 0 {
bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline
}
}

if abs(bird2.physicsBody!.velocity.dx) < 5 {

bird2.physicsBody?.velocity = CGVector(dx: 0, dy: jumppower*2300 + 504) // was dy: jumppower*2800


sliding = true
running = false
jumping = false
atrest = false

bird5con = 0
bird5concheck = 1
newtouch = 0
} */


//  bird7.physicsBody!.collisionBitMask = 0
//  bird8.physicsBody!.collisionBitMask = 0
//  bird7.physicsBody!.contactTestBitMask = 0 //PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart
//  bird8.physicsBody!.contactTestBitMask = 0
bird2.physicsBody!.affectedByGravity = true





}
novj = 0
}

}


infinitejumptest()











}
    
*/
*/
*/
*/








//
//  GameScene.swift
//  Jump Bird
//
//  Created by Jerome Elmore.
//  Copyright (c) 2015 Jerome Elmore. All rights reserved.
//


//Check master list in phone for other problems and recommendations.


import SpriteKit
import AVFoundation
import GameKit

/*
extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file as String, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)

            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as SKNode
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}
*/
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
class GameScene: SKScene, SKPhysicsContactDelegate, MultiplayerProtocol {
    /*
var jumpMax: Double = 0.3
var jumpMX: Double = 2286.45
var jumpYX: Double = 53.635
var jumpMY: Double = 4063.03
var jumpYY: Double = 143.81
*/

var tapStart: Bool = false
var levelSelectOn: Bool = false

var jumpMax: Double = 0.3
var jumpMX: Double = 1750
var jumpYX: Double = 214.544
var jumpMY: Double = 2625
var jumpYY: Double = 575.22

var stopwatch1on: Int = 0
var wait = SKAction.waitForDuration(1.0)
var time1: Int = 60 
var run1: Int = 1



var touchontimer: CGFloat = 0
var rightEdge: CGFloat = 0
var leftEdge: CGFloat = 0
var physicsSpeed: CGFloat = 1.0 //0.2 //1.0 // put back, used 0.2 for testing.
var frontjaggedypos: CGFloat = 0
var setCastleDistance: CGFloat = 0    
var setCastle: CGFloat = 0
var firstBarrierXPos: CGFloat = 0    
var enterCastle: CGFloat = 0
var multTimerOn: CGFloat = 0
var introCastle: CGFloat = 0
var ranAchievementWall: CGFloat = 0
var lastMoveWallXPos: CGFloat = 0
var slideWallsCastle: CGFloat = 0
var lastBackArcXPos: CGFloat = 0
var noRoofABegin: CGFloat = 0
var noRoofAEnd: CGFloat = 0
var roofwall: SKSpriteNode! 
var roofwallypos: CGFloat = 0     
    
var castleType: Int = 0
var ffYPos: CGFloat = 0
var freezeFrame: SKSpriteNode!
var backwallCounter: CGFloat = 0
let room1Height: CGFloat = 1.32608696*920
let room1Width: CGFloat = 1.32608696*1314
let windowWallHeight: CGFloat = 1.32608696*920
let windowWallWidth: CGFloat = 1.32608696*289
var replay: Bool = false
let midSpeed: CGFloat = 0.69 //0.8
let distantSpeed: CGFloat = 0.427//0.50
var alternateMountains: CGFloat = 1
var lastMtnPos: CGFloat = -700
var lastHillsPos: CGFloat = 0
var castleColor: UIColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)//UIColor(red: 233/255, green: 200/255, blue: 159/255, alpha: 1.0)
var castleBlendFactor: CGFloat = 0 //0.5
var castleAlpha: CGFloat = 1// 0.5
var platformColor: UIColor = UIColor(red: 233/255, green: 200/255, blue: 159/255, alpha: 1.0)

var platformBlendFactor: CGFloat = 0.5
var difColor: UIColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
var difBlendFactor: CGFloat = 0.5

var resetFrontCastle: CGFloat = 0
var resetWorld: CGFloat = 0




//var backjaggedypos: CGFloat = 250
   // var frontjaggedypos: CGFloat = 125   
var floorCycle: Int = 0
var floorPos: CGFloat = 0
var floorPos2: CGFloat = 0
var floorPos3: CGFloat = 0
var floorLead: CGFloat = 2200

var wallfriction: CGFloat = 1.0
var ppw: CGFloat = 95

var floorSpikeCycle: Int = 0

let awardBackgroundOne = SKSpriteNode(texture: SKTexture(imageNamed: "objcompletelevel1"))
let awardPlatformOne = SKSpriteNode(texture: SKTexture(imageNamed: "awardplatformone"))

let tapToPlay = SKSpriteNode(texture: SKTexture(imageNamed: "tap-to-play"))
let levelScreen = SKSpriteNode(texture: SKTexture(imageNamed: "LevelScreen"))
let levelButton = SKSpriteNode(texture: SKTexture(imageNamed: "PhysicsTest")) 

let assignmentOutline = SKSpriteNode(texture: SKTexture(imageNamed: "assignmentoutline"))
let stopwatchicon1 = SKSpriteNode(imageNamed: "stopwatch")
let stopwatchicon2 = SKSpriteNode(imageNamed: "stopwatch")
let stopwatchicon3 = SKSpriteNode(imageNamed: "stopwatch")

let checkmark1 = SKSpriteNode(imageNamed: "checkmark")
let checkmark2 = SKSpriteNode(imageNamed: "checkmark")
let checkmark3 = SKSpriteNode(imageNamed: "checkmark")



let entryArc1 = SKSpriteNode(texture: SKTexture(imageNamed: "entryarc"))
let entryArc2 = SKSpriteNode(texture: SKTexture(imageNamed: "bottomentryarc"))


//let firstVPlatform = SKSpriteNode(texture: SKTexture(imageNamed: "FrontWall"))
//let firstPlatform = SKSpriteNode(texture: SKTexture(imageNamed: "FrontWall"))

let spikeSlot1 = SKSpriteNode(texture: SKTexture(imageNamed: "spikeslot"))
let spikeSlot2 = SKSpriteNode(texture: SKTexture(imageNamed: "spikeslot"))
let spikeSlot3 = SKSpriteNode(texture: SKTexture(imageNamed: "spikeslot"))

let backSpikeSlot1 = SKSpriteNode(texture: SKTexture(imageNamed: "backspikeslot"))
let backSpikeSlot2 = SKSpriteNode(texture: SKTexture(imageNamed: "backspikeslot"))
let backSpikeSlot3 = SKSpriteNode(texture: SKTexture(imageNamed: "backspikeslot"))

let floorSpike1 = SKSpriteNode(texture: SKTexture(imageNamed: "Spike"))
let floorSpike2 = SKSpriteNode(texture: SKTexture(imageNamed: "Spike"))
let floorSpike3 = SKSpriteNode(texture: SKTexture(imageNamed: "Spike"))

let checkPointFlag = SKSpriteNode(texture: SKTexture(imageNamed: "flag_00004"))
let checkPointFlag2 = SKSpriteNode(texture: SKTexture(imageNamed: "flag_00004"))
let tail = SKSpriteNode(texture: SKTexture(imageNamed: "tail_00005"))
let smalltail = SKSpriteNode(texture: SKTexture(imageNamed: "smalltail_00005"))
let flagPole = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))

let skyTop = SKSpriteNode(imageNamed: "Sky")
let skyTop2 = SKSpriteNode(imageNamed: "Sky")

let innerGauge = SKSpriteNode(texture: SKTexture(imageNamed: "gauge-inner"))
let outerGauge = SKSpriteNode(texture: SKTexture(imageNamed: "gauge-outer"))

//Level 1:

let hills1 = SKSpriteNode(imageNamed: "big-hill")
let hills2 = SKSpriteNode(imageNamed: "Backgrounds14")
let hills3 = SKSpriteNode(imageNamed: "Backgrounds14")

//Mountains:

let iceMountain1 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain2 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain3 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain4 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain5 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain6 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain7 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain8 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain9 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain10 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain11 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain12 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain13 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain14 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain15 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain16 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain17 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))
let iceMountain18 = SKSpriteNode(texture: SKTexture(imageNamed: "SingleMountain"))







//




//Rolling Hills

let mainRollingHills1 = SKSpriteNode(texture: SKTexture(imageNamed: "RollingHillsMain"))
let mainRollingHills2 = SKSpriteNode(texture: SKTexture(imageNamed: "RollingHillsMain2"))

let lightHill1 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill2 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill3 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill4 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill5 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill6 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill7 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill8 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill9 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill10 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))
let lightHill11 = SKSpriteNode(texture: SKTexture(imageNamed: "hill1"))

let darkHill1 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill2 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill3 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill4 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill5 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill6 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill7 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill8 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill9 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill10 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))
let darkHill11 = SKSpriteNode(texture: SKTexture(imageNamed: "hill2"))

let house1 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house2 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house3 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house4 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house5 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house6 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house7 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house8 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house9 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house10 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))
let house11 = SKSpriteNode(texture: SKTexture(imageNamed: "house"))

let rHLTree1 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree2 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree3 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree4 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree5 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree6 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree7 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree8 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree9 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree10 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))
let rHLTree11 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree1"))

let rHDTree1 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree2 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree3 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree4 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree5 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree6 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree7 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree8 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree9 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree10 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))
let rHDTree11 = SKSpriteNode(texture: SKTexture(imageNamed: "rhtree2"))

let bush1 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush2 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush3 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush4 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush5 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush6 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush7 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush8 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush9 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))
let bush10 = SKSpriteNode(texture: SKTexture(imageNamed: "bush"))

let cart1 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart2 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart3 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart4 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart5 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart6 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart7 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart8 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart9 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))
let cart10 = SKSpriteNode(texture: SKTexture(imageNamed: "cart"))

let sheep1 = SKSpriteNode(texture: SKTexture(imageNamed: "sheep"))


//RegularCastle


let barrel1 = SKSpriteNode(texture: SKTexture(imageNamed: "barrel"))
let barrel2 = SKSpriteNode(texture: SKTexture(imageNamed: "barrel"))
let barrel3 = SKSpriteNode(texture: SKTexture(imageNamed: "barrel"))
let barrel4 = SKSpriteNode(texture: SKTexture(imageNamed: "barrel"))
let barrel5 = SKSpriteNode(texture: SKTexture(imageNamed: "barrel"))

let exteriorWall = SKSpriteNode(texture: SKTexture(imageNamed: "FrontWall"))

let eWLB1 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB2 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB3 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB4 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB5 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB6 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB7 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB8 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB9 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))
let eWLB10 = SKSpriteNode(texture: SKTexture(imageNamed: "light-brick"))

let eWDB1 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB2 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB3 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB4 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB5 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB6 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB7 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB8 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB9 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))
let eWDB10 = SKSpriteNode(texture: SKTexture(imageNamed: "dark-brick"))


let bigwindow1 = SKSpriteNode(texture: SKTexture(imageNamed: "bigwindow"))
let openwindow = SKSpriteNode(texture: SKTexture(imageNamed: "openwindow"))

let window1 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window2 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window3 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window4 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window5 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window6 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window7 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window8 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window9 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))
let window10 = SKSpriteNode(texture: SKTexture(imageNamed: "window"))

let entrance = SKSpriteNode(texture: SKTexture(imageNamed: "Entrance-wall"))

let plainWall1 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall2 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall3 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall4 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall5 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall6 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall61 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall62 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall7 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall8 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall9 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall10 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))

let plainWall11 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall12 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall13 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall14 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall15 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWall16 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))

let plainWallRW1 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallR = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallRE = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallE = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))

let roomWall1 = SKSpriteNode(texture: SKTexture(imageNamed: "storage-wall"))

let windowWall1 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall2 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall3 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall4 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall5 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall6 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall7 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))


let windowWall8 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall9 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall10 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall11 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall12 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall13 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall14 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall15 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall16 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))
let windowWall17 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-window"))


let backArc1 = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))
let backArc2 = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))
let backArc3 = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))
let backArc4 = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))
let backArc5 = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))
let backArc6 = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))

let backArcE = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))


let arc1 = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))
let arc2 = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))
let arc3 = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))
let arc4 = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))
let arc5 = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))
let arc6 = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))

let arcE = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))

let closeTree1 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree2 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree3 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree4 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree5 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree6 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree7 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree8 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree9 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree10 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree11 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))
let closeTree12 = SKSpriteNode(texture: SKTexture(imageNamed: "tree1"))


//End Regular Castle

//Achievement Wall

let arcA1 = SKSpriteNode(texture: SKTexture(imageNamed: "arc2"))
let backArcA1 = SKSpriteNode(texture: SKTexture(imageNamed: "arc"))

let windowWallA1 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))
let windowWallA2 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))
let windowWallA3 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))
let windowWallA4 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))
let windowWallA5 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))
let windowWallA6 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))
let windowWallA7 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))
let windowWallA8 = SKSpriteNode(texture: SKTexture(imageNamed: "smallWindow"))

let plainWallA1 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallA2 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallA3 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallA4 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallA5 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallA6 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallA7 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))
let plainWallA8 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-empty"))

let mountainA1 = SKSpriteNode(imageNamed: "SingleMountain")
let mountainA2 = SKSpriteNode(imageNamed: "SingleMountain")
let mountainA3 = SKSpriteNode(imageNamed: "SingleMountain")
let mountainA4 = SKSpriteNode(imageNamed: "SingleMountain")
let mountainA5 = SKSpriteNode(imageNamed: "SingleMountain")


let roomWallA1 = SKSpriteNode(texture: SKTexture(imageNamed: "modular-wall-room-1"))



let chanA1 = SKSpriteNode(texture: SKTexture(imageNamed: "chandelier"))
let chanA2 = SKSpriteNode(texture: SKTexture(imageNamed: "chandelier"))
let chanA3 = SKSpriteNode(texture: SKTexture(imageNamed: "chandelier"))

//End Achievement Wall

let leftDeath = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
let bottomDeath = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
let gameOverFilter = SKSpriteNode(texture: SKTexture(imageNamed: "GOFilter"))
let pauseFilter = SKSpriteNode(texture: SKTexture(imageNamed: "PauseFilter"))
let bigTree = SKSpriteNode(texture: SKTexture(imageNamed: "tree2"))
let bigTree2 = SKSpriteNode(texture: SKTexture(imageNamed: "symmetricaltree1"))
let bigTree3 = SKSpriteNode(texture: SKTexture(imageNamed: "tree2"))
let bigTree4 = SKSpriteNode(texture: SKTexture(imageNamed: "tree2"))
let physicsBodyWall = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
let castleFloor = SKSpriteNode(texture: SKTexture(imageNamed: "Floor"))
let castleCeiling = SKSpriteNode(texture: SKTexture(imageNamed: "Floor"))
let castleCeiling2 = SKSpriteNode(texture: SKTexture(imageNamed: "Floor"))
let frontWall = SKSpriteNode(texture: SKTexture(imageNamed: "FrontWall"))
var makemsgcounter: CGFloat = 0
var startmakemsgcounter: CGFloat = 10


var makemsgxpos1: CGFloat = 0
var makemsgxpos2: CGFloat = 0
var makemsgxpos3: CGFloat = 0

var makemsgcharge1: CGFloat = 0
var makemsgcharge2: CGFloat = 0
var makemsgcharge3: CGFloat = 0

var makemsgcyclepos1: Int = 0
var makemsgcyclepos2: Int = 0
var makemsgcyclepos3: Int = 0


    var sharedScore: Int = 0
 var currentIndex: Int?
    typealias GameOverBlock = (didWin: Bool) -> Void
    var gameOverBlock: GameOverBlock?   
   var networkingEngine: MultiplayerNetworking?
    
    private var bird2: SKSpriteNode!

var shakeNode: SKNode! 
var castleMoveNode: SKNode!
    var worldNode: SKNode!
var distantWorldNode: SKNode!
var midWorldNode: SKNode!
    var starttime: Double = 0
    var endtime: Double = 0
    var jumppower: Double = 0
    
    //sounds:
    
    var shutgapsound = SKAction.playSoundFileNamed("shutgap.wav", waitForCompletion: false)
    
  //  let bird2 = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    
    
    let spikedetector1 = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let spikedetector2 = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let tutorialBox = SKSpriteNode(texture: SKTexture(imageNamed: "TutorialTapHoldRelease2"))
   // let birdimage = SKSpriteNode(texture: SKTexture(imageNamed: "Bird")) //SKSpriteNode(imageNamed: "Bird")





//Costumeparts

//pirate:




let overlay = SKSpriteNode(imageNamed: "Overlay")
let bird3 = SKSpriteNode(imageNamed: "BlueC")
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
    var bird2x: CGFloat =  -1000 //30 // reset how startblock got defined, now the x start amount is much shorter //1950 //1850 // all that follows is for bird2 in backgroundLayer, not self: 1850 // 2250 for 1600 make3 // 2050//1850 for fast start with make3size = 1300 //1500 //for opening walls test: 2300//was 1500 for normal//890 for most tests //800 for some older tests maybe // for reverse slip test: 1500 //800
var newbird2x: CGFloat = -132//-1000
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
    var lowestplatformpos: CGFloat = -324 // -624
    var highestplatformpos: CGFloat = 200// was 600, but too tall, let bird2 fly over next barriers // 8
    var platformyinc: CGFloat = 250 // was 100 before dx velocity was decreased // the maximum y position above the current platform that the next platform will be
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
    var touchongc: Int = 0
    var touchonmm: Int = 0
var touchonlevel: Int = 0
var touchonmult: Int = 0




    var secondlives: CGFloat = 0
    var usedsecondlives: CGFloat = 0
    var checkpointmode: Int = 0
    var checkpointmove: Int = 0
    var maxsawy: CGFloat = 1550
    var minsawy: CGFloat = 600
 
    
    var swmaxy: CGFloat = 1700// was 1750// was CGFloat // was 1848 // highest height the bottom of vplatform goes (not including spike) for sliding walls
    var swminy: CGFloat = 915 // was 700 when groundypos was 30// was 700//was CGFloat
    var swgap: CGFloat = 325 // was 350, but seemed easy// was 325 before graphics, but graphics changed the height of bird2 physicsbody// was 350 // gap is technically swgap + 2
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
var sawheight: CGFloat = 120
var sawwidth: CGFloat = 120
    var preventssdeath: CGFloat = 0
    var pssdcounter: CGFloat = 2
    var placeholder1: Int = -1
    var placeholder2: Int = -1
    var placeholder3: Int = -1
    var placeholder4: Int = -1
    var closepos: Int = -1
    var lastclosepos: Int = 4
    var endpos: Int = -1
    var platformcount: Int = 0
var chaincount: CGFloat = 0
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

 var difPer: CGFloat = 0.8 //0.8

var difMaxPos: CGFloat = 400
var difMinPos: CGFloat = 350
var difLowPos: CGFloat = 0
var difPos: CGFloat = 0
    
    
 var difMaxPos1200: CGFloat = 390 //350
  var difMinPos1200: CGFloat = 290 //320
    var difLowPos1200: CGFloat = -250// was -120 when floor was GRectGetMinY(castleCeiling.frame) - 1220 - castleFloor.size.height/2 // was -325 w groundypos 30. 
  var difMaxPos1350: CGFloat = 420 //400
  var difMinPos1350: CGFloat = 320 //350
   var difLowPos1350: CGFloat = -250// was -120 when floor was GRectGetMinY(castleCeiling.frame) - 1220 - castleFloor.size.height/2 //   
var difMaxPos1500: CGFloat = 440 //460 //420
  var difMinPos1500: CGFloat = 360 //390
var difLowPos1500: CGFloat = -250// was -120 when floor was GRectGetMinY(castleCeiling.frame) - 1220 - castleFloor.size.height/2 // 
var LFW: CGFloat = 0
var maxIncrease: CGFloat = 600 // was 600

var closegaptime: NSTimeInterval = 4 // was 7
    var gapclosed: Bool = false
    var deaththisframe: CGFloat = 0
    

var falltime: NSTimeInterval = 10
var fallwaittime: NSTimeInterval = 1.0
    var fall2time: NSTimeInterval = 0.25
    var frontClosed: Int = 0
    
    let GameCenterButton = SKSpriteNode(texture: SKTexture(imageNamed: "GameCenterButton"))
    let matchMakerButton = SKSpriteNode(texture: SKTexture(imageNamed: "matchMakerButton"))
    let scorescreen = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let pausescreen = SKSpriteNode(texture: SKTexture(imageNamed: "transparent")) // oldbarrier2
    let storescreen = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let coinchoicescreen = SKSpriteNode(texture: SKTexture(imageNamed: "oldbarrier2"))
    let replaybutton = SKSpriteNode(texture: SKTexture(imageNamed: "PlayButton"))
    let replaybutton2 = SKSpriteNode(texture: SKTexture(imageNamed: "PlayButton"))
let startButton = SKSpriteNode(texture: SKTexture(imageNamed: "PlayButton"))
let title = SKSpriteNode(texture: SKTexture(imageNamed: "title"))
    let pausebutton = SKSpriteNode(texture: SKTexture(imageNamed: "Pause"))
    let storebutton = SKSpriteNode(texture: SKTexture(imageNamed: "Coin"))
    let backbuttonpause = SKSpriteNode(texture: SKTexture(imageNamed: "Back"))
    let backbuttonstore = SKSpriteNode(texture: SKTexture(imageNamed: "Back"))
    let backbuttoncoinscreen = SKSpriteNode(texture: SKTexture(imageNamed: "Back"))
let backbuttonlevelscreen = SKSpriteNode(texture: SKTexture(imageNamed: "Back"))
let level1Button = SKSpriteNode(texture: SKTexture(imageNamed: "PhysicsTest"))
let level2Button = SKSpriteNode(texture: SKTexture(imageNamed: "PhysicsTest"))
let level3Button = SKSpriteNode(texture: SKTexture(imageNamed: "PhysicsTest"))
    let exitButton = SKSpriteNode(texture: SKTexture(imageNamed: "Exit"))
let exitButton2 = SKSpriteNode(texture: SKTexture(imageNamed: "Exit"))
    let buySecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "secondLifeButton"))

let effectNode = SKEffectNode()
let gfilter = CIFilter(name: "CIGaussianBlur") // CIFilter(name: "CIColorMonochrome", withInputParameters: ["inputColor": CIColor(red: 0/255, green: 100/255, blue: 255/255), "inputIntensity": 0.5]) //, withInputParameters: ["inputRadius": 1.0]) // for bloom:   //CIGaussianBlur
    

    var blurAmount: CGFloat = 0
var blurcounter: CGFloat = 0
var oldblurcounter: CGFloat = 0
    
    // BUTTONS TO REMOVE
    
    let freecoins = SKSpriteNode(texture: SKTexture(imageNamed: "Coin")) // remove, gives free coins. PUT BACK
    let wipecleanbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Cancel")) // REMOVE, RESETS THE GAME PUT BACK
    
    // END BUTTONS TO REMOVE
    
    //StoreButtons:
    
    let buymultbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
    let buyslbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
    let buyOneCoinUpgButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
    let buySingleSecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
    let buyCheckpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "blank-button"))
    let buyStackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "Buy"))
    
    
    
    let multbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Mult"))
    let secondLifeButton = SKSpriteNode(imageNamed: "transparent") // UnlimitedSecondLives
    let oneCoinUpgButton = SKSpriteNode(texture: SKTexture(imageNamed: "individualcoinupgrade")) // Individualcoinupgrade
    let singleSecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "secondLifeButton"))
    let scrambledCheckpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "ScrambledCheckpoint"))
    let checkpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "Checkpoint"))
    let hiddenStackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "Hidden"))
    let stackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "StackableLives"))
    
    
    
    
    var gpaused: Bool = true // was false Put back
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
    
    let yellowCoinChoice: SKSpriteNode = SKSpriteNode(imageNamed: "coin-x2")
    let blueCoinChoice: SKSpriteNode = SKSpriteNode(imageNamed: "blue-coin-x2")
    let redCoinChoice: SKSpriteNode = SKSpriteNode(imageNamed: "red-coin-x2")
    
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
var startref: CGFloat = 0
    var sml: CGFloat = 0
    
    let platformst2 = SKSpriteNode(imageNamed: "barrier2")
    let platformst1 = SKSpriteNode(imageNamed: "barrier")
    let platformst3 = SKSpriteNode(imageNamed: "symmetricaltreeshell1") // oldbarrier2
    let platformst3pb = SKSpriteNode(imageNamed: "treestalk1")
    
    let blueC = SKSpriteNode(imageNamed: "BlueC")
    let blackC = SKSpriteNode(imageNamed: "BlackC")

    
let floorForbidSign: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "floorForbidSign"))  

let floorForbid1 = SKSpriteNode(imageNamed: "transparent")
let floorForbid2 = SKSpriteNode(imageNamed: "transparent")
let floorForbid3 = SKSpriteNode(imageNamed: "transparent")
let floorForbid4 = SKSpriteNode(imageNamed: "transparent")
let floorForbid5 = SKSpriteNode(imageNamed: "transparent")
let floorForbid6 = SKSpriteNode(imageNamed: "transparent")
let floorForbid7 = SKSpriteNode(imageNamed: "transparent")
let floorForbid8 = SKSpriteNode(imageNamed: "transparent")
let floorForbid9 = SKSpriteNode(imageNamed: "transparent")
let floorForbid10 = SKSpriteNode(imageNamed: "transparent")
let floorForbid11 = SKSpriteNode(imageNamed: "transparent")
let floorForbid12 = SKSpriteNode(imageNamed: "transparent")

let floorForbidHeight: CGFloat = 100
let floorForbidWait: NSTimeInterval = 1.0
let ffmove: CGFloat = 50




let chain1: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain2: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain3: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain4: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain5: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain6: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain7: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain8: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain9: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain10: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain11: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
let chain12: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "chain"))
    
    let platform1: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform2: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform3: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform4: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform5: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform6: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform7: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform8: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform9: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform10: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform11: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))
    let platform12: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "transparent"))

let platformImage1: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage2: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage3: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage4: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage5: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage6: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage7: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage8: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage9: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage10: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage11: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
let platformImage12: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))





let platformSlot1: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot2: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot3: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot4: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot5: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot6: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot7: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot8: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot9: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot10: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot11: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let platformSlot12: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))


let vplatformSlot1: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot2: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot3: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot4: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot5: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot6: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot7: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot8: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot9: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot10: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot11: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))
let vplatformSlot12: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "PlatformSlot"))

    
    
    let coin0: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    
    
    let coin1: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin2: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin3: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin4: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin5: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin6: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin7: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin8: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin9: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin10: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin11: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    let coin12: SKSpriteNode = SKSpriteNode(imageNamed: "Coin")
    
    let coin21: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin22: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin23: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin24: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin25: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin26: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin27: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin28: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin29: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin210: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin211: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    let coin212: SKSpriteNode = SKSpriteNode(imageNamed: "Coin2")
    
    let coin31: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin32: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin33: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin34: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin35: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin36: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin37: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin38: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin39: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin310: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin311: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    let coin312: SKSpriteNode = SKSpriteNode(imageNamed: "Coin3")
    
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
    
    let vplatform1: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform2: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform3: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform4: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform5: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform6: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform7: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform8: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform9: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform10: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform11: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    let vplatform12: SKSpriteNode = SKSpriteNode(texture: SKTexture(imageNamed: "barrier2"))
    
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
    
    
    let saw1: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw2: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw3: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw4: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw5: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw6: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw7: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw8: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw9: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw10: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw11: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw12: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw13: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw14: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw15: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw16: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw17: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw18: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw19: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw20: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw21: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw22: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw23: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw24: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw25: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw26: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw27: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw28: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw29: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw30: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw31: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw32: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw33: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw34: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw35: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw36: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw37: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw38: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw39: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw40: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw41: SKSpriteNode = SKSpriteNode(imageNamed: "saw")
    let saw42: SKSpriteNode = SKSpriteNode(imageNamed: "saw")

let initialfrontjagged1: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let initialfrontjagged2: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
 
let frontjagged1: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged2: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged3: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged4: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged5: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged6: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged7: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")  
let frontjagged8: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged9: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged10: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged11: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged12: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged13: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged14: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged15: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged16: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged17: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged18: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged19: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged20: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged21: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")
let frontjagged22: SKSpriteNode = SKSpriteNode(imageNamed: "FrontJagged")

let backjagged1: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged2: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged3: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged4: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged5: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged6: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged7: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")  
let backjagged8: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged9: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged10: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged11: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged12: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged13: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged14: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged15: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged16: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged17: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged18: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged19: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged20: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged21: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")
let backjagged22: SKSpriteNode = SKSpriteNode(imageNamed: "BackJagged")

let beginroofwall: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall-beginning")

    
    let initialroofwall1: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let initialroofwall2: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall1: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall2: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall3: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall4: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall5: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall6: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall7: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")  
let roofwall8: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall9: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall10: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall11: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall12: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall13: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall14: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall15: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall16: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall17: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall18: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall19: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")
let roofwall20: SKSpriteNode = SKSpriteNode(imageNamed: "roof-wall")

   
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
    var ground = SKSpriteNode(imageNamed: "transparent")
    var ceiling = SKSpriteNode(imageNamed: "transparent")
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



    var scoreLabel = SKLabelNode(fontNamed: "BanglaSangamMN") //SKLabelNode()
var buyLabel1 = SKLabelNode(fontNamed: "BanglaSangamMN")

    var highScoreLabel = SKLabelNode(fontNamed: "BanglaSangamMN")
    var coinLabel = SKLabelNode(fontNamed: "BanglaSangamMN")
    var screenScoreLabel = SKLabelNode(fontNamed: "BanglaSangamMN")
    var screenHighScoreLabel = SKLabelNode(fontNamed: "BanglaSangamMN")
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
var chaincycle: Int = 1
    var xcycle: Int = -1
    
    var dartarraypos: Int = 0
    var spikearraypos: Int = 0
var sawarraypos: Int = 0
var frontjaggedarraypos: Int = 0
var backjaggedarraypos: Int = 0
 var roofwallarraypos: Int = 0
 
  
let flag1: SKTexture = SKTexture(imageNamed: "flag_00004")
let flag2: SKTexture = SKTexture(imageNamed: "flag_00005")
let flag3: SKTexture = SKTexture(imageNamed: "flag_00006")
let flag4: SKTexture = SKTexture(imageNamed: "flag_00007")
let flag5: SKTexture = SKTexture(imageNamed: "flag_00008")
let flag6: SKTexture = SKTexture(imageNamed: "flag_00009")
let flag7: SKTexture = SKTexture(imageNamed: "flag_00010")
let flag8: SKTexture = SKTexture(imageNamed: "flag_00011")
let flag9: SKTexture = SKTexture(imageNamed: "flag_00012")
let flag10: SKTexture = SKTexture(imageNamed: "flag_00013")
let flag11: SKTexture = SKTexture(imageNamed: "flag_00014")
let flag12: SKTexture = SKTexture(imageNamed: "flag_00015")
let flag13: SKTexture = SKTexture(imageNamed: "flag_00016")
let flag14: SKTexture = SKTexture(imageNamed: "flag_00017")
let flag15: SKTexture = SKTexture(imageNamed: "flag_00018")
let flag16: SKTexture = SKTexture(imageNamed: "flag_00019")
let flag17: SKTexture = SKTexture(imageNamed: "flag_00020")
let flag18: SKTexture = SKTexture(imageNamed: "flag_00021")
let flag19: SKTexture = SKTexture(imageNamed: "flag_00022")
let flag20: SKTexture = SKTexture(imageNamed: "flag_00023")

let flag21: SKTexture = SKTexture(imageNamed: "checkpoint_00004")
let flag22: SKTexture = SKTexture(imageNamed: "checkpoint_00005")
let flag23: SKTexture = SKTexture(imageNamed: "checkpoint_00006")
let flag24: SKTexture = SKTexture(imageNamed: "checkpoint_00007")
let flag25: SKTexture = SKTexture(imageNamed: "checkpoint_00008")
let flag26: SKTexture = SKTexture(imageNamed: "checkpoint_00009")
let flag27: SKTexture = SKTexture(imageNamed: "checkpoint_00010")
let flag28: SKTexture = SKTexture(imageNamed: "checkpoint_00011")
let flag29: SKTexture = SKTexture(imageNamed: "checkpoint_00012")
let flag210: SKTexture = SKTexture(imageNamed: "checkpoint_00013")


let tail1: SKTexture = SKTexture(imageNamed: "tail_00005")
let tail2: SKTexture = SKTexture(imageNamed: "tail_00006")
let tail3: SKTexture = SKTexture(imageNamed: "tail_00007")
let tail4: SKTexture = SKTexture(imageNamed: "tail_00008")
let tail5: SKTexture = SKTexture(imageNamed: "tail_00009")
let tail6: SKTexture = SKTexture(imageNamed: "tail_00010")
let tail7: SKTexture = SKTexture(imageNamed: "tail_00011")
let tail8: SKTexture = SKTexture(imageNamed: "tail_00012")
let tail9: SKTexture = SKTexture(imageNamed: "tail_00013")
let tail10: SKTexture = SKTexture(imageNamed: "tail_00014")


let smalltail1: SKTexture = SKTexture(imageNamed: "smalltail_00005")
let smalltail2: SKTexture = SKTexture(imageNamed: "smalltail_00006")
let smalltail3: SKTexture = SKTexture(imageNamed: "smalltail_00007")
let smalltail4: SKTexture = SKTexture(imageNamed: "smalltail_00008")
let smalltail5: SKTexture = SKTexture(imageNamed: "smalltail_00009")
let smalltail6: SKTexture = SKTexture(imageNamed: "smalltail_00010")



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

let deathtext: SKTexture = SKTexture(imageNamed: "monkey-death-state")
    
var flagtexture: [SKTexture] = []
var flagtexture2: [SKTexture] = []
var tailtexture: [SKTexture] = []
var tailtexture2: [SKTexture] = []

var deathtexture: [SKTexture] = []
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

    static let bird: UInt32 = 0b1  //1
    static let block: UInt32 = 0b10 ////2
    static let floor: UInt32 = 0b100 //4
    static let danger: UInt32 = 0b1000 // 8
    static let dart: UInt32 = 0b10000 // 16
    static let dartcatcher: UInt32 = 0b100000 //32
    static let vplatform: UInt32 = 0b1000000 // 64
    static let outline: UInt32 = 0b10000000 // 128
    static let slidespike: UInt32 = 0b100000000 // 256
    static let coin: UInt32 = 0b1000000000 // 512
    static let cleanup: UInt32 = 0b10000000000 // 1024
static let chain: UInt32 = 0b100000000000

    }
    
    
    
    /* IS THIS NEEDED? DID NOT SEE ONE IN CIRCUIT RACER GAMESCENE. A: this is usedwhen gnothing is being gamescene is not being loaded from storyboard. Since I added storyboard, have to use the method below this one */


    required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    }


    
    /*
    required init(coder aDecoder: NSCoder!) {
   //     foo = "some string"
   //     bar = 9001
        
        super.init(coder: aDecoder!)
    } */



func achievementBarrier(goal: SKSpriteNode) {

/*
backgroundLayer.enumerateChildNodesWithName("backArc") { node, _ in 

if let marker = node as? SKSpriteNode {

if marker.position.x < goal.position.x - 1800 {

if marker.position.x > self.lastBackArcXPos {

self.lastBackArcXPos = marker.position.x

}


} else {


marker.removeFromParent()

}

    }
    }
*/

backgroundLayer.enumerateChildNodesWithName("expendable3") { node, _ in

if let todelete = node as? SKSpriteNode {

if todelete.position.x > self.lastBackArcXPos {


todelete.paused = false
todelete.removeAllActions()
todelete.name = nil


}

}

    }

backgroundLayer.enumerateChildNodesWithName("expendable1") { node, _ in 

if let todelete = node as? SKSpriteNode {

if todelete.position.x > goal.position.x - 1447.44 + 471 && todelete.position.x < goal.position.x + 1447.44 - 471 { // was within +/- 1000

// let todelete = node as! SKSpriteNode

todelete.paused = false
todelete.removeAllActions()
//todelete.physicsBody?.restitution = 0.2
//todelete.physicsBody?.angularDamping = 0.1
//todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil



/*
if let pchildren = todelete.children as? [SKSpriteNode] {

for pchild in pchildren {
    // *** // *** // 10-2-15 print("pchild.name: \(pchild.name)")

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.removeFromParent()
//pchild.runAction(SKAction.removeFromParent())

}

}

*/


todelete.removeFromParent()


}

}

}

backgroundLayer.enumerateChildNodesWithName("expendable2") { node, _ in 

if let todelete = node as? SKSpriteNode {

if todelete.position.x > goal.position.x - 1447.44 + 235.5 && todelete.position.x < goal.position.x + 1447.44 - 235.5 { // was within +/- 1000

// let todelete = node as! SKSpriteNode

todelete.paused = false
todelete.removeAllActions()
//todelete.physicsBody?.restitution = 0.2
//todelete.physicsBody?.angularDamping = 0.1
//todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil



/*
if let pchildren = todelete.children as? [SKSpriteNode] {

for pchild in pchildren {
    // *** // *** // 10-2-15 print("pchild.name: \(pchild.name)")

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.removeFromParent()
//pchild.runAction(SKAction.removeFromParent())

}

}

*/


todelete.removeFromParent()


}

}

}


noRoofABegin = goal.position.x - 1447.44 // - 1000
noRoofAEnd = goal.position.x + 1447.44 // + 1000

print("noRoofABegin: \(noRoofABegin)")
print("noRoofAEnd: \(noRoofAEnd)")


//ceiling.size.width = goal.position.x - 380
//ceiling.position.x = 380 + ceiling.size.width/2

castleCeiling.size.width = goal.position.x - 380 - 1447.44 + 471 // - 800
castleCeiling.position.x = 380 + castleCeiling.size.width/2

skyTop.size.width = goal.position.x - 380 - 1447.44
skyTop.position.x = 380 + skyTop.size.width/2
skyTop.zPosition = platformSlotZPos
skyTop.removeFromParent()
backgroundLayer.addChild(skyTop)

//skyTop2.position.x = self.size.width/2
skyTop2.size.height = 200
skyTop2.position.y = self.size.height - skyTop2.size.height/2
//skyTop2.size.height = self.size.height + 100
skyTop2.size.width = 24000 //self.size.width + 100
skyTop2.name = "skyTop2"
skyTop2.zPosition = platformSlotZPos + backgroundLayerZPos
skyTop2.hidden = false
//self.addChild(skyTop2)

castleCeiling2.color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
castleCeiling2.colorBlendFactor = castleBlendFactor//0.5
castleCeiling2.position.y = self.size.height - 300
castleCeiling2.size.width = 8000 //8000
castleCeiling2.zPosition = floorZPos - backgroundLayerZPos

    castleCeiling2.removeFromParent()
//backgroundLayer.addChidl(castleCeiling2)



windowWallA1.position.x = goal.position.x + windowWallA1.size.width/2 + 40
windowWallA1.position.y = CGRectGetMaxY(castleFloor.frame) + windowWallA1.size.height/2 + 200
windowWallA1.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA1)

windowWallA2.position.x = windowWallA1.position.x + windowWallA2.size.width + 80
windowWallA2.position.y = CGRectGetMaxY(castleFloor.frame) + windowWallA2.size.height/2 + 200
windowWallA2.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA2)

windowWallA3.position.x = goal.position.x - windowWallA3.size.width/2 - 40
windowWallA3.position.y = CGRectGetMaxY(castleFloor.frame) + windowWallA3.size.height/2 + 200
windowWallA3.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA3)

windowWallA4.position.x = windowWallA3.position.x - windowWallA4.size.width - 80
windowWallA4.position.y = CGRectGetMaxY(castleFloor.frame) + windowWallA4.size.height/2 + 200
windowWallA4.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA4)

windowWallA5.position.x = goal.position.x + windowWallA5.size.width/2 + 40
windowWallA5.position.y = CGRectGetMaxY(windowWallA1.frame) + windowWallA5.size.height/2 + 300
windowWallA5.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA5)

windowWallA6.position.x = windowWallA1.position.x + windowWallA6.size.width + 80
windowWallA6.position.y = CGRectGetMaxY(windowWallA2.frame) + windowWallA6.size.height/2 + 300
windowWallA6.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA6)

windowWallA7.position.x = goal.position.x - windowWallA7.size.width/2 - 40
windowWallA7.position.y = CGRectGetMaxY(windowWallA3.frame) + windowWallA7.size.height/2 + 300
windowWallA7.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA7)

windowWallA8.position.x = windowWallA3.position.x - windowWallA8.size.width - 80
windowWallA8.position.y = CGRectGetMaxY(windowWallA4.frame) + windowWallA8.size.height/2 + 300
windowWallA8.zPosition = backWallZPos
backgroundLayer.addChild(windowWallA8)

plainWallA1.size.width = CGRectGetMaxX(windowWallA2.frame) - CGRectGetMinX(windowWallA4.frame)
plainWallA1.size.height = CGRectGetMinY(windowWallA1.frame) - CGRectGetMaxY(castleFloor.frame) + 10
plainWallA1.position.x = goal.position.x
plainWallA1.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallA1.size.height/2
plainWallA1.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA1)


plainWallA2.size.width = CGRectGetMaxX(windowWallA2.frame) - CGRectGetMinX(windowWallA4.frame)
plainWallA2.size.height = CGRectGetMinY(windowWallA5.frame) - CGRectGetMaxY(windowWallA1.frame) + 10
plainWallA2.position.x = goal.position.x
plainWallA2.position.y = CGRectGetMaxY(windowWallA1.frame) + plainWallA2.size.height/2
plainWallA2.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA2)

plainWallA3.size.width = CGRectGetMaxX(windowWallA2.frame) - CGRectGetMinX(windowWallA4.frame)
plainWallA3.size.height = 2000
plainWallA3.position.x = goal.position.x
plainWallA3.position.y = CGRectGetMaxY(windowWallA5.frame) + plainWallA3.size.height/2
plainWallA3.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA3)

plainWallA4.size.width = 300 // update
plainWallA4.size.height = 2500
plainWallA4.position.x = CGRectGetMinX(windowWallA4.frame) - plainWallA4.size.width/2 + 10
plainWallA4.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallA4.size.height/2
plainWallA4.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA4)

backArcA1.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArcA1.size.width = backArcA1.size.height*0.37624750 
backArcA1.position.x = CGRectGetMinX(plainWallA4.frame) - backArcA1.size.width/2 + 10
backArcA1.position.y = CGRectGetMaxY(castleFloor.frame) + backArcA1.size.height/2
backArcA1.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(backArcA1)

plainWallA5.size.width = CGRectGetMinX(windowWallA3.frame) - CGRectGetMaxX(windowWallA4.frame) + 10
plainWallA5.size.height = 2500
plainWallA5.position.x = CGRectGetMinX(windowWallA3.frame) - plainWallA5.size.width/2 + 10
plainWallA5.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallA5.size.height/2
plainWallA5.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA5)

plainWallA6.size.width = CGRectGetMinX(windowWallA1.frame) - CGRectGetMaxX(windowWallA3.frame) + 10
plainWallA6.size.height = 2500
plainWallA6.position.x = CGRectGetMinX(windowWallA1.frame) - plainWallA6.size.width/2 + 10
plainWallA6.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallA6.size.height/2
plainWallA6.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA6)

plainWallA7.size.width = CGRectGetMinX(windowWallA2.frame) - CGRectGetMaxX(windowWallA1.frame) + 10
plainWallA7.size.height = 2500
plainWallA7.position.x = CGRectGetMinX(windowWallA2.frame) - plainWallA7.size.width/2 + 10
plainWallA7.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallA7.size.height/2
plainWallA7.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA7)

plainWallA8.size.width = 300 //update
plainWallA8.size.height = 2500
plainWallA8.position.x = CGRectGetMaxX(windowWallA2.frame) + plainWallA8.size.width/2 - 10
plainWallA8.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallA8.size.height/2
plainWallA8.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(plainWallA8)

arcA1.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arcA1.size.width = arcA1.size.height*0.37624750 
arcA1.position.x = CGRectGetMaxX(plainWallA8.frame) + arcA1.size.width/2 - 10
arcA1.position.y = CGRectGetMaxY(castleFloor.frame) + arcA1.size.height/2
arcA1.zPosition = backWallZPos - 0.3
backgroundLayer.addChild(arcA1)

print("CGRectGetMaxX(backArcA1.frame): \(CGRectGetMaxX(backArcA1.frame)) CGRectGetMinX(arcA1.frame): \(CGRectGetMinX(arcA1.frame))")

print("arcA1.size: \(arcA1.size) backArcA1.size: \(backArcA1.size)")

/* mountains in the tall windows?
mountainA1.anchorPoint.x = 0
mountainA1.anchorPoint.y = 0
mountainA1.position.x = lastMtnPos + 800
mountainA1.position.y = 250//CGFloat.random(min: -100, max: 250)
mountainA1.name = "mountainA12"
mountainA1.size = CGSize(width: mountainA1.size.width, height: mountainA1.size.height)
*/

chanA1.position.x = plainWallA5.position.x
chanA1.position.y = 1900
chanA1.zPosition = frontWallZPos
backgroundLayer.addChild(chanA1)

chanA2.position.x = plainWallA6.position.x
chanA2.position.y = 1900
chanA2.zPosition = frontWallZPos
backgroundLayer.addChild(chanA2)

chanA3.position.x = plainWallA7.position.x
chanA3.position.y = 1900
chanA3.zPosition = frontWallZPos
backgroundLayer.addChild(chanA3)

//ranAchievementWall = 1


}

func hideLevelScreen() {



print("hidelevelScreen run")

levelScreen.removeAllActions()

levelScreen.runAction(SKAction.sequence([SKAction.moveToX(rightEdge + levelScreen.size.width/2 + 50, duration: 0.5), SKAction.runBlock({


self.levelScreen.position.y = 6000
self.levelScreen.removeFromParent()

//gameVCDelegate!.setMultiButtonHidden(false) // put back
self.levelSelectOn = false

})]))


}

func exitToMain() {


/* need this? Isn't fixing problem with using exit button after scoring a few points and is interfering with transition
backgroundLayer.enumerateChildNodesWithName("*") { node, _ in // was backgroundLayer and  "*", but only worked on direct children of scne.e skip this for now, don't recall this taking too much time.

if let todelete = node as? SKSpriteNode {

if 

todelete.paused = false
todelete.removeAllActions()
todelete.physicsBody?.restitution = 0.2
todelete.physicsBody?.angularDamping = 0.1
todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil


if let pchildren = todelete.children as? [SKSpriteNode] {

for pchild in pchildren {


pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.removeFromParent()


}

}

todelete.removeFromParent()


}
self.backgroundLayer.removeAllChildren()
}
self.backgroundLayer.removeAllChildren()
self.removeAllChildren()
*/




print("exit button pressed")
            noOfCars = 1
            let transition: SKTransition = SKTransition.pushWithDirection(.Right, duration:0.5)            
let scene = GameScene(size:CGSize(width: 1536, height: 2048))
   
            let skView = self.view as SKView!
          
          //  skView.ignoresSiblingOrder = true
         //   scene.scaleMode = .AspectFill
replay = false
tapStart = false
            skView.presentScene(scene, transition: transition)



}

func showLevelScreen() {

levelSelectOn = true

//gameVCDelegate!.setMultiButtonHidden(true) // put back

levelScreen.removeFromParent()
levelScreen.size.width = rightEdge - leftEdge + 30
levelScreen.size.height = self.size.height + 30
levelScreen.zPosition = scoreScreenZPos
levelScreen.position.x = rightEdge + levelScreen.size.width/2 + 50
levelScreen.position.y = self.size.height/2
self.addChild(levelScreen)
levelScreen.removeAllActions()

backbuttonlevelscreen.removeFromParent()
backbuttonlevelscreen.position.x = -rightEdge/2 + backbuttonlevelscreen.size.width/2 + 55
backbuttonlevelscreen.position.y = self.size.height/2 - backbuttonlevelscreen.size.height/2 - 55
backbuttonlevelscreen.zPosition = 1
levelScreen.addChild(backbuttonlevelscreen)

level1Button.size.width = 1000//rightEdge - leftEdge - 300
level1Button.size.height = self.size.height/6
level1Button.removeFromParent()
level1Button.position.x = 0
level1Button.position.y = self.size.height/2 - self.size.height/6 
level1Button.zPosition = 1
levelScreen.addChild(level1Button)


level2Button.size.width = 1000//rightEdge - leftEdge - 300
level2Button.size.height = self.size.height/6
level2Button.removeFromParent()
level2Button.position.x = 0
level2Button.position.y = self.size.height/2 - self.size.height/2
level2Button.zPosition = 1
levelScreen.addChild(level2Button)

level3Button.size.width = 1000//rightEdge - leftEdge - 300
level3Button.size.height = self.size.height/6
level3Button.removeFromParent()
level3Button.position.x = 0
level3Button.position.y = self.size.height/2 - 5*self.size.height/6
level3Button.zPosition = 1
levelScreen.addChild(level3Button)


levelScreen.runAction(SKAction.moveToX(self.size.width/2, duration: 0.5))


}



func checkcompleteAssignmentBlockOne() {


completeAssignmentBlock()

if GameState.sharedInstance.runBlockUpdate == 1 {
    
   achievementBlockStart() // put back. causing an exc_bad_access error?
    
    //set the next assignment block
    
    //use global definitions to display words and coin amounts
    
   
    GameState.sharedInstance.saveState()



}

if GameState.sharedInstance.runBlockUpdate == 2 { //for level2
    
   achievementBlockStart()
    
    //set the next assignment block
    
    //use global definitions to display words and coin amounts
    
  //  GameState.sharedInstance.oneBlock += 1
  //  GameState.sharedInstance.saveState()



}

if GameState.sharedInstance.runBlockUpdate == 3 { //for level 3
    
   achievementBlockStart()
    
    //set the next assignment block
    
    //use global definitions to display words and coin amounts
    
 //   GameState.sharedInstance.oneBlock += 1
//    GameState.sharedInstance.saveState()



}

}

func achievementBlockStart() {


//award scene

if GameState.sharedInstance.runBlockUpdate == 1 {

//transitionToGame() // cleans the scene // move world nodes up instead

worldNode.position.y = 10000
distantWorldNode.position.y = 10000
midWorldNode.position.y = 10000
shakeNode.position.y = 10000



GameState.sharedInstance.timer1running = -1
assignmentLabel1.removeAllActions()
stopwatchLabel1.removeAllActions()

//setupScene won't run becuase runBlockUpdate > 0
backgroundColor = SKColor.whiteColor()
awardBackgroundOne.position.x = self.size.width/2
awardBackgroundOne.position.y = self.size.height/2
awardBackgroundOne.zPosition = -10
//addChild(awardBackgroundOne)


awardPlatformOne.position.x = self.size.width/2
awardPlatformOne.position.y = 600 - awardPlatformOne.size.height/2
awardPlatformOne.zPosition = 1
awardPlatformOne.physicsBody = SKPhysicsBody(rectangleOfSize: awardPlatformOne.size)
awardPlatformOne.physicsBody!.categoryBitMask = PhysicsCategory.outline
awardPlatformOne.physicsBody!.collisionBitMask = PhysicsCategory.bird
awardPlatformOne.physicsBody!.dynamic = false
awardPlatformOne.physicsBody!.affectedByGravity = false
addChild(awardPlatformOne)

   
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.removeFromParent()
bird2.position.x = awardPlatformOne.position.x
bird2.position.y = CGRectGetMaxY(awardPlatformOne.frame) + bird2.size.height/2
bird2.zPosition = 2

bird2.physicsBody!.velocity.dx = 0
bird2.physicsBody!.velocity.dy = 0
jumping = true
bird2con = 0
bird2.addChild(birdimagerightrun)



addChild(bird2)

assignmentLabel1.removeFromParent()
assignmentLabel2.removeFromParent()
assignmentLabel3.removeFromParent()

assignmentLabel1.position.y = 2500
assignmentLabel2.position.y = -100
assignmentLabel3.position.y = assignmentLabel2.position.y - 100
assignmentLabel1.position.x = 600
assignmentLabel2.position.x = 0
assignmentLabel3.position.x = 0

assignmentLabel1.zPosition = 5
assignmentLabel2.zPosition = 5
assignmentLabel3.zPosition = 5

addChild(assignmentLabel1)
assignmentLabel1.addChild(assignmentLabel2)
assignmentLabel1.addChild(assignmentLabel3)

assignmentLabel1.runAction(SKAction.sequence([SKAction.waitForDuration(2.0), SKAction.moveToY(1800, duration: 3), SKAction.runBlock({

GameState.sharedInstance.oneBlock += 1
GameState.sharedInstance.runBlockUpdate = 0
GameState.sharedInstance.saveState()

self.showScoreScreen()

})]))

//check off assignment labels


/*
pausescreen.position.y = self.size.width/2
pausescreen.position.x = self.size.height/2
pausescreen.zPosition = 3
pausescreen.removeAllChildren()
addChild(pausescreen)

pausescreen.addChild(replaybutton)
replaybutton.position.x = 250
replaybutton.position.y = -500
*/







}

}

func singlePlayerStart() {
print("singleplayerstart()")

tapToPlay.removeAllActions()
tapToPlay.runAction(SKAction.sequence([SKAction.fadeAlphaTo(0, duration: NSTimeInterval(tapToPlay.alpha*CGFloat(0.5))), SKAction.runBlock({

self.tapToPlay.removeFromParent()

})]))

//gameVCDelegate!.setMultiButtonHidden(true) // put back
//viewController.hidemult()

levelButton.position.y = 5000
levelButton.removeFromParent()

if replay == false {

//checkcompleteAssignmentBlockOne()

}


showAssignments()




introCastle = 1
print("worldNode.position.x: \(worldNode.position.x)")

let moveAmount: CGFloat = -150 //was — 250 //375 //-worldNode.position.x - 50 //-worldNode.position.x + (self.size.width/2) 

print("moveAmount: \(moveAmount)")
       // worldNode.runAction(SKAction.moveToX(self.size.width/2, duration: 0.70))
worldNode.runAction(SKAction.moveByX(moveAmount, y: 0, duration: 0.75))        

        midWorldNode.runAction(SKAction.moveByX(moveAmount*midSpeed, y: 0, duration: 0.75))
        distantWorldNode.runAction(SKAction.moveByX(moveAmount*distantSpeed, y: 0, duration: 0.75))



/*platformst3.runAction(SKAction.sequence([SKAction.moveToX(-132, duration: 0.7), SKAction.runBlock({

self.introCastle = 0

})]))

bird2.runAction(SKAction.sequence([SKAction.moveToX(platforms[4].position.x - 500, duration: 0.7), SKAction.runBlock({

self.gpaused = false

if self.leftDeath.parent == nil {

self.leftDeath.position.x = -300 //140
self.leftDeath.position.y = self.size.height/2
self.leftDeath.size.height = self.size.height
self.leftDeath.size.width = 100
self.leftDeath.name = "danger"


self.leftDeath.physicsBody = SKPhysicsBody(rectangleOfSize: self.leftDeath.size)
self.leftDeath.physicsBody!.affectedByGravity = false
self.leftDeath.physicsBody!.categoryBitMask = 0
self.leftDeath.physicsBody!.contactTestBitMask = PhysicsCategory.bird
self.leftDeath.physicsBody!.collisionBitMask = 0
self.leftDeath.physicsBody!.dynamic = false
self.addChild(self.leftDeath)

self.bottomDeath.position.x = self.size.width/2
self.bottomDeath.position.y = -400//-140
self.bottomDeath.size.height = 100
self.bottomDeath.size.width = self.size.width

self.bottomDeath.name = "danger"



self.bottomDeath.physicsBody = SKPhysicsBody(rectangleOfSize: self.bottomDeath.size)
self.bottomDeath.physicsBody!.affectedByGravity = false
self.bottomDeath.physicsBody!.categoryBitMask = 0
self.bottomDeath.physicsBody!.contactTestBitMask = PhysicsCategory.bird
self.bottomDeath.physicsBody!.collisionBitMask = 0
self.bottomDeath.physicsBody!.dynamic = false
self.addChild(self.bottomDeath)

}

})]))
*/


/*
platformst3.runAction(SKAction.sequence([SKAction.moveToX(-132, duration: 0.7), SKAction.runBlock({

self.introCastle = 0

})])) */


/*

bird2.runAction(SKAction.sequence([SKAction.moveToX(platforms[4].position.x - 500, duration: 0.7), SKAction.runBlock({

self.gpaused = false

if self.leftDeath.parent == nil {

self.leftDeath.position.x = -300 //140
self.leftDeath.position.y = self.size.height/2
self.leftDeath.size.height = self.size.height
self.leftDeath.size.width = 100
self.leftDeath.name = "danger"


self.leftDeath.physicsBody = SKPhysicsBody(rectangleOfSize: self.leftDeath.size)
self.leftDeath.physicsBody!.affectedByGravity = false
self.leftDeath.physicsBody!.categoryBitMask = PhysicsCategory.outline
self.leftDeath.physicsBody!.contactTestBitMask = PhysicsCategory.bird
self.leftDeath.physicsBody!.collisionBitMask = 0
self.leftDeath.physicsBody!.dynamic = false
self.addChild(self.leftDeath)

self.bottomDeath.position.x = self.size.width/2
self.bottomDeath.position.y = -400//-140
self.bottomDeath.size.height = 100
self.bottomDeath.size.width = self.size.width

self.bottomDeath.name = "danger"



self.bottomDeath.physicsBody = SKPhysicsBody(rectangleOfSize: self.bottomDeath.size)
self.bottomDeath.physicsBody!.affectedByGravity = false
self.bottomDeath.physicsBody!.categoryBitMask = PhysicsCategory.outline
self.bottomDeath.physicsBody!.contactTestBitMask = PhysicsCategory.bird
self.bottomDeath.physicsBody!.collisionBitMask = 0
self.bottomDeath.physicsBody!.dynamic = false
self.addChild(self.bottomDeath)

}

})]))

*/



print("running singleplayerstart")

for i in 0...(castlemoves.count - 1) {

print("ran castle moves loop")


castlemoves[i].removeFromParent()
castleMoveNode.addChild(castlemoves[i])  


    }




castleMoveNode.runAction(SKAction.sequence([SKAction.moveByX(-setCastleDistance, y: 0, duration: 0.75), SKAction.runBlock({
    
    
    self.introCastle = 0
    self.setCastle = 1 
self.gpaused = false

    
   

/*

for i in 0...(self.castlemoves.count - 1) {

print("ran castle moves loop")

self.castlemoves[i].removeFromParent()
self.backgroundLayer.addChild(self.castlemoves[i])  


    }
*/

})]))






if self.leftDeath.parent == nil {

self.leftDeath.position.x = -300 //140
self.leftDeath.position.y = self.size.height/2
self.leftDeath.size.height = self.size.height
self.leftDeath.size.width = 100
self.leftDeath.name = "danger"


self.leftDeath.physicsBody = SKPhysicsBody(rectangleOfSize: self.leftDeath.size)
self.leftDeath.physicsBody!.affectedByGravity = false
self.leftDeath.physicsBody!.categoryBitMask = PhysicsCategory.outline
self.leftDeath.physicsBody!.contactTestBitMask = PhysicsCategory.bird
self.leftDeath.physicsBody!.collisionBitMask = 0
self.leftDeath.physicsBody!.dynamic = false
self.addChild(self.leftDeath)

self.bottomDeath.position.x = self.size.width/2
self.bottomDeath.position.y = -400//-140
self.bottomDeath.size.height = 100
self.bottomDeath.size.width = self.size.width

self.bottomDeath.name = "danger"



self.bottomDeath.physicsBody = SKPhysicsBody(rectangleOfSize: self.bottomDeath.size)
self.bottomDeath.physicsBody!.affectedByGravity = false
self.bottomDeath.physicsBody!.categoryBitMask = PhysicsCategory.outline
self.bottomDeath.physicsBody!.contactTestBitMask = PhysicsCategory.bird
self.bottomDeath.physicsBody!.collisionBitMask = 0
self.bottomDeath.physicsBody!.dynamic = false
self.addChild(self.bottomDeath)

}






//startButton.position.x = 0
startButton.removeFromParent() //add quick fade
title.removeFromParent() //add quick fade
startButton.position.y = 3000 // was still able to click even after removing from parent


}



func transitionToGame() {


print("transitiontogame running")
//  // *** // *** // *** // 10-2-15 print("began running transition to game")

    print("GameState.sharedInstance.runBlockUpdate: \(GameState.sharedInstance.runBlockUpdate)")
print("transitionToGame() ran")

if opponentReplay == 2 {


// "Player has left."

//Game Center Invite a Friend/Play Now pops up.

}

if noOfCars == 2 && opponentReplay == 0 {

// "Waiting For Response"

}


if noOfCars == 1 || (noOfCars > 1 && opponentReplay == 1 && selfReplay == 1) {

gpaused = true
replay = true

bird2.position.x = newbird2x //bird2x
bird2.position.y = bird2y + 300


if platformImages.count > 0 {

for i in 0...(platformImages.count - 1) {

platformImages[i].removeFromParent()


}

for i in 0...(castlemoves.count - 1) {

castlemoves[i].removeFromParent()

 // print("ran removefromparent on castlemoves: name : \(castlemoves[i].name)")
    }

}

for i in 0...(platformImages.count - 1) {

platformImages[i].name = nil
}





platformst3.removeAllChildren()


backgroundLayer.enumerateChildNodesWithName("*") { node, _ in // was backgroundLayer and  "*", but only worked on direct children of scne.e skip this for now, don't recall this taking too much time.

if let todelete = node as? SKSpriteNode {

// let todelete = node as! SKSpriteNode

todelete.paused = false
todelete.removeAllActions()
todelete.physicsBody?.restitution = 0.2
todelete.physicsBody?.angularDamping = 0.1
todelete.physicsBody?.linearDamping = 0.1
todelete.name = nil


//let pchildren = todelete.children as! [SKSpriteNode]

if let pchildren = todelete.children as? [SKSpriteNode] {

for pchild in pchildren {
    // *** // *** // 10-2-15 print("pchild.name: \(pchild.name)")

pchild.paused = false
pchild.removeAllActions()
pchild.physicsBody?.restitution = 0.2
pchild.physicsBody?.angularDamping = 0.1
pchild.physicsBody?.linearDamping = 0.1
pchild.name = nil
pchild.removeFromParent()
//pchild.runAction(SKAction.removeFromParent())

}

}

//todelete.runAction(SKAction.removeFromParent())
todelete.removeFromParent()


}
self.backgroundLayer.removeAllChildren()
}
self.backgroundLayer.removeAllChildren()
self.removeAllChildren()

//  var transition: SKTransition = SKTransition.flipHorizontalWithDuration(1)
//   var scene: SKScene = TransitionScene(size: size)
//   scene.scaleMode = scaleMode

// self.paused = true
//    self.view?.presentScene(scene, transition: transition)


// // *** // *** // *** // 10-2-15 print("ran transition to game")

/*
self.removeAllActions()
distantWorldNode.removeAllChildren()
midWorldNode.removeAllChildren()
worldNode.removeAllChildren()
shakeNode.removeAllActions()
shakeNode.removeAllChildren()
replaybutton.removeFromParent()
pausescreen.removeAllChildren()
pausescreen.removeFromParent()
assignmentLabel1.removeFromParent()
assignmentLabel2.removeFromParent()
assignmentLabel3.removeFromParent()
checkmark1.removeFromParent()
checkmark2.removeFromParent()
checkmark3.removeFromParent()
bird2.removeAllChildren()
bird2.removeFromParent()
awardBackgroundOne.removeFromParent()
awardPlatformOne.removeFromParent()
distantWorldNode.removeFromParent()
midWorldNode.removeFromParent()
worldNode.removeFromParent()
shakeNode.removeFromParent()
*/




for i in 0...11 {

vplatforms[i].removeAllActions()
platforms[i].removeAllActions()
floorForbids[i].removeAllActions()


}

//SKAction.waitForDuration(0),

GameState.sharedInstance.score = 0

print("setupscene about to run")


replaybutton2.removeFromParent()
scorescreen.removeFromParent()
    addChild(scorescreen)
scorescreen.position.x = self.size.width/2
scorescreen.position.y = self.size.height/2
scorescreen.addChild(replaybutton2)
    replaybutton2.zPosition = 1000
    
 //   if replay == false   { // || GameState.sharedInstance.runBlockUpdate == 0 ————removed this to debug. if this prevents error, will relocate world type nodes.
    
setupScene()
        
//    }
    
    
print("setupscene ran")


self.runAction(SKAction.sequence([SKAction.runBlock({

/*
let transition: SKTransition = SKTransition.flipHorizontalWithDuration(1.0)
let scene: SKScene = GameScene(size: self.size)
scene.scaleMode = self.scaleMode
self.view?.presentScene(scene, transition: transition)
*/

 //   self.runAction(SKAction.sequence([SKAction.runBlock({self.setupScene()})])) //SKAction.waitForDuration(10.0),
//add transition effect without transitioning





})]))
}
print("transitiontogame ran")

}

    
    func matchEnded() {
       // if let block = gameEndedBlock {
     //       paused = true
     //       block()
     //   }
    }
    
    
    func gameOver(didLocalPlayerWin: Bool) { 
        
        paused = true
    
        gameOverBlock?(didWin: didLocalPlayerWin) 
    }

func isGameOver() {

//use this both for received messages and for self game over

    
    // *** // *** // 10-2-15 print("GameState.sharedInstance.score:  \(GameState.sharedInstance.score)")
    
    // *** // *** // 10-2-15 print("otherPlayerScore: \(otherPlayerScore)")
// *** // *** // 10-2-15 print("otherPlayerGameOver: \(otherPlayerGameOver)")
// *** // *** // 10-2-15 print("selfGameOver: \(selfGameOver)")
    
    
if isPlayer1 {

if GameState.sharedInstance.score == otherPlayerScore && otherPlayerGameOver == true {

//GameKitHelper.sharedInstance.multiplayerMatch?.disconnect()
    // *** // *** // 10-2-15 print("disconnect")
// "Score Win

if GameState.sharedInstance.score > otherPlayerScore + 1 {

//"Shut Out Win
}
}

if GameState.sharedInstance.score == otherPlayerScore {

if (timerOnLocal == false && otherPlayerGameOver == true) {

// "Time Win"

}

if timerOnLocal == true && selfGameOver == true {

//"Time Lose"

}

//GameKitHelper.sharedInstance.multiplayerMatch?.disconnect()
   //  // *** // *** // 10-2-15 print("disconnect")




}

if GameState.sharedInstance.score == otherPlayerScore && selfGameOver == true {

// "Score Lose
//GameKitHelper.sharedInstance.multiplayerMatch?.disconnect()
 //    // *** // *** // 10-2-15 print("disconnect")

    if GameState.sharedInstance.score < otherPlayerScore - 1 {

// "Shut Out"
}

    }

    }
    
    }

    
    func setPositionOfCar(dx: Float, dy: Float, rotation: Float) { //index: Int,
      //  let car = cars[index] as SKSpriteNode  THIS WILL BE FOR THE OPPOSING BIRD. FOR NOW, SETTING TO THE SAME BIRD.
   //     bird2.physicsBody?.velocity.dx = CGFloat(dx)
      //  bird2.physicsBody?.velocity.dy = CGFloat(dy)
        
     //   // *** // *** // 10-2-15 print("test received velocity expression dx: \(dx) dy: \(dy)")
     //   // *** // *** // 10-2-15 print("bird2.physicsBody?.velocity.dx: \(bird2.physicsBody?.velocity.dx) dy: \(bird2.physicsBody?.velocity.dy)") 

bird3.position.x = CGFloat(dx)
bird3.position.y = CGFloat(dy)
        

// *** // *** // 10-2-15 print("test received position expression dx: \(dx) dy: \(dy)")
        
            if rotation != 0 {
        bird2.zRotation = CGFloat(rotation)
        }  
    
    }
    

    
    func receiveMake(gen: Int, xpos: Float, charge: Float, cyclepos: Int) {
        
        // *** // *** // 10-2-15 print("receivemake start: gen: \(gen) xpos: \(xpos) charge: \(charge) cyclepos: \(cyclepos)")
       
        if gen > 0 {

if gen > sharedScore {

// *** // *** // 10-2-15 print("receivemake updatesharedscore")
sharedScore = gen
    
    if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
        platforms[lastclosepos].runAction(SKAction.moveToY(platforms[lastclosepos].physicsBody!.charge, duration: fall2time), withKey: "Fall2")
        vplatforms[lastclosepos].runAction(SKAction.moveToY(vplatforms[lastclosepos].physicsBody!.charge, duration: fall2time), withKey: "Fall2")
    }

            }
        }

if gen < 1 {

platforms[cyclepos].position.x = CGFloat(xpos)
platforms[cyclepos].physicsBody!.charge = CGFloat(charge)

vplatforms[cyclepos].position.x = CGFloat(xpos)
vplatforms[cyclepos].position.y = CGFloat(charge) + 2048 - 2
vplatforms[cyclepos].physicsBody!.charge = CGFloat(charge) + 2048 - 2
// *** // *** // 10-2-15 print("receivemake positions")
    
    if cyclepos < 4 {
    if platformcount - 2 <= 5 {
        coins[cyclepos].position.x = CGFloat(xpos)
        coins[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
    }
    
    if platformcount - 2 > 5 && platformcount - 3 <= 10 {
        coins2[cyclepos].position.x = CGFloat(xpos)
        coins2[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
    }
    
    if platformcount - 2 > 10 {
        coins3[cyclepos].position.x = CGFloat(xpos)
        coins3[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
    }
    

}
    
    
    if cyclepos >=  4 && cyclepos < 8 {
        if platformcount - 1 <= 5 {
            coins[cyclepos].position.x = CGFloat(xpos)
            coins[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
        }
        
        if platformcount - 1 > 5 && platformcount - 2 <= 10 {
            coins2[cyclepos].position.x = CGFloat(xpos)
            coins2[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
        }
        
        if platformcount - 1 > 10 {
            coins3[cyclepos].position.x = CGFloat(xpos)
            coins3[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
        }
        
        
    }
    
    if cyclepos >= 8 {
        if platformcount <= 5 {
            coins[cyclepos].position.x = CGFloat(xpos)
            coins[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
        }
        
        if platformcount > 5 && platformcount - 1 <= 10 {
            coins2[cyclepos].position.x = CGFloat(xpos)
            coins2[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
        }
        
        if platformcount > 10 {
            coins3[cyclepos].position.x = CGFloat(xpos)
            coins3[cyclepos].position.y = CGRectGetMinY(vplatforms[cyclepos].frame)
        }
        
        
    }
        }
    }



    
func receiveOpen(time: NSTimeInterval, pos: Int) {


//check to see if it's already been given a signal -- linear damping?
// *** // *** // 10-2-15 print("run receiveopen")
    if closepos != pos && lastclosepos != pos && endpos != pos { // definitely ahead
        
        placeholder1 = pos



//cancel the close action on the current closepos and reset it if it started closing
        
        if closepos != -1 {
platforms[closepos].removeActionForKey("Fall2")
vplatforms[closepos].removeActionForKey("Fall2")
        }
        
        
/*REDUNDANT:
platforms[closepos].runAction(SKAction.moveToY(platforms[closepos].physicsBody!.charge - self.swgap/2, duration: fall2time))
vplatforms[closepos].runAction(SKAction.moveToY(platforms[closepos].physicsBody!.charge + self.swgap/2, duration: fall2time))
*/
//platforms[closepos].runAction
/*

endpos = lastclosepos
lastclosepos = closepos
closepos = pos
*/
        
}



}

        
    
    
    func setCurrentPlayerIndex(index :Int) { currentIndex = index
    }
    
func playcoinsound(ctype: String) {

if ctype == "1" {

runAction(SKAction.playSoundFileNamed("patheticcoin.wav", waitForCompletion: false))

}

if ctype == "2" {

runAction(SKAction.playSoundFileNamed("smallcoin.wav", waitForCompletion: false))

}


if ctype == "3" {

runAction(SKAction.playSoundFileNamed("coinsack.wav", waitForCompletion: false))


}



}


func playshutgapsound() {


runAction(shutgapsound)

}
    
    func playopenwalls() {
        
        runAction(SKAction.playSoundFileNamed("openwalls.wav", waitForCompletion: false))
    
    }
    
    func playscoresound() {
        
        if GameState.sharedInstance.score == 5 {
            
            runAction(SKAction.playSoundFileNamed("coinvalueincreased.wav", waitForCompletion: false))
            
            
        }
        
        if GameState.sharedInstance.score == 10 {
            
            runAction(SKAction.playSoundFileNamed("redcoinopen.wav", waitForCompletion: false))
            
            
        }
        
        runAction(SKAction.playSoundFileNamed("score.wav", waitForCompletion: false))

    

    }


func playjumpsound() {

runAction(SKAction.playSoundFileNamed("jump2.wav", waitForCompletion: false))
// *** // *** // 10-2-15 print("playjumpsound() ran")
}







    func checkpointroundanimation() {
    
    scoreLabel.text = "0"
buyLabel1.text = "BUY"
    gpaused = true
    
    
    blueC.size.height = 300
    blueC.size.width = 300
    blackC.size.height = 300
    blackC.size.width = 300
    blueC.zPosition = 26
    blackC.zPosition = 25
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
    
    
    //
    func death() {
    
    // *** // *** // *** // *** // 10-2-15 print("death() begin")
    // *** // *** // 10-2-15 print("death()")

deathtexture.append(deathtext)

//birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(deathtexture, timePerFrame: 1000000)))

//birdimage.texture =  SKTexture(imageNamed: "monkey-death-state")

birdimagedeath.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagedeath)

birdimagedeath.anchorPoint.x = 0.5
birdimagedeath.anchorPoint.y = 0.5

//bird2.paused = true




//could adapt to global function?:
/*
if castleType == 0 && GameState.sharedInstance.runNextBlockAnimation == 1 {//level 1 and need to run finished block

if GameState.sharedInstance.oneBlock == 1 {

//list the 3 assignments from level 1 in objective box. (could surround objective box with a well-centered cloud.

let testObjAnim = SKSpriteNode(imageNamed: "individualcoinupgrade")

testObjAnim.position.x = self.size.width/2
testObjAnim.position.y = self.size.height/2
testObjAnim.zPosition = 100
self.addChild(testObjAnim)

testObjAnim.runAction(SKAction.sequence([SKAction.waitForDuration(20), SKAction.removeFromParent()])) 

//player pushes next and the next 3 objectives fade in? Then ok one more time to continue.


}

//put a checkmark next to each one. or, could put a line through it, but would need to do this individually within each oneBlock check.

GameState.sharedInstance.oneBlock += 1

}
*/

/*if GameState.sharedInstance.score < 1 {

runAction(SKAction.playSoundFileNamed("deathonfirstbarrier.wav", waitForCompletion: false))


} else {

runAction(SKAction.playSoundFileNamed("death.wav", waitForCompletion: false))

}*/


//networkingEngine?.sendLapComplete() // adapt this to give the gameover condition




individseclifelabel.removeFromParent()
individseclifelabel.zPosition = scoreScreenButtonZPos


    if deaththisframe == 0 {
    
    if (secondlives == 0 || usedsecondlives == 1) && gameover == false {
    

if noOfCars > 1 {
selfGameOver = true
networkingEngine?.sendGameOver(GameState.sharedInstance.score)
  // *** // *** // 10-2-15 print("order send gameover in death()")

if isPlayer1 {


isGameOver()

}

}
 

    
    //turns on danger gameover
    //  println("slidespike death")
    gameover = true
    GameState.sharedInstance.saveState()
    
    //TURNS ON EXTRA SCORESCREEN BUTTONS:
    /*
    if GameState.sharedInstance.highScore >= 10 && noOfCars == 1 {
    
    buySecondLifeButton.size.width = 100
    buySecondLifeButton.size.height = 100
        /*
    buySecondLifeButton.position.x = -scorescreen.size.width/2
    buySecondLifeButton.position.x += replaybutton.size.width/2
    buySecondLifeButton.position.x += 250
    
    buySecondLifeButton.position.y = -scorescreen.size.height/2
    buySecondLifeButton.position.y += replaybutton.size.height/2
    buySecondLifeButton.position.y += 50
    */
    buySecondLifeButton.zPosition = scoreScreenButtonZPos
    
    
   
    if buySecondLifeButton.parent == nil {
    
buySecondLifeButton.removeFromParent()
    scorescreen.addChild(buySecondLifeButton)
        
        }
    
    if individseclifelabel.parent == nil {
        individseclifelabel.fontColor = SKColor.yellowColor()
        individseclifelabel.colorBlendFactor = 0.25
        individseclifelabel.fontSize = 40
        individseclifelabel.name = "scorescreenlabel"
        individseclifelabel.zPosition = scoreScreenButtonZPos // was 0 but didn't wshow up after ios9 PUT BACK - FIGURE OUT IF Zpos is ok.
        individseclifelabel.position.x = buySecondLifeButton.position.x - 150
        individseclifelabel.position.y = buySecondLifeButton.position.y
        individseclifelabel.text = "\(costOfSecondLife)"

individseclifelabel.removeFromParent()
        scorescreen.addChild(individseclifelabel)
    }
    
        
        
        // *** // *** // 10-2-15 print("individseclifelabel.parent: \(individseclifelabel.parent)")
        // *** // *** // 10-2-15 print("individseclifelabel.position : \(individseclifelabel.position)")
        // *** // *** // 10-2-15 print("buySecondLifeButton.position: \(buySecondLifeButton.position)")
        
    
    
    
    if buySecondLifeButton.parent != nil && checkpointmode == 1 {
    
    buySecondLifeButton.removeFromParent()
    individseclifelabel.removeFromParent()
    
    }
        
        if GameState.sharedInstance.coins < costOfSecondLife || usedsecondlives == 1 {
            
            buySecondLifeButton.alpha = 0.5
            individseclifelabel.alpha = 0.5
            
        }
            
       if GameState.sharedInstance.coins >= costOfSecondLife && usedsecondlives == 0 {
            
            buySecondLifeButton.alpha = 1.0
            individseclifelabel.alpha = 1.0
            
        }

    
        }
    
   
        
    
    if buyStackableLivesButton.parent == nil && GameState.sharedInstance.coins >= 500 && noOfCars == 1 {
    
    
    
    buyStackableLivesButton.size.width = 100
    buyStackableLivesButton.size.height = 100
    buyStackableLivesButton.position.x = -scorescreen.size.width/2
    buyStackableLivesButton.position.x += replaybutton.size.width/2
    buyStackableLivesButton.position.x += 250
    
    
    buyStackableLivesButton.position.y = -scorescreen.size.height/2
    buyStackableLivesButton.position.y += replaybutton.size.height/2
    
    buyStackableLivesButton.position.y -= 150
    buyStackableLivesButton.zPosition = scoreScreenButtonZPos

buyStackableLivesButton.removeFromParent()
    scorescreen.addChild(buyStackableLivesButton)
    }
    
    if stackableliveslabel.parent == nil && buyStackableLivesButton.parent != nil {
    stackableliveslabel.fontColor = SKColor.yellowColor()
    stackableliveslabel.colorBlendFactor = 0.25
    stackableliveslabel.fontSize = 40
    stackableliveslabel.name = "storelabel"
    stackableliveslabel.zPosition = scoreScreenButtonZPos
    stackableliveslabel.position.x = buyStackableLivesButton.position.x - 150
    stackableliveslabel.position.y = buyStackableLivesButton.position.y
    stackableliveslabel.text = "\(costOfStackableLife)"

   scorescreen.removeFromParent()
    scorescreen.addChild(stackableliveslabel)
    }
    
    if GameState.sharedInstance.coins < costOfStackableLife {
    
    buyStackableLivesButton.alpha = 0.5
    stackableliveslabel.alpha = 0.5
    
} else {
    
    buyStackableLivesButton.alpha = 1.0
    stackableliveslabel.alpha = 1.0
    
    }
    
       */
    checkcompleteAssignmentBlockOne() // need to interrupt score screen for when this needs to runBlockUpdate, for the animation.
    
if GameState.sharedInstance.runBlockUpdate == 0 {


showScoreScreen()
    
        }


    
    }

        }

/*  this was moved. Not sure where this goes for second lives.

    if secondlives == 1 && usedsecondlives == 0 {
    
    secondliferepo()
    
    
    }
    
*/

deaththisframe = 1 // this runs even when award scene is triggered. not sure if that is ok
        
    }

func showScoreScreen() {

gameOverFilter.alpha = 0       
self.addChild(gameOverFilter)
gameOverFilter.size.height = self.size.height
gameOverFilter.size.width = self.size.width
gameOverFilter.position.x = self.size.width/2
gameOverFilter.position.y = self.size.height/2
gameOverFilter.zPosition = interfaceButtonsZPos
gameOverFilter.runAction(SKAction.fadeAlphaTo(0.6, duration: 0.5))


scorescreen.removeFromParent()
    scorescreen.size.width = 800
    scorescreen.size.height = 1500
    scorescreen.position.x = self.size.width/2
    scorescreen.position.y = self.size.height/2 // was -500 for scroll up
    scorescreen.zPosition = scoreScreenZPos
    scorescreen.name = "scorescreen"
    self.addChild(scorescreen) //some kind of problem with this, being added twice PUT BACK but fix first
    
        backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in
            
            let pauseplatform = node as! SKSpriteNode
            
            
            
            pauseplatform.removeAllActions()
            pauseplatform.paused = true
            
        }
        
        backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in
            
            let pausevplatform = node as! SKSpriteNode
            pausevplatform.removeAllActions()
            
            
            
            pausevplatform.paused = true
            
        }
        
   //     floorForbids[closepos].paused = true
    /*    backgroundLayer.enumerateChildNodesWithName("floorForbid") { node, _ in
            
      //      let pauseff = node as! SKSpriteNode
            
            
       //     pauseff.removeAllActions()
            
      //      pauseff.paused = true
            
        } */

        
    replaybutton2.removeFromParent()
    replaybutton2.size.width = 400//150
    replaybutton2.size.height = 400//150
    replaybutton2.position.x = -scorescreen.size.width/2
    replaybutton2.position.x += replaybutton.size.width/2
    replaybutton2.position.x += CGFloat(50)
    
    replaybutton2.position.y = -scorescreen.size.height/2
    replaybutton2.position.y += replaybutton.size.height/2
    replaybutton2.position.y += 50
    
    replaybutton2.zPosition =  scoreScreenButtonZPos// was 0 but was not showing up after ios 9. PUT BACK
        


replaybutton2.removeFromParent()
    scorescreen.addChild(replaybutton2) //some kind of problem with this, being added twice PUT BACK but fix first

exitButton.removeFromParent()
exitButton.size.width = 150
exitButton.size.height = 150
exitButton.position.x = replaybutton2.position.x + 800


exitButton.position.y = replaybutton2.position.y

exitButton.zPosition =  scoreScreenButtonZPos// was 0 but was not showing up after ios 9. PUT BACK

exitButton.removeFromParent()
scorescreen.addChild(exitButton)



    
    screenScoreLabel.removeFromParent()
    screenScoreLabel.text = "Score: \(GameState.sharedInstance.score)"
    screenScoreLabel.position.x = 0
    screenScoreLabel.position.y = 400
    screenScoreLabel.fontColor = SKColor.blackColor()
    
    //  screenScoreLabel.fontName = NoteWorthy
    screenScoreLabel.fontSize = 65
        screenScoreLabel.zPosition = scoreScreenButtonZPos // was missing, but wasn't showing up after ios9 PUT BACK - CONSIDER IF OK

screenScoreLabel.removeFromParent()
    scorescreen.addChild(screenScoreLabel)












    
    screenHighScoreLabel.removeFromParent()
    screenHighScoreLabel.text = "High Score: \(GameState.sharedInstance.highScore)"
    screenHighScoreLabel.position.x = 0
    screenHighScoreLabel.position.y = 100
    screenHighScoreLabel.fontColor = SKColor.blackColor()
    //    screenhighScoreLabel.fontName = NoteWorthy
        screenHighScoreLabel.zPosition = scoreScreenButtonZPos // was missing, but wasn't showing up after ios9 PUT BACK - CONSIDER IF OK
    screenHighScoreLabel.fontSize = 65

screenHighScoreLabel.removeFromParent()
    scorescreen.addChild(screenHighScoreLabel)
    
    
  //  scorescreen.runAction(SKAction.moveToY(self.size.height/2, duration: 1))
    //   replaybutton.runAction(SKAction.moveToY(self.size.height - 1200, duration: 1))
    
    
    if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.checkpointunlock == 1 {
    
    GameState.sharedInstance.checkpointround = GameState.sharedInstance.checkpointround + 1
    
    if GameState.sharedInstance.score > GameState.sharedInstance.checkpointHS && checkpointmode == 0 {
    
    GameState.sharedInstance.checkpointHS = GameState.sharedInstance.score
    
    }
    
    GameState.sharedInstance.saveState()
    } //CHECKPOINTPUTBACK
    
 //   bird2.runAction(SKAction.removeFromParent())
bird2.removeFromParent() // PUT BACK. COMMENTED OUT TO TEST DEATH ANIMATION
    //  bird2.paused = true

    }
    
    
    
    
    func checkshutgaploss(checknode: Int) {
        // *** // *** // 10-2-15 print("checkshutgaploss")



    
    // *** // *** // *** // 10-2-15 print("checkshutgaploss start")

print("checkshutgaploss start")
    if bird2.position.x < platforms[checknode].position.x {
    gapclosed = true
   
  //  platforms[checknode].physicsBody!.angularDamping = CGFloat(closepos)
  //  vplatforms[checknode].physicsBody!.angularDamping = CGFloat(closepos)

platforms[checknode].physicsBody!.linearDamping = 15000
//  vplatforms[checknode].physicsBody!.linearDamping = 15000
    
    if GameState.sharedInstance.score <= 5 {
    coins[checknode].hidden = true
    }
    
    if GameState.sharedInstance.score > 5 && GameState.sharedInstance.score <= 10  {
    coins2[checknode].hidden = true
    }
    
    if GameState.sharedInstance.score > 10 {
    coins3[checknode].hidden = true
    }
    

death()
    }
    
    //otherwise do nothing
    // *** // *** // *** // 10-2-15 print("checkshutgaploss end")
    
    }
    
    
    func resetbird() {
    
        
    reposition = 0
    running = false
    sliding = false
    atrest = false
    jumping = true
    bird2con = 0
    facingdirection = 1
  //  birdimage.alpha = 1
    timelastscore = CFAbsoluteTimeGetCurrent()
    // *** // *** // *** // 10-2-15 print("resetbird")
    bird2.physicsBody!.velocity.dx = 100
    bird2.physicsBody!.velocity.dy = 0
    bird2.physicsBody!.affectedByGravity = true
    bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart | PhysicsCategory.slidespike | PhysicsCategory.chain
       
        
        if closepos != -1 {
        platforms[closepos].physicsBody!.linearDamping = 15000
        vplatforms[closepos].physicsBody!.linearDamping = 15000
            platforms[closepos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
            vplatforms[closepos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
        }
        
        
        // *** // *** // 10-2-15 print("resetbird ran")
    
        closepos = lastclosepos
        
        if endpos != -1 {
            
            lastclosepos = endpos
            
        }
        usedsecondlives = 0 //PUT BACK -- REMOVE
        
    }
    
    func secondliferepo() {

gameOverFilter.removeFromParent()
    
    reposition = 1
 //   birdimage.alpha = 0.5
    bird2con = 0
    bird2.physicsBody!.velocity.dx = 0
    bird2.physicsBody!.velocity.dy = 0
        
        backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in
            
            let pauseplatform = node as! SKSpriteNode
            
            
            
            
            pauseplatform.paused = false
            
        }
        
        backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in
            
            let pausevplatform = node as! SKSpriteNode
            
            
            
            
            pausevplatform.paused = false
            
        }
        
        backgroundLayer.enumerateChildNodesWithName("floorForbid") { node, _ in
            
            let pauseff = node as! SKSpriteNode
            
            
            
            
            pauseff.paused = false
            
        }
bird2.physicsBody!.contactTestBitMask = 0
      
        
        // *** // *** // 10-2-15 print("closepos: \(closepos)")
        
    if closepos > -1 {
        
        platforms[closepos].physicsBody!.contactTestBitMask = 0
        vplatforms[closepos].physicsBody!.contactTestBitMask = 0
    
        floorForbids[closepos].runAction(SKAction.moveToY(ffYPos, duration: 0.25)) //PUT BACK
        

let moveAmount: CGFloat = -worldNode.position.x - (platforms[closepos].position.x - 0.5*make3size/3 - 20 - self.size.width/2) 

        worldNode.runAction(SKAction.moveToX(-(platforms[closepos].position.x - 0.5*make3size/3 - 20 - self.size.width/2), duration: 0.50))
        
        midWorldNode.runAction(SKAction.moveByX(moveAmount*midSpeed, y: 0, duration: 0.50))
        distantWorldNode.runAction(SKAction.moveByX(moveAmount*distantSpeed, y: 0, duration: 0.50))
        
    bird2.runAction(SKAction.sequence([SKAction.moveToX(platforms[closepos].position.x - 0.5*make3size/3 - 20, duration: 0.50), SKAction.moveTo(CGPoint(x: platforms[closepos].position.x - 0.5*make3size/3 - 20, y: CGRectGetMaxY(ground.frame) + 150), duration: 0.5), SKAction.runBlock({self.resetbird()})]))
       
        platforms[closepos].removeAllActions()
        vplatforms[closepos].removeAllActions()
        

        
        platforms[closepos].runAction(SKAction.moveToY(platforms[closepos].physicsBody!.charge, duration: fall2time))
    vplatforms[closepos].runAction(SKAction.moveToY(vplatforms[closepos].physicsBody!.charge, duration: fall2time))
        
       
        
        /*
    if gapclosed == false {
    platforms[closepos].runAction(SKAction.sequence([SKAction.moveToY(platforms[closepos].physicsBody!.charge - swgap/2, duration: 1.0), SKAction.waitForDuration(closegaptime), SKAction.runBlock({playshutgapsound()}), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")
    
    vplatforms[closepos].runAction(SKAction.sequence([SKAction.moveToY(vplatforms[closepos].physicsBody!.charge + swgap/2, duration: 1.0), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time)]), withKey: "Fall2")
    }
        */
        
        
        }
        
     // *** // *** // 10-2-15 print("secondliferepo")   
    // *** // *** // 10-2-15 print("placeholder1: \(placeholder1)")
// *** // *** // 10-2-15 print("placeholder2: \(placeholder2)")
// *** // *** // 10-2-15 print("placeholder3: \(placeholder3)")
// *** // *** // 10-2-15 print("placeholder4: \(placeholder4)")

    if closepos == -1 {
    //   bird2.runAction(SKAction.moveToX(platformst3.position.x - 20, duration: 0.5))
    
    bird2.runAction(SKAction.sequence([SKAction.moveTo(CGPoint(x: platformst3.position.x - 20, y: CGRectGetMaxY(platformst3.frame) + 150), duration: 0.5), SKAction.runBlock({self.resetbird()})]))
    //SKAction.waitForDuration(0.5),
    }
    //    bird2.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.waitForDuration(0.1), SKAction.hide(bird2), SKAction.waitForDuration(0.1), SKAction.unhide(bird2)])), withKey: "Blink")
    
    gameover = false
    
    secondlives = 0
    }
    
    func updateUpgMeters() {
    
    yellowBar.size.width = 50
    yellowBar.size.height = 50
yellowBar.zPosition = storeScreenButtonZPos
    blueBar.size.width = 50
    blueBar.size.height = 50
blueBar.zPosition = storeScreenButtonZPos
    redBar.size.width = 50
    redBar.size.height = 50
redBar.zPosition = storeScreenButtonZPos
    upgradeBarOne.size.width = 50
    upgradeBarOne.size.height = 50
upgradeBarOne.zPosition = storeScreenButtonZPos
    upgradeBarTwo.size.width = 50
    upgradeBarTwo.size.height = 50
upgradeBarTwo.zPosition = storeScreenButtonZPos
    upgradeBarThree.size.width = 50
    upgradeBarThree.size.height = 50
upgradeBarThree.zPosition = storeScreenButtonZPos
    upgradeBarFour.size.width = 50
    upgradeBarFour.size.height = 50
upgradeBarFour.zPosition = storeScreenButtonZPos
    upgradeBarFive.size.width = 50
    upgradeBarFive.size.height = 50
    upgradeBarFive.zPosition = storeScreenButtonZPos
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
yellowCoinChoice.removeFromParent()
    coinchoicescreen.addChild(yellowCoinChoice)
    }
    
    if GameState.sharedInstance.bluCoinUpg == 1 {
blueCoinChoice.removeFromParent()
    coinchoicescreen.addChild(blueCoinChoice)
    }
    
    if GameState.sharedInstance.redCoinUpg == 1 {
redCoinChoice.removeFromParent()
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
    individcoinupglabel.zPosition = storeScreenButtonZPos
    
    
    
    
    
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
yellowBar.removeFromParent()
    storescreen.addChild(yellowBar)
    
    }
    
    if oneUpgOrder >= 200 && oneUpgOrder < 300  {
    
    
    blueBar.removeFromParent()
    blueBar.position.x = -100
    blueBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
blueBar.removeFromParent()
    storescreen.addChild(blueBar)
    
    }
    
    if oneUpgOrder >= 300 {
    
    
    redBar.removeFromParent()
    redBar.position.x = -100
    redBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
redBar.removeFromParent()
    storescreen.addChild(redBar)
    
    }
    
    if twoUpgOrder >= 10 && twoUpgOrder < 20  {
    
    yellowBar.removeFromParent()
    yellowBar.position.x = 0
    yellowBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
yellowBar.removeFromParent()
    storescreen.addChild(yellowBar)
    
    }
    
    if twoUpgOrder >= 20 && twoUpgOrder < 30 {
    
    
    blueBar.removeFromParent()
    blueBar.position.x = 0
    blueBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
blueBar.removeFromParent()
    storescreen.addChild(blueBar)
    
    }
    
    if twoUpgOrder >= 30 {
    
    
    redBar.removeFromParent()
    redBar.position.x = 0
    redBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
redBar.removeFromParent()
    storescreen.addChild(redBar)
    
    }
    
    if threeUpgOrder == 1 {
    
    yellowBar.removeFromParent()
    yellowBar.position.x = 100
    yellowBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
yellowBar.removeFromParent()
    storescreen.addChild(yellowBar)
    
    }
    
    if threeUpgOrder == 2 {
    
    
    blueBar.removeFromParent()
    blueBar.position.x = 100
    blueBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
blueBar.removeFromParent()
    storescreen.addChild(blueBar)
    
    }
    
    if threeUpgOrder == 3 {
    
    
    redBar.removeFromParent()
    redBar.position.x = 100
    redBar.position.y = storescreen.size.height/2 - oneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
redBar.removeFromParent()
    storescreen.addChild(redBar)
    
    }
    
    if GameState.sharedInstance.checkpointunlock == 1 {
    
    upgradeBarOne.removeFromParent()
    upgradeBarOne.position.x = 0
    upgradeBarOne.position.y = checkpointButton.position.y
upgradeBarOne.removeFromParent()
    storescreen.addChild(upgradeBarOne)
    }
    
    if GameState.sharedInstance.coinMult > 1 {
    
    upgradeBarTwo.removeFromParent()
    upgradeBarTwo.position.x = -100
    upgradeBarTwo.position.y = multbutton.position.y
upgradeBarTwo.removeFromParent()
    storescreen.addChild(upgradeBarTwo)
    }
    
    if GameState.sharedInstance.coinMult > 4 {
    
    upgradeBarThree.removeFromParent()
    upgradeBarThree.position.x = 0
    upgradeBarThree.position.y = multbutton.position.y
upgradeBarThree.removeFromParent()
    storescreen.addChild(upgradeBarThree)
    }
    
    if GameState.sharedInstance.coinMult > 9 {
    
    upgradeBarFour.removeFromParent()
    upgradeBarFour.position.x = 100
    upgradeBarFour.position.y = multbutton.position.y
upgradeBarFour.removeFromParent()
    storescreen.addChild(upgradeBarFour)
    }
    
    if GameState.sharedInstance.secondLife == 1 {
    
    upgradeBarFive.removeFromParent()
    upgradeBarFive.position.x = 0
    upgradeBarFive.position.y = secondLifeButton.position.y
upgradeBarFive.removeFromParent()
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

GameState.sharedInstance.timer1running = -1
GameState.sharedInstance.wallsCleared = 0
GameState.sharedInstance.redCollected = 0

GameState.sharedInstance.oneBlock = 1
GameState.sharedInstance.oneScore5 = 110
GameState.sharedInstance.oneBlue2 = 110
GameState.sharedInstance.oneTime60 = 10

GameState.sharedInstance.oneLowWall = 110
GameState.sharedInstance.oneScore10 = 110
GameState.sharedInstance.oneRed2 = 110
        
GameState.sharedInstance.oneTime180 = 10
GameState.sharedInstance.oneVineWall = 110
GameState.sharedInstance.oneFloatWall = 110

GameState.sharedInstance.oneScore25 = 110
GameState.sharedInstance.oneClear300 = 110
GameState.sharedInstance.oneTime300 = 10
        
        
GameState.sharedInstance.oneScore40 = 110
    GameState.sharedInstance.oneColl200 = 110
    GameState.sharedInstance.oneTime600 = 10
    GameState.sharedInstance.oneScore50 = 110
    GameState.sharedInstance.oneColl1000 = 110
    GameState.sharedInstance.oneTime600b = 10
        
        
        
        
        
        
        
        






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
    
    var chains: Array<SKSpriteNode!> = []
var saws: Array<SKSpriteNode!> = []
    var platforms: Array<SKSpriteNode!> = []
var platformImages: Array<SKSpriteNode!> = []
var platformSlots: Array<SKSpriteNode!> = []
var vplatformSlots: Array<SKSpriteNode!> = []
    var floorForbids: Array<SKSpriteNode!> = []
var spikeSlots: Array<SKSpriteNode!> = []
var backSpikeSlots: Array<SKSpriteNode!> = []
var floorSpikes: Array<SKSpriteNode!> = []
    var breakwalls: Array<SKSpriteNode!> = []
    var vplatforms: Array<SKSpriteNode!> = []
    var xplatforms: Array<SKSpriteNode!> = []
    var xvplatforms: Array<SKSpriteNode!> = []
    var spikes: Array<SKSpriteNode!> = []
    var frontjaggeds: Array<SKSpriteNode!> = []
var backjaggeds: Array<SKSpriteNode!> = []
var roofwalls: Array<SKSpriteNode!> = []
    var darts: Array<SKSpriteNode!> = []
    var dartducts: Array<SKSpriteNode!> = []
    var dartcatchers: Array<SKSpriteNode!> = []
    var trees: Array<SKSpriteNode!> = []
    var coins: Array<SKSpriteNode!> = []
    var coins2: Array<SKSpriteNode!> = []
    var coins3: Array<SKSpriteNode!> = []
    var minicoinlabels: Array<SKLabelNode!> = []
    var castlemoves: Array<SKSpriteNode!> = []
    
    var scorescreenwidth: CGFloat = 800
    var replaybuttonwidth: CGFloat = 300 //150
    var scorescreenheight: CGFloat = 1500
    var replaybuttonheight: CGFloat = 300 //150
    
    
    
   
    
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


GameState.sharedInstance.runBlockUpdate = 0 // remove, put back
GameState.sharedInstance.saveState() // remove, put back

GameState.sharedInstance.score = 0

if noOfCars == 1 {


tapStart = false
backgroundLayer.addChild(checkmark1)
backgroundLayer.addChild(checkmark2)
backgroundLayer.addChild(checkmark3)
checkmark1.hidden = true
checkmark2.hidden = true
checkmark3.hidden = true
assignmentOutline.position.x = -3000


assignmentLabel1.position.y = 7000
assignmentLabel2.position.y = 7000
assignmentLabel3.position.y = 7000

assignmentLabel1.removeFromParent()
assignmentLabel2.removeFromParent()
assignmentLabel3.removeFromParent()
assignmentOutline.removeFromParent()
backgroundLayer.addChild(assignmentLabel1) 
backgroundLayer.addChild(assignmentLabel2)
backgroundLayer.addChild(assignmentLabel3) 
backgroundLayer.addChild(assignmentOutline)


levelButton.position.x = self.size.width/2
levelButton.position.y = 600
levelButton.zPosition = interfaceButtonsZPos
self.addChild(levelButton)




}

/*
let levelStuff = SKNode.unarchiveFromFile("GameScene")!
self.addChild(levelStuff)
*/


if GameState.sharedInstance.oneBlock == 1 {
            
            GameState.sharedInstance.oneTime60 = 10
            
        }
        
        if GameState.sharedInstance.oneBlock == 3 {
            
            GameState.sharedInstance.oneTime180 = 10
            
        }
        
        
        if GameState.sharedInstance.oneBlock == 4 {
            
            GameState.sharedInstance.oneTime300 = 10
            
        }
        
        if GameState.sharedInstance.oneBlock == 5 {
            
            GameState.sharedInstance.oneTime600 = 10
            
        }
        
        if GameState.sharedInstance.oneBlock == 6 {
            
            GameState.sharedInstance.oneTime600b = 10
            
        }


GameState.sharedInstance.timer1running = -1

/*
startButton.position.x = self.size.width/2
startButton.position.y = self.size.height/2
startButton.alpha = 0.5
//startButton.size.height = 120*4
//startButton.size.width = 120*4
startButton.zPosition = interfaceButtonsZPos
self.addChild(startButton)
*/



title.position.x = self.size.width/2
title.position.y = 1600
title.zPosition = interfaceButtonsZPos
self.addChild(title)


tapToPlay.position.x = self.size.width/2
tapToPlay.position.y = title.position.y - title.size.height/2 - 150
tapToPlay.alpha = 1
//tapToPlay.size.height = 120*4
//tapToPlay.size.width = 120*4
tapToPlay.zPosition = interfaceButtonsZPos
self.addChild(tapToPlay)
tapToPlay.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.fadeAlphaTo(0, duration: 0.5), SKAction.fadeAlphaTo(1, duration: 0.5)])))



setupScene()

   //    self.backgroundColor = UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0) //UIColor(red: 122/255, green: 164/255, blue: 210/255, alpha: 1.0)//UIColor(red: 122/255, green: 164/255, blue: 177/255, alpha: 1.0)  //SKColor.whiteColor() //UIColor(red: 135/255, green: 206/255, blue: 250/255, alpha: 1.0)  //Put back?


}

func setupScene() {


    scorescreen.removeFromParent()

if replay == true { // put back so won't load when game first starts. but is causing exc_bad_access error?

//checkcompleteAssignmentBlockOne()

}

print("GameState.sharedInstance.runBlockUpdate at top of setupScene: \(GameState.sharedInstance.runBlockUpdate) replay at top of setupScene: \(replay)")

//if GameState.sharedInstance.runBlockUpdate == 0 || replay == false { 

GameState.sharedInstance.score = 0





levelSelectOn = false

print("run setupScene")

print("noOfCars: \(noOfCars)")
//gameVCDelegate!.setMultiButtonHidden(false) //put back
castleType = GameState.sharedInstance.loadLevel //Int(CGFloat.random(min: 0, max: 2))

if castleType == 1 {
jumpMax = 0.3
jumpYX = 107.27/2
jumpYY = 2.68127*jumpYX



jumpMX = (493 - jumpYX)/jumpMax //slow: (493 - jumpYX)/jumpMax //fast: (739.57 - jumpYX)/jumpMax
jumpMY = (1362.728 - jumpYY)/jumpMax //(1362.728 - jumpYY)/jumpMax
}




if GameState.sharedInstance.timer1running == 1 {

backgroundLayer.addChild(stopwatchLabel1)
self.addChild(timerLabel1)

} else {

time1 = 60 
run1 = 1


}

stopwatchicon1.position.y = 5000







wait = SKAction.waitForDuration(1.0)


if noOfCars == 1 {

   notificationBox.removeFromParent() 
    
self.addChild(notificationBox)

}

touchontimer = 0


if self.view!.bounds.size.width == 768 {

rightEdge = 768*2 
leftEdge = 0

} else {

rightEdge = 768*2 - (self.view!.bounds.size.width)/2
leftEdge = self.view!.bounds.size.width/2



}

    
    castlemoves = []

    if enterCastle == 0 && castleType == 0 {
backgroundLayer.addChild(exteriorWall)

}

frontjaggedypos = 0
setCastleDistance = 0
setCastle = 0
firstBarrierXPos = 0
multTimerOn = 1
floorSpikeCycle = 0
introCastle = 0
ranAchievementWall = 0
lastMoveWallXPos = 0
slideWallsCastle = 0
lastBackArcXPos = 0
noRoofABegin = 0
noRoofAEnd = 0


    /* Setup your scene here */
    //   println("\(self.size.width) \(self.size.width/7)")
    // *** // *** // *** // 10-2-15 print("MaxY: \(platform11.position))")
    /*   let maxAspectRatio:CGFloat = 16.0/9.0
    let playableHeight = size.width / maxAspectRatio
    let playableMargin = (size.height - playableHeight)/2.0 */
    
    
    /*for fallthrough test
    
    bird2.runAction(SKAction.moveToX(3570, duration: 5))
    */
    
    // RESET HIGH SCORE:    GameState.sharedInstance.highScore = 0
    
    
    
    
    //reset initial values on transitionToGame():



    




backwallCounter = 0
gpaused = true
makemsgxpos1 = 0
makemsgxpos2 = 0
makemsgxpos3 = 0

makemsgcharge1 = 0
makemsgcharge2 = 0 
makemsgcharge3 = 0

makemsgcyclepos1 = 0
makemsgcyclepos2 = 0
makemsgcyclepos3 = 0

sharedScore = 0



     //   scorescreen.size.width = 800
      //  scorescreen.size.height = 1500
// backjaggedypos = 250
 //   frontjaggedypos = 125

overlay.size.width = self.size.width
overlay.size.height = 400
overlay.position.x = self.size.width/2
overlay.position.y = 400
overlay.zPosition = 4.5
//self.addChild(overlay) 

lastHillsPos = 0
lastMtnPos = -700
    alternateMountains = 1
resetFrontCastle = 0
    
floorCycle = 0
floorPos = 0

    floorPos2 = 0
floorPos3 = 0

floorLead = 2200
wallfriction = 1.0
ppw = 95
selfReplay = 0
opponentReplay = 0
   timerOnLocal = false
otherPlayerGameOver = false
selfGameOver = false
otherPlayerScore = 0
        touchongc = 0
touchonlevel = 0
touchonmult = 0
        touchonmm = 0
    
        self.physicsWorld.speed = physicsSpeed  
        self.speed = 1
        
        // *** // *** // 10-2-15 print("isplayer1: \(isPlayer1)")
        
    self.view!.multipleTouchEnabled = false
    
    bird2 = SKSpriteNode(texture: SKTexture(imageNamed: "PhysicsTest")) // "transparent" removed for debug. put back
    
    if GameState.sharedInstance.highScore >= 5 {
    
    
    if GameState.sharedInstance.firstCoinRound > 3 {
    
    firstCoin = 0 //CGFloat.random(min: 0, max: 1) // PUT BACK
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
    
    
    // *** // *** // *** // 10-2-15 print("firstCoin: \(firstCoin)")
    
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
    bird2x =  30 // reset, now much shorter, see note in gamescene initializing area // 1850 // all that follows is for bird2 in backgroundLayer, not self: 1850 // 2250 for 1600 make3 // 2050//1850 for fast start with make3size = 1300 //1500 //for opening walls test: 2300//was 1500 for normal//890 for most tests //800 for some older tests maybe // for reverse slip test: 1500 //800
newbird2x = -132//-1000
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
    lowestplatformpos = -324 // -624
    highestplatformpos = 200 // 8
    platformyinc = 250 // the maximum y position above the current platform that the next platform will be
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
    
    
    
    
    
    swmaxy = 1700 //1750// was CGFloat // was 1848 // highest height the bottom of vplatform goes (not including spike)
    swminy = 915 //was 700 when groundpos was 30 CGFloat
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
    lastclosepos = 4
    endpos = -1
    platformcount = 0
chaincount = 0
    platformMinNA = 230 //330 // was 1 for testing//was 340, raised for testing
    platformMaxNA = 580 //380 // was 370, // was 600 for testing// raised for testing
    closegaptime = 4 // put back 7 // was 7
    
    fall2time = 0.5 // was 0.5 // was 0.25
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

difPer = 0.75// 0.75 //0.8 //put back

difMaxPos = 0
difMinPos = 0


        difMaxPos1200 = 390 //350
        difMinPos1200 = 320 //300 // revised 10-26, was 290, but hit vplatform after setting swgap to 325 from 350 //320
        
        difMaxPos1350 = 420 //400
        difMinPos1350 = 350 // revised 10-26, was 330, but hit vplatform after setting swgap to 325 from 350// 320 //350
        
        difMaxPos1500 = 420 //420
        difMinPos1500 = 367 // revised 10-26, was 70, but hit vplatform after setting swgap to 325 from 350// revised 10-26, was 360 //390



    
    
    
    
    
    
    gpaused = true // was false PUT BACK
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
    
chaincycle = 1
    cycle = -1
    xcycle = -1
    
    dartarraypos = 0
    spikearraypos = 0
sawarraypos = 0
frontjaggedarraypos = 0
backjaggedarraypos = 0
roofwallarraypos = 0
    
    
    //  flytextu: SKTexture = SKTexture(imageNamed: "JumpBirdU")
    //   flytext: SKTexture = SKTexture(imageNamed: "JumpBird")
    
flagtexture = [flag1, flag2, flag3, flag4, flag5, flag6, flag7, flag8, flag9, flag10, flag11, flag12, flag13, flag14, flag15, flag16, flag17, flag18, flag19, flag20]

flagtexture2 = [flag21, flag22, flag23, flag24, flag25, flag26, flag27, flag28, flag29, flag210]
tailtexture = [tail1, tail2, tail3, tail4, tail5, tail6, tail7, tail8, tail9, tail10]
tailtexture2 = [smalltail1, smalltail2, smalltail3, smalltail4, smalltail5, smalltail6]
    righttexture = []
    lefttexture = []
    flytextureR = []
    flytextureL = []
    rightslidetexture = []
    leftslidetexture = []
    leftresttexture = []
    rightresttexture = []
deathtexture = []
    
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
    
    
    
    
    
    
    
    
    
    
    
    // end reset initial values on transitionToGame()
    
    self.size.width = 1536
    self.size.height = 2048



shakeNode = SKNode()
castleMoveNode = SKNode()
    shakeNode.zPosition = worldZPos
castleMoveNode.zPosition = backgroundLayerZPos
    addChild(shakeNode)
    shakeNode.position.x = 0
    shakeNode.position.y = 0
    
    worldNode = SKNode()
    worldNode.zPosition = worldZPos
    shakeNode.addChild(worldNode)
    worldNode.position.x = 0
    worldNode.position.y = 0

midWorldNode = SKNode()
midWorldNode.zPosition = midWorldZPos
shakeNode.addChild(midWorldNode)
midWorldNode.position.x = 0
midWorldNode.position.y = 0

distantWorldNode = SKNode()
distantWorldNode.zPosition = distantWorldZPos
shakeNode.addChild(distantWorldNode)
distantWorldNode.position.x = 0
distantWorldNode.position.y = 0




    // anchorPoint = CGPointMake(0.5,0.5)
    
   // backgroundColor = SKColor.whiteColor()
    
    // *** // *** // *** // 10-2-15 print("checkpoint round before checking for checkpoint mode: \(GameState.sharedInstance.checkpointround)")
    
    
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
    
    
    
    
    
    
    freecoins.position.x = 550
    freecoins.position.y = 100// REMOVE PUT BACK
    freecoins.zPosition = interfaceButtonsZPos
    freecoins.size.width = 100
    freecoins.size.height = 100
    freecoins.hidden = true
    self.addChild(freecoins)
    
    
    
    wipecleanbutton.position.x = 350 // REMOVE PUT BACK
    wipecleanbutton.position.y = 100
    wipecleanbutton.zPosition = interfaceButtonsZPos
    wipecleanbutton.size.width = 100
    wipecleanbutton.size.height = 100
    wipecleanbutton.hidden = true
    self.addChild(wipecleanbutton)
    



castleCeiling.position.y = self.size.height - 300
castleCeiling.size.width = 24000 //8000
castleCeiling.zPosition = floorZPos - backgroundLayerZPos

    castleCeiling.removeFromParent()



castleFloor.position.y = CGRectGetMinY(castleCeiling.frame) - 1350 - castleFloor.size.height/2// was: CGRectGetMinY(castleCeiling.frame) - 1220 - castleFloor.size.height/2 //CGRectGetMaxY(ground.frame)
castleFloor.size.width = 8000
castleFloor.zPosition = floorZPos - backgroundLayerZPos

    castleFloor.removeFromParent()

ground.size.width = 8000
    ground.size.height = 300 // was 100
    ground.position.x = size.width/2
    ground.position.y = castleFloor.position.y - ground.size.height/2 // is 245
    ground.physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: ground.size.width - 100, height: ground.size.height))
    ground.physicsBody!.dynamic = false
    ground.physicsBody!.friction = 0
    ground.physicsBody!.restitution = 0
    ground.physicsBody!.categoryBitMask = PhysicsCategory.floor
    ground.physicsBody!.contactTestBitMask = 0 // USED TO BE PhysicsCategory.bird BEFORE 9-15, BUT SEE WORD FILE "COULD NOT SLIDE ON LEFT ..."
    ground.physicsBody?.collisionBitMask = PhysicsCategory.bird
    ground.zPosition = 10
    ground.name = "floor"
    ground.removeFromParent()

  ffYPos = castleFloor.position.y - floorForbid1.size.height/2 - 10//- 20


frontWall.size.width = 8000
frontWall.size.height = 500

frontWall.position.y = CGRectGetMinY(castleFloor.frame) - frontWall.size.height/2
frontWall.zPosition = frontWallZPos




    ceiling.size.width = size.width
    ceiling.size.height = 100
  //  ceiling.position.x = size.width/2


    ceiling.position.y = castleCeiling.position.y + ceiling.size.height/2
    ceiling.physicsBody = SKPhysicsBody(rectangleOfSize:ceiling.size)
    ceiling.physicsBody!.dynamic = false
    ceiling.physicsBody!.friction = wallfriction
    ceiling.physicsBody!.restitution = 0
    ceiling.physicsBody!.categoryBitMask = PhysicsCategory.outline
    ceiling.physicsBody!.contactTestBitMask = 0
    ceiling.physicsBody?.collisionBitMask = PhysicsCategory.bird
    ceiling.zPosition = 4
    ceiling.name = "ceiling"
    ceiling.removeFromParent()
    
    
    
    
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
   // backgroundLayer.addChild(gameoverbarrier)
    
    breakwallphysicsbody.size.width = platformwidth
    
    breakwallphysicsbody.size.height = swgap + 2
    
    
    scoreLabel.text = "0"
scoreLabel.horizontalAlignmentMode = .Left
    scoreLabel.position.x = leftEdge + 30
    scoreLabel.position.y = self.size.height - 60
    scoreLabel.fontSize = 70
scoreLabel.zPosition = interfaceButtonsZPos
    scoreLabel.fontColor = SKColor.blackColor()
    addChild(scoreLabel)
    
    
    miniCoinLabel1.text = "+1"
    miniCoinLabel1.fontColor = UIColor(red: 245/255, green: 236/255, blue: 149/255, alpha: 1.0)// SKColor.orangeColor()// //UIColor(red: 240/255, green: 245/255, blue: 5/255, alpha: 1.0) //SKColor.yellowColor()
   // miniCoinLabel1.color = UIColor(red: 245, green: 236, blue: 149, alpha: 1.0) //SKColor.orangeColor()//UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0) //SKColor.blackColor()
    miniCoinLabel1.blendMode = SKBlendMode.Alpha
    miniCoinLabel1.colorBlendFactor = 0
    miniCoinLabel1.fontSize = 40
    miniCoinLabel1.name = "miniCoinLabel"
    miniCoinLabel1.zPosition = 6
    miniCoinLabel1.zRotation = 3.14159/8
    
    miniCoinLabel2.text = "+1"
miniCoinLabel2.fontColor = UIColor(red: 245/255, green: 236/255, blue: 149/255, alpha: 1.0)//SKColor.orangeColor()// //UIColor(red: 240/255, green: 245/255, blue: 5/255, alpha: 1.0) //SKColor.yellowColor()
//miniCoinLabel2.color = UIColor(red: 245, green: 236, blue: 149, alpha: 1.0)//SKColor.orangeColor()//UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0) //SKColor.blackColor()
    miniCoinLabel2.blendMode = SKBlendMode.Alpha
    miniCoinLabel2.colorBlendFactor = 0
    miniCoinLabel2.fontSize = 40
    miniCoinLabel2.name = "miniCoinLabel"
    miniCoinLabel2.zPosition = 6
    miniCoinLabel2.zRotation = 3.14159/8
    
    miniCoinLabel3.text = "+1"
miniCoinLabel3.fontColor = UIColor(red: 245/255, green: 236/255, blue: 149/255, alpha: 1.0)//SKColor.orangeColor()// //UIColor(red: 240/255, green: 245/255, blue: 5/255, alpha: 1.0) //SKColor.yellowColor()
//miniCoinLabel3.color = UIColor(red: 245, green: 236, blue: 149, alpha: 1.0)//SKColor.orangeColor()//UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0) //SKColor.blackColor()
    miniCoinLabel3.blendMode = SKBlendMode.Alpha
        miniCoinLabel3.colorBlendFactor = 0
        miniCoinLabel3.fontSize = 40
        miniCoinLabel3.name = "miniCoinLabel"
        miniCoinLabel3.zPosition = 6
        miniCoinLabel3.zRotation = 3.14159/8
        
        
    
    minicycle = 0
    
    coinLabel.text = "\(GameState.sharedInstance.coins)"
    coinLabel.horizontalAlignmentMode = .Left
    coinLabel.position.x = leftEdge + 30
    coinLabel.position.y = scoreLabel.position.y - 200
    coinLabel.zPosition = interfaceButtonsZPos
    coinLabel.fontColor = UIColor(red: 245/255, green: 236/255, blue: 149/255, alpha: 1.0)
    coinLabel.fontSize = 70
    addChild(coinLabel)


if GameState.sharedInstance.timer1running == 1 {
timerLabel1.position.x = coinLabel.position.x
}

    backgroundLayer.zPosition = backgroundLayerZPos
        backgroundLayer.name = "backgroundLayer"
    worldNode.addChild(backgroundLayer)
worldNode.addChild(castleMoveNode)


    
    highScoreLabel.text = "\(GameState.sharedInstance.highScore)"
highScoreLabel.horizontalAlignmentMode = .Left
    highScoreLabel.position.x = leftEdge + 30
    highScoreLabel.position.y = scoreLabel.position.y - 100
    highScoreLabel.fontColor = SKColor.blackColor()
    highScoreLabel.fontSize = 70
highScoreLabel.zPosition = interfaceButtonsZPos
    addChild(highScoreLabel) //PUT BACK but might be a problem with adding it twice
    
    beginLabel = SKLabelNode(text: "Begin Game")
    
    topfloor = CGRectGetMaxY(ground.frame)
    

    
    effectNode.shouldEnableEffects = true
gfilter!.setValue(blurAmount, forKey: kCIInputRadiusKey)
effectNode.filter = gfilter
effectNode.position = self.view!.center
effectNode.blendMode = .Alpha



    

let sky = SKSpriteNode(imageNamed: "Sky")
sky.position.x = self.size.width/2
sky.position.y = self.size.height/2
sky.size.height = self.size.height + 100
sky.size.width = self.size.width + 100
sky.name = "sky"
sky.zPosition = skyZPos
sky.hidden = false
self.addChild(sky)


//skyTop.position.x = self.size.width/2
skyTop.size.height = 200
skyTop.position.y = self.size.height - skyTop.size.height/2
//skyTop.size.height = self.size.height + 100
skyTop.size.width = 24000 //self.size.width + 100
skyTop.name = "skyTop"
skyTop.zPosition = platformSlotZPos + backgroundLayerZPos
skyTop.hidden = false
self.addChild(skyTop)



        
    let sun = SKSpriteNode(imageNamed: "Backgrounds17")
    sun.position.x = 1300
    sun.position.y = 1600
    sun.name = "sun"
    sun.size = CGSize(width: sun.size.width, height: sun.size.height)
    sun.zPosition = sunZPos
    sun.hidden = false
    self.addChild(sun)



if castleType == 0 {
 // hills
//hills1.anchorPoint.x = 0
//hills1.anchorPoint.y = 0
print("hills1: \(hills1)")
print("hills1.name: \(hills1.name)")
print("hills1.size: \(hills1.size)")
    hills1.name = "hills11"
    hills1.zPosition = hillsZPos
    print("hills1.name: \(hills1.name)")
    print("hills1.parent: \(hills1.parent)")
hills1.size = CGSize(width: 3891*0.7, height: 1870*0.7)
hills1.position.x = hills1.size.width/2 - 300
hills1.position.y = CGRectGetMaxY(castleFloor.frame) - 370 // - 50//+ hills1.size.height/2

hills1.hidden = false
midWorldNode.addChild(hills1)


hills3.anchorPoint.x = 0
hills3.anchorPoint.y = 0
hills3.position.x = -30
 //   hills3.size = CGSize(width: hills2.size.width, height: hills2.size.height)
hills3.position.y = CGRectGetMaxY(castleFloor.frame) - 300 // - 50//+ hills3.size.height/2
hills3.name = "hills31"

hills3.zPosition = hillsZPos
hills3.hidden = false
midWorldNode.addChild(hills3)


lastHillsPos = hills1.position.x

hills2.anchorPoint.x = 0
hills2.anchorPoint.y = 0
hills2.position.x = lastHillsPos + hills2.size.width + 700
 //   hills2.size = CGSize(width: hills2.size.width, height: hills2.size.height)
hills2.position.y = CGRectGetMaxY(castleFloor.frame) - 50//+ hills2.size.height/2
hills2.name = "hills21"

hills2.zPosition = hillsZPos
hills2.hidden = false
midWorldNode.addChild(hills2)





    
//Mountains:
print("iceMountain1: \(iceMountain1)")
print("iceMountain1.size: \(iceMountain1.size)")
iceMountain1.size = CGSize(width: iceMountain1.size.width, height: iceMountain1.size.height)
iceMountain1.position.x = lastMtnPos + 800
iceMountain1.position.y = 600//CGFloat.random(min: -100, max: 250)
iceMountain1.name = "iceMountain12"

iceMountain1.zPosition = closeMountainsZPos
iceMountain1.hidden = false
distantWorldNode.addChild(iceMountain1)

lastMtnPos = iceMountain1.position.x


iceMountain2.position.x = lastMtnPos + 360
iceMountain2.position.y = 700//CGFloat.random(min: -100, max: 250)
iceMountain2.name = "iceMountain22"
iceMountain2.size = CGSize(width: iceMountain2.size.width, height: iceMountain2.size.height)
iceMountain2.zPosition = mountainsZPos
iceMountain2.hidden = false
distantWorldNode.addChild(iceMountain2)

lastMtnPos = iceMountain2.position.x


iceMountain4.position.x = lastMtnPos + 450
iceMountain4.position.y = 600//CGFloat.random(min: -100, max: 250)
iceMountain4.name = "iceMountain42"
iceMountain4.size = CGSize(width: iceMountain4.size.width, height: iceMountain4.size.height)
iceMountain4.zPosition = closeMountainsZPos
iceMountain4.hidden = false
distantWorldNode.addChild(iceMountain4)


iceMountain3.position.x = lastMtnPos + 925
iceMountain3.position.y = 630//CGFloat.random(min: -100, max: 250)
iceMountain3.name = "iceMountain32"
iceMountain3.size = CGSize(width: iceMountain3.size.width, height: iceMountain3.size.height)
iceMountain3.zPosition = mountainsZPos
iceMountain3.hidden = false
distantWorldNode.addChild(iceMountain3)

lastMtnPos = iceMountain3.position.x



iceMountain6.position.x = lastMtnPos + 700
iceMountain6.position.y = 580//CGFloat.random(min: -100, max: 250)
iceMountain6.name = "iceMountain62"
iceMountain6.size = CGSize(width: iceMountain6.size.width, height: iceMountain6.size.height)
iceMountain6.zPosition = mountainsZPos
iceMountain6.hidden = false
distantWorldNode.addChild(iceMountain6)

lastMtnPos = iceMountain6.position.x

iceMountain5.position.x = lastMtnPos + 400
iceMountain5.position.y = 630//CGFloat.random(min: -100, max: 250)
iceMountain5.name = "iceMountain52"
iceMountain5.size = CGSize(width: iceMountain5.size.width, height: iceMountain5.size.height)
iceMountain5.zPosition = closeMountainsZPos
iceMountain5.hidden = false
distantWorldNode.addChild(iceMountain5)

lastMtnPos = iceMountain5.position.x

iceMountain7.position.x = lastMtnPos + 450
iceMountain7.position.y = 600//CGFloat.random(min: -100, max: 250)
iceMountain7.name = "iceMountain72"
iceMountain7.size = CGSize(width: iceMountain7.size.width, height: iceMountain7.size.height)
iceMountain7.zPosition = mountainsZPos
iceMountain7.hidden = false
distantWorldNode.addChild(iceMountain7)

lastMtnPos = iceMountain7.position.x

iceMountain8.position.x = lastMtnPos + 450
iceMountain8.position.y = 600//CGFloat.random(min: -100, max: 250)
iceMountain8.name = "iceMountain82"
iceMountain8.size = CGSize(width: iceMountain8.size.width, height: iceMountain8.size.height)
iceMountain8.zPosition = mountainsZPos
iceMountain8.hidden = false
distantWorldNode.addChild(iceMountain8)

lastMtnPos = iceMountain8.position.x


iceMountain9.position.x = lastMtnPos + 450
iceMountain9.position.y = 750//CGFloat.random(min: -100, max: 250)
iceMountain9.name = "iceMountain92"
iceMountain9.size = CGSize(width: iceMountain9.size.width, height: iceMountain9.size.height)
iceMountain9.zPosition = mountainsZPos
iceMountain9.hidden = false
distantWorldNode.addChild(iceMountain9)

lastMtnPos = iceMountain9.position.x


iceMountain10.position.x = lastMtnPos + 450
iceMountain10.position.y = 600//CGFloat.random(min: -100, max: 250)
iceMountain10.name = "iceMountain102"
iceMountain10.size = CGSize(width: iceMountain10.size.width, height: iceMountain10.size.height)
iceMountain10.zPosition = mountainsZPos
iceMountain10.hidden = false
distantWorldNode.addChild(iceMountain10)

lastMtnPos = iceMountain10.position.x

iceMountain11.position.x = lastMtnPos + 450
iceMountain11.position.y = 576//CGFloat.random(min: -100, max: 250)
iceMountain11.name = "iceMountain112"
iceMountain11.size = CGSize(width: iceMountain11.size.width, height: iceMountain11.size.height)
iceMountain11.zPosition = mountainsZPos
iceMountain11.hidden = false
distantWorldNode.addChild(iceMountain11)

lastMtnPos = iceMountain11.position.x

iceMountain12.position.x = lastMtnPos + 600
iceMountain12.position.y = 576//CGFloat.random(min: -100, max: 250)
iceMountain12.name = "iceMountain122"
iceMountain12.size = CGSize(width: iceMountain12.size.width, height: iceMountain12.size.height)
iceMountain12.zPosition = closeMountainsZPos
iceMountain12.hidden = false
distantWorldNode.addChild(iceMountain12)

lastMtnPos = iceMountain12.position.x

iceMountain13.position.x = lastMtnPos + 950
iceMountain13.position.y = 576//CGFloat.random(min: -100, max: 250)
iceMountain13.name = "iceMountain132"
iceMountain13.size = CGSize(width: iceMountain13.size.width, height: iceMountain13.size.height)
iceMountain13.zPosition = mountainsZPos
iceMountain13.hidden = false
distantWorldNode.addChild(iceMountain13)

lastMtnPos = iceMountain13.position.x

iceMountain14.position.x = lastMtnPos + 1100
iceMountain14.position.y = 576//CGFloat.random(min: -100, max: 250)
iceMountain14.name = "iceMountain142"
iceMountain14.size = CGSize(width: iceMountain14.size.width, height: iceMountain14.size.height)
iceMountain14.zPosition = mountainsZPos
iceMountain14.hidden = false
distantWorldNode.addChild(iceMountain14)

lastMtnPos = iceMountain14.position.x

iceMountain15.position.x = lastMtnPos + 900
iceMountain15.position.y = 576//CGFloat.random(min: -100, max: 250)
iceMountain15.name = "iceMountain152"
iceMountain15.size = CGSize(width: iceMountain15.size.width, height: iceMountain15.size.height)
iceMountain15.zPosition = closeMountainsZPos
iceMountain15.hidden = false
distantWorldNode.addChild(iceMountain15)

lastMtnPos = iceMountain15.position.x

iceMountain16.position.x = lastMtnPos + 750
iceMountain16.position.y = 576//CGFloat.random(min: -100, max: 250)
iceMountain16.name = "iceMountain162"
iceMountain16.size = CGSize(width: iceMountain16.size.width, height: iceMountain16.size.height)
iceMountain16.zPosition = closeMountainsZPos
iceMountain16.hidden = false
distantWorldNode.addChild(iceMountain16)

lastMtnPos = iceMountain16.position.x

iceMountain17.position.x = lastMtnPos + 450
iceMountain17.position.y = 576//CGFloat.random(min: -100, max: 250)
iceMountain17.name = "iceMountain172"
iceMountain17.size = CGSize(width: iceMountain17.size.width, height: iceMountain17.size.height)
iceMountain17.zPosition = mountainsZPos
iceMountain17.hidden = false
distantWorldNode.addChild(iceMountain17)

lastMtnPos = iceMountain17.position.x



closeTree8.position.x = 6700
closeTree8.size.height = 1091.94*0.6
closeTree8.size.width = 700*0.6
closeTree8.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree8.size.height/2 - 100
closeTree8.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree8)

closeTree7.position.x = 7400
closeTree7.size.height = 1091.94*0.6
closeTree7.size.width = 700*0.6
closeTree7.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree7.size.height/2 - 100
closeTree7.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree7)

closeTree2.position.x = 8000
closeTree2.size.height = 1091.94*0.6
closeTree2.size.width = 700*0.6
closeTree2.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree2.size.height/2 - 100
closeTree2.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree2)

closeTree3.position.x = 8700
closeTree3.size.height = 1091.94*0.6
closeTree3.size.width = 700*0.6
closeTree3.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree3.size.height/2 - 100
closeTree3.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree3)


closeTree4.position.x = 9400
closeTree4.size.height = 1091.94*0.6
closeTree4.size.width = 700*0.6
closeTree4.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree4.size.height/2 - 100
closeTree4.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree4)

closeTree5.position.x = 10100
closeTree5.size.height = 1091.94*0.6
closeTree5.size.width = 700*0.6
closeTree5.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree5.size.height/2 - 100
closeTree5.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree5)

closeTree6.position.x = 10800
closeTree6.size.height = 1091.94*0.6
closeTree6.size.width = 700*0.6
closeTree6.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree6.size.height/2 - 100
closeTree6.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree6)

 //   }
    

 /* 
    if alternateMountains > 0 {
        
iceMountain1.zPosition = closeMountainsZPos
        
    } else {
        
        iceMountain1.zPosition = mountainsZPos
        
    }
    
    alternateMountains = -1*alternateMountains

*/
/*    if i == 1 {
        let background = SKSpriteNode(imageNamed: "BackgroundMtns") // "background" BackgroundMtns
        background.anchorPoint.x = 0
        background.anchorPoint.y = 0
        background.position.x = 300//CGFloat(i)*background.size.width
        background.position.y = 700
        background.name = "background2"
        background.size = CGSize(width: background.size.width, height: background.size.height)
        background.zPosition = mountainsZPos
        background.hidden = false
        distantWorldNode.addChild(background)
    } */
    }




if castleType == 1 {





mainRollingHills1.size.width = 6719*0.6
mainRollingHills1.size.height = 1129*0.6
mainRollingHills1.position.x = 0 + mainRollingHills1.size.width/2
mainRollingHills1.position.y = 600
mainRollingHills1.zPosition = 0
distantWorldNode.addChild(mainRollingHills1)

mainRollingHills2.size.width = 6881*0.6
mainRollingHills2.size.height = 1132*0.6
mainRollingHills2.position.x = CGRectGetMaxX(mainRollingHills1.frame) + mainRollingHills2.size.width/2 - 600//- 1100
mainRollingHills2.position.y = 600
mainRollingHills2.zPosition = -0.1
distantWorldNode.addChild(mainRollingHills2)


lightHill1.position.x = 0
lightHill1.position.y = 475//CGFloat.random(min: -100, max: 250)
lightHill1.name = "lightHill"
lightHill1.zPosition = 0.4
lightHill1.size = CGSize(width: 1177*1.4, height: 366*1.4)
    
   distantWorldNode.addChild(lightHill1)



lightHill2.position.x = 1100
lightHill2.position.y = 230//CGFloat.random(min: -100, max: 250)
lightHill2.name = "lightHill"
lightHill2.zPosition = 0.3
lightHill2.size = CGSize(width: 1177*1.5, height: 366*1.5)
    
  
    

distantWorldNode.addChild(lightHill2)


//make repeatable.



/*
darkHill1.position.x = 1000
darkHill1.position.y = 600//CGFloat.random(min: -100, max: 250)
darkHill1.name = "darkHill"
darkHill1.zPosition = 0.5
//darkHill1.size = CGSize(width: darkHill1.size.width, height: darkHill1.size.height)
    

distantWorldNode.addChild(darkHill1)






darkHill2.position.x = 500
darkHill2.position.y = 1400//CGFloat.random(min: -100, max: 250)
darkHill2.name = "darkHill"
darkHill2.zPosition = 0.2

//darkHill2.size = CGSize(width: darkHill2.size.width, height: darkHill2.size.height)
    

distantWorldNode.addChild(darkHill2)





lightHill3.position.x = 900
lightHill3.position.y = 1400//CGFloat.random(min: -100, max: 250)
lightHill3.name = "lightHill"
lightHill3.zPosition = 0.1
//lightHill3.size = CGSize(width: lightHill3.size.width, height: lightHill3.size.height)
    

distantWorldNode.addChild(lightHill3)


*/



}
   
    
for i in 0...2 { // clouds
let background = SKSpriteNode(imageNamed: "Backgrounds16") // "background"
background.anchorPoint.x = 0
background.anchorPoint.y = 0
background.position.x = background.size.width*CGFloat(i)
background.position.y = 700
background.name = "background3"
background.size = CGSize(width: background.size.width, height: background.size.height)
background.zPosition = distantCloudZPos
background.hidden = false
   // background.color = UIColor(red: 79/255, green: 102/255, blue: 106/255, alpha: 1.0) 
   // background.colorBlendFactor = 0.7
distantWorldNode.addChild(background)

    background.runAction(SKAction.moveByX(-10000, y: 0, duration: 400))// was duration: 200 // put back, was -10000

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
    
    rightarrow.zPosition = 700
    leftarrow.zPosition = 700
    uparrow.zPosition = 700
    downarrow.zPosition = 700
    hidearrows.zPosition = 700
    
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
    pausebutton.position.x = rightEdge - pausebutton.size.width/2//self.size.width - 300//pausebutton.size.width/2 + 500
    pausebutton.position.y = self.size.height - pausebutton.size.height/2
    pausebutton.zPosition = interfaceButtonsZPos
    self.addChild(pausebutton) //some kind of problem with this, being added twice PUT BACK but fix first
    
        
        GameCenterButton.size.width = 150
        GameCenterButton.size.height = 150
        GameCenterButton.position.x = GameCenterButton.size.width/2 + 800
        GameCenterButton.position.y = self.size.height - GameCenterButton.size.height/2
        GameCenterButton.zPosition = interfaceButtonsZPos
        self.addChild(GameCenterButton)
        
        matchMakerButton.size.width = 150
        matchMakerButton.size.height = 150
        matchMakerButton.position.x = matchMakerButton.size.width/2 + 1200
        matchMakerButton.position.y = matchMakerButton.size.height/2 + 100
        matchMakerButton.zPosition = interfaceButtonsZPos
        self.addChild(matchMakerButton)
        
    
    
    CGPathMoveToPoint(trianglePath, nil, -spikewidth/2, -spikeheight/2)
    CGPathAddLineToPoint(trianglePath, nil, spikewidth/2 - 2, -spikeheight/2)
    CGPathAddLineToPoint(trianglePath, nil, 0, spikeheight/2)
    CGPathAddLineToPoint(trianglePath, nil, -spikewidth/2 + 2, -spikeheight/2)
    
    

    
    
    
  //  birdimage.texture?.filteringMode = .Nearest // removed 10-21-15
    
  //  birdimage.anchorPoint.x = 0.5
  //  birdimage.anchorPoint.y = 0.5
    
        //
    //        bird1.position = CGPoint(x: bird2x, y: bird2y + 190)
    bird2.position.x =  newbird2x//bird2x
    bird2.position.y = bird2y + 300
bird3.position.x = bird2.position.x
bird3.position.y = bird2.position.y
    bird3.zPosition = birdZPos + 9000 // remove + 9000 added for bug check. put back
    
    //CGPoint(x: bird2x, y: bird2y + 70)//(x: 0, y: size.height - 200 - 0.5*bird.size.height + 0.5*bird2.size.height - 800)
    
    //  self.convertPoint(CGPoint(x: platformst3.position.x, y: 900), fromNode: self.backgroundLayer)
    
    //        bird1.size.width = 70
    bird2.size.width = 70 //birdimage.size.width - 5 //was 70// was 130
    //        bird1.size.height = 90
    bird2.size.height = 140 //birdimage.size.height - 5// was 140 //was 140

bird3.size.width = birdimage2rightrun.size.width
bird3.size.height = birdimage2rightrun.size.height
   /* 
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
*/
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
    
    //  bird1.physicsBody!.usesPreciseCollisionDetection = true
    bird2.physicsBody!.usesPreciseCollisionDetection = true
    //     bird1.zPosition = 1000
    bird2.zPosition = birdZPos
//bird2.zPosition = bird2.zPosition - 1
    //       bird1.name = "bird1"
    bird2.name = "bird2"

    bird2.paused = false
    
  self.backgroundLayer.addChild(bird2)

tail.position.y = -45
tail.position.x = -180
tail.zPosition = 0.1
//bird2.addChild(tail)

//tail.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(tailtexture, timePerFrame: 0.1)))

smalltail.size.width = 160*1.3
smalltail.size.height = 141*1.3
smalltail.position.y = -10
smalltail.position.x = -30
smalltail.zPosition = 0.1
//bird2.addChild(smalltail)

let wagtail = SKAction.animateWithTextures(tailtexture2, timePerFrame: 0.1)
let wait2 = SKAction.waitForDuration(6.0)


smalltail.runAction(SKAction.repeatActionForever(SKAction.sequence([wagtail, wait2])))

        if noOfCars > 1 {
self.backgroundLayer.addChild(bird3)


bird3.color = UIColor(red: 139/255, green: 137/255, blue: 137/255, alpha: 1.0)
bird3.colorBlendFactor = 0.7
        }
    

// assemble costume

var progress: Int = 0

if GameState.sharedInstance.costumechoice == 1 {

progress = GameState.sharedInstance.oneBlock

} else {

if GameState.sharedInstance.costumechoice == 2 {

progress = GameState.sharedInstance.twoBlock

} else {

if GameState.sharedInstance.costumechoice == 3 {

progress = GameState.sharedInstance.threeBlock

} else {

progress = 1

}}}


assembleCostume(1, costumechoice: GameState.sharedInstance.costumechoice, progress: progress) // use bird3 for setting up player 2 costume in multiplayer

birdimagerightrun.removeFromParent()
bird2.addChild(birdimagerightrun)

  
    
    
    gauge.size.width = 300
    gauge.size.height = 300


    gauge.zPosition = 5
    gauge.alpha = 0.7
 //   bird2.addChild(gauge)
    
    gauge.position.x = -2000

innerGauge.removeActionForKey("Charge")
innerGauge.setScale(1.0)
innerGauge.runAction(SKAction.scaleTo(1.0, duration: 0), withKey: "Charge")
innerGauge.size.width = 50
innerGauge.size.height = 50
innerGauge.zPosition = gaugeZPos
innerGauge.color = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0) //UIColor(red: 255/255, green: 64/255, blue: 64/255, alpha: 1.0)
innerGauge.colorBlendFactor = 0


// innerGauge.alpha = 0.7

outerGauge.removeActionForKey("Charge")
outerGauge.setScale(1.0)
outerGauge.runAction(SKAction.scaleTo(1.0, duration: 0), withKey: "Charge")
outerGauge.size.width = 80
outerGauge.size.height = 80
outerGauge.zPosition = gaugeZPos
outerGauge.color = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0) //UIColor(red: 255/255, green: 64/255, blue: 64/255, alpha: 1.0)
outerGauge.colorBlendFactor = 0

// innerGauge.alpha = 0.7







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
    
    physicsWorld.gravity = CGVector(dx: 0, dy: -12.0) // -16 // -12.0
    physicsWorld.contactDelegate = self
 //   startblock()
    
chains = [chain1, chain2, chain3, chain4, chain5, chain6, chain7, chain8, chain9, chain10, chain11, chain12]
    
    platforms = [platform1, platform2, platform3, platform4, platform5, platform6, platform7, platform8, platform9, platform10, platform11, platform12]

platformImages = [platformImage1, platformImage2, platformImage3, platformImage4, platformImage5, platformImage6, platformImage7, platformImage8, platformImage9, platformImage10, platformImage11, platformImage12]

platformSlots = [platformSlot1, platformSlot2, platformSlot3, platformSlot4, platformSlot5, platformSlot6, platformSlot7, platformSlot8, platformSlot9, platformSlot10, platformSlot11, platformSlot12]

vplatformSlots = [vplatformSlot1, vplatformSlot2, vplatformSlot3, vplatformSlot4, vplatformSlot5, vplatformSlot6, vplatformSlot7, vplatformSlot8, vplatformSlot9, vplatformSlot10, vplatformSlot11, vplatformSlot12]
    
    coins = [coin1, coin2, coin3, coin4, coin5, coin6, coin7, coin8, coin9, coin10, coin11, coin12]
    
    coins2 = [coin21, coin22, coin23, coin24, coin25, coin26, coin27, coin28, coin29, coin210, coin211, coin212]
    
    coins3 = [coin31, coin32, coin33, coin34, coin35, coin36, coin37, coin38, coin39, coin310, coin311, coin312]
    
    minicoinlabels = [miniCoinLabel1, miniCoinLabel2, miniCoinLabel3]
    
    breakwalls = [self.breakwall1, self.breakwall2, self.breakwall3, self.breakwall4, self.breakwall5, self.breakwall6, self.breakwall7, self.breakwall8, self.breakwall9, self.breakwall10, self.breakwall11, self.breakwall12]
    
    xplatforms = [self.xplatform1, self.xplatform2, self.xplatform3, self.xplatform4, self.xplatform5]
    
    vplatforms = [self.vplatform1, self.vplatform2, self.vplatform3, self.vplatform4, self.vplatform5, self.vplatform6, self.vplatform7, self.vplatform8, self.vplatform9, self.vplatform10, self.vplatform11, self.vplatform12]
    
    xvplatforms = [self.xvplatform1, self.xvplatform2, self.xvplatform3, self.xvplatform4, self.xvplatform5]


saws = [saw1, saw2, saw3, saw4, saw5, saw6, saw7, saw8, saw9, saw10, saw11, saw12, saw13, saw14, saw15, saw16, saw17, saw18, saw19, saw20, saw21, saw22, saw23, saw24, saw25, saw26, saw27, saw28, saw29, saw30, saw31, saw32, saw33, saw34, saw35, saw36, saw37, saw38, saw39, saw40, saw41, saw42]
    
    spikes = [self.spikespr1, self.spikespr2, self.spikespr3, self.spikespr4, self.spikespr5, self.spikespr6, self.spikespr7, self.spikespr8, self.spikespr9, self.spikespr10, self.spikespr11, self.spikespr12, self.spikespr13, self.spikespr14, self.spikespr15, self.spikespr16, self.spikespr17, self.spikespr18, self.spikespr19, self.spikespr20, self.spikespr21, self.spikespr22, self.spikespr23, self.spikespr24, self.spikespr25, self.spikespr26, self.spikespr27, self.spikespr28, self.spikespr29, self.spikespr30, self.spikespr31, self.spikespr32, self.spikespr33, self.spikespr34, self.spikespr35, self.spikespr36, self.spikespr37, self.spikespr38, self.spikespr39, self.spikespr40, self.spikespr41, self.spikespr42]

frontjaggeds = [self.frontjagged1, self.frontjagged2, self.frontjagged3, self.frontjagged4, self.frontjagged5, self.frontjagged6, self.frontjagged7, self.frontjagged8, self.frontjagged9, self.frontjagged10, self.frontjagged11, self.frontjagged12, self.frontjagged13, self.frontjagged14, self.frontjagged15, self.frontjagged16, self.frontjagged17, self.frontjagged18, self.frontjagged19, self.frontjagged20, self.frontjagged21, self.frontjagged22]

backjaggeds = [self.backjagged1, self.backjagged2, self.backjagged3, self.backjagged4, self.backjagged5, self.backjagged6, self.backjagged7, self.backjagged8, self.backjagged9, self.backjagged10, self.backjagged11, self.backjagged12, self.backjagged13, self.backjagged14, self.backjagged15, self.backjagged16, self.backjagged17, self.backjagged18, self.backjagged19, self.backjagged20, self.backjagged21, self.backjagged22]

roofwalls = [self.roofwall1, self.roofwall2, self.roofwall3, self.roofwall4, self.roofwall5, self.roofwall6, self.roofwall7, self.roofwall8, self.roofwall9, self.roofwall10, self.roofwall11, self.roofwall12, self.roofwall13, self.roofwall14, self.roofwall15, self.roofwall16, self.roofwall17, self.roofwall18, self.roofwall19, self.roofwall20]
    
    darts = [self.dartsspr1, self.dartsspr2, self.dartsspr3, self.dartsspr4, self.dartsspr5, self.dartsspr6, self.dartsspr7, self.dartsspr8, self.dartsspr9, self.dartsspr10, self.dartsspr11, self.dartsspr12, self.dartsspr13, self.dartsspr14, self.dartsspr15, self.dartsspr16, self.dartsspr17, self.dartsspr18, self.dartsspr19, self.dartsspr20, self.dartsspr21, self.dartsspr22, self.dartsspr23, self.dartsspr24, self.dartsspr25, self.dartsspr26, self.dartsspr27, self.dartsspr28, self.dartsspr29, self.dartsspr30]
    
    dartducts = [self.dartduct1, self.dartduct2, self.dartduct3, self.dartduct4, self.dartduct5, self.dartduct6, self.dartduct7, self.dartduct8, self.dartduct9, self.dartduct10, self.dartduct11, self.dartduct12, self.dartduct13, self.dartduct14, self.dartduct15, self.dartduct16, self.dartduct17, self.dartduct18, self.dartduct19, self.dartduct20, self.dartduct21, self.dartduct22, self.dartduct23, self.dartduct24, self.dartduct25, self.dartduct26, self.dartduct27, self.dartduct28, self.dartduct29, self.dartduct30]
    
    dartcatchers = [self.dartcatcher1, self.dartcatcher2, self.dartcatcher3, self.dartcatcher4]
    
    trees = [self.tree1, self.tree2, self.tree3, self.tree4]

floorForbids = [self.floorForbid1, self.floorForbid2, self.floorForbid3, self.floorForbid4, self.floorForbid5, self.floorForbid6, self.floorForbid7, self.floorForbid8, self.floorForbid9, self.floorForbid10, self.floorForbid11, self.floorForbid12]

spikeSlots = [spikeSlot1, spikeSlot2, spikeSlot3]

backSpikeSlots = [backSpikeSlot1, backSpikeSlot2, backSpikeSlot3]

floorSpikes = [floorSpike1, floorSpike2, floorSpike3]


roofwall = roofwalls[self.roofwallarraypos]


        
    cleanupbarrier.size.height = 3000
cleanupbarrier.size.width = 50
        cleanupbarrier.position.x = -1500
        cleanupbarrier.position.y = self.size.height/2
        cleanupbarrier.physicsBody = SKPhysicsBody(rectangleOfSize: cleanupbarrier.size)
        cleanupbarrier.physicsBody!.categoryBitMask = PhysicsCategory.cleanup
        cleanupbarrier.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.dart | PhysicsCategory.coin | PhysicsCategory.slidespike | PhysicsCategory.vplatform | PhysicsCategory.danger
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
    replaybutton.position.x = 0-pausescreen.size.width/2 - 400
    //replaybutton.position.x += replaybutton.size.width/2
   // replaybutton.position.x += 50
    
    replaybutton.position.y = 0//-pausescreen.size.height/2
//    replaybutton.position.y += replaybutton.size.height/2
//    replaybutton.position.y += 50
//    replaybutton.zPosition = pauseScreenButtonZPos // was 0 but was not showing up after ios9
    
    replaybutton.removeFromParent()
    pausescreen.addChild(replaybutton) //PUT BACK 



//exitButton2.size.width = exitButton2width
 //   exitButton2.size.height = exitButton2height
    exitButton2.position.x = 300
    exitButton2.position.y = 200
exitButton2.removeFromParent()
pausescreen.addChild(exitButton2)
   
    storebutton.size.width = 150
    storebutton.size.height = 150
    storebutton.position.x = pausescreen.size.width/2 - storebutton.size.width/2 - 50
    storebutton.position.y = 10000
    storebutton.zPosition = pauseScreenButtonZPos // ios9 problem, was 0
storebutton.removeFromParent()
  //  pausescreen.addChild(storebutton)
    
    backbuttonpause.size.width = 150
    backbuttonpause.size.height = 150
    backbuttonpause.position.x = pausescreen.size.width/2 - backbuttonpause.size.width/2 - 50
    backbuttonpause.position.y = -300
    backbuttonpause.zPosition = pauseScreenButtonZPos
backbuttonpause.removeFromParent()
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
    oneCoinUpgButton.zPosition = storeScreenButtonZPos
oneCoinUpgButton.removeFromParent()
    storescreen.addChild(oneCoinUpgButton)
    
    scrambledCheckpointButton.size.width = 100
    scrambledCheckpointButton.size.height = 100
    scrambledCheckpointButton.position.x = -200
    scrambledCheckpointButton.position.y = storescreen.size.height/2 - scrambledCheckpointButton.size.height/2 - 2*100 - 80 - 2*multbutton.size.height
    scrambledCheckpointButton.zPosition = storeScreenButtonZPos
scrambledCheckpointButton.removeFromParent()
    storescreen.addChild(scrambledCheckpointButton)
    
    buyCheckpointButton.size.width = 150
    buyCheckpointButton.size.height = 100
    buyCheckpointButton.position.x = 200
    buyCheckpointButton.position.y = storescreen.size.height/2 - buyCheckpointButton.size.height/2 - 2*100 - 80 - 2*multbutton.size.height
    buyCheckpointButton.zPosition = storeScreenButtonZPos
buyCheckpointButton.removeFromParent()
buyCheckpointButton.color = UIColor(red: 50/255, green: 205/255, blue: 50/255, alpha: 1.0)
buyCheckpointButton.colorBlendFactor = 0.7    
storescreen.addChild(buyCheckpointButton)

buyLabel1.removeFromParent()
 buyLabel1.position.x = 0
    buyLabel1.position.y = -20
    buyLabel1.fontColor = SKColor.whiteColor()
buyLabel1.text = "BUY"
buyLabel1.zPosition = 1
buyLabel1.fontSize = 50
buyCheckpointButton.addChild(buyLabel1)
    
    
    
    
    buyOneCoinUpgButton.size.width = 150
    buyOneCoinUpgButton.size.height = 100
    buyOneCoinUpgButton.position.x = 200
    buyOneCoinUpgButton.position.y = storescreen.size.height/2 - buyOneCoinUpgButton.size.height/2 - 100 - 80 - oneCoinUpgButton.size.height
    buyOneCoinUpgButton.zPosition = storeScreenButtonZPos
buyOneCoinUpgButton.removeFromParent()
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
    multbutton.zPosition = storeScreenButtonZPos
multbutton.removeFromParent()
    storescreen.addChild(multbutton)
    
    buymultbutton.size.width = 150
    buymultbutton.size.height = 100
    buymultbutton.position.x = 200
    buymultbutton.position.y = storescreen.size.height/2 - buymultbutton.size.height/2 - 3*100 - 80 - 3*multbutton.size.height
    buymultbutton.zPosition = storeScreenButtonZPos
buymultbutton.removeFromParent()
    storescreen.addChild(buymultbutton)
    
    //    individcoinupglabel.position = CGPoint(x: buyOneCoinUpgButton.position.x, y: buyOneCoinUpgButton.position.y + 50)
    //     storescreen.addChild(individcoinupglabel)
    
    secondLifeButton.size.width = 100
    secondLifeButton.size.height = 100
    secondLifeButton.position.x = -200
    secondLifeButton.position.y = storescreen.size.height/2 - secondLifeButton.size.height/2 - 4*100 - 80 - 4*multbutton.size.height
    secondLifeButton.zPosition = storeScreenButtonZPos
secondLifeButton.removeFromParent()
    storescreen.addChild(secondLifeButton)
    
    buyslbutton.size.width = 150
    buyslbutton.size.height = 100
    buyslbutton.position.x = 200
    buyslbutton.position.y = storescreen.size.height/2 - buyslbutton.size.height/2 - 4*100 - 80 - 4*multbutton.size.height
    buyslbutton.zPosition = storeScreenButtonZPos
buyslbutton.removeFromParent()
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
    backbuttonstore.zPosition = storeScreenButtonZPos
backbuttonstore.removeFromParent()
    storescreen.addChild(backbuttonstore)
    
    individcoinupglabel.position.x = buyOneCoinUpgButton.position.x - 150
    individcoinupglabel.position.y = buyOneCoinUpgButton.position.y
individcoinupglabel.zPosition = storeScreenButtonZPos
    secondlifelabel.position.x = buyslbutton.position.x - 150
    secondlifelabel.position.y = buyslbutton.position.y
secondlifelabel.zPosition = storeScreenButtonZPos
    checkpointlabel.position.x = buyCheckpointButton.position.x - 150
    checkpointlabel.position.y = buyCheckpointButton.position.y
checkpointlabel.zPosition = storeScreenButtonZPos
    allcoinmultlabel.position.x = buymultbutton.position.x - 150
    allcoinmultlabel.position.y = buymultbutton.position.y
    allcoinmultlabel.zPosition = storeScreenButtonZPos

    individcoinupglabel.removeFromParent()
secondlifelabel.removeFromParent()
checkpointlabel.removeFromParent()
allcoinmultlabel.removeFromParent()

    storescreen.addChild(individcoinupglabel)
    storescreen.addChild(secondlifelabel)
    storescreen.addChild(checkpointlabel)
    storescreen.addChild(allcoinmultlabel)
    
    updateUpgMeters()
    
    //Coinscreen buttons:
    
    yellowCoinChoice.size.height = 65
    yellowCoinChoice.size.width = 82
    blueCoinChoice.size.height = 65
    blueCoinChoice.size.width = 82
    redCoinChoice.size.height = 65
    redCoinChoice.size.width = 82
    yellowCoinChoice.position.x = -100
    yellowCoinChoice.position.y = 0
    blueCoinChoice.position.x = 0
    blueCoinChoice.position.y = 0
    redCoinChoice.position.x = 100
    redCoinChoice.position.y = 0
        
        yellowCoinChoice.zPosition = cCSButtonZPos
        
        redCoinChoice.zPosition = cCSButtonZPos
        
        blueCoinChoice.zPosition = cCSButtonZPos
    
    /*
    if GameState.sharedInstance.yelCoinUpg == 1 {
yellowCoinChoice.removeFromParent()
    coinchoicescreen.addChild(yellowCoinChoice)
    }
    
    if GameState.sharedInstance.bluCoinUpg == 1 {
blueCoinChoice.removeFromParent()
    coinchoicescreen.addChild(blueCoinChoice)
    }
    
    if GameState.sharedInstance.redCoinUpg == 1 {
redCoinChoice.removeFromParent()
    coinchoicescreen.addChild(redCoinChoice)
    } */
    
    backbuttoncoinscreen.size.width = 100
    backbuttoncoinscreen.size.height = 75
    backbuttoncoinscreen.position.x = 0
    backbuttoncoinscreen.position.y = -125
    backbuttoncoinscreen.zPosition = cCSButtonZPos
backbuttoncoinscreen.removeFromParent()
    coinchoicescreen.addChild(backbuttoncoinscreen)
    
    
    righttexture.append(righttext)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(righttexture, timePerFrame: 1000000)))


//birdimage.texture =  SKTexture(imageNamed: "Bird") // removed for assembling costume
birdimagerightjump.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightjump)
birdimagerightjump.anchorPoint.x = 0.5
birdimagerightjump.anchorPoint.y = 0.5
    
    /*
    let oneCoinUpgButton = SKSpriteNode(texture: SKTexture(imageNamed: "individual coin upgrade"))
    
    let singleSecondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "secondLifeButton"))
    let multbutton = SKSpriteNode(texture: SKTexture(imageNamed: "Mult"))
    let secondLifeButton = SKSpriteNode(texture: SKTexture(imageNamed: "Unlimited Second Lives"))
    
    
    let scrambledCheckpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "ScrambledCheckpoint"))
    let checkpointButton = SKSpriteNode(texture: SKTexture(imageNamed: "Checkpoint"))
    let hiddenStackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "Hidden"))
    let stackableLivesButton = SKSpriteNode(texture: SKTexture(imageNamed: "StackableLives"))
    
    }
    */
    
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
    
print("setupScene() ran")

}

    
    func showAssignments() {
        
        
        //will show at beginning every time: 
        assignmentLabel1.removeFromParent()
        assignmentLabel2.removeFromParent()
        assignmentLabel3.removeFromParent()
        assignmentOutline.removeFromParent()
        backgroundLayer.addChild(assignmentLabel1)
        backgroundLayer.addChild(assignmentLabel2)
        backgroundLayer.addChild(assignmentLabel3)
        backgroundLayer.addChild(assignmentOutline)
        
        assignmentLabel1.horizontalAlignmentMode = .Left
        
        assignmentLabel1.position.x = -500
        assignmentLabel1.position.y = self.size.height - 450
        assignmentLabel1.fontColor = UIColor(red: 49/255, green: 79/255, blue: 79/255, alpha: 1.0)//SKColor.greenColor()
        assignmentLabel1.fontSize = 35
        assignmentLabel1.zPosition = interfaceButtonsZPos
        
        
        assignmentLabel2.horizontalAlignmentMode = .Left
        
        assignmentLabel2.position.x = -500
        assignmentLabel2.position.y = assignmentLabel1.position.y - 100
        assignmentLabel2.fontColor = UIColor(red: 49/255, green: 79/255, blue: 79/255, alpha: 1.0)//SKColor.greenColor()
        assignmentLabel2.fontSize = 35
        assignmentLabel2.zPosition = interfaceButtonsZPos
        
        
        
        assignmentLabel3.horizontalAlignmentMode = .Left
        
        assignmentLabel3.position.x = -500
        assignmentLabel3.position.y = assignmentLabel2.position.y - 100
        assignmentLabel3.fontColor = UIColor(red: 49/255, green: 79/255, blue: 79/255, alpha: 1.0)//SKColor.greenColor()
        assignmentLabel3.fontSize = 35
        assignmentLabel3.zPosition = interfaceButtonsZPos
        
        
        assignmentOutline.position.x = assignmentLabel1.position.x + assignmentOutline.size.width/2 - 30
        assignmentOutline.position.y = assignmentLabel1.position.y - assignmentOutline.size.height/2 + 100
        assignmentOutline.zPosition = interfaceButtonsZPos
        
        checkmark1.position.x = assignmentLabel1.position.x - checkmark1.size.width/2 - 20
        checkmark1.position.y = assignmentLabel1.position.y + 20
        checkmark1.zPosition = interfaceButtonsZPos
        
        
        checkmark2.position.x = assignmentLabel2.position.x - checkmark2.size.width/2 - 20
        checkmark2.position.y = assignmentLabel2.position.y + 20
        checkmark2.zPosition = interfaceButtonsZPos
        
        
        checkmark3.position.x = assignmentLabel3.position.x - checkmark3.size.width/2 - 20
        checkmark3.position.y = assignmentLabel3.position.y + 20
        checkmark3.zPosition = interfaceButtonsZPos
        
        
        if castleType == 0 && noOfCars == 1 {
            
            
            if GameState.sharedInstance.oneBlock == 1 {
                
                assignmentLabel1.text = "\(oneA1T) +\(oneA1C)"
                assignmentLabel2.text = "\(oneA2T) +\(oneA2C)"
                assignmentLabel3.text = "\(oneA3T) +\(oneA3C)"
                
                
                
                
                
                stopwatchicon1.size.width = 70
                stopwatchicon1.size.height = 70
                stopwatchicon1.position.x = assignmentLabel3.position.x + 80
                
                stopwatchicon1.zPosition = interfaceButtonsZPos
                
                if GameState.sharedInstance.oneTime60 != 1{
                    backgroundLayer.addChild(stopwatchicon1)
                    stopwatchicon1.position.y = assignmentLabel3.position.y - stopwatchicon1.size.width - 30
                }
                
                
                if GameState.sharedInstance.oneScore5 == 1 {
                    
                    checkmark1.hidden = false
                    print("added checkmark1")
                    
                }
                
                if GameState.sharedInstance.oneBlue2 == 1 {
                    
                    
                    checkmark2.hidden = false
                    
                }
                
                if GameState.sharedInstance.oneTime60 == 1 {
                    
                    checkmark3.hidden = false
                    
                }
                
            }
            
            
            if GameState.sharedInstance.oneBlock == 2 {
                
                assignmentLabel1.text = "\(oneA4T) +\(oneA4C)"
                assignmentLabel2.text = "\(oneA5T) +\(oneA5C)"
                assignmentLabel3.text = "\(oneA6T) +\(oneA6C)"
                
                /*
                backgroundLayer.addChild(assignmentLabel1) 
                backgroundLayer.addChild(assignmentLabel2)
                backgroundLayer.addChild(assignmentLabel3) 
                backgroundLayer.addChild(assignmentOutline)
                */
                
                
                if GameState.sharedInstance.oneLowWall == 1 {
                    
                    
                    checkmark1.hidden = false
                    
                    
                }
                
                if GameState.sharedInstance.oneScore10 == 1 {
                    
                    checkmark2.hidden = false
                    
                    
                }
                
                if GameState.sharedInstance.oneRed2 == 1 {
                    
                    
                    checkmark3.hidden = false
                    
                }
                
            }
            
            
            
            
            if GameState.sharedInstance.oneBlock == 3 {
                
                assignmentLabel1.text = "\(oneA7T) +\(oneA7C)"
                assignmentLabel2.text = "\(oneA8T) +\(oneA8C)"
                assignmentLabel3.text = "\(oneA9T) +\(oneA9C)"
                
                /*
                backgroundLayer.addChild(assignmentLabel1) 
                backgroundLayer.addChild(assignmentLabel2)
                backgroundLayer.addChild(assignmentLabel3) 
                backgroundLayer.addChild(assignmentOutline)
                */
                
                stopwatchicon1.size.width = 70
                stopwatchicon1.size.height = 70
                stopwatchicon1.position.x = assignmentLabel3.position.x + 80
                stopwatchicon1.zPosition = interfaceButtonsZPos
                
                
                if GameState.sharedInstance.oneTime180 != 1 {
                    
                    backgroundLayer.addChild(stopwatchicon1)
                    stopwatchicon1.position.y = assignmentLabel3.position.y - stopwatchicon1.size.width - 30
                    
                }
                
                
                if GameState.sharedInstance.oneVineWall == 1 {
                    
                    
                    checkmark1.hidden = false
                    
                }
                
                if GameState.sharedInstance.oneFloatWall == 1 {
                    
                    
                    checkmark2.hidden = false
                    
                    
                }
                
                if GameState.sharedInstance.oneTime180 == 1 {
                    
                    
                    checkmark3.hidden = false
                    
                    
                }
                
            }
            
            
            
            
            
            if GameState.sharedInstance.oneBlock == 4 {
                
                assignmentLabel1.text = "\(oneA10T) +\(oneA10C)"
                
                
                
                var wallsClearAmount: Int = 0
                
                if GameState.sharedInstance.wallsCleared >= 300 {
                    
                    wallsClearAmount = 300
                    
                } else {
                    
                    wallsClearAmount = GameState.sharedInstance.wallsCleared
                    
                }
                
                
                
                assignmentLabel2.text = "\(oneA11T) \(wallsClearAmount) / 300 +\(oneA11C)"
                assignmentLabel3.text = "\(oneA12T) +\(oneA12C)"
                
                /*
                backgroundLayer.addChild(assignmentLabel1) 
                backgroundLayer.addChild(assignmentLabel2)
                backgroundLayer.addChild(assignmentLabel3) 
                backgroundLayer.addChild(assignmentOutline)
                */
                
                stopwatchicon1.size.width = 70
                stopwatchicon1.size.height = 70
                stopwatchicon1.position.x = assignmentLabel3.position.x + 80
                stopwatchicon1.zPosition = interfaceButtonsZPos
                
                
                if GameState.sharedInstance.oneTime300 != 1 {
                    
                    backgroundLayer.addChild(stopwatchicon1)
                    stopwatchicon1.position.y = assignmentLabel3.position.y - stopwatchicon1.size.width - 30
                    
                }
                
                
                if GameState.sharedInstance.oneScore25 == 1 {
                    
                    
                    checkmark1.hidden = false
                    
                }
                
                if GameState.sharedInstance.oneClear300 == 1 {
                    
                    
                    checkmark2.hidden = false
                    
                    
                }
                
                if GameState.sharedInstance.oneTime300 == 1 {
                    
                    
                    checkmark3.hidden = false
                    
                    
                }
                
            }
            
            
            if GameState.sharedInstance.oneBlock == 5 {
                
                assignmentLabel1.text = "\(oneA13T) +\(oneA13C)"
                
                
                var redAmount1: Int = 0
                
                if GameState.sharedInstance.redCollected >= 200 {
                    
                    redAmount1 = 200
                    
                } else {
                    
                    redAmount1 = GameState.sharedInstance.redCollected
                    
                }
                
                assignmentLabel2.text = "\(oneA14T) \(redAmount1) / 200 +\(oneA14C)"
                assignmentLabel3.text = "\(oneA15T) +\(oneA15C)"
                
                /*
                backgroundLayer.addChild(assignmentLabel1) 
                backgroundLayer.addChild(assignmentLabel2)
                backgroundLayer.addChild(assignmentLabel3) 
                backgroundLayer.addChild(assignmentOutline)
                */
                
                stopwatchicon1.size.width = 70
                stopwatchicon1.size.height = 70
                stopwatchicon1.position.x = assignmentLabel3.position.x + 80
                stopwatchicon1.zPosition = interfaceButtonsZPos
                
                
                if GameState.sharedInstance.oneTime600 != 1 {
                    
                    backgroundLayer.addChild(stopwatchicon1)
                    stopwatchicon1.position.y = assignmentLabel3.position.y - stopwatchicon1.size.width - 30
                    
                }
                
                
                if GameState.sharedInstance.oneScore40 == 1 {
                    
                    
                    checkmark1.hidden = false
                    
                }
                
                if GameState.sharedInstance.oneColl200 == 1 {
                    
                    
                    checkmark2.hidden = false
                    
                    
                }
                
                if GameState.sharedInstance.oneTime600 == 1 {
                    
                    
                    checkmark3.hidden = false
                    
                    
                }
                
            }
            
            
            
            
            
            
            
            
            
            if GameState.sharedInstance.oneBlock == 6 {
                
                assignmentLabel1.text = "\(oneA16T) +\(oneA16C)"
                
                
                
                var redAmount2: Int = 0
                
                if GameState.sharedInstance.redCollected >= 1000 {
                    
                    redAmount2 = 1000
                    
                } else {
                    
                    redAmount2 = GameState.sharedInstance.redCollected
                    
                }
                
                
                
                assignmentLabel2.text = "\(oneA17T) \(redAmount2) / 1000 +\(oneA17C)"
                assignmentLabel3.text = "\(oneA18T) +\(oneA18C)"
                
                /*
                backgroundLayer.addChild(assignmentLabel1) 
                backgroundLayer.addChild(assignmentLabel2)
                backgroundLayer.addChild(assignmentLabel3) 
                backgroundLayer.addChild(assignmentOutline)
                */
                
                stopwatchicon1.size.width = 70
                stopwatchicon1.size.height = 70
                stopwatchicon1.position.x = assignmentLabel3.position.x + 80
                stopwatchicon1.zPosition = interfaceButtonsZPos
                
                
                if GameState.sharedInstance.oneTime600b != 1 {
                    
                    backgroundLayer.addChild(stopwatchicon1)
                    stopwatchicon1.position.y = assignmentLabel3.position.y - stopwatchicon1.size.width - 30
                    
                }
                
                
                if GameState.sharedInstance.oneScore50 == 1 {
                    
                    
                    checkmark1.hidden = false
                    
                }
                
                if GameState.sharedInstance.oneColl1000 == 1 {
                    
                    
                    checkmark2.hidden = false
                    
                    
                }
                
                if GameState.sharedInstance.oneTime600b == 1 {
                    
                    
                    checkmark3.hidden = false
                    
                    
                }
                
            }
            
            
        } 
        
    }
    
    func moveBackground() {
    



       
//print("moveBackground start")


    
    
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


//print("resetFrontCastle: \(resetFrontCastle)")

if resetFrontCastle == 0 && bird2.position.x > 2500 {
        
        
ground.position.x = self.size.width/2
ceiling.position.x = self.size.width/2
frontWall.position.x = self.size.width/2
castleFloor.position.x = self.size.width/2
//castleCeiling.position.x = self.size.width/2

frontWall.zPosition = selffrontWallZPos
castleFloor.zPosition = floorZPos
//castleCeiling.zPosition = floorZPos

ground.removeFromParent()
ceiling.removeFromParent()
frontWall.removeFromParent()
castleFloor.removeFromParent()
//castleCeiling.removeFromParent()

ground.removeFromParent()
ceiling.removeFromParent()
frontWall.removeFromParent()
castleFloor.removeFromParent()

self.addChild(ground)
self.addChild(castleFloor)
self.addChild(frontWall)

if castleType != 1 {


self.addChild(ceiling)



}


//self.addChild(castleCeiling)

resetFrontCastle = 1


    }
    

//print("floorLead: \(floorLead)")
//print("floorPos: \(floorPos)")
 if platforms[4].parent != nil || bird2.position.x > 800 {       
        
        while bird2.position.x + floorLead > floorPos {
  



print("platforms[4].position.x: \(platforms[4].position.x)")        
//print("bird2.position.x: \(bird2.position.x) floorLead: \(floorLead) floorPos: \(floorPos)")

            let frontJagged = frontjaggeds[self.frontjaggedarraypos]
           frontjaggedypos = CGRectGetMinY(castleFloor.frame) + 10
            
            frontJagged.removeFromParent()
            frontJagged.position.x = floorPos + frontJagged.size.width
            frontJagged.position.y = frontjaggedypos
frontJagged.color = castleColor 
frontJagged.colorBlendFactor = castleBlendFactor //0.5
            frontJagged.zPosition = frontWallZPos
            // *** // *** // 10-2-15 print("frontjaggedarraypos: \(frontjaggedarraypos)")
            
            
            backgroundLayer.addChild(frontJagged)
print("added front jagged")            


            floorPos += frontJagged.size.width
            
            if self.frontjaggedarraypos < 21 {
                self.frontjaggedarraypos++
            } else {
                self.frontjaggedarraypos = 0
                
            }
            
    }
        
        
    //    print("floorPos2: \(floorPos2)")

        while bird2.position.x + floorLead > floorPos2 { //&& setCastle == 1
            
if backwallCounter == 0 && castleType == 0 { // PUT BACK. backwallCounter == 0 and remove castleType == 0 since will be the same if rotating 3 backgrounds.


print("backwallCounter: \(backwallCounter)")
/*
//roomWall1.size.height = windowWallHeight// room1Height //1.32608696*920 //CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
//roomWall1.size.width = windowWallWidth //room1Width // 1.32608696*1314 //CGRectGetMaxX(platforms[cpos].frame) - CGRectGetMinX(plainWall1.frame) + 50
roomWall1.position.x = CGRectGetMinX(castleFloor.frame) + 0.5*roomWall1.size.width + 150//CGRectGetMaxX(plainWall1.frame) + 0.5*roomWall1.size.width/2//(CGRectGetMinX(platforms[cpos].frame) + CGRectGetMaxX(platforms[cycle].frame))/2
roomWall1.position.y =  CGRectGetMaxY(castleFloor.frame) + roomWall1.size.height/2 
roomWall1.zPosition = backWallZPos
backgroundLayer.addChild(roomWall1)
*/

if replay == false {
roomWall1.removeFromParent()
//roomWall1.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
//roomWall1.size.width = 2200
roomWall1.position.x = CGRectGetMinX(castleFloor.frame) + 0.5*roomWall1.size.width //CGRectGetMaxX(windowWall1.frame) + roomWall1.size.width/2 - 5
roomWall1.position.y = CGRectGetMaxY(castleFloor.frame) + roomWall1.size.height/2 - 10
roomWall1.zPosition = backWallZPos + 0.1
roomWall1.alpha = castleAlpha
roomWall1.name = "roomWall1"
backgroundLayer.addChild(roomWall1)

plainWallRW1.removeFromParent()
plainWallRW1.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(roomWall1.frame) + 5
plainWallRW1.size.width = roomWall1.size.width
plainWallRW1.position.x = roomWall1.position.x//CGRectGetMinX(castleFloor.frame) + 0.5*plainWallRW1.size.width + 150 //CGRectGetMaxX(windowWall1.frame) + plainWallRW1.size.width/2 - 5
plainWallRW1.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(roomWall1.frame))/2 
plainWallRW1.zPosition = backWallZPos
plainWallRW1.alpha = castleAlpha
backgroundLayer.addChild(plainWallRW1)

}

floorPos2 += roomWall1.size.width



plainWall1.removeFromParent()
plainWall1.name = "plainWall1"
plainWall1.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall1.size.width = 2200 - roomWall1.size.width
plainWall1.position.x = floorPos2 + plainWall1.size.width/2//CGRectGetMinX(castleFloor.frame) + 0.5*plainWall1.size.width + 150 //CGRectGetMaxX(windowWall1.frame) + plainWall1.size.width/2 - 5
plainWall1.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(castleFloor.frame))/2 
plainWall1.zPosition = backWallZPos
plainWall1.alpha = castleAlpha
backgroundLayer.addChild(plainWall1)




arc1.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arc1.size.width = arc1.size.height*0.37624750 
arc1.position.x = CGRectGetMaxX(plainWall1.frame) + arc1.size.width/2
arc1.position.y =  CGRectGetMaxY(castleFloor.frame) + arc1.size.height/2
arc1.zPosition = floorZPos - 5 + 0.1
arc1.alpha = castleAlpha
backgroundLayer.addChild(arc1)


//floorPos2 += windowWall1.size.width // need this?
floorPos2 += plainWall1.size.width - 5

/*
var backjcount1: CGFloat = 0

floorPos2 += backjagged1.size.width/2 - 50

while backjcount1 < 3 {

let backJagged = backjaggeds[self.backjaggedarraypos]
let backjaggedypos = CGRectGetMaxY(castleFloor.frame) + 0.5*backJagged.size.height - 10
            
backJagged.removeFromParent()
backJagged.position.x = floorPos2 + backJagged.size.width
backJagged.position.y = backjaggedypos
backJagged.color = castleColor 
backJagged.colorBlendFactor = castleBlendFactor //0.5
backJagged.zPosition = backWallZPos
            // *** // *** // 10-2-15 print("backjaggedarraypos: \(backjaggedarraypos)")
            
            
backgroundLayer.addChild(backJagged)
print("added back jagged")         

if self.backjaggedarraypos < 21 {
                self.backjaggedarraypos++
            } else {
                self.backjaggedarraypos = 0
                
                
                
            }


floorPos2 += backJagged.size.width
backjcount1 += 1

}
floorPos2 -= 40

*/

 floorPos2 += 1200// without back jagged
backArc1.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArc1.size.width = backArc1.size.height*0.37624750 
backArc1.position.x = floorPos2
backArc1.position.y = CGRectGetMaxY(castleFloor.frame) + backArc1.size.height/2
backArc1.zPosition = floorZPos - 5 + 0.1
backArc1.name = "backArc"
backArc1.alpha = castleAlpha
backgroundLayer.addChild(backArc1)

//closeTree1.position.x = (arc1.position.x + backArc1.position.x)/2 //3153 - (1 - midSpeed)*3284//for backgroundLayer parent: 

print("closeTree1: \(closeTree1)")
print("closeTree1.size.height: \(closeTree1.size.height)")
    closeTree1.size.height = 1091.94*0.6
    closeTree1.size.width = 700*0.6
closeTree1.position = self.backgroundLayer.convertPoint(CGPoint(x: 3153 - (1 - midSpeed)*(3153 - newbird2x), y: 0), toNode: self.midWorldNode)

closeTree1.position.y =  CGRectGetMaxY(castleFloor.frame) + closeTree1.size.height/2 - 100
closeTree1.zPosition = hillsZPos + 0.1//backWallTreeZPos

midWorldNode.addChild(closeTree1)

//backgroundLayer.addChild(closeTree1)



floorPos2 += backArc1.size.width/2


backwallCounter += 1

plainWall2.removeFromParent()
plainWall2.size.width = 900
plainWall2.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall2.position.x = floorPos2 + plainWall2.size.width/2
plainWall2.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall2.size.height/2
plainWall2.zPosition = backWallZPos
plainWall2.alpha = castleAlpha
backgroundLayer.addChild(plainWall2)

floorPos2 += plainWall2.size.width

windowWall1.position.x = floorPos2 + windowWall1.size.width/2
windowWall1.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall1.size.height/2
windowWall1.zPosition = backWallZPos + 0.1
windowWall1.alpha = castleAlpha
backgroundLayer.addChild(windowWall1)

floorPos2 += windowWall1.size.width


plainWall3.removeFromParent()
plainWall3.size.width = 200
plainWall3.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall3.position.x = floorPos2 + plainWall3.size.width/2
plainWall3.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall3.size.height/2
plainWall3.zPosition = backWallZPos
plainWall3.alpha = castleAlpha
backgroundLayer.addChild(plainWall3)

floorPos2 += plainWall3.size.width


windowWall2.position.x = floorPos2 + windowWall1.size.width/2
windowWall2.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall1.size.height/2
windowWall2.zPosition = backWallZPos + 0.1
windowWall2.alpha = castleAlpha
backgroundLayer.addChild(windowWall2)

floorPos2 += windowWall2.size.width


plainWall4.removeFromParent()
plainWall4.size.width = 200
plainWall4.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall4.position.x = floorPos2 + plainWall4.size.width/2
plainWall4.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall4.size.height/2
plainWall4.zPosition = backWallZPos
plainWall4.alpha = castleAlpha
backgroundLayer.addChild(plainWall4)

floorPos2 += plainWall4.size.width


windowWall3.position.x = floorPos2 + windowWall1.size.width/2
windowWall3.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall1.size.height/2
windowWall3.zPosition = backWallZPos + 0.1
windowWall3.alpha = castleAlpha
backgroundLayer.addChild(windowWall3)

floorPos2 += windowWall3.size.width

plainWall5.removeFromParent()
plainWall5.size.width = 200
plainWall5.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall5.position.x = floorPos2 + plainWall5.size.width/2
plainWall5.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall5.size.height/2
plainWall5.zPosition = backWallZPos
plainWall5.alpha = castleAlpha
backgroundLayer.addChild(plainWall5)

floorPos2 += plainWall5.size.width


windowWall4.position.x = floorPos2 + windowWall1.size.width/2
windowWall4.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall1.size.height/2
windowWall4.zPosition = backWallZPos + 0.1
windowWall4.alpha = castleAlpha
backgroundLayer.addChild(windowWall4)

floorPos2 += windowWall4.size.width

plainWall6.removeFromParent()
plainWall6.size.width = 200
plainWall6.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall6.position.x = floorPos2 + plainWall6.size.width/2
plainWall6.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall6.size.height/2
plainWall6.zPosition = backWallZPos
plainWall6.alpha = castleAlpha
backgroundLayer.addChild(plainWall6)

plainWall16.removeFromParent()
plainWall16.size.width = CGRectGetMaxX(windowWall4.frame) - CGRectGetMinX(windowWall1.frame) + 20
plainWall16.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(windowWall4.frame)
plainWall16.position.x = (CGRectGetMaxX(windowWall4.frame) + CGRectGetMinX(windowWall1.frame))/2
plainWall16.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(windowWall4.frame))/2
plainWall16.zPosition = backWallZPos
plainWall16.alpha = castleAlpha
backgroundLayer.addChild(plainWall16)

floorPos2 += plainWall6.size.width

arc2.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arc2.size.width = arc2.size.height*0.37624750 
arc2.position.x = CGRectGetMaxX(plainWall6.frame) + arc1.size.width/2
arc2.position.y =  CGRectGetMaxY(castleFloor.frame) + arc2.size.height/2
arc2.zPosition = backWallZPos + 0.1
arc2.alpha = castleAlpha
backgroundLayer.addChild(arc2)

floorPos2 += arc2.size.width

backArc2.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArc2.size.width = backArc2.size.height*0.37624750 
backArc2.position.x = floorPos2 + backArc2.size.width/2
backArc2.position.y = CGRectGetMaxY(castleFloor.frame) + backArc2.size.height/2
backArc2.zPosition = backWallZPos + 0.1
backArc2.name = "backArc"
backArc2.alpha = castleAlpha
backgroundLayer.addChild(backArc2)

floorPos2 += backArc2.size.width

plainWall61.removeFromParent()
plainWall61.size.width = 100
plainWall61.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall61.position.x = floorPos2 + plainWall61.size.width/2
plainWall61.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall61.size.height/2
plainWall61.zPosition = backWallZPos
plainWall61.alpha = castleAlpha
backgroundLayer.addChild(plainWall61)

floorPos2 += plainWall61.size.width

arc3.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arc3.size.width = arc3.size.height*0.37624750 
arc3.position.x = floorPos2 + arc2.size.width/2
arc3.position.y =  CGRectGetMaxY(castleFloor.frame) + arc3.size.height/2
arc3.zPosition = backWallZPos + 0.1
arc3.alpha = castleAlpha
backgroundLayer.addChild(arc3)

//floorPos2 += 3400

var miniFloorPos2: CGFloat = 0

while miniFloorPos2 < 3400 {

let backJagged = backjaggeds[self.backjaggedarraypos]
let backjaggedypos = CGRectGetMaxY(castleFloor.frame) + 0.5*backJagged.size.height - 10
            
            backJagged.removeFromParent()
            backJagged.position.x = floorPos2 + backJagged.size.width
            backJagged.position.y = backjaggedypos
backJagged.color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
backJagged.colorBlendFactor = castleBlendFactor //0.5
            backJagged.zPosition = backWallZPos
backJagged.name = "expendable2"
            // *** // *** // 10-2-15 print("backjaggedarraypos: \(backjaggedarraypos)")
            
            
            backgroundLayer.addChild(backJagged)
//print("added back jagged")         

if self.backjaggedarraypos < 21 {
                self.backjaggedarraypos++
            } else {
                self.backjaggedarraypos = 0
                
                
                
            }
   
floorPos2 += backJagged.size.width
miniFloorPos2 += backJagged.size.width

print("floorPos2: \(floorPos2)")
print("miniFloorPos2: \(miniFloorPos2)")
}




backArc3.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArc3.size.width = backArc3.size.height*0.37624750
backArc3.position.x = floorPos2 + backArc3.size.width/2
backArc3.position.y = CGRectGetMaxY(castleFloor.frame) + backArc3.size.height/2
backArc3.zPosition = backWallZPos + 0.1
backArc3.name = "backArc"
backArc3.alpha = castleAlpha
backgroundLayer.addChild(backArc3)

floorPos2 += backArc3.size.width

plainWall62.removeFromParent()
plainWall62.size.width = 100
plainWall62.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall62.position.x = floorPos2 + plainWall62.size.width/2
plainWall62.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall62.size.height/2
plainWall62.zPosition = backWallZPos
plainWall62.alpha = castleAlpha
backgroundLayer.addChild(plainWall62)

floorPos2 += plainWall62.size.width

arc4.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arc4.size.width = arc4.size.height*0.37624750 
arc4.position.x = floorPos2 + arc4.size.width/2
arc4.position.y =  CGRectGetMaxY(castleFloor.frame) + arc4.size.height/2
arc4.zPosition = backWallZPos + 0.1
arc4.alpha = castleAlpha
backgroundLayer.addChild(arc4)

floorPos2 += arc4.size.width

backArc4.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArc4.size.width = backArc4.size.height*0.37624750
backArc4.position.x = floorPos2 + backArc4.size.width/2
backArc4.position.y = CGRectGetMaxY(castleFloor.frame) + backArc4.size.height/2
backArc4.zPosition = 0 //backWallZPos + 0.1
backArc4.name = "expendable"
backArc4.alpha = castleAlpha
backgroundLayer.addChild(backArc4)

floorPos2 += backArc4.size.width/2



plainWallRE.removeFromParent()
plainWallRE.size.width = 200
plainWallRE.size.height = backArc4.size.height
plainWallRE.position.x = floorPos2 + plainWallRE.size.width
plainWallRE.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallRE.size.height/2
plainWallRE.zPosition = 0 //backWallZPos
plainWallRE.name = "expendable"
plainWallRE.alpha = castleAlpha
backgroundLayer.addChild(plainWallRE)


arcE.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arcE.size.width = arcE.size.height*0.37624750
arcE.position.x = CGRectGetMaxX(plainWallRE.frame) + arcE.size.width/2
arcE.position.y = CGRectGetMaxY(castleFloor.frame) + arcE.size.height/2
arcE.zPosition = backWallZPos + 0.1
arcE.name = "expendable"
arcE.alpha = castleAlpha
backgroundLayer.addChild(arcE)

backArc4.removeFromParent()
plainWallRE.removeFromParent()


plainWallRE.position.x = -arcE.size.width/2 - plainWallRE.size.width/2
backArc4.position.x = plainWallRE.position.x - plainWallRE.size.width/2 - backArc4.size.width/2
plainWallRE.position.y = 0
backArc4.position.y = 0



arcE.addChild(backArc4)
arcE.addChild(plainWallRE)

/*

plainWall7.removeFromParent()
plainWall7.size.width = 400
plainWall7.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall7.position.x = floorPos2 + plainWall7.size.width/2
plainWall7.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall7.size.height/2
plainWall7.zPosition = backWallZPos
backgroundLayer.addChild(plainWall7)

floorPos2 += plainWall7.size.width

windowWall5.position.x = floorPos2 + windowWall1.size.width/2
windowWall5.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall1.size.height/2
windowWall5.zPosition = backWallZPos + 0.1
backgroundLayer.addChild(windowWall5)

floorPos2 += windowWall5.size.width


plainWall8.removeFromParent()
plainWall8.size.width = 200
plainWall8.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall8.position.x = floorPos2 + plainWall8.size.width/2
plainWall8.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall8.size.height/2
plainWall8.zPosition = backWallZPos
backgroundLayer.addChild(plainWall8)

floorPos2 += plainWall8.size.width

windowWall6.position.x = floorPos2 + windowWall6.size.width/2
windowWall6.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall6.size.height/2
windowWall6.zPosition = backWallZPos + 0.1
backgroundLayer.addChild(windowWall6)

floorPos2 += windowWall6.size.width


plainWall9.removeFromParent()
plainWall9.size.width = 200
plainWall9.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall9.position.x = floorPos2 + plainWall9.size.width/2
plainWall9.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall9.size.height/2
plainWall9.zPosition = backWallZPos
backgroundLayer.addChild(plainWall9)

floorPos2 += plainWall9.size.width

windowWall7.position.x = floorPos2 + windowWall1.size.width/2
windowWall7.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall1.size.height/2
windowWall7.zPosition = backWallZPos + 0.1
backgroundLayer.addChild(windowWall7)

floorPos2 += windowWall7.size.width


plainWall10.removeFromParent()
plainWall10.size.width = 200
plainWall10.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall10.position.x = floorPos2 + plainWall10.size.width/2
plainWall10.position.y = CGRectGetMaxY(castleFloor.frame) + plainWall10.size.height/2
plainWall10.zPosition = backWallZPos
backgroundLayer.addChild(plainWall10)

floorPos2 += plainWall10.size.width


*/

// small arches, 3





// short colonnade to tower finish

}



//print("bird2.position.x: \(bird2.position.x) floorLead: \(floorLead) floorPos2: \(floorPos2)")
            
print("noRoofABegin: \(noRoofABegin)")
print("noRoofAEnd: \(noRoofAEnd)")

if floorPos2 >= noRoofABegin + 235.5 && floorPos2 <= noRoofAEnd - 235.5 {

floorPos2 = noRoofAEnd

print("end of floorPos2. floorPos2: \(floorPos2)")


if floorPos2 <= bird2.position.x + floorLead { // added this to prevent infinite looping caused by floorPos2 never exceeding bird2.position.x + floorLead

floorPos2 = bird2.position.x + floorLead + 1
print("new floorPos2: \(floorPos2)")

}


}



print("after floorPos2. floorPos2: \(floorPos2)")

// BRING BACK LATER, FOR BACKJAGGEDS AFTER THE ACHIEVEMENT ROOM
let backJagged = backjaggeds[self.backjaggedarraypos]
            let backjaggedypos = CGRectGetMaxY(castleFloor.frame) + 0.5*backJagged.size.height - 10
            
            backJagged.removeFromParent()
            backJagged.position.x = floorPos2 + backJagged.size.width
            backJagged.position.y = backjaggedypos
backJagged.color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
backJagged.colorBlendFactor = castleBlendFactor //0.5
            backJagged.zPosition = backWallZPos
backJagged.name = "expendable2"
            // *** // *** // 10-2-15 print("backjaggedarraypos: \(backjaggedarraypos)")
            
            
            backgroundLayer.addChild(backJagged)
//print("added back jagged")         

if self.backjaggedarraypos < 21 {
                self.backjaggedarraypos++
            } else {
                self.backjaggedarraypos = 0
                
                
                
            }
   
            floorPos2 += backJagged.size.width
            
            


}



            
            
            
        
        

while bird2.position.x + floorLead > floorPos3 && castleType == 0 {
            

print("bird2.position.x: \(bird2.position.x) floorLead: \(floorLead) floorPos2: \(floorPos2)")


let roofwall = roofwalls[self.roofwallarraypos]

if floorPos3 >= noRoofABegin + 471 && floorPos3 <= noRoofAEnd - 471 {

floorPos3 = noRoofAEnd

print("roofwall.position.x: \(roofwall.position.x)")

}
            


            roofwall.removeFromParent()
            roofwall.position.x = floorPos3 + roofwall.size.width - 10
            roofwall.position.y = roofwallypos
roofwall.color = castleColor // UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1.0) //UIColor(red: 165/255, green: 137/255, blue: 106/255, alpha: 1.0)//castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
roofwall.colorBlendFactor = castleBlendFactor //0//0.4 ////0.5
roofwall.zPosition = frontWallZPos + 0.5
roofwall.name = "expendable1"
            // *** // *** // 10-2-15 print("roofwallarraypos: \(roofwallarraypos)")
            
            
            backgroundLayer.addChild(roofwall)
//print("added back jagged")         


   
            floorPos3 += roofwall.size.width - 10
            
            if self.roofwallarraypos < 19 {
                self.roofwallarraypos++
            } else {
                self.roofwallarraypos = 0
                
                
                
            }

print("roofwall.position.x: \(roofwall.position.x)")


            print("noRoofAEnd: \(noRoofAEnd)")
print("floorPos3: \(floorPos3)")
            //delete, testing taller wall:

//roofwall.size.height = 2*roofwall.size.height
//roofwall.position.y = CGRectGetMaxY(castleCeiling.frame) + roofwall.size.height/2 - 10 
            
        }







        }
    
    if (noOfCars == 1 && GameState.sharedInstance.score > Int(self.scrollcount*3) - 2 && checkpointmode == 0) || (noOfCars == 2 && Int(sharedScore) > Int(self.scrollcount*3) - 2 && checkpointmode == 0) || (noOfCars == 1 && checkpointmode == 1 && (GameState.sharedInstance.score - GameState.sharedInstance.checkpointHS) > (Int(self.scrollcount*3) - 2)) || initialcount < 2 { // self.bird2.position.x > self.scrollcount*self.make3size + self.make3size/2
    
    //VAR PLATFORMS, BREAKWALLS, XPLATFORMS, ETC. GO HERE: PUT BACK
    
    
        if printOn == 1 {
    // *** // *** // *** // 10-2-15 print("ran movebackground: self.bird2.position.x > self.scrollcount*self.make3size + self.make3size/2 || initialcount < 2")
    
    // *** // *** // *** // 10-2-15 print("bird2.position.x: \(bird2.position.x)")
        }
    
    var shrink: CGFloat = 1
    
    
    
    
    //  prinln("testtttt \(platform4.size.height) does equal \(platforms[cycle+4].size.height)")
    
    
    if initialcount == 2 {
    self.scrollcount = self.scrollcount + 1
    }
    
    func make3(blocks: String) {
        
        // *** // *** // 10-2-15 print("start make3")
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
    // *** // *** // *** // 10-2-15 print("runmake3: cycle: \(cycle) platformcount: \(platformcount) bird2position: \(bird2.position) scrollcount: \(scrollcount) checkpointmode: \(checkpointmode) GameState.sharedInstance.score: \(GameState.sharedInstance.score) GameState.sharedInstance.checkpointHS: \(GameState.sharedInstance.checkpointHS) GameState.sharedInstance.checkpointunlock: \(GameState.sharedInstance.checkpointunlock)")
        }
        
        
        
        
        if makeOne == 1 {
            
    if cycle < 3 {
    
    cycle++
    
    } else {
    
    cycle = 0
    
    }

platformImages[cycle].colorBlendFactor = castleBlendFactor
platformImages[cycle+4].colorBlendFactor = castleBlendFactor
platformImages[cycle+8].colorBlendFactor = castleBlendFactor

platformImages[cycle].name = nil
platformImages[cycle+4].name = nil
platformImages[cycle+8].name = nil       


vplatforms[cycle].colorBlendFactor = castleBlendFactor
vplatforms[cycle+4].colorBlendFactor = castleBlendFactor
vplatforms[cycle+8].colorBlendFactor = castleBlendFactor
            
           
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

if castleType == 0 {

    sml = CGFloat.random(min: 0, max: 1)
    


    if sml > 0.82 {
    
    make3size = CGFloat.random(min: 1350, max: 1501)
    }
    
    if sml >= 0.18 && sml <= 0.82 {
    
    make3size = CGFloat.random(min: 1250, max: 1349)
    }
    
    if sml < 0.18 {
    
    make3size = CGFloat.random(min: 1100, max: 1249)
    
    }

}

if castleType == 1 {

sml = CGFloat.random(min: 0, max: 1)

print("sml castletype 1 ")
    
    if sml > 0.82 {
    
    make3size = CGFloat.random(min: 1651, max: 1800)
    }
    
    if sml >= 0.18 && sml <= 0.82 {
    
    make3size = CGFloat.random(min: 1451, max: 1650)
    }
    
    if sml < 0.18 {
    
    make3size = CGFloat.random(min: 1400, max: 1450)
    
    }



}
            }

//make3size = 1550 //Test PUT BACK

// // *** // *** // *** // 10-2-15 print("checkmark1")

if difOne > difPer {

if platforms[previousbarrier1].physicsBody!.charge + difPos <= maxPHeight || LFW == 1 {



if difOneWidth <= 0.33 {

make3size = 1200

}

if difOneWidth > 0.33 && difOneWidth <= 0.66 {

make3size = 1350

}

if difOneWidth > 0.66 {

make3size = 1425

}

difOneWidth = make3size
    if printOn == 1 {
// *** // *** // *** // 10-2-15 print("make3size: \(make3size)")
    }
    
    

} else {

difTwo = 10

    }

if difOne > difPer && difTwo < 9 {
platformImages[cycle].color = difColor //UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) 
platformImages[cycle].colorBlendFactor = difBlendFactor //0.5
vplatforms[cycle].color = difColor //UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) 
vplatforms[cycle].colorBlendFactor = difBlendFactor  //0.5


if LFW == 1 {

platformImages[cycle].name = "lowwall"

}

if (difPos == difMaxPos1200 || difPos == difMaxPos1350 || difPos == difMaxPos1500) && LFW == 0 {

platformImages[cycle].name = "float"

}

//add spike strip to vplatform on minPos jumps:

if (difPos == difMinPos1200 || difPos == difMinPos1350 || difPos == difMinPos1500) && LFW == 0 {



let spikestrip1 = SKSpriteNode(imageNamed: "floorForbid")
spikestrip1.size.height = platformheight
spikestrip1.size.width = platformwidth*0.5
spikestrip1.zPosition = platformZPos - 0.1
spikestrip1.color = UIColor(red: 0/255, green: 220/255, blue: 0/255, alpha: 1) 
spikestrip1.colorBlendFactor = 1.0

if cycle == 0 {


if vplatforms[cycle+11].name != "firstvplatform"{

vplatforms[cycle+11].addChild(spikestrip1)
platformImages[cycle].name = "vine"

}

} else {

if vplatforms[cycle+7].name != "firstvplatform" {

vplatforms[cycle+7].addChild(spikestrip1)
platformImages[cycle].name = "vine"

}


}



spikestrip1.position.x = 35

}

//end add spike strip


}
        }
            if printOn == 1 {
    // *** // *** // *** // 10-2-15 print("platformwidth = \(platformwidth)")
    // *** // *** // *** // 10-2-15 print("vplatformwidth = \(vplatformwidth)")
            }
        }

    
    if a == on {
    
    if vw1 != 0 {
    vplatforms[cycle].size.width = vw1
    
} else { vplatforms[cycle].size.width = vplatformwidth }
    
    
    if vh1 != 0 {
    vplatforms[cycle].size.height = vh1
    
} else { vplatforms[cycle].size.height = vplatformheight }
    
    vplatforms[cycle].zPosition = platformZPos
    
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
    
   // // *** // *** // *** // 10-2-15 print("pw1: \(pw1)")
   // // *** // *** // *** // 10-2-15 print("sample width1: \(platforms[cycle].size.width)")
    platforms[cycle].size.width = platformwidth //shrink*make3size/12
    
    if pw1 != 0 {
    platforms[cycle].size.width = pw1
    }
 //   // *** // *** // *** // 10-2-15 print("sample width2: \(platforms[cycle].size.width)")
  //  // *** // *** // *** // 10-2-15 print("pw1: \(pw1)")
    
    platforms[cycle].size.height = platformheight //CGFloat.random(min: 600, max: 800)    //700
    platforms[cycle].position.y = CGFloat.random(min: lowestplatformpos, max: highestplatformpos)
 //   // *** // *** // *** // 10-2-15 print("platforms[cycle].size.height: \(platforms[cycle].size.height)")
    
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
    
    platforms[cycle].zPosition = platformZPos
    
  //  // *** // *** // *** // 10-2-15 print("sample width2: \(platforms[cycle].size.width)")
    
    if platforms[cycle+7].parent == nil && GameState.sharedInstance.score < 2 { // -1 + 8
    
    platforms[cycle].position.x = platforms[cycle+3].position.x + make3size/3 // -1 + 4


    
    
} else {
    
    if cycle > 0 {
    
    platforms[cycle].position.x = platforms[cycle+7].position.x + make3size/3 // - 1 + 8


    
    }
    
    if cycle == 0 {
    
    platforms[cycle].position.x = platforms[cycle+11].position.x + make3size/3  // +3 + 8


    
    }
    
    }
    
 //   platforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: platforms[cycle].size)

platforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: platforms[cycle].size) //CGSize(width: ppw, height: platforms[cycle].size.height))
    platforms[cycle].physicsBody!.dynamic = false
    platforms[cycle].physicsBody!.usesPreciseCollisionDetection = true
    platforms[cycle].physicsBody!.friction = wallfriction
    platforms[cycle].physicsBody!.restitution = 0
    platforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
    platforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    platforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
    platforms[cycle].name = "platform"
platforms[cycle].removeFromParent()
    self.backgroundLayer.addChild(platforms[cycle])
    
    checkfirstplat = 1
   // // *** // *** // *** // 10-2-15 print(" platform1 height\(platforms[cycle].size.height)")
   // // *** // *** // *** // 10-2-15 print("sample width3: \(platforms[cycle].size.width)")



if castleType == 0 {
    
    platforms[cycle].position.y = self.size.height - platforms[cycle].size.height/2

}
        }
        
        
        
        
        
        
        
        
        
        if castleType == 1 {

sml = CGFloat.random(min: 0, max: 1)
print("sml castletype 1 ")
    
    if sml > 0.82 {
    
    make3size = CGFloat.random(min: 1651, max: 1800)
    }
    
    if sml >= 0.18 && sml <= 0.82 {
    
    make3size = CGFloat.random(min: 1451, max: 1650)
    }
    
    if sml < 0.18 {
    
    make3size = CGFloat.random(min: 1400, max: 1450)
    
        
        
    }



}

        
        
        
    
  if b == on {








        
    
if difTwo <= difPer || (platforms[cycle].physicsBody!.charge + difPos > maxPHeight && LFW == 0) {

if castleType == 0 {

sml = CGFloat.random(min: 0, max: 1)

if sml > 0.82 {
    
    make3size = CGFloat.random(min: 1350, max: 1501)
    }
    
    if sml >= 0.18 && sml <= 0.82 {
    
    make3size = CGFloat.random(min: 1250, max: 1349)
    }
    
    if sml < 0.18 {
    
    make3size = CGFloat.random(min: 1100, max: 1249)
    
    }

}


}

// make3size = 1550 //test put back

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

make3size = 1425

}
    
    difTwoWidth = make3size
 //   // *** // *** // *** // 10-2-15 print("make3size: \(make3size)")

} else {

difThree = 10

    }
    
    if difTwo > difPer && difThree < 9 {
        platformImages[cycle+4].color = difColor //UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) 
platformImages[cycle+4].colorBlendFactor = difBlendFactor

vplatforms[cycle+4].color = difColor //UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) 
vplatforms[cycle+4].colorBlendFactor = difBlendFactor

if LFW == 1 {

platformImages[cycle+4].name = "lowwall"

}

 if (difPos == difMaxPos1200 || difPos == difMaxPos1350 || difPos == difMaxPos1500) && LFW == 0 {

platformImages[cycle+4].name = "float"

}


//add spike strip to vplatform on minPos jumps:

if (difPos == difMinPos1200 || difPos == difMinPos1350 || difPos == difMinPos1500) && LFW == 0 {


let spikestrip2 = SKSpriteNode(imageNamed: "floorForbid")
spikestrip2.size.height = platformheight
spikestrip2.size.width = platformwidth*0.5
spikestrip2.zPosition = platformZPos - 0.1
spikestrip2.color = UIColor(red: 0/255, green: 220/255, blue: 0/255, alpha: 1) 
spikestrip2.colorBlendFactor = 1.0


if vplatforms[cycle].name != "firstvplatform"  {

vplatforms[cycle].addChild(spikestrip2)
platformImages[cycle+4].name = "vine"
}


spikestrip2.position.x = 35

}

//end add spike strip



    }

        }


    



    

    if vw2 != 0 {
    vplatforms[cpos].size.width = vw2
    
} else { vplatforms[cpos].size.width = vplatformwidth }
    
    
    if vh2 != 0 {
    vplatforms[cpos].size.height = vh2
    
} else { vplatforms[cpos].size.height = vplatformheight }
    
    
    vplatforms[cpos].zPosition = platformZPos
    
    
    vplatforms[cycle].zPosition = platformZPos
    
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
    
    platforms[cpos].zPosition = platformZPos
    
    if platforms[cycle].parent == nil {
    
    platforms[cpos].position.x = platforms[cycle].position.x + make3size/3
    
    
    
} else {
    
    platforms[cpos].position.x = platforms[cycle].position.x + make3size/3
    
   
    }
    
    
    
    platforms[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: platforms[cpos].size) //CGSize(width: ppw, height: platforms[cpos].size.height)) //SKPhysicsBody(rectangleOfSize: platforms[cpos].size)
    platforms[cpos].physicsBody!.dynamic = false
    platforms[cpos].physicsBody!.usesPreciseCollisionDetection = true
    platforms[cpos].physicsBody!.friction = wallfriction
    platforms[cpos].physicsBody!.restitution = 0
    platforms[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
    platforms[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    platforms[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
    platforms[cpos].name = "platform"
platforms[cpos].removeFromParent()
    self.backgroundLayer.addChild(platforms[cpos])
    
   // checkfirstplat == 1 //what is this?


if castleType == 0 {
    
    platforms[cpos].position.y = self.size.height - platforms[cpos].size.height/2

}
        
        }









if castleType == 1 {

sml = CGFloat.random(min: 0, max: 1)
print("sml castletype 1 ")
    
    if sml > 0.82 {
    
    make3size = CGFloat.random(min: 1651, max: 1800)
    }
    
    if sml >= 0.18 && sml <= 0.82 {
    
    make3size = CGFloat.random(min: 1451, max: 1650)
    }
    
    if sml < 0.18 {
    
    make3size = CGFloat.random(min: 1400, max: 1450)
    
    }



}






    
if c == on {





//// *** // *** // *** // 10-2-15 print("make3size: \(make3size)")


    
if difThree <= difPer || (platforms[cycle+4].physicsBody!.charge + difMaxPos > maxPHeight && LFW == 0) {


if castleType == 0 {

sml = CGFloat.random(min: 0, max: 1)

if sml > 0.66 {
    
    make3size = CGFloat.random(min: 1350, max: 1501)
    }
    
    if sml >= 0.33 && sml <= 0.66 {
    
    make3size = CGFloat.random(min: 1250, max: 1349)
    }
    
    if sml < 0.33 {
    
    make3size = CGFloat.random(min: 1100, max: 1249)
    
    }
}



}

// make3size = 1550 //test PUT BACK

if difThree > difPer {

if platforms[cycle+4].physicsBody!.charge + difPos <= maxPHeight || LFW == 1 {

//difThreeWidth = 0//CGFloat.random(min: 0, max: 1.00)

//// *** // *** // *** // 10-2-15 print("difThreeWidth: \(difThreeWidth)")

if difThreeWidth <= 0.33 {

make3size = 1200

}

if difThreeWidth > 0.33 && difThreeWidth <= 0.66 {

make3size = 1350

}

if difThreeWidth > 0.66 {

make3size = 1425

}

difThreeWidth = make3size
    
    if printOn == 1 {
// *** // *** // *** // 10-2-15 print("make3size: \(make3size)")
    }

} else {
difOne = 10

}

if difThree > difPer && difOne < 9 {
platformImages[cpos2].color = difColor //UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) 
platformImages[cpos2].colorBlendFactor = difBlendFactor //0.5


vplatforms[cpos2].color = difColor //UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) 
vplatforms[cpos2].colorBlendFactor = difBlendFactor //0.5

if LFW == 1 {

platformImages[cpos2].name = "lowwall"

}

 if (difPos == difMaxPos1200 || difPos == difMaxPos1350 || difPos == difMaxPos1500) && LFW == 0 {

platformImages[cpos2].name = "float"

}

//add spike strip to vplatform on minPos jumps:

if (difPos == difMinPos1200 || difPos == difMinPos1350 || difPos == difMinPos1500) && LFW == 0 {
let spikestrip3 = SKSpriteNode(imageNamed: "floorForbid")
spikestrip3.size.height = platformheight
spikestrip3.size.width = platformwidth*0.5
spikestrip3.zPosition = platformZPos - 0.1
spikestrip3.color = UIColor(red: 0/255, green: 220/255, blue: 0/255, alpha: 1) 
spikestrip3.colorBlendFactor = 1.0

if vplatforms[cycle+4].name != "firstvplatform" {

vplatforms[cycle+4].addChild(spikestrip3)
platformImages[cpos2].name = "vine"

}

spikestrip3.position.x = 35

}

//end add spike strip


}


}
        
        


    
    
    
    if vw3 != 0 {
    vplatforms[cpos2].size.width = vw3
    
} else { vplatforms[cpos2].size.width = vplatformwidth }
    
    
    if vh3 != 0 {
    vplatforms[cpos2].size.height = vh3
    
} else { vplatforms[cpos2].size.height = vplatformheight }
    
    
    
    
    
    vplatforms[cpos2].zPosition = platformZPos
    
    
    vplatforms[cycle].zPosition = platformZPos
    
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
    // *** // *** // *** // 10-2-15 print(" cycle inside of make func: \(self.cycle)")
        }
        
    platforms[cpos2].size.width = platformwidth //shrink*make3size/12
platforms[cpos2].size.height = platformheight
    
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
    platforms[cpos2].zPosition = platformZPos
        
    
    if platforms[cpos].parent == nil {
    
    platforms[cpos2].position.x = platforms[cycle+3].position.x + make3size/3 // + 3
    
    
    
} else {
    
    platforms[cpos2].position.x = platforms[cpos].position.x + make3size/3
    
   
    
    }
    
       platforms[cpos2].physicsBody = SKPhysicsBody(rectangleOfSize: platforms[cpos2].size)  //CGSize(width: ppw, height: platforms[cpos2].size.height)) //SKPhysicsBody(rectangleOfSize: platforms[cpos2].size)
    // *** // *** // 10-2-15 print("platforms[cpos2].physicsBody: \(platforms[cpos2].physicsBody)")
    platforms[cpos2].physicsBody!.usesPreciseCollisionDetection = true
    platforms[cpos2].physicsBody!.friction = wallfriction
    platforms[cpos2].physicsBody!.restitution = 0
    platforms[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.block
    platforms[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    platforms[cpos2].physicsBody!.collisionBitMask = PhysicsCategory.bird
    platforms[cpos2].name = "platform"
        platforms[cpos2].physicsBody!.dynamic = false
platforms[cpos2].removeFromParent()
    self.backgroundLayer.addChild(platforms[cpos2])
    
if castleType == 0 {
    
    platforms[cpos2].position.y = self.size.height - platforms[cpos2].size.height/2

}
    
  //  checkfirstplat == 1 //what is this?
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
    // *** // *** // *** // 10-2-15 print("rolldice = \(rolldice)")
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
// *** // *** // 10-2-15 print("run firstbarriers")
    
    // infinite bounce test  vh1 = 4000
    //  ph1 = 1025 // 830// was 850 // was 835 //
    //    ph1 = 1050
    //   ph2 = 600
    //   ph3 = 650
    //    pw1 = 150
        // *** // *** // *** // 10-2-15 print("cycle after initialcount platform \(cycle)")
    ph1 = 0
    ph2 = 0
    ph3 = 0
    pw1 = 0
    
        let cpos: Int = cycle + 4
        let cpos2: Int = cycle + 8
            let firstPlatformHeight: CGFloat = 650
    startref = make3size
    // Testing sliding walls opening:
    
    
    //normal DO NOT CHANGE, SOME OF THE TESTS DEPEND ON THIS STAYING THE SAME!
    
    
    //   ********** DO NOT CHANGE ***********
    /*
    platforms[cpos2].position.x = make3size + 5*make3size/6 //DO NOT CHANGE
    platforms[cpos].position.x = make3size + 1*make3size/2 //DO NOT CHANGE
    platforms[cycle].position.x = make3size + make3size/6 //DO NOT CHANGE
    
    platforms[cpos2].position.y = -200 //DO NOT CHANGE
    platforms[cpos].position.y = -150 //DO NOT CHANGE
    platforms[cycle].position.y = -100 //DO NOT CHANGE
    */
    
    //   ********* END DO NOT CHANGE *********
    
    
    
    //   platforms[cpos2].position.x = make3size + 5*make3size/6 + 300
    //    platforms[cycle].position.x = platformst2.position.x + make3size/3 //- firstswadjust// make3size + make3size/6 + 300
    platforms[cpos].position.x = 368 //platformst3.position.x + 450// was + make3size/3 ---> 9/24/15 //- firstswadjust//make3size + 1*make3size/2 + 500
    
    // platforms[cycle].size.width = 150
    
    
    platformcount = platformcount + 1
    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    
    platforms[cpos].physicsBody!.linearDamping = 1
    platforms[cpos].physicsBody!.angularDamping = 0.1
    
    platformImages[cpos].texture =  SKTexture(imageNamed: "FrontWall")//SKTexture(imageNamed: "transparent") //"FrontWall")
    vplatforms[cpos].texture =  SKTexture(imageNamed: "FrontWall")//SKTexture(imageNamed: "transparent")//"FrontWall")
platformImages[cpos].color = castleColor
platformImages[cpos].colorBlendFactor = castleBlendFactor



vplatforms[cpos].name = "firstvplatform"

 
          
vplatforms[cpos].color = castleColor
vplatforms[cpos].colorBlendFactor = castleBlendFactor
    
    platforms[cpos].position.y = 200
   
    vplatforms[cpos].position.x = platforms[cpos].position.x
    vplatforms[cpos].position.y = platforms[cpos].position.y + 2048 + swgap - 2
    vplatforms[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cpos].size) //CGSize(width: 95, height: vplatforms[cpos].size.height))

    vplatforms[cpos].physicsBody!.dynamic = false
    vplatforms[cpos].physicsBody!.usesPreciseCollisionDetection = true
    vplatforms[cpos].physicsBody!.friction = wallfriction
    vplatforms[cpos].physicsBody!.restitution = 0
    vplatforms[cpos].name = "vplatform"
    vplatforms[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
    vplatforms[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    vplatforms[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
    vplatforms[cpos].physicsBody!.linearDamping = 1
    
   
worldNode.position.x = -bird2.position.x + self.size.width/2//-platforms[cpos].position.x + self.size.width/2 + 300
    vplatforms[cpos].physicsBody!.angularDamping = 0.1


vplatforms[cpos].removeAllActions()
platforms[cpos].removeAllActions()



    spikes[self.spikearraypos].removeFromParent()
    spikes[self.spikearraypos].name = "spike"
    spikes[self.spikearraypos].size.width = spikewidth // was 42 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight // was 42 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
    spikes[self.spikearraypos].position.x = 0
    spikes[self.spikearraypos].position.y = firstPlatformHeight/2 + spikes[self.spikearraypos].size.height/2 - 3
    //CGPoint(x: platforms[self.cycle].position.x , y: CGRectGetMaxY(platforms[self.cycle].frame) + 25)
    
    
    // spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
    spikes[self.spikearraypos].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
    
    spikes[self.spikearraypos].physicsBody!.dynamic = false
    spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
    spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.slidespike //.danger
    spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    spikes[self.spikearraypos].anchorPoint.x = 0.50
    spikes[self.spikearraypos].anchorPoint.y = 0.50

spikes[self.spikearraypos].color = UIColor(red: 70/255, green: 70/255, blue: 70/255, alpha: 1)
spikes[self.spikearraypos].colorBlendFactor = 1.0 

spikes[self.spikearraypos].zRotation = 0
  //  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(0, duration: 0))
  //  platforms[cpos].addChild(spikes[self.spikearraypos]) //REMOVED FOR opening walls TEST PUT BACK     

spikes[self.spikearraypos].texture = flippedTextureWithImageNamed("Spike")   
            
            floorForbidSign.size.width = 200
            floorForbidSign.size.height = 200
            floorForbidSign.position.x = platforms[cpos].position.x + 175
            floorForbidSign.position.y = CGRectGetMaxY(ground.frame) + 0.5*floorForbidSign.size.height
            floorForbidSign.zPosition = 3
            floorForbidSign.hidden = true
            backgroundLayer.addChild(floorForbidSign)
    
    //  self.backgroundLayer.addChild(spikes[self.spikearraypos])
    
    
    
    // *** // *** // *** // 10-2-15 print("firstCoin: \(firstCoin)")
    
    vplatforms[cpos].physicsBody!.charge = vplatforms[cpos].position.y - swgap/2
    platforms[cpos].physicsBody!.charge = platforms[cpos].position.y + swgap/2
    //TURNS ON FIRST COIN:
    
    
    if GameState.sharedInstance.highScore >= 5 {
    
    if firstCoin >= 0.9 {
    
    coins[cpos2].size.height = coinheight
    coins[cpos2].size.width = coinwidth
    coins[cpos2].position.x = vplatforms[cpos].position.x + 3*coinwidth/2
    coins[cpos2].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap/2
    coins[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
// *** // *** // 10-2-15 print("coins[cpos2].physicsBody: \(coins[cpos2].physicsBody)")
    coins[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[cpos2].physicsBody!.collisionBitMask = 0
    coins[cpos2].physicsBody!.affectedByGravity = false
    coins[cpos2].physicsBody!.angularDamping = CGFloat(cycle)
    coins[cpos2].name = "coin"
    coins[cpos2].zPosition = coinZPos
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
    coins[cpos].zPosition = coinZPos
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
    coins[cycle].zPosition = coinZPos
    backgroundLayer.addChild(coins[cycle])

/*
var light = SKLightNode()
light.position.x = 0
light.position.y = 0
light.zPosition = coinZPos
light.falloff = 1
light.ambientColor = UIColor.darkGrayColor()
light.lightColor = UIColor.whiteColor()
        coins[cycle].lightingBitMask = 1
        light.removeFromParent
coins[cycle].addChild(light)

var light2 = SKLightNode()
light2.position.x = 0
light2.position.y = 0
light2.zPosition = coinZPos
light2.falloff = 1
light2.ambientColor = UIColor.darkGrayColor()
light2.lightColor = UIColor.whiteColor()
        coins[cpos].lightingBitMask = 1
        light2.removeFromParent
coins[cpos].addChild(light2)

var light3 = SKLightNode()
light3.position.x = 0
light3.position.y = 0
light3.zPosition = coinZPos
light3.falloff = 1
light3.ambientColor = UIColor.darkGrayColor()
light3.lightColor = UIColor.whiteColor()
coins[cpos2].lightingBitMask = 1
light3.removeFromParent
coins[cpos2].addChild(light3)
*/

    
    }
    
    if firstCoin >= 0.6 && firstCoin < 0.9 {
    
    
    
    coins[cpos].size.height = coinheight
    coins[cpos].size.width = coinwidth
    coins[cpos].position.x = vplatforms[cpos].position.x
    coins[cpos].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap/3
    coins[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
// *** // *** // 10-2-15 print("coins[cpos].physicsBody: \(coins[cpos].physicsBody)")
    coins[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[cpos].physicsBody!.collisionBitMask = 0
    coins[cpos].physicsBody!.affectedByGravity = false
    coins[cpos].physicsBody!.angularDamping = CGFloat(cycle)
    coins[cpos].name = "coin"
    coins[cpos].zPosition = coinZPos
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
    coins[cycle].zPosition = coinZPos
    backgroundLayer.addChild(coins[cycle])
    
    }
    
    if firstCoin >= 0.5 && firstCoin < 0.6 {
    
    
    
    
    coins[cycle].size.height = coinheight
    coins[cycle].size.width = coinwidth
    coins[cycle].position.x = vplatforms[cpos].position.x
    coins[cycle].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap/2
    coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
// *** // *** // 10-2-15 print("coins[cycle].physicsBody: \(coins[cycle].physicsBody)")
    coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[cycle].physicsBody!.collisionBitMask = 0
    coins[cycle].physicsBody!.affectedByGravity = false
    coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins[cycle].name = "coin"
    coins[cycle].zPosition = coinZPos
    backgroundLayer.addChild(coins[cycle])
    
    }
    
    // *** // *** // 10-2-15 print("firstcoinpositions and parents: coins[cycle]: \(coins[cycle].position) \(coins[cycle].parent) coins[cpos]: \(coins[cpos].position) coins[cpos2]: \(coins[cpos].parent) coins[cpos2]: \(coins[cpos2].position) \(coins[cpos2].parent)")
    
    }
    
    
    //END TURNS ON FIRSTCOIN




firstBarrierXPos = platforms[cpos].position.x






 //print("initialcount: \(initialcount)")
     
            
            floorPos = CGRectGetMaxX(platforms[4].frame) - frontjagged1.size.width/2 + 50 + 2*frontjagged1.size.width // - 1//CGRectGetMinX(platforms[4].frame) - frontjagged1.size.width/2  //+ frontjaggeds[self.frontjaggedarraypos].size.width/2 - 30
            floorPos2 = CGRectGetMaxX(platforms[4].frame) - backjagged1.size.width/2 //+ backjaggeds[self.backjaggedarraypos].size.width/2 - 30
floorPos3 = CGRectGetMinX(platforms[4].frame) - roofwall1.size.width/2 - 75 + 2*(roofwall.size.width - 10)//- 20 - 70



beginroofwall.position.x = floorPos3 + beginroofwall.size.width - 5
beginroofwall.position.y = 1918
beginroofwall.zPosition = frontWallZPos
beginroofwall.color = castleColor//UIColor(red: 84/255, green: 84/255, blue: 84/255, alpha: 1.0)
beginroofwall.colorBlendFactor = castleBlendFactor//0//0.4
backgroundLayer.addChild(beginroofwall)
floorPos3 += beginroofwall.size.width
            


            print("initial floorPos: \(floorPos)")
            // *** // *** // 10-2-15 print("run initial floor pos")
        


    
    //  println("spikearraypos: \(spikearraypos)")
    
    spikes[self.spikearraypos].color = platformColor 
spikes[self.spikearraypos].colorBlendFactor = platformBlendFactor

    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }


    
    //   println("spikearraypos: \(spikearraypos)")
            spikes[self.spikearraypos].name = "spike"
spikes[self.spikearraypos].removeFromParent()
    spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
    spikes[self.spikearraypos].position.x = 0
    spikes[self.spikearraypos].position.y = -platformheight/2 - spikes[self.spikearraypos].size.height/2 + 8//+ 3
            
        
    
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


    
  //  vplatforms[cpos].addChild(spikes[self.spikearraypos]) //REMOVED FOR opening walls TEST PUT BACK
    

spikes[self.spikearraypos].texture = SKTexture(imageNamed: "Spike") 
    
spikes[self.spikearraypos].color = platformColor 
spikes[self.spikearraypos].colorBlendFactor = platformBlendFactor
    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }
    


platformSlots[cpos].position.y = castleFloor.position.y - 60
platformSlots[cpos].position.x = platforms[cpos].position.x
            platformSlots[cpos].size.height = 117
            platformSlots[cpos].size.width = 61 // was 58
platformSlots[cpos].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
platformSlots[cpos].colorBlendFactor = castleBlendFactor //0.5
platformSlots[cpos].zPosition = platformSlotZPos

//backgroundLayer.addChild(platformSlots[cpos])


vplatformSlots[cpos].position.y = castleCeiling.position.y + 60
vplatformSlots[cpos].position.x = vplatforms[cpos].position.x
vplatformSlots[cpos].size.height = 117
vplatformSlots[cpos].size.width = 61 // was 58
vplatformSlots[cpos].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
vplatformSlots[cpos].colorBlendFactor = castleBlendFactor //0.5
vplatformSlots[cpos].zPosition = platformSlotZPos
vplatformSlots[cpos].zRotation = 3.14159265

//backgroundLayer.addChild(vplatformSlots[cpos])



platformImages[cpos].position.y = 0



platformImages[cpos].position.x = 0

platformImages[cpos].zPosition = 0



platformImages[cpos].size.height = platformheight



platformImages[cpos].size.width = platformwidth


platformImages[cpos].removeFromParent()
platforms[4].addChild(platformImages[cpos])
            
            
            platformImages[cpos].size.height = firstPlatformHeight
            
            platformImages[cpos].position.y = 0 // member of platforms[cpos] //CGRectGetMinY(vplatforms[cpos].frame) - swgap - platformImages[cpos].size.height/2
            
            
            
            platforms[cpos].size.height = firstPlatformHeight
            platforms[cpos].position.y = CGRectGetMinY(vplatforms[cpos].frame) - swgap - platforms[cpos].size.height/2
            
            platforms[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: platformwidth, height: firstPlatformHeight))
            platforms[cpos].physicsBody!.dynamic = false
            platforms[cpos].physicsBody!.usesPreciseCollisionDetection = true
            platforms[cpos].physicsBody!.friction = wallfriction
            platforms[cpos].physicsBody!.restitution = 0
            platforms[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
            platforms[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
            platforms[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
            platforms[cpos].physicsBody!.angularDamping = CGFloat(cpos)
            platforms[cpos].physicsBody!.linearDamping = 10
            
            platforms[cpos].physicsBody!.charge = platforms[cpos].position.y
            
            
            openwindow.size.height = swgap + 30
openwindow.size.width = 250*(swgap+30)/342
            openwindow.position.x = CGRectGetMaxX(platforms[cpos].frame) - openwindow.size.width/2 + 30
openwindow.position.y = CGRectGetMaxY(platforms[cpos].frame) + openwindow.size.height/2//CGRectGetMinY(vplatforms[cpos].frame) - openwindow.size.height/2
backgroundLayer.addChild(openwindow)

            entryArc1.size.width = 68*1.5
            entryArc1.size.height = 47*1.5
            entryArc1.position.x = CGRectGetMinX(beginroofwall.frame) + entryArc1.size.width/2 + 15//beginroofwall.position.x - 150
            entryArc1.position.y = CGRectGetMinY(beginroofwall.frame) - entryArc1.size.height/2
            entryArc1.zPosition = backWallZPos
            backgroundLayer.addChild(entryArc1)
            
            entryArc2.size.width = 68*1.2
            entryArc2.size.height = 47*1.2
            entryArc2.position.x = CGRectGetMinX(platforms[cpos].frame) + entryArc2.size.width/2 - 4.5 //beginroofwall.position.x - 150
            entryArc2.position.y = CGRectGetMinY(platforms[cpos].frame) - entryArc2.size.height/2 + 2
            entryArc2.zPosition = backWallZPos
         //   entryArc2.zRotation = 3.14159
            backgroundLayer.addChild(entryArc2)


/*
platformImages[cpos].color = platformColor
platformImages[cpos].colorBlendFactor = platformBlendFactor

vplatforms[cpos].color = platformColor
vplatforms[cpos].colorBlendFactor = platformBlendFactor
*/

ground.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*ground.size.width - 30
ceiling.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*ceiling.size.width - 100
frontWall.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*frontWall.size.width + 50//- 100 // was - 30
castleFloor.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*castleFloor.size.width + 50//- 30
castleCeiling.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*castleCeiling.size.width //- 30
skyTop.position.x = CGRectGetMinX(platforms[4].frame) + 0.5*castleCeiling.size.width - 30


roofwallypos = 1917.5//CGRectGetMaxY(castleCeiling.frame) + roofwall.size.height/2 - 10 
print("roofwallypos: \(roofwallypos)")

exteriorWall.size.height = roofwallypos - roofwall.size.width/2 - castleFloor.position.y +  74
exteriorWall.size.width = 2000
exteriorWall.position.x = CGRectGetMaxX(platforms[cpos].frame) + exteriorWall.size.width/2 - 3//CGRectGetMinX(castleFloor.frame) + exteriorWall.size.width/2 + 150 //CGRectGetMinX(platforms[cpos].frame) + exteriorWall.size.width/2  - 10 //
exteriorWall.position.y = roofwallypos - roofwall.size.height/2 - exteriorWall.size.height/2 + 3
exteriorWall.zPosition = frontWallZPos
exteriorWall.color = castleColor
exteriorWall.colorBlendFactor = castleBlendFactor
exteriorWall.alpha = 1


bigwindow1.position.x = -exteriorWall.size.width/2 + bigwindow1.size.width/2
bigwindow1.position.y = 268 //exteriorWall.size.height/2
bigwindow1.zPosition = 1
//exteriorWall.addChild(bigwindow1)

entrance.size.height = 2310*1.06
entrance.size.width = 120//145
entrance.position.x = CGRectGetMaxX(platforms[cpos].frame) + 10//position.x //CGRectGetMaxX(platforms[cpos].frame) + entrance.size.width/2 + 80 //CGRectGetMinX(platforms[cpos].frame) - entrance.size.width/2 + 100
entrance.position.y = CGRectGetMinY(beginroofwall.frame) - 422 //- entrance.size.height/2
entrance.zPosition = backWallZPos + 0.5

if enterCastle == 0 {
entrance.alpha = 0

} else {

entrance.alpha = 1 

}

backgroundLayer.addChild(entrance)


window3.removeFromParent()
window3.position.y = 0
window3.position.x = -exteriorWall.size.width/2 + 200
window3.size.width = window3.size.width*2.0
window3.size.height = window3.size.height*2.0
window3.zPosition = frontWindowZPos
//exteriorWall.addChild(window3)

window4.removeFromParent()
window4.position.y = 0
window4.position.x = window3.position.x + 350
window4.size.width = window4.size.width*2.0
window4.size.height = window4.size.height*2.0
window4.zPosition = frontWindowZPos
//exteriorWall.addChild(window4)

window5.removeFromParent()
window5.position.y = 0
window5.position.x = window4.position.x + 350
window5.size.width = window5.size.width*2.0
window5.size.height = window5.size.height*2.0
window5.zPosition = frontWindowZPos
//exteriorWall.addChild(window5)


eWLB1.removeFromParent()
eWLB1.position.x = -exteriorWall.size.width/2 + 50
eWLB1.position.y = 0
eWLB1.zPosition = 100
exteriorWall.addChild(eWLB1)


eWLB2.removeFromParent()
eWLB2.position.x = -exteriorWall.size.width/2 + 300
eWLB2.position.y = 500
eWLB2.zPosition = 100
exteriorWall.addChild(eWLB2)


eWLB3.removeFromParent()
eWLB3.position.x = -exteriorWall.size.width/2 + 400
eWLB3.position.y = -500
eWLB3.zPosition = 100
exteriorWall.addChild(eWLB3)


eWLB4.removeFromParent()
eWLB4.position.x = -exteriorWall.size.width/2 + 500
eWLB4.position.y = 50
eWLB4.zPosition = 100
exteriorWall.addChild(eWLB4)


eWLB5.removeFromParent()
eWLB5.position.x = -exteriorWall.size.width/2 + 300
eWLB5.position.y = -200
eWLB5.zPosition = 100
exteriorWall.addChild(eWLB5)


eWDB1.removeFromParent()
eWDB1.position.x = -exteriorWall.size.width/2 + 150
eWDB1.position.y = 100
eWDB1.zPosition = 100
exteriorWall.addChild(eWDB1)


eWDB2.removeFromParent()
eWDB2.position.x = -exteriorWall.size.width/2 + 300
eWDB2.position.y = 500
eWDB2.zPosition = 100
exteriorWall.addChild(eWDB2)


eWDB3.removeFromParent()
eWDB3.position.x = -exteriorWall.size.width/2 + 400
eWDB3.position.y = -500
eWDB3.zPosition = 100
exteriorWall.addChild(eWDB3)


eWDB4.removeFromParent()
eWDB4.position.x = -exteriorWall.size.width/2 + 500
eWDB4.position.y = 50
eWDB4.zPosition = 100
exteriorWall.addChild(eWDB4)


eWDB5.removeFromParent()
eWDB5.position.x = -exteriorWall.size.width/2 + 300
eWDB5.position.y = -200
eWDB5.zPosition = 100
exteriorWall.addChild(eWDB5)



castleFloor.color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
castleFloor.colorBlendFactor = castleBlendFactor //0.5

castleCeiling.color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
castleCeiling.colorBlendFactor = castleBlendFactor//0.5

frontWall.color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
frontWall.colorBlendFactor = castleBlendFactor //0.5


ground.removeFromParent()
ceiling.removeFromParent()
frontWall.removeFromParent()
castleFloor.removeFromParent()
castleCeiling.removeFromParent()

            backgroundLayer.addChild(ground)
            backgroundLayer.addChild(castleFloor)

backgroundLayer.addChild(frontWall)

if castleType != 1 {
backgroundLayer.addChild(ceiling)

backgroundLayer.addChild(castleCeiling)

}


window1.position.y = castleFloor.position.y - 200
window1.position.x = platforms[4].position.x + 400
window1.zPosition = frontWindowZPos
backgroundLayer.addChild(window1)

window2.position.y = castleFloor.position.y - 200
window2.position.x = window1.position.x + 450
window2.zPosition = frontWindowZPos
backgroundLayer.addChild(window2)
    //   println("spikearraypos: \(spikearraypos)")
    
    
    
barrel1.position.y = castleFloor.position.y + 90
barrel1.position.x = platforms[4].position.x + 200
barrel1.zPosition = barrelZPos
//backgroundLayer.addChild(barrel1)

barrel2.position.y = castleFloor.position.y + 90
barrel2.position.x = barrel1.position.x + barrel2.size.width/2 + 50
barrel2.zPosition = barrelZPos
//backgroundLayer.addChild(barrel2)

barrel3.position.y = castleFloor.position.y + 90
barrel3.position.x = barrel2.position.x + barrel3.size.width/2 + 50
barrel3.zPosition = barrelZPos
//backgroundLayer.addChild(barrel3)

barrel4.position.y = castleFloor.position.y + 90
barrel4.position.x = barrel3.position.x + barrel4.size.width/2 + 50
barrel4.zPosition = barrelZPos
//backgroundLayer.addChild(barrel4)
    

barrel5.position.y = castleFloor.position.y + 90
barrel5.position.x = barrel4.position.x + barrel5.size.width/2 + 50
barrel5.zPosition = barrelZPos
//backgroundLayer.addChild(barrel5)
    
    
    
    
    
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
    vplatforms[cycle].physicsBody!.friction = wallfriction
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
            // *** // *** // 10-2-15 print("firstbarrier pos: \(platforms[cpos].position)")
            // *** // *** // 10-2-15 print("firstbarrier parent: \(platforms[cpos].parent)")
    
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
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].zPosition = spikeZPos
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

func slidingchains() {

if chaincycle < 3 {
    
   chaincycle++
    
    } else {
    
    chaincycle = 0
    
    }

var cpos: Int = chaincycle
    cpos += 4
    
    var cpos2: Int = chaincycle
    cpos2 += 8


if chaincycle == 0 && GameState.sharedInstance.score > 0 {

chains[chaincycle].position.x = chains[chaincycle+11].position.x + 550 //CGFloat.random(min: 366, max: 550)

} else {

if GameState.sharedInstance.score == 0 {

chains[chaincycle].position.x = platforms[cycle+4].position.x + 550 //CGFloat.random(min: 366, max: 550)

} else {

chains[chaincycle].position.x = chains[cpos2-1].position.x + 550 //CGFloat.random(min: 366, max: 550)

}

}

chains[chaincycle].position.y = self.size.height/2
chains[chaincycle].zPosition = platformZPos
chains[chaincycle].anchorPoint.x = 2.2
chains[chaincycle].name = "chain"
chains[chaincycle].physicsBody = SKPhysicsBody(rectangleOfSize: chains[chaincycle].size)
chains[chaincycle].physicsBody!.affectedByGravity = false
chains[chaincycle].physicsBody!.dynamic = false
chains[chaincycle].physicsBody!.friction = 0
chains[chaincycle].physicsBody!.restitution = 0
chains[chaincycle].physicsBody!.categoryBitMask = PhysicsCategory.chain
chains[chaincycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
chains[chaincycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
chains[chaincycle].removeFromParent()
backgroundLayer.addChild(chains[chaincycle])

chains[cpos].position.x = chains[chaincycle].position.x + 550 // CGFloat.random(min: 366, max: 550)
chains[cpos].position.y = self.size.height/2
chains[cpos].zPosition = platformZPos
chains[cpos].anchorPoint.x = 2.2
chains[cpos].name = "chain"
chains[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: chains[cpos].size)
chains[cpos].physicsBody!.affectedByGravity = false
chains[cpos].physicsBody!.dynamic = false
chains[cpos].physicsBody!.friction = 0
chains[cpos].physicsBody!.restitution = 0
chains[cpos].physicsBody!.categoryBitMask = PhysicsCategory.chain
chains[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
chains[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
chains[cpos].removeFromParent()
backgroundLayer.addChild(chains[cpos])

chains[cpos2].position.x = chains[cpos].position.x + 550 // CGFloat.random(min: 366, max: 550)
chains[cpos2].position.y = self.size.height/2
chains[cpos2].zPosition = platformZPos
chains[cpos2].anchorPoint.x = 2.2
chains[cpos2].name = "chain"
chains[cpos2].physicsBody = SKPhysicsBody(rectangleOfSize: chains[cpos2].size)
chains[cpos2].physicsBody!.affectedByGravity = false
chains[cpos2].physicsBody!.dynamic = false
chains[cpos2].physicsBody!.friction = 0
chains[cpos2].physicsBody!.restitution = 0
chains[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.chain
chains[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
chains[cpos2].physicsBody!.collisionBitMask = PhysicsCategory.bird
chains[cpos2].removeFromParent()
backgroundLayer.addChild(chains[cpos2])


func makesaw(saw: SKSpriteNode, pos: Int, ypos: CGFloat, max: CGFloat,  min: CGFloat, time: CGFloat, initial: Int) {


//let randompos = CGFloat.random(min: 600, max: 1348)

saw.removeAllActions()
saw.removeFromParent()
saw.size.height = sawheight
saw.size.width = sawwidth
saw.position.x = chains[pos].position.x - 60
saw.position.y = CGFloat(ypos)
saw.zPosition = platformZPos + 0.1
saw.physicsBody = SKPhysicsBody(circleOfRadius: sawwidth/2)
saw.physicsBody!.dynamic = false
saw.physicsBody!.affectedByGravity = false
saw.physicsBody!.categoryBitMask = PhysicsCategory.dart
saw.physicsBody!.contactTestBitMask = PhysicsCategory.bird
saw.name = "dart"

if GameState.sharedInstance.score > 0 {

backgroundLayer.addChild(saw)

}

saw.runAction(SKAction.repeatActionForever(SKAction.rotateByAngle(3.14159, duration: 0.5)))

var upordown: CGFloat = 0

if initial == -1 {

upordown = min

} else {


upordown = max

}

let initialmove = SKAction.moveToY(upordown, duration: NSTimeInterval(abs(time*(ypos - upordown)/124.66)))

let backup = SKAction.moveToY(max, duration: NSTimeInterval(time*(max-min)/124.64))
let backdown = SKAction.moveToY(min, duration: NSTimeInterval(time*(max-min)/124.64))


if initial == 1 {
saw.runAction(SKAction.sequence([initialmove, SKAction.repeatActionForever(SKAction.sequence([backdown, backup]))]))
} else {

saw.runAction(SKAction.sequence([initialmove, SKAction.repeatActionForever(SKAction.sequence([backup, backdown]))]))

}


if sawarraypos < 41 {

    sawarraypos++

} else {

    sawarraypos = 0
    
    }



}

func sawType(type: CGFloat, pos: Int) {

if type < 1 {

makesaw(saws[sawarraypos], pos: pos, ypos: 700, max: maxsawy, min: minsawy, time: 0.6, initial: -1)

}

if type >= 1 && type < 2 {

let startpos1: CGFloat = CGFloat.random(min: 0, max: (maxsawy + minsawy)/2 - sawheight/2 - minsawy)

makesaw(saws[sawarraypos], pos: pos, ypos: (maxsawy + minsawy)/2 + sawheight/2 + startpos1
 , max: maxsawy, min: (maxsawy + minsawy)/2 + sawheight/2, time: 1.0, initial: 1) 
makesaw(saws[sawarraypos], pos: pos, ypos: (maxsawy + minsawy)/2 - sawheight/2 - startpos1, max: (maxsawy + minsawy)/2 - sawheight/2, min: minsawy, time: 1.0, initial: -1)

}

if type >= 2 && type < 3 {

makesaw(saws[sawarraypos], pos: pos, ypos:1700, max: maxsawy, min: minsawy, time: 0.3, initial: -1)

}

if type >= 3 && type < 4 {

makesaw(saws[sawarraypos], pos: pos, ypos:1700, max: maxsawy, min: minsawy, time: 0.3, initial: -1)

makesaw(saws[sawarraypos], pos: pos, ypos: 700, max: maxsawy, min: minsawy, time: 1.0, initial: 1)

}




}

/*
var sawType1: CGFloat = 0 //CGFloat.random(min: 0, max: 4)
var sawType2: CGFloat = 0 //CGFloat.random(min: 0, max: 4)
var sawType3: CGFloat = 0 //CGFloat.random(min: 0, max: 4)
*/


if GameState.sharedInstance.score > 0 {

sawType(chaincount, pos: chaincycle)
chaincount += 1

}




sawType(chaincount, pos: cpos)

chaincount += 1

sawType(chaincount, pos: cpos2)

chaincount += 1





 if chaincycle == 0 {
    
    posA = CGRectGetMaxX(chains[chaincycle].frame)
    posB = CGRectGetMaxX(chains[cpos].frame)
    posC = CGRectGetMaxX(chains[cpos2].frame)
    
    }
    
    if chaincycle == 1 {
    
    posD = CGRectGetMaxX(chains[chaincycle].frame)
    posE = CGRectGetMaxX(chains[cpos].frame)
    posF = CGRectGetMaxX(chains[cpos2].frame)

    }
    
    if chaincycle == 2 {
    
    posG = CGRectGetMaxX(chains[chaincycle].frame)
    posH = CGRectGetMaxX(chains[cpos].frame)
    posI = CGRectGetMaxX(chains[cpos2].frame)
    
    }
    
    if chaincycle == 3 {
    
    posJ = CGRectGetMaxX(chains[chaincycle].frame)
    posK = CGRectGetMaxX(chains[cpos].frame)
    posL = CGRectGetMaxX(chains[cpos2].frame)
    
    }



}

func fallingplatforms() {



var cpos: Int = cycle
    cpos += 4
    
    var cpos2: Int = cycle
    cpos2 += 8
  
    
    platforms[cycle].physicsBody!.linearDamping = 10000
    platforms[cycle].physicsBody!.angularDamping = CGFloat(cycle)
platforms[cycle].physicsBody!.charge = platforms[cycle].position.y

platforms[cpos].physicsBody!.linearDamping = 10000
    platforms[cpos].physicsBody!.angularDamping = CGFloat(cpos)
platforms[cpos].physicsBody!.charge = platforms[cpos].position.y

platforms[cpos2].physicsBody!.linearDamping = 10000
    platforms[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
platforms[cpos2].physicsBody!.charge = platforms[cpos2].position.y


placecoins(cycle, cpos: cpos, cpos2: cpos2, level: 2)



/*
platformcount = platformcount + 1




/*
if platformcount == 40 {

achievementBarrier(platforms[cycle])

}
*/




    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    
    if platformcount <= 5 {
    
    coins[cycle].size.height = coinheight
    coins[cycle].size.width = coinwidth
    coins[cycle].position.x = platforms[cycle].position.x
    coins[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2 + coinheight/2 + 10//CGRectGetMaxY(platforms[cycle].frame) + coinheight/2 + 10
    
    coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cycle].physicsBody!.contactTestBitMask = 0
    coins[cycle].physicsBody!.collisionBitMask = 0
    coins[cycle].physicsBody!.affectedByGravity = false
    coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins[cycle].name = "coin"
    coins[cycle].zPosition = coinZPos
    coins[cycle].hidden = false
    backgroundLayer.addChild(coins[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cycle].size.height = coinheight
    coins2[cycle].size.width = coinwidth
    coins2[cycle].position.x = platforms[cycle].position.x
    coins2[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cycle].frame) + coinheight/2 + 10
    coins2[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cycle].physicsBody!.contactTestBitMask = 0
    coins2[cycle].physicsBody!.collisionBitMask = 0
    coins2[cycle].physicsBody!.affectedByGravity = false
    coins2[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins2[cycle].name = "coin2"
    coins2[cycle].zPosition = coinZPos // was 2 PUT BACK
    coins2[cycle].hidden = false
    backgroundLayer.addChild(coins2[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins2[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    if platformcount > 10 {
    
    coins3[cycle].size.height = coinheight
    coins3[cycle].size.width = coinwidth
    coins3[cycle].position.x = platforms[cycle].position.x
    
    coins3[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cycle].frame) + coinheight/2 + 10
    
    coins3[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cycle].physicsBody!.contactTestBitMask = 0
    coins3[cycle].physicsBody!.collisionBitMask = 0
    coins3[cycle].physicsBody!.affectedByGravity = false
    coins3[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins3[cycle].name = "coin3"
    coins3[cycle].zPosition = coinZPos // was 2 PUT BACK
    coins3[cycle].hidden = true
    backgroundLayer.addChild(coins3[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins3[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    platformcount = platformcount + 1


/*if platformcount == 40 {

achievementBarrier(platforms[cpos])

}*/

    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    if platformcount <= 5 {
    
    coins[cpos].size.height = coinheight
    coins[cpos].size.width = coinwidth
    coins[cpos].position.x = platforms[cpos].position.x
    coins[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cpos].frame) + coinheight/2 + 10
    coins[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos].physicsBody!.contactTestBitMask = 0
    coins[cpos].physicsBody!.collisionBitMask = 0
    coins[cpos].physicsBody!.affectedByGravity = false
    coins[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins[cpos].name = "coin"
    coins[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins[cpos].hidden = true
    backgroundLayer.addChild(coins[cpos])
    
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cpos].size.height = coinheight
    coins2[cpos].size.width = coinwidth
    coins2[cpos].position.x = platforms[cpos].position.x
    coins2[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cpos].frame) + coinheight/2 + 10
    coins2[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cpos].physicsBody!.contactTestBitMask = 0
    coins2[cpos].physicsBody!.collisionBitMask = 0
    coins2[cpos].physicsBody!.affectedByGravity = false
    coins2[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins2[cpos].name = "coin2"
    coins2[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins2[cpos].hidden = true
    backgroundLayer.addChild(coins2[cpos])
    
    }
    
    if platformcount > 10 {
    
    coins3[cpos].size.height = coinheight
    coins3[cpos].size.width = coinwidth
    coins3[cpos].position.x = platforms[cpos].position.x
    coins3[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cpos].frame) + coinheight/2 + 10
    coins3[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cpos].physicsBody!.contactTestBitMask = 0
    coins3[cpos].physicsBody!.collisionBitMask = 0
    coins3[cpos].physicsBody!.affectedByGravity = false
    coins3[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins3[cpos].name = "coin3"
    coins3[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins3[cpos].hidden = true
    backgroundLayer.addChild(coins3[cpos])
    
    }
    
    platformcount = platformcount + 1


/*
if platformcount == 40 {

achievementBarrier(platforms[cpos2])

}
*/

    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    if platformcount <= 5 {
    
    coins[cpos2].size.height = coinheight
    coins[cpos2].size.width = coinwidth
    coins[cpos2].position.x = platforms[cpos2].position.x
    coins[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cpos2].frame) + coinheight/2 + 10
    coins[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos2].physicsBody!.contactTestBitMask = 0
    coins[cpos2].physicsBody!.collisionBitMask = 0
    coins[cpos2].physicsBody!.affectedByGravity = false
    coins[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins[cpos2].name = "coin"
    coins[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins[cpos2].hidden = true
    
    
    backgroundLayer.addChild(coins[cpos2])
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cpos2].size.height = coinheight
    coins2[cpos2].size.width = coinwidth
    coins2[cpos2].position.x = platforms[cpos2].position.x
    coins2[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cpos2].frame) + coinheight/2 + 10
    coins2[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cpos2].physicsBody!.contactTestBitMask = 0
    coins2[cpos2].physicsBody!.collisionBitMask = 0
    coins2[cpos2].physicsBody!.affectedByGravity = false
    coins2[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins2[cpos2].name = "coin2"
    coins2[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins2[cpos2].hidden = true
    
    backgroundLayer.addChild(coins2[cpos2])
    }
    
    if platformcount > 10 {
    
    coins3[cpos2].size.height = coinheight
    coins3[cpos2].size.width = coinwidth
    coins3[cpos2].position.x = platforms[cpos2].position.x
    coins3[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2 + coinheight/2 + 10 //CGRectGetMaxY(platforms[cpos2].frame) + coinheight/2 + 10
    coins3[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cpos2].physicsBody!.contactTestBitMask = 0
    coins3[cpos2].physicsBody!.collisionBitMask = 0
    coins3[cpos2].physicsBody!.affectedByGravity = false
    coins3[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins3[cpos2].name = "coin3"
    coins3[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins3[cpos2].hidden = true
    
    backgroundLayer.addChild(coins3[cpos2])

    }
    
    */
    platforms[cycle].position.y = platforms[cycle].physicsBody!.charge
    platforms[cpos].position.y = platforms[cpos].physicsBody!.charge
    platforms[cpos2].position.y = platforms[cpos2].physicsBody!.charge
  

/*  
    platformImages[cycle].position.y = platforms[cycle].physicsBody!.charge
    platformImages[cpos].position.y = platforms[cpos].physicsBody!.charge
    platformImages[cpos2].position.y = platforms[cpos2].physicsBody!.charge
    
    platformImages[cycle].position.x = platforms[cycle].position.x
    platformImages[cpos].position.x = platforms[cpos].position.x
    platformImages[cpos2].position.x = platforms[cpos2].position.x

*/

 platformImages[cycle].position.y = 0
    platformImages[cpos].position.y = 0
    platformImages[cpos2].position.y = 0
    
    platformImages[cycle].position.x = 0
    platformImages[cpos].position.x = 0
    platformImages[cpos2].position.x = 0
    
    
    platformImages[cycle].zPosition = platformZPos - backgroundLayerZPos
    platformImages[cpos].zPosition = platformZPos - backgroundLayerZPos
    platformImages[cpos2].zPosition = platformZPos - backgroundLayerZPos
    
    platformImages[cycle].size.height = platformheight
    platformImages[cpos].size.height = platformheight
    platformImages[cpos2].size.height = platformheight
    
    platformImages[cycle].size.width = platformwidth
    platformImages[cpos].size.width = platformwidth
    platformImages[cpos2].size.width = platformwidth
    
    
    platformImages[cycle].removeFromParent()
    platformImages[cpos].removeFromParent()
    platformImages[cpos2].removeFromParent()
    
    platforms[cycle].addChild(platformImages[cycle])
    platforms[cpos].addChild(platformImages[cpos])
    platforms[cpos2].addChild(platformImages[cpos2])
    
    platformImages[cycle].color = platformColor 
    platformImages[cycle].colorBlendFactor = platformBlendFactor
    
    platformImages[cpos].color = platformColor 
    platformImages[cpos].colorBlendFactor = platformBlendFactor
    
    platformImages[cpos2].color = platformColor 
    platformImages[cpos2].colorBlendFactor = platformBlendFactor

    
    


print("platforms[cycle].size: \(platforms[cycle].size)")
print("platforms[cpos].size: \(platforms[cpos].size)")
print("platforms[cpos2].size: \(platforms[cpos2].size)")

print("platforms[cycle].position.y: \(platforms[cycle].position.y)")
print("platforms[cpos].position.y: \(platforms[cpos].position.y)")
print("platforms[cpos2].position.y: \(platforms[cpos2].position.y)")


print("platformImages[cycle].size: \(platformImages[cycle].size)")
print("platformImages[cpos].size: \(platformImages[cpos].size)")
print("platformImages[cpos2].size: \(platformImages[cpos2].size)")

print("platformImages[cycle].position.y: \(platformImages[cycle].position.y)")
print("platformImages[cpos].position.y: \(platformImages[cpos].position.y)")
print("platformImages[cpos2].position.y: \(platformImages[cpos2].position.y)")

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
    // *** // *** // *** // 10-2-15 print("score1: \(score1)")
    
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



}


func constantwalls() {

ph1 = 0
    ph2 = 0
    ph3 = 0
    
    
  







}


func placecoins(cycle: Int, cpos: Int, cpos2: Int, level: Int) {


platformcount = platformcount + 1




/*
if platformcount == 40 {

achievementBarrier(platforms[cycle])

}
*/




    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    
    if platformcount <= 5 {
    
    coins[cycle].size.height = coinheight
    coins[cycle].size.width = coinwidth
    coins[cycle].position.x = platforms[cycle].position.x
    coins[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cycle].frame) + coinheight/2 + 10


if level == 2 {

coins[cycle].position.y += coinheight/2 + 10

}
    
    coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[cycle].physicsBody!.collisionBitMask = 0
    coins[cycle].physicsBody!.affectedByGravity = false
    coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins[cycle].name = "coin"
    coins[cycle].zPosition = coinZPos
    coins[cycle].hidden = false
    backgroundLayer.addChild(coins[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cycle].size.height = coinheight
    coins2[cycle].size.width = coinwidth
    coins2[cycle].position.x = platforms[cycle].position.x
    coins2[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cycle].frame) + coinheight/2 + 10

if level == 2 {

coins2[cycle].position.y += coinheight/2 + 10

}

    coins2[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins2[cycle].physicsBody!.collisionBitMask = 0
    coins2[cycle].physicsBody!.affectedByGravity = false
    coins2[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins2[cycle].name = "coin2"
    coins2[cycle].zPosition = coinZPos // was 2 PUT BACK
    coins2[cycle].hidden = false
    backgroundLayer.addChild(coins2[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins2[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    if platformcount > 10 {
    
    coins3[cycle].size.height = coinheight
    coins3[cycle].size.width = coinwidth
    coins3[cycle].position.x = platforms[cycle].position.x
    
    coins3[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cycle].frame) + coinheight/2 + 10


if level == 2 {

coins3[cycle].position.y += coinheight/2 + 10

}
    
    coins3[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins3[cycle].physicsBody!.collisionBitMask = 0
    coins3[cycle].physicsBody!.affectedByGravity = false
    coins3[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins3[cycle].name = "coin3"
    coins3[cycle].zPosition = coinZPos // was 2 PUT BACK
    coins3[cycle].hidden = false
    backgroundLayer.addChild(coins3[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins3[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    platformcount = platformcount + 1


/*if platformcount == 40 {

achievementBarrier(platforms[cpos])

}*/

    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    if platformcount <= 5 {
    
    coins[cpos].size.height = coinheight
    coins[cpos].size.width = coinwidth
    coins[cpos].position.x = platforms[cpos].position.x
    coins[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cpos].frame) + coinheight/2 + 10

if level == 2 {

coins[cpos].position.y += coinheight/2 + 10

}
    coins[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[cpos].physicsBody!.collisionBitMask = 0
    coins[cpos].physicsBody!.affectedByGravity = false
    coins[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins[cpos].name = "coin"
    coins[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins[cpos].hidden = false
    backgroundLayer.addChild(coins[cpos])
    
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cpos].size.height = coinheight
    coins2[cpos].size.width = coinwidth
    coins2[cpos].position.x = platforms[cpos].position.x
    coins2[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cpos].frame) + coinheight/2 + 10

if level == 2 {

coins2[cpos].position.y += coinheight/2 + 10

}
    coins2[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins2[cpos].physicsBody!.collisionBitMask = 0
    coins2[cpos].physicsBody!.affectedByGravity = false
    coins2[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins2[cpos].name = "coin2"
    coins2[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins2[cpos].hidden = false
    backgroundLayer.addChild(coins2[cpos])
    
    }
    
    if platformcount > 10 {
    
    coins3[cpos].size.height = coinheight
    coins3[cpos].size.width = coinwidth
    coins3[cpos].position.x = platforms[cpos].position.x
    coins3[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cpos].frame) + coinheight/2 + 10

if level == 2 {

coins3[cpos].position.y += coinheight/2 + 10

}

    coins3[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins3[cpos].physicsBody!.collisionBitMask = 0
    coins3[cpos].physicsBody!.affectedByGravity = false
    coins3[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins3[cpos].name = "coin3"
    coins3[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins3[cpos].hidden = false
    backgroundLayer.addChild(coins3[cpos])
    
    }
    
    platformcount = platformcount + 1


/*
if platformcount == 40 {

achievementBarrier(platforms[cpos2])

}
*/

    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    if platformcount <= 5 {
    
    coins[cpos2].size.height = coinheight
    coins[cpos2].size.width = coinwidth
    coins[cpos2].position.x = platforms[cpos2].position.x
    coins[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cpos2].frame) + coinheight/2 + 10

if level == 2 {

coins[cpos2].position.y += coinheight/2 + 10

}

    coins[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[cpos2].physicsBody!.collisionBitMask = 0
    coins[cpos2].physicsBody!.affectedByGravity = false
    coins[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins[cpos2].name = "coin"
    coins[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins[cpos2].hidden = false
    
    
    backgroundLayer.addChild(coins[cpos2])
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cpos2].size.height = coinheight
    coins2[cpos2].size.width = coinwidth
    coins2[cpos2].position.x = platforms[cpos2].position.x
    coins2[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cpos2].frame) + coinheight/2 + 10


if level == 2 {

coins2[cpos2].position.y += coinheight/2 + 10

}


    coins2[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins2[cpos2].physicsBody!.collisionBitMask = 0
    coins2[cpos2].physicsBody!.affectedByGravity = false
    coins2[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins2[cpos2].name = "coin2"
    coins2[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins2[cpos2].hidden = false
    
    backgroundLayer.addChild(coins2[cpos2])
    }
    
    if platformcount > 10 {
    
    coins3[cpos2].size.height = coinheight
    coins3[cpos2].size.width = coinwidth
    coins3[cpos2].position.x = platforms[cpos2].position.x
    coins3[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2 //CGRectGetMaxY(platforms[cpos2].frame) + coinheight/2 + 10


if level == 2 {

coins3[cpos2].position.y += coinheight/2 + 10

}

    coins3[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins3[cpos2].physicsBody!.collisionBitMask = 0
    coins3[cpos2].physicsBody!.affectedByGravity = false
    coins3[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins3[cpos2].name = "coin3"
    coins3[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins3[cpos2].hidden = false
    
    backgroundLayer.addChild(coins3[cpos2])

    }
    




}
        
        func slidingwalls() {
        
var cpos: Int = cycle
    cpos += 4
    
    var cpos2: Int = cycle
    cpos2 += 8

    platforms[cycle].physicsBody!.linearDamping = 15000
    platforms[cycle].physicsBody!.angularDamping = CGFloat(cycle)
   

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
    
            
 
            if cycle != 0 {
                
                platformBeforeFirst = cycle - 1 + 8
                
            } else {
                
                platformBeforeFirst = cycle + 3 + 8 // was + 2 + 8 by mistake
            }

if makeOne == 1 {
    
    
       
  
    
    
   

if difOne <= difPer {
    
    
    if platforms[platformBeforeFirst].parent != nil {

    
    if platforms[platformBeforeFirst].physicsBody!.charge + platformMinNA > maxPHeight { // if no critical area to worry about. Critical area is only higher than previous platform
    
    platforms[cycle].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight) // this was max: maxPHeight - platformMaxNA - 50  but there's no reason for this. Should be minPHeight and max: maxPHeight since maxPheight is below the critical area. Change made 10-8-15

 
} else {
    
    if platforms[platformBeforeFirst].physicsBody!.charge + platformMinNA <= maxPHeight {
    
    secondMin1 = platforms[platformBeforeFirst].physicsBody!.charge + platformMaxNA + 1
    secondMax1 = platforms[platformBeforeFirst].physicsBody!.charge + platformMinNA - 1
   
    gateOne = CGFloat.random(min: 0, max: totalLength)
    

    
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

//platforms[cycle].hidden = true // put back, remove, used this for testing


}
    


if difTwo > 9 {

// *** // *** // *** // 10-2-15 print("ran difTwo == 10")
platforms[cycle].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - difMaxPos1500 - 5) // goes by highest difMaxPos


}
            



            
            }




if makeTwo == 1 {
    
   
   


platforms[cpos].physicsBody!.angularDamping = CGFloat(cycle + 4) // REMOVED FOR OPENING WALLS TEST. PUT BACK

platforms[cpos].physicsBody!.linearDamping = 15000 // REMOVED FOR OPENING WALLS TEST. PUT BACK


            
    
           // *** // *** // *** // 10-2-15 print("finished first platform charge")

if cycle != 0 {

platformBeforeSecond = cycle //- 1 + 8

} else {

platformBeforeSecond = cycle //+ 2 + 8
}

if difTwo <= difPer {
    
    if platforms[platformBeforeSecond].parent != nil {
    
    // *** // *** // *** // 10-2-15 print("platforms[platformBeforeSecond].physicsBody!.charge: \(platforms[platformBeforeSecond].physicsBody!.charge)")
    // *** // *** // *** // 10-2-15 print("platformMinNA: \(platformMinNA)")
    // *** // *** // *** // 10-2-15 print("maxPHeight: \(maxPHeight)")
    
    
    if platforms[platformBeforeSecond].physicsBody!.charge + platformMinNA > maxPHeight { // if no critical area to worry about. Critical area is only higher than previous platform
    
    platforms[cpos].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight) // was max: maxPHeight - platformMaxNA - 50
    // *** // *** // *** // 10-2-15 print("no critical area")
    
} else {
    
    if platforms[platformBeforeSecond].physicsBody!.charge + platformMinNA <= maxPHeight {
    
    secondMin2 = platforms[platformBeforeSecond].physicsBody!.charge + platformMaxNA + 1
    secondMax2 = platforms[platformBeforeSecond].physicsBody!.charge + platformMinNA - 1
    
    // *** // *** // *** // 10-2-15 print("secondMin2: \(secondMin2)")
    // *** // *** // *** // 10-2-15 print("secondMax2: \(secondMax2)")
    
    
    gateTwo = CGFloat.random(min: 0, max: totalLength)
    
    // *** // *** // *** // 10-2-15 print("totalLength: \(totalLength)")
    // *** // *** // *** // 10-2-15 print("gateTwo: \(gateTwo)")
    
    // *** // *** // *** // 10-2-15 print("minPHeight: \(minPHeight)")
    
    if gateTwo > (secondMax2 - minPHeight) && maxPHeight > secondMin2 {

if maxPHeight - platforms[platformBeforeSecond].physicsBody!.charge > maxIncrease {

platforms[cpos].physicsBody!.charge = CGFloat.random(min: secondMin2, max: platforms[platformBeforeSecond].physicsBody!.charge + maxIncrease)


}
    
if maxPHeight - platforms[platformBeforeSecond].physicsBody!.charge <= maxIncrease {


    platforms[cpos].physicsBody!.charge = CGFloat.random(min: secondMin2, max: maxPHeight)
    // *** // *** // *** // 10-2-15 print("1 platforms[cpos].physicsBody!.charge: \(platforms[cpos].physicsBody!.charge)")

}



} else {
    
    platforms[cpos].physicsBody!.charge = CGFloat.random(min: minPHeight, max: secondMax2)
    // *** // *** // *** // 10-2-15 print("2 platforms[cpos].physicsBody!.charge: \(platforms[cpos].physicsBody!.charge)")
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

//platforms[cpos].hidden = true // put back, remove, used this for testing

}

    
    

if difThree > 9 {

// *** // *** // *** // 10-2-15 print("ran difThree == 10")
platforms[cycle+4].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - difMaxPos1500 - 5) // goes by highest difMaxPos


}
    }



    if makeThree == 1 {
        
        
        vplatforms[cycle].removeAllActions()
platforms[cycle].removeAllActions()
vplatforms[cpos].removeAllActions()
platforms[cpos].removeAllActions()
vplatforms[cpos2].removeAllActions()
platforms[cpos2].removeAllActions()


platforms[cpos2].physicsBody!.linearDamping = 15000 // REMOVED FOR OPENING WALLS TEST. PUT BACK
platforms[cpos2].physicsBody!.angularDamping = CGFloat(cycle + 8) // REMOVED FOR OPENING WALLS TEST. PUT BACK




 // *** // *** // *** // 10-2-15 print("finished second platform charge")
            
if cycle != 0 {

platformBeforeThird = cycle + 4//- 1 + 8

} else {

platformBeforeThird = cycle + 4//+ 2 + 8
}


if difThree <= difPer {
    
    

    
    
    if platforms[platformBeforeThird].parent != nil {
    
    // *** // *** // *** // 10-2-15 print("platforms[platformBeforeThird].physicsBody!.charge: \(platforms[platformBeforeThird].physicsBody!.charge)")
    // *** // *** // *** // 10-2-15 print("platformMinNA: \(platformMinNA)")
    // *** // *** // *** // 10-2-15 print("maxPHeight: \(maxPHeight)")
    
    if platforms[platformBeforeThird].physicsBody!.charge + platformMinNA > maxPHeight { // if no critical area to worry about. Critical area is only higher than previous platform
    // *** // *** // *** // 10-2-15 print("no critical area")
    platforms[cpos2].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight) // was max: maxPHeight - platformMaxNA - 50, changed 10-8-15
    
} else {
    
    if platforms[platformBeforeThird].physicsBody!.charge + platformMinNA <= maxPHeight {
    
    secondMin3 = platforms[platformBeforeThird].physicsBody!.charge + platformMaxNA + 1
    secondMax3 = platforms[platformBeforeThird].physicsBody!.charge + platformMinNA - 1
    
    // *** // *** // *** // 10-2-15 print("secondMin3: \(secondMin3)")
    // *** // *** // *** // 10-2-15 print("secondMax3: \(secondMax3)")
    
    gateThree = CGFloat.random(min: 0, max: totalLength)
    
    // *** // *** // *** // 10-2-15 print("totalLength: \(totalLength)")
    // *** // *** // *** // 10-2-15 print("gateThree: \(gateThree)")
    
    // *** // *** // *** // 10-2-15 print("minPHeight: \(minPHeight)")

    if gateThree > (secondMax3 - minPHeight) && maxPHeight > secondMin3 {
    
if maxPHeight - platforms[platformBeforeThird].physicsBody!.charge > maxIncrease {

platforms[cpos2].physicsBody!.charge = CGFloat.random(min: secondMin3, max: platforms[platformBeforeThird].physicsBody!.charge + maxIncrease)

}

if maxPHeight - platforms[platformBeforeThird].physicsBody!.charge <= maxIncrease {

platforms[cpos2].physicsBody!.charge = CGFloat.random(min: secondMin3, max: maxPHeight)

}


    // *** // *** // *** // 10-2-15 print("1 platforms[cpos2].physicsBody!.charge: \(platforms[cpos2].physicsBody!.charge)")



} else {
    
    platforms[cpos2].physicsBody!.charge = CGFloat.random(min: minPHeight, max: secondMax3)
    // *** // *** // *** // 10-2-15 print("2 platforms[cpos2].physicsBody!.charge: \(platforms[cpos2].physicsBody!.charge)")
    }
    
    }
    
    }
    
    }
        }
    
    
//platforms[cpos2].physicsBody!.charge = platforms[cpos].physicsBody!.charge + 310

    // *** // *** // *** // 10-2-15 print("difOne before checking for 10 on makeThree: \(difOne)")

if difThree > difPer && difOne < 9 && LFW == 0 {





platforms[cpos2].physicsBody!.charge = platforms[platformBeforeThird].physicsBody!.charge + difPos


}


if difThree > difPer && difOne < 9 && LFW == 1 {





platforms[cpos2].physicsBody!.charge = difLowPos

//platforms[cpos2].hidden = true // put back, remove, used this for testing


}




if difOne > 9 {

// *** // *** // *** // 10-2-15 print("ran difOne == 10")
platforms[cycle+8].physicsBody!.charge = CGFloat.random(min: minPHeight, max: maxPHeight - difMaxPos1500 - 5) // goes by highest difMaxPos


}



// *** // *** // *** // 10-2-15 print("finished third  platform charge")


    
    if platforms[platformBeforeFirst].parent != nil {
    // *** // *** // *** // 10-2-15 print("Y Pos difference P1 and P3(-1): \(platforms[cycle].physicsBody!.charge - platforms[platformBeforeFirst].physicsBody!.charge) P2 an P1: \(platforms[cpos].physicsBody!.charge - platforms[cycle].physicsBody!.charge) P3 and P2: \(platforms[cpos2].physicsBody!.charge - platforms[cpos].physicsBody!.charge)")
    }
    
    if platforms[platformBeforeFirst].parent == nil {
    // *** // *** // *** // 10-2-15 print("Y Pos difference P2 an P1: \(platforms[cpos].physicsBody!.charge - platforms[cycle].physicsBody!.charge) P3 and P2: \(platforms[cpos2].physicsBody!.charge - platforms[cpos].physicsBody!.charge)")
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
    
    
    
    /* // REMOVED FOR VARIABLE WIDTH
    platforms[cycle].position.x = platforms[cycle].position.x - firstswadjust //REMOVED FOR TEST PUT BACK
    platforms[cpos].position.x = platforms[cpos].position.x - firstswadjust
    platforms[cpos2].position.x  = platforms[cpos2].position.x - firstswadjust
    
    
    vplatforms[cpos].position.x = platforms[cpos].position.x
    vplatforms[cpos2].position.x = platforms[cpos2].position.x
    
    vplatforms[self.cycle].position.x = platforms[self.cycle].position.x
    */

if platforms[platformBeforeFirst].parent != nil {

floorForbids[cycle].size.width = platforms[cycle].position.x
floorForbids[cycle].size.width -= platforms[platformBeforeFirst].position.x
floorForbids[cycle].size.width -= platformwidth

floorForbids[cycle].size.height = floorForbidHeight

floorForbids[cycle].position.x = (platforms[cycle].position.x + platforms[platformBeforeFirst].position.x)/2
floorForbids[cycle].position.y = ffYPos
    // *** // *** // 10-2-15 print("floorForbids[cycle].position.y: \(floorForbids[cycle].position.y)")

floorForbids[cycle].zPosition = floorForbidZPos
floorForbids[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: floorForbids[cycle].size)
floorForbids[cycle].physicsBody!.affectedByGravity = false
floorForbids[cycle].physicsBody!.categoryBitMask = PhysicsCategory.danger
floorForbids[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
floorForbids[cycle].physicsBody!.collisionBitMask = 0
floorForbids[cycle].name = "floorForbid"

self.backgroundLayer.addChild(floorForbids[cycle])



floorSpikes[floorSpikeCycle].removeFromParent()
floorSpikes[floorSpikeCycle].position.x = 0
floorSpikes[floorSpikeCycle].position.y = 60
floorSpikes[floorSpikeCycle].zPosition = 0
floorSpikes[floorSpikeCycle].name = "floorspike"
    floorSpikes[floorSpikeCycle].size.width = spikewidth // was 42 8/3/15
    floorSpikes[floorSpikeCycle].size.height = spikeheight // was 42 8/3/15
    floorSpikes[floorSpikeCycle].zPosition = 0

    floorSpikes[floorSpikeCycle].physicsBody = SKPhysicsBody(polygonFromPath: trianglePath)
    
    floorSpikes[floorSpikeCycle].physicsBody!.dynamic = false
    floorSpikes[floorSpikeCycle].physicsBody?.affectedByGravity = false
    floorSpikes[floorSpikeCycle].physicsBody!.categoryBitMask = PhysicsCategory.danger //.danger
    floorSpikes[floorSpikeCycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
 //   floorSpikes[floorSpikeCycle].anchorPoint.x = 0.50
 //   floorSpikes[floorSpikeCycle].anchorPoint.y = 0.50
 //   floorSpikes[floorSpikeCycle].runAction(SKAction.rotateByAngle(0, duration: 0))
floorForbids[cycle].addChild(floorSpikes[floorSpikeCycle])




spikeSlots[floorSpikeCycle].removeFromParent()
spikeSlots[floorSpikeCycle].position = floorForbids[cycle].convertPoint(CGPoint(x: floorSpikes[floorSpikeCycle].position.x, y: floorSpikes[floorSpikeCycle].position.y), toNode: self.backgroundLayer)
spikeSlots[floorSpikeCycle].position.y = castleFloor.position.y - spikeSlots[floorSpikeCycle].size.height/2
spikeSlots[floorSpikeCycle].zPosition = 800//floorForbidZPos + 0.5
backgroundLayer.addChild(spikeSlots[floorSpikeCycle])

backSpikeSlots[floorSpikeCycle].removeFromParent()
backSpikeSlots[floorSpikeCycle].position.x = spikeSlots[floorSpikeCycle].position.x
backSpikeSlots[floorSpikeCycle].position.y = CGRectGetMaxY(spikeSlots[floorSpikeCycle].frame)
backSpikeSlots[floorSpikeCycle].zPosition = floorForbidZPos - 0.5
backgroundLayer.addChild(backSpikeSlots[floorSpikeCycle])

//backSpikeSlots[floorSpikeCycle] 





if floorSpikeCycle < 2 {

floorSpikeCycle += 1

} else {

floorSpikeCycle = 0


}



 
        }

if noOfCars > 1 {

makemsgxpos1 = platforms[cycle].position.x
makemsgcharge1 = platforms[cycle].physicsBody!.charge
makemsgcyclepos1 = Int(platforms[cycle].physicsBody!.angularDamping)    

makemsgxpos2 = platforms[cpos].position.x
makemsgcharge2 = platforms[cpos].physicsBody!.charge
makemsgcyclepos2 = Int(platforms[cpos].physicsBody!.angularDamping)

makemsgxpos3 = platforms[cpos2].position.x
makemsgcharge3 = platforms[cpos2].physicsBody!.charge
makemsgcyclepos3 = Int(platforms[cpos2].physicsBody!.angularDamping)

makemsgcounter = startmakemsgcounter
    
   

    // *** // *** // 10-2-15 print("assigned makemsgcounter and data")
}


    vplatforms[cycle].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cycle].size) //CGSize(width: ppw, height: vplatforms[cycle].size.height)) //SKPhysicsBody(rectangleOfSize: vplatforms[cycle].size)
    vplatforms[cycle].physicsBody!.dynamic = false
    vplatforms[cycle].physicsBody!.usesPreciseCollisionDetection = true
    vplatforms[cycle].physicsBody!.friction = wallfriction
    vplatforms[cycle].physicsBody!.restitution = 0
    vplatforms[cycle].physicsBody!.categoryBitMask = PhysicsCategory.block
    vplatforms[cycle].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    vplatforms[cycle].physicsBody!.collisionBitMask = PhysicsCategory.bird
    vplatforms[self.cycle].position.y = platforms[self.cycle].position.y + 2048 - 2 //+ swgap
    vplatforms[self.cycle].physicsBody!.linearDamping = 15000
    vplatforms[cycle].name = "vplatform"
    vplatforms[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    
    // Take out spikes for opening walls test



floorForbids[cpos].size.width = platforms[cpos].position.x
floorForbids[cpos].size.width -= platforms[cycle].position.x
floorForbids[cpos].size.width -= platformwidth

floorForbids[cpos].size.height = floorForbidHeight

floorForbids[cpos].position.x = (platforms[cpos].position.x + platforms[cycle].position.x)/2
floorForbids[cpos].position.y = ffYPos

floorForbids[cpos].zPosition = floorForbidZPos
floorForbids[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: floorForbids[cpos].size)
floorForbids[cpos].physicsBody!.affectedByGravity = false
floorForbids[cpos].physicsBody!.categoryBitMask = PhysicsCategory.danger
floorForbids[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
floorForbids[cpos].physicsBody!.collisionBitMask = 0
floorForbids[cpos].name = "floorForbid"

self.backgroundLayer.addChild(floorForbids[cpos])




    vplatforms[cpos].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cpos].size) //CGSize(width: ppw, height: vplatforms[cpos].size.height)) //SKPhysicsBody(rectangleOfSize: vplatforms[cpos].size)
    vplatforms[cpos].physicsBody!.dynamic = false
    vplatforms[cpos].physicsBody!.usesPreciseCollisionDetection = true
    vplatforms[cpos].physicsBody!.friction = wallfriction
    vplatforms[cpos].physicsBody!.restitution = 0
    vplatforms[cpos].name = "vplatform"
    vplatforms[cpos].physicsBody!.categoryBitMask = PhysicsCategory.block
    vplatforms[cpos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    vplatforms[cpos].physicsBody!.collisionBitMask = PhysicsCategory.bird
    vplatforms[cpos].physicsBody!.linearDamping = 15000



floorForbids[cpos2].size.width = platforms[cpos2].position.x
floorForbids[cpos2].size.width -= platforms[cpos].position.x
floorForbids[cpos2].size.width -= platformwidth

floorForbids[cpos2].size.height = floorForbidHeight

floorForbids[cpos2].position.x = (platforms[cpos2].position.x + platforms[cpos].position.x)/2
floorForbids[cpos2].position.y = ffYPos

floorForbids[cpos2].zPosition = floorForbidZPos
floorForbids[cpos2].physicsBody = SKPhysicsBody(rectangleOfSize: floorForbids[cpos2].size)
floorForbids[cpos2].physicsBody!.affectedByGravity = false
floorForbids[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.danger
floorForbids[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
floorForbids[cpos2].physicsBody!.collisionBitMask = 0
floorForbids[cpos2].name = "floorForbid"

self.backgroundLayer.addChild(floorForbids[cpos2])

// *** // *** // 10-2-15 print("floorForbids[cpos].position.x = \(floorForbids[cpos].position.x)")
// *** // *** // 10-2-15 print("floorForbids[cpos].position.y = \(floorForbids[cpos].position.y)")
// *** // *** // 10-2-15 print("floorForbids[cpos].parent = \(floorForbids[cpos].parent)")
// *** // *** // 10-2-15 print("platforms[cpos].position.x = \(platforms[cpos].position.x)")

    vplatforms[cpos2].physicsBody = SKPhysicsBody(rectangleOfSize: vplatforms[cpos2].size) //CGSize(width: ppw, height: vplatforms[cpos2].size.height)) //SKPhysicsBody(rectangleOfSize: vplatforms[cpos2].size)
    vplatforms[cpos2].physicsBody!.dynamic = false
    vplatforms[cpos2].physicsBody!.usesPreciseCollisionDetection = true
    vplatforms[cpos2].physicsBody!.friction = wallfriction
    vplatforms[cpos2].physicsBody!.linearDamping = 15000
    vplatforms[cpos2].physicsBody!.restitution = 0
    vplatforms[cpos2].name = "vplatform"
    vplatforms[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.block
    vplatforms[cpos2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    vplatforms[cpos2].physicsBody!.collisionBitMask = PhysicsCategory.bird
    
    
    vplatforms[cpos].physicsBody!.angularDamping = CGFloat(cycle + 4)
    vplatforms[cpos2].physicsBody!.angularDamping = CGFloat(cycle + 8)
    
/*
    vplatforms[cycle].physicsBody!.charge = vplatforms[cycle].position.y
    vplatforms[cpos].physicsBody!.charge = vplatforms[cpos].position.y
    vplatforms[cpos2].physicsBody!.charge = vplatforms[cpos2].position.y
    
    */

    platforms[cycle].position.y = size.height/2
    platforms[cpos].position.y = size.height/2
    platforms[cpos2].position.y = size.height/2



vplatformSlots[cycle].name = "expendable1"
if vplatformSlots[cycle].position.x >= noRoofABegin && vplatformSlots[cycle].position.x <= noRoofAEnd {


vplatformSlots[cycle].hidden = true

} else {

vplatformSlots[cycle].hidden = false

}








    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    
//placecoins(cycle, cpos: cpos, cpos2: cpos2, level: 1)




    platformcount = platformcount + 1


if platformcount == 40 {

achievementBarrier(platforms[cycle])

}





    if platformcount <= 5 {
    
    coins[cycle].size.height = coinheight
    coins[cycle].size.width = coinwidth
    coins[cycle].position.x = vplatforms[cycle].position.x
    coins[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2
    
    coins[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cycle].physicsBody!.contactTestBitMask = 0
    coins[cycle].physicsBody!.collisionBitMask = 0
    coins[cycle].physicsBody!.affectedByGravity = false
    coins[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins[cycle].name = "coin"
    coins[cycle].zPosition = coinZPos
    coins[cycle].hidden = true
    backgroundLayer.addChild(coins[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cycle].size.height = coinheight
    coins2[cycle].size.width = coinwidth
    coins2[cycle].position.x = vplatforms[cycle].position.x
    coins2[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2
    coins2[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cycle].physicsBody!.contactTestBitMask = 0
    coins2[cycle].physicsBody!.collisionBitMask = 0
    coins2[cycle].physicsBody!.affectedByGravity = false
    coins2[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins2[cycle].name = "coin2"
    coins2[cycle].zPosition = coinZPos // was 2 PUT BACK
    coins2[cycle].hidden = true
    backgroundLayer.addChild(coins2[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins2[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    if platformcount > 10 {
    
    coins3[cycle].size.height = coinheight
    coins3[cycle].size.width = coinwidth
    coins3[cycle].position.x = vplatforms[cycle].position.x
    
    coins3[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight/2
    
    coins3[cycle].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cycle].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cycle].physicsBody!.contactTestBitMask = 0
    coins3[cycle].physicsBody!.collisionBitMask = 0
    coins3[cycle].physicsBody!.affectedByGravity = false
    coins3[cycle].physicsBody!.angularDamping = CGFloat(cycle)
    coins3[cycle].name = "coin3"
    coins3[cycle].zPosition = coinZPos // was 2 PUT BACK
    coins3[cycle].hidden = true
    backgroundLayer.addChild(coins3[cycle])
    // *** // *** // *** // 10-2-15 print("coin1pos: \(coins3[cycle].position) vplatform1pos: \(vplatforms[cycle].position)")
    
    
    }
    
    platformcount = platformcount + 1

vplatformSlots[cpos].name = "expendable1"
if vplatformSlots[cpos].position.x >= noRoofABegin && vplatformSlots[cpos].position.x <= noRoofAEnd {


vplatformSlots[cpos].hidden = true

} else {

vplatformSlots[cpos].hidden = false

}


if platformcount == 40 {

achievementBarrier(platforms[cpos])

}
    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    if platformcount <= 5 {
    
    coins[cpos].size.height = coinheight
    coins[cpos].size.width = coinwidth
    coins[cpos].position.x = vplatforms[cpos].position.x
    coins[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2
    coins[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos].physicsBody!.contactTestBitMask = 0
    coins[cpos].physicsBody!.collisionBitMask = 0
    coins[cpos].physicsBody!.affectedByGravity = false
    coins[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins[cpos].name = "coin"
    coins[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins[cpos].hidden = true
    backgroundLayer.addChild(coins[cpos])
    
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cpos].size.height = coinheight
    coins2[cpos].size.width = coinwidth
    coins2[cpos].position.x = vplatforms[cpos].position.x
    coins2[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2
    coins2[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cpos].physicsBody!.contactTestBitMask = 0
    coins2[cpos].physicsBody!.collisionBitMask = 0
    coins2[cpos].physicsBody!.affectedByGravity = false
    coins2[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins2[cpos].name = "coin2"
    coins2[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins2[cpos].hidden = true
    backgroundLayer.addChild(coins2[cpos])
    
    }
    
    if platformcount > 10 {
    
    coins3[cpos].size.height = coinheight
    coins3[cpos].size.width = coinwidth
    coins3[cpos].position.x = vplatforms[cpos].position.x
    coins3[cpos].position.y = platforms[cpos].physicsBody!.charge + platformheight/2
    coins3[cpos].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cpos].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cpos].physicsBody!.contactTestBitMask = 0
    coins3[cpos].physicsBody!.collisionBitMask = 0
    coins3[cpos].physicsBody!.affectedByGravity = false
    coins3[cpos].physicsBody!.angularDamping = CGFloat(cpos)
    coins3[cpos].name = "coin3"
    coins3[cpos].zPosition = coinZPos // was 2 PUT BACK
    coins3[cpos].hidden = true
    backgroundLayer.addChild(coins3[cpos])
    
    }
    
    platformcount = platformcount + 1

vplatformSlots[cpos2].name = "expendable1"
if vplatformSlots[cpos2].position.x >= noRoofABegin && vplatformSlots[cpos2].position.x <= noRoofAEnd {


vplatformSlots[cpos2].hidden = true

} else {

vplatformSlots[cpos2].hidden = false

}


if platformcount == 40 {

achievementBarrier(platforms[cpos2])

}
    // *** // *** // *** // 10-2-15 print("platformcount: \(platformcount)")
    if platformcount <= 5 {
    
    coins[cpos2].size.height = coinheight
    coins[cpos2].size.width = coinwidth
    coins[cpos2].position.x = vplatforms[cpos2].position.x
    coins[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2
    coins[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins[cpos2].physicsBody!.contactTestBitMask = 0
    coins[cpos2].physicsBody!.collisionBitMask = 0
    coins[cpos2].physicsBody!.affectedByGravity = false
    coins[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins[cpos2].name = "coin"
    coins[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins[cpos2].hidden = true
    
    
    backgroundLayer.addChild(coins[cpos2])
    }
    
    if platformcount > 5 && platformcount <= 10 {
    
    coins2[cpos2].size.height = coinheight
    coins2[cpos2].size.width = coinwidth
    coins2[cpos2].position.x = vplatforms[cpos2].position.x
    coins2[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2
    coins2[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins2[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins2[cpos2].physicsBody!.contactTestBitMask = 0
    coins2[cpos2].physicsBody!.collisionBitMask = 0
    coins2[cpos2].physicsBody!.affectedByGravity = false
    coins2[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins2[cpos2].name = "coin2"
    coins2[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins2[cpos2].hidden = true
    
    backgroundLayer.addChild(coins2[cpos2])
    }
    
    if platformcount > 10 {
    
    coins3[cpos2].size.height = coinheight
    coins3[cpos2].size.width = coinwidth
    coins3[cpos2].position.x = vplatforms[cpos2].position.x
    coins3[cpos2].position.y = platforms[cpos2].physicsBody!.charge + platformheight/2
    coins3[cpos2].physicsBody = SKPhysicsBody(circleOfRadius: coinwidth/2)
    coins3[cpos2].physicsBody!.categoryBitMask = PhysicsCategory.coin
    coins3[cpos2].physicsBody!.contactTestBitMask = 0
    coins3[cpos2].physicsBody!.collisionBitMask = 0
    coins3[cpos2].physicsBody!.affectedByGravity = false
    coins3[cpos2].physicsBody!.angularDamping = CGFloat(cpos2)
    coins3[cpos2].name = "coin3"
    coins3[cpos2].zPosition = coinZPos // was 2 PUT BACK
    coins3[cpos2].hidden = true
    
    backgroundLayer.addChild(coins3[cpos2])
    }
    
    


    // *** // *** // *** // 10-2-15 print("post platformcount: \(platformcount)")
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
    
    // *** // *** // *** // 10-2-15 print("correct meeting? vplatform bottom: \(CGRectGetMinY(vplatforms[self.cycle].frame)) platform top: \(CGRectGetMaxY(platforms[self.cycle].frame))")
    
    spikes[self.spikearraypos].removeFromParent()
    spikes[self.spikearraypos].name = "spike"
    spikes[self.spikearraypos].size.width = spikewidth // was 42 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight // was 42 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    platforms[self.cycle].addChild(spikes[self.spikearraypos]) //PUT BACK
    
spikes[self.spikearraypos].texture = flippedTextureWithImageNamed("Spike")

    
    //     println("spikearraypos: \(spikearraypos)")


self.spikes[spikearraypos].color = platformColor
self.spikes[spikearraypos].colorBlendFactor = platformBlendFactor
    
    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }
    
    spikes[self.spikearraypos].removeFromParent()
    spikes[self.spikearraypos].name = "spike"
    spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    vplatforms[self.cycle].addChild(spikes[self.spikearraypos]) //PUT BACK
    spikes[self.spikearraypos].texture = SKTexture(imageNamed: "Spike") 
    
    self.spikes[spikearraypos].color = platformColor
self.spikes[spikearraypos].colorBlendFactor = platformBlendFactor
    
    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }
    
    
    
    spikes[self.spikearraypos].removeFromParent()
    spikes[self.spikearraypos].name = "spike"
    // Take out spikes for opening walls test
    
    //     println("spikearraypos: \(spikearraypos)")
    spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].texture = flippedTextureWithImageNamed("Spike")
    
self.spikes[spikearraypos].color = platformColor
self.spikes[spikearraypos].colorBlendFactor = platformBlendFactor

    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }
    //       println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].removeFromParent()
        spikes[self.spikearraypos].name = "spike"
    spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].texture = flippedTextureWithImageNamed("Spike")

    self.spikes[spikearraypos].color = platformColor
self.spikes[spikearraypos].colorBlendFactor = platformBlendFactor
    
    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }
    //       println("spikearraypos: \(spikearraypos)")
    //        println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].removeFromParent()
        spikes[self.spikearraypos].name = "spike"
    spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].texture = SKTexture(imageNamed: "Spike")
   
    self.spikes[spikearraypos].color = platformColor
self.spikes[spikearraypos].colorBlendFactor = platformBlendFactor
    
    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }
    //        println("spikearraypos: \(spikearraypos)")
spikes[self.spikearraypos].removeFromParent()
        spikes[self.spikearraypos].name = "spike"
    spikes[self.spikearraypos].size.width = spikewidth //was 8/3/15
    spikes[self.spikearraypos].size.height = spikeheight //was 8/3/15
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    
    spikes[self.spikearraypos].texture = SKTexture(imageNamed: "Spike")

    self.spikes[spikearraypos].color = platformColor
self.spikes[spikearraypos].colorBlendFactor = platformBlendFactor
    
    if self.spikearraypos < 41 {
    self.spikearraypos++
} else {
    self.spikearraypos = 0
    
    
    }
        
        platforms[cycle].zPosition = platformZPos
        platforms[cpos].zPosition = platformZPos
        platforms[cpos2].zPosition = platformZPos
        vplatforms[cycle].zPosition = platformZPos
        vplatforms[cpos].zPosition = platformZPos
        vplatforms[cpos2].zPosition = platformZPos
        
        
        
        
        
        platforms[cycle].position.y = platforms[cycle].physicsBody!.charge
        platforms[cpos].position.y = platforms[cpos].physicsBody!.charge
        platforms[cpos2].position.y = platforms[cpos2].physicsBody!.charge
        
        platformImages[cycle].position.y = platforms[cycle].physicsBody!.charge
        platformImages[cpos].position.y = platforms[cpos].physicsBody!.charge
        platformImages[cpos2].position.y = platforms[cpos2].physicsBody!.charge
        
        platformImages[cycle].position.x = platforms[cycle].position.x
        platformImages[cpos].position.x = platforms[cpos].position.x
        platformImages[cpos2].position.x = platforms[cpos2].position.x
        
        
        platformImages[cycle].zPosition = platformZPos
        platformImages[cpos].zPosition = platformZPos
        platformImages[cpos2].zPosition = platformZPos
        
        platformImages[cycle].size.height = platformheight
        platformImages[cpos].size.height = platformheight
        platformImages[cpos2].size.height = platformheight
        
        platformImages[cycle].size.width = platformwidth
        platformImages[cpos].size.width = platformwidth
        platformImages[cpos2].size.width = platformwidth
        
        
        platformImages[cycle].removeFromParent()
        platformImages[cpos].removeFromParent()
        platformImages[cpos2].removeFromParent()
        
        
        platformImages[cycle].removeFromParent()
        platformImages[cpos].removeFromParent()
        platformImages[cpos2].removeFromParent()
        
        backgroundLayer.addChild(platformImages[cycle])
        backgroundLayer.addChild(platformImages[cpos])
        backgroundLayer.addChild(platformImages[cpos2])
        
        platformImages[cycle].color = platformColor 
        platformImages[cycle].colorBlendFactor = platformBlendFactor
        vplatforms[cycle].color = platformColor 
        vplatforms[cycle].colorBlendFactor = platformBlendFactor
        
        platformImages[cpos].color = platformColor 
        platformImages[cpos].colorBlendFactor = platformBlendFactor
        vplatforms[cpos].color = platformColor 
        vplatforms[cpos].colorBlendFactor = platformBlendFactor
        
        platformImages[cpos2].color = platformColor 
        platformImages[cpos2].colorBlendFactor = platformBlendFactor
        vplatforms[cpos2].color = platformColor 
        vplatforms[cpos2].colorBlendFactor = platformBlendFactor
        
        


platformSlots[cycle].removeFromParent()
platformSlots[cycle].position.y = castleFloor.position.y - 60
platformSlots[cycle].position.x = platforms[cycle].position.x
platformSlots[cycle].size.height = 117
platformSlots[cycle].size.width = 61 // 58
platformSlots[cycle].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
platformSlots[cycle].colorBlendFactor = castleBlendFactor //0.5

platformSlots[cycle].zPosition = platformSlotZPos
backgroundLayer.addChild(platformSlots[cycle])

platformSlots[cpos].removeFromParent()
platformSlots[cpos].position.y = castleFloor.position.y - 60
platformSlots[cpos].position.x = platforms[cpos].position.x
platformSlots[cpos].size.height = 117
platformSlots[cpos].size.width = 61 // 58
platformSlots[cpos].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
platformSlots[cpos].colorBlendFactor = castleBlendFactor //0.5
platformSlots[cpos].zPosition = platformSlotZPos
backgroundLayer.addChild(platformSlots[cpos])

platformSlots[cpos2].removeFromParent()
platformSlots[cpos2].position.y = castleFloor.position.y - 60
platformSlots[cpos2].position.x = platforms[cpos2].position.x
platformSlots[cpos2].size.height = 117
platformSlots[cpos2].size.width = 61 // 58
platformSlots[cpos2].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
platformSlots[cpos2].colorBlendFactor = castleBlendFactor //0.5
platformSlots[cpos2].zPosition = platformSlotZPos
backgroundLayer.addChild(platformSlots[cpos2])



vplatformSlots[cycle].removeFromParent()
vplatformSlots[cycle].position.y = castleCeiling.position.y + 60
vplatformSlots[cycle].position.x = vplatforms[cycle].position.x
vplatformSlots[cycle].size.height = 117
vplatformSlots[cycle].size.width = 61 // 58
vplatformSlots[cycle].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
vplatformSlots[cycle].colorBlendFactor = castleBlendFactor //0.5

vplatformSlots[cycle].zPosition = platformSlotZPos
vplatformSlots[cycle].zRotation = 3.14159265
backgroundLayer.addChild(vplatformSlots[cycle])

vplatformSlots[cpos].removeFromParent()
vplatformSlots[cpos].position.y = castleCeiling.position.y + 60
vplatformSlots[cpos].position.x = vplatforms[cpos].position.x
vplatformSlots[cpos].size.height = 117
vplatformSlots[cpos].size.width = 61 // 58
vplatformSlots[cpos].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
vplatformSlots[cpos].colorBlendFactor = castleBlendFactor //0.5
vplatformSlots[cpos].zPosition = platformSlotZPos
vplatformSlots[cpos].zRotation = 3.14159265
backgroundLayer.addChild(vplatformSlots[cpos])

vplatformSlots[cpos2].removeFromParent()
vplatformSlots[cpos2].position.y = castleCeiling.position.y + 60
vplatformSlots[cpos2].position.x = vplatforms[cpos2].position.x
vplatformSlots[cpos2].size.height = 117
vplatformSlots[cpos2].size.width = 61 // 58
vplatformSlots[cpos2].color = castleColor //UIColor(red: 85/255, green: 84/255, blue: 47/255, alpha: 1.0) 
vplatformSlots[cpos2].colorBlendFactor = castleBlendFactor //0.5
vplatformSlots[cpos2].zPosition = platformSlotZPos
vplatformSlots[cpos2].zRotation = 3.14159265
backgroundLayer.addChild(vplatformSlots[cpos2])




platforms[cycle].position.y = self.size.height/2
platforms[cpos].position.y = self.size.height/2
platforms[cpos2].position.y = self.size.height/2
    
// *** // *** // 10-2-15 print("platforms[cycle].position: \(platforms[cycle].position)")
// *** // *** // 10-2-15 print("platforms[cpos].position: \(platforms[cpos].position)")
// *** // *** // 10-2-15 print("platforms[cpos2].position: \(platforms[cpos2].position)")
        

let color1 = platformImages[cycle].colorBlendFactor
let colora = platformImages[cycle].color


let p1children = platforms[cycle].children as! [SKSpriteNode]

for p1child in p1children {

// *** // *** // 10-2-15 print("p1child: \(p1child)")
p1child.color = colora
p1child.colorBlendFactor = color1


}


let p4children = vplatforms[cycle].children as! [SKSpriteNode]

for p4child in p4children {

// *** // *** // 10-2-15 print("p4child: \(p4child)")

p4child.color = colora
p4child.colorBlendFactor = color1


}

let color2 = platformImages[cycle+4].colorBlendFactor
let colorb = platformImages[cycle+4].color


let p2children = platforms[cycle+4].children as! [SKSpriteNode]

for p2child in p2children {

// *** // *** // 10-2-15 print("p2child: \(p2child)")
p2child.color = colorb
p2child.colorBlendFactor = color2


}


let p5children = vplatforms[cycle+4].children as! [SKSpriteNode]

for p5child in p5children {

// *** // *** // 10-2-15 print("p5child: \(p5child)")
p5child.color = colorb
p5child.colorBlendFactor = color2


}


let color3 = platformImages[cycle+8].colorBlendFactor
let colorc = platformImages[cycle+8].color


let p3children = platforms[cycle+8].children as! [SKSpriteNode]

for p3child in p3children {

// *** // *** // 10-2-15 print("p3child: \(p3child)")
p3child.color = colorc
p3child.colorBlendFactor = color3


}


let p6children = vplatforms[cycle+8].children as! [SKSpriteNode]

for p6child in p6children {

// *** // *** // 10-2-15 print("p6child: \(p6child)")
p6child.color = colorc
p6child.colorBlendFactor = color3


}

//begin slidingwalls add background

if GameState.sharedInstance.score >= 27 && ranAchievementWall == 0 { // platforms[cycle].position.x > 13316// was > 13316


arc6.removeFromParent()
arc6.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arc6.size.width = arc6.size.height*0.37624750

if platforms[cpos].position.x + 100 > 12879 {

arc6.position.x = platforms[cpos].position.x + 100

} else {

arc6.position.x = 12879

}

arc6.position.y = CGRectGetMaxY(castleFloor.frame) + arc6.size.height/2
arc6.zPosition = backWallZPos + 0.1
arc6.name = "backArc"
arc6.color = UIColor(red: 233/255, green: 0/255, blue: 0/255, alpha: 1.0)
arc6.colorBlendFactor = 0.7
backgroundLayer.addChild(arc6)

backArcE.removeFromParent()
backArcE.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArcE.size.width = backArcE.size.height*0.37624750
backArcE.position.x = arc6.position.x - 50 - backArcE.size.width
backArcE.position.y = CGRectGetMaxY(castleFloor.frame) + backArcE.size.height/2
backArcE.zPosition = backWallZPos + 0.1
backArcE.name = "backArc"
backArcE.color = UIColor(red: 233/255, green: 0/255, blue: 0/255, alpha: 1.0)
backArcE.colorBlendFactor = 0.7
backgroundLayer.addChild(backArcE)

plainWallE.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWallE.size.width = 55 
plainWallE.position.x = (arc6.position.x + backArcE.position.x)/2
plainWallE.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(castleFloor.frame))/2 
plainWallE.zPosition = backWallZPos
backgroundLayer.addChild(plainWallE)






ranAchievementWall = 1

backgroundLayer.enumerateChildNodesWithName("expendable") { node, _ in 

if let todelete = node as? SKSpriteNode {

if todelete.position.x > self.arc6.position.x - 300 { // was within +/- 1000



todelete.paused = false
todelete.removeAllActions()

todelete.name = nil
todelete.removeFromParent()

print("todelete.position.x: \(todelete.position.x)")

print("self.arc6.position.x - 300: \(self.arc6.position.x - 300)")




}

}

}

        


backgroundLayer.enumerateChildNodesWithName("expendable0") { node, _ in 

if let todelete = node as? SKSpriteNode {

if todelete.position.x > self.arc6.position.x - 300 { // was within +/- 1000


self.backgroundLayer.enumerateChildNodesWithName("expendable0") { node, _ in

if let todelete2 = node as? SKSpriteNode {
todelete2.paused = false
todelete2.removeAllActions()

todelete2.name = nil
todelete2.removeFromParent()

print("todelete2.position.x: \(todelete2.position.x)")

print("self.arc6.position.x - 300: \(self.arc6.position.x - 300)")
}

todelete.paused = false
todelete.removeAllActions()

todelete.name = nil
todelete.removeFromParent()

}

}

}

        }

            }

if platforms[cycle].position.x > 13316 && GameState.sharedInstance.score < 30 && ranAchievementWall == 0 { // was > 13316 //&& lastMoveWallXPos > //come back to score check


print("slidingwallsaddbackground bird2.position.x: \(bird2.position.x)")
print("add background; floorPos2: \(floorPos2) platforms[cycle].position.x: \(platforms[cycle].position.x)")


if slideWallsCastle == 3 {










}


if slideWallsCastle == 2 {

backArc6.removeFromParent()
backArc6.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArc6.size.width = backArc6.size.height*0.37624750
backArc6.position.x = platforms[cpos2].position.x + 200
backArc6.position.y = CGRectGetMaxY(castleFloor.frame) + backArc6.size.height/2
backArc6.zPosition = backWallZPos + 0.1
backArc6.name = "expendable"
backgroundLayer.addChild(backArc6)


lastMoveWallXPos = backArc6.position.x

slideWallsCastle = 3
}


if slideWallsCastle == 1 {







lastMoveWallXPos = backArc5.position.x
slideWallsCastle = 2



}

if slideWallsCastle == 0 {


backArc5.removeFromParent()
backArc5.size.height = castleCeiling.position.y - castleFloor.position.y - 100
backArc5.size.width = backArc5.size.height*0.37624750
backArc5.position.x = platforms[cycle].position.x - 200//platforms[cpos2].position.x + 200
backArc5.position.y = CGRectGetMaxY(castleFloor.frame) + backArc5.size.height/2
backArc5.zPosition = backWallZPos + 0.1
backArc5.name = "expendable0"
backgroundLayer.addChild(backArc5)


windowWall8.position.x = platforms[cycle].position.x + 200
windowWall8.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall8.size.height/2
windowWall8.zPosition = backWallZPos
windowWall8.name = "expendable0"
backgroundLayer.addChild(windowWall8)



plainWall11.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall11.size.width = CGRectGetMinX(windowWall8.frame) - CGRectGetMaxX(backArc5.frame) 
plainWall11.position.x = (windowWall8.position.x + backArc5.position.x)/2
plainWall11.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(castleFloor.frame))/2 
plainWall11.zPosition = backWallZPos
plainWall11.name = "expendable0"
backgroundLayer.addChild(plainWall11)

windowWall9.position.x = platforms[cpos].position.x + 100
windowWall9.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall9.size.height/2 
windowWall9.zPosition = backWallZPos
windowWall9.name = "expendable0"
backgroundLayer.addChild(windowWall9)

plainWall12.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall12.size.width = CGRectGetMinX(windowWall9.frame) - CGRectGetMaxX(windowWall8.frame) 
plainWall12.position.x = (windowWall8.position.x + windowWall9.position.x)/2
plainWall12.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(castleFloor.frame))/2 
plainWall12.zPosition = backWallZPos
plainWall12.name = "expendable0"
backgroundLayer.addChild(plainWall12)

windowWall10.position.x = platforms[cpos2].position.x
windowWall10.position.y = CGRectGetMaxY(castleFloor.frame) + windowWall10.size.height/2
windowWall10.zPosition = backWallZPos
windowWall10.name = "expendable0"
backgroundLayer.addChild(windowWall10)

plainWall13.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWall13.size.width = CGRectGetMinX(windowWall10.frame) - CGRectGetMaxX(windowWall9.frame) 
plainWall13.position.x = (windowWall9.position.x + windowWall10.position.x)/2
plainWall13.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(castleFloor.frame))/2 
plainWall13.zPosition = backWallZPos
plainWall13.name = "expendable0"
backgroundLayer.addChild(plainWall13)


plainWallR.removeFromParent()
plainWallR.size.width = 1
plainWallR.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(castleFloor.frame)
plainWallR.position.x = CGRectGetMaxX(windowWall10.frame) + plainWallR.size.width/2
plainWallR.position.y = CGRectGetMaxY(castleFloor.frame) + plainWallR.size.height/2
plainWallR.zPosition = backWallZPos
plainWallR.name = "expendable0"
backgroundLayer.addChild(plainWallR)


arc5.removeFromParent()
arc5.size.height = castleCeiling.position.y - castleFloor.position.y - 100
arc5.size.width = arc5.size.height*0.37624750
arc5.position.x = CGRectGetMaxX(plainWallR.frame) + arc5.size.width/2
arc5.position.y = CGRectGetMaxY(castleFloor.frame) + arc5.size.height/2
arc5.zPosition = backWallZPos + 0.1
arc5.name = "expendable0"
backgroundLayer.addChild(arc5)

plainWall14.size.height = CGRectGetMinY(castleCeiling.frame) - CGRectGetMaxY(windowWall8.frame)
plainWall14.size.width = CGRectGetMinX(plainWallR.frame) - CGRectGetMaxX(plainWall11.frame) 
plainWall14.position.x = (CGRectGetMinX(plainWallR.frame) + CGRectGetMinX(plainWall11.frame) )/2
plainWall14.position.y = (CGRectGetMinY(castleCeiling.frame) + CGRectGetMaxY(windowWall8.frame))/2 
plainWall14.zPosition = backWallZPos
plainWall14.name = "expendable0"
backgroundLayer.addChild(plainWall14)



 slideWallsCastle = 1




}
/*
if slideWallsCastle == 3 {

slideWallsCastle = 0

}
*/
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
    // *** // *** // *** // 10-2-15 print("score1: \(score1)")
    
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
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].zPosition = spikeZPos
    spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMinX(platforms[self.cycle+8].frame) - 25, y: 975)
    
    
    spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
    spikes[self.spikearraypos].physicsBody!.dynamic = false
    spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
    spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
    spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    spikes[self.spikearraypos].zRotation = 3.14159/2

//.runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))
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
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].zPosition = spikeZPos
    spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMinX(vplatforms[self.cycle+4].frame) - spikes[self.spikearraypos].size.width/2, y: CGRectGetMinY(vplatforms[self.cycle+4].frame) + spikes[self.spikearraypos].size.width/2 )
    
    
    spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
    spikes[self.spikearraypos].physicsBody!.dynamic = false
    spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
    spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
    spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
  //  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(3.14159/2, duration: 0))

spikes[self.spikearraypos].zRotation = 3.14159/2
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
    spikes[self.spikearraypos].zPosition = spikeZPos
    spikes[self.spikearraypos].position = CGPoint(x: CGRectGetMaxX(vplatforms[self.cycle+4].frame) + spikes[self.spikearraypos].size.width/2, y: CGRectGetMinY(vplatforms[self.cycle+4].frame) + 200 )
    
    
    spikes[self.spikearraypos].physicsBody = SKPhysicsBody(rectangleOfSize: spikes[self.spikearraypos].size) // MAY NEED TO MAKE THIS A TRIANGLE
    spikes[self.spikearraypos].physicsBody!.dynamic = false
    spikes[self.spikearraypos].physicsBody?.affectedByGravity = false
    spikes[self.spikearraypos].physicsBody!.categoryBitMask = PhysicsCategory.danger
    spikes[self.spikearraypos].physicsBody!.contactTestBitMask = PhysicsCategory.bird
  //  spikes[self.spikearraypos].runAction(SKAction.rotateByAngle(-3.14159/2, duration: 0))

spikes[self.spikearraypos].zRotation = -3.14159/2
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
    spikes[self.spikearraypos].zPosition = spikeZPos
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
    spikes[self.spikearraypos].zPosition = spikeZPos
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
startblock()
            bird2.position.x = platformst3.position.x
            worldNode.position.x = -bird2.position.x + self.size.width/2 // added back because worldnode was off
tutorialBox.position.x = bird2.position.x
tutorialBox.position.y = 1500
tutorialBox.size.height = 300
tutorialBox.size.width = 300
tutorialBox.zPosition = 2
//backgroundLayer.addChild(tutorialBox)
            
        }


if castleType == 2 {


slidingchains()


}



if castleType == 1 {

makeOne = 1
makeTwo = 1
makeThree = 1

difPer = 1
make3("000111")
fallingplatforms()



platformImages[cycle].removeFromParent()
platformImages[cycle+4].removeFromParent()
platformImages[cycle+8].removeFromParent()

platforms[cycle].addChild(platformImages[cycle])
platforms[cycle+4].addChild(platformImages[cycle+4])
platforms[cycle+8].addChild(platformImages[cycle+8])





}







        
    
        if castleType == 0 && stoprolldice == 0 { //rolldice >= 3



            if GameState.sharedInstance.score == 0 && checkpointmode == 0 { //not working, need to update so that first rolldice is correct, where the first barrier does not refer to cycle -1 + 8
                
                difOne = 0
            } else {

                // *** // *** // *** // 10-2-15 print("difOne: \(difOne)")
if difOne < 9 {
difOne = CGFloat.random(min: 0, max: 1)
}


                
            }
            
            // *** // *** // *** // 10-2-15 print("about to run makeOne")
            
            if difOne > difPer && difOne < 9 { // only redefines width and max/min if not passed from the prior barrier
                
                
                difOneWidth = CGFloat.random(min: 0, max: 1.00) // PUT BACK
                
                // *** // *** // *** // 10-2-15 print("difOneWidth: \(difOneWidth)")
                
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
            difTypeOne = CGFloat.random(min: 0, max: 1) //put back
            
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
            // *** // *** // *** // 10-2-15 print("difPos: \(difPos)")
            // *** // *** // *** // 10-2-15 print("difOneWidth: \(difOneWidth)")
            
makeOne = 1
make3("100100")


           
// *** // *** // *** // 10-2-15 print("difTwo after makeOne make3: \(difTwo)")
slidingwalls() //MAKE UNCOMMENTED - PUT BACK
makeOne = 0



// *** // *** // *** // 10-2-15 print("platform charge after slidingwalls: \(platforms[cycle].physicsBody!.charge)")


if cycle == 0 && platforms[cycle+3+8].parent != nil {
// *** // *** // *** // 10-2-15 print("previous platform charge after sliding walls: \(platforms[cycle+3+8].physicsBody!.charge)")

} else {

if platforms[cycle-1+8].parent != nil {
// *** // *** // *** // 10-2-15 print("previous platform charge after sliding walls: \(platforms[cycle-1+8].physicsBody!.charge)")
}

}
// *** // *** // *** // 10-2-15 print("platformposition cycle: \(platforms[cycle].position)")
// *** // *** // *** // 10-2-15 print("difMaxPos: \(difMaxPos)")
// *** // *** // *** // 10-2-15 print("difMinPos: \(difMinPos)")
// *** // *** // *** // 10-2-15 print("make3size: \(make3size)")






// *** // *** // *** // 10-2-15 print("ran makeOne")
            
            
            // *** // *** // *** // 10-2-15 print("difTwo: \(difTwo)")
if difTwo < 9 {
difTwo = CGFloat.random(min: 0, max: 1)

} 


            
            
            
            
            
            
            
// *** // *** // *** // 10-2-15 print("about to run makeTwo")
            
            if difTwo > difPer && difTwo < 9 {
                
                
                difTwoWidth = CGFloat.random(min: 0, max: 1.00) //put back
                
                // *** // *** // *** // 10-2-15 print("difTwoWidth: \(difTwoWidth)")
                
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
difTypeTwo = CGFloat.random(min: 0, max: 1)// put back

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



// *** // *** // *** // 10-2-15 print("difThree after makeTwo make3: \(difThree)")
            
            // *** // *** // *** // 10-2-15 print("difPos: \(difPos)")
            // *** // *** // *** // 10-2-15 print("difTwoWidth: \(difTwoWidth)")
  makeTwo = 1 // PUT BACK
slidingwalls() // PUT BACK
makeTwo = 0



// *** // *** // *** // 10-2-15 print("ran makeTwo")

// *** // *** // *** // 10-2-15 print("platform charge after slidingwalls: \(platforms[cycle+4].physicsBody!.charge)")
// *** // *** // *** // 10-2-15 print("previous platform charge after sliding walls: \(platforms[cycle].physicsBody!.charge)")
// *** // *** // *** // 10-2-15 print("platformposition cycle+4: \(platforms[cycle+4].position)")

// *** // *** // *** // 10-2-15 print("difMaxPos: \(difMaxPos)")
// *** // *** // *** // 10-2-15 print("difMinPos: \(difMinPos)")
// *** // *** // *** // 10-2-15 print("make3size: \(make3size)")
            
            // *** // *** // *** // 10-2-15 print("difThree: \(difThree)")

if difThree < 9 {
difThree = CGFloat.random(min: 0, max: 1)
}


// *** // *** // *** // 10-2-15 print("about to run makeThree")
            
            
            if difThree > difPer && difThree < 9 {
                
                difThreeWidth = CGFloat.random(min: 0, max: 1.00) // put back
                
                // *** // *** // *** // 10-2-15 print("difThreeWidth: \(difThreeWidth)")
                
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
difTypeThree = CGFloat.random(min: 0, max: 1) //put back

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
            
// *** // *** // *** // 10-2-15 print("difThree before makeThree run \(difThree)")
make3("001001")
// *** // *** // *** // 10-2-15 print("difOne after makeThree make3: \(difOne)")
            
            // *** // *** // *** // 10-2-15 print("difPos: \(difPos)")
            // *** // *** // *** // 10-2-15 print("difThreeWidth: \(difThreeWidth)")
makeThree = 1
slidingwalls()
makeThree = 0

            
           

// *** // *** // *** // 10-2-15 print("ran makeThree")

// *** // *** // *** // 10-2-15 print("platform charge after slidingwalls: \(platforms[cycle+8].physicsBody!.charge)")

// *** // *** // *** // 10-2-15 print("platform charge after slidingwalls: \(platforms[cycle+8].physicsBody!.charge)")
// *** // *** // *** // 10-2-15 print("previous platform charge after sliding walls: \(platforms[cycle+4].physicsBody!.charge)")
            
           
            
// *** // *** // *** // 10-2-15 print("platformposition cycle+8: \(platforms[cycle+8].position)")

// *** // *** // *** // 10-2-15 print("difMaxPos: \(difMaxPos)")
// *** // *** // *** // 10-2-15 print("difMinPos: \(difMinPos)")
// *** // *** // *** // 10-2-15 print("make3size: \(make3size)")
            
            
            

// *** // *** // *** // 10-2-15 print("TEST1: platforms[cycle].position.x: \(platforms[cycle].position.x)")
// *** // *** // *** // 10-2-15 print("TEST2: platforms[cycle+4].position.x: \(platforms[cycle+4].position.x)")
// *** // *** // *** // 10-2-15 print("TEST3: platforms[cycle+8].position.x: \(platforms[cycle+8].position.x)")

// *** // *** // *** // 10-2-15 print("TEST1: platforms[cycle].physicsBody!.charge: \(platforms[cycle].physicsBody!.charge)")
// *** // *** // *** // 10-2-15 print("TEST2: platforms[cycle+4].physicsBody!.charge: \(platforms[cycle+4].physicsBody!.charge)")
// *** // *** // *** // 10-2-15 print("TEST3: platforms[cycle+8].physicsBody!.charge: \(platforms[cycle+8].physicsBody!.charge)")



         //   make3("111111") // take out for opening walls test. PUt back
            slidingwalls()


vplatforms[cycle].position.y = platforms[cycle].physicsBody!.charge + platformheight

    vplatforms[cycle+4].position.y = platforms[cycle+4].physicsBody!.charge + platformheight//+ swgap
    vplatforms[cycle+8].position.y = platforms[cycle+8].physicsBody!.charge + platformheight//+ swgap


vplatforms[cycle].physicsBody!.charge = vplatforms[cycle].position.y

vplatforms[cycle+4].physicsBody!.charge = vplatforms[cycle+4].position.y

vplatforms[cycle+8].physicsBody!.charge = vplatforms[cycle+8].position.y

            
    }
    
        


        
         if setCastle == 0 {

let setPos: CGFloat = 1500 // 2000
setCastleDistance = setPos - platforms[4].position.x

platforms[4].position.x = setPos
vplatforms[4].position.x = setPos

ground.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*ground.size.width - 30
ceiling.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*ceiling.size.width - 100
frontWall.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*frontWall.size.width + 50//- 100 // was - 30
castleFloor.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*castleFloor.size.width + 50//- 30
castleCeiling.position.x = CGRectGetMaxX(platforms[4].frame) + 0.5*castleCeiling.size.width //- 30

entrance.position.x = CGRectGetMaxX(platforms[4].frame) + 10

let startMark: CGFloat = CGRectGetMinX(platforms[4].frame) - roofwall1.size.width/2 - 75

beginroofwall.position.x = startMark + beginroofwall.size.width - 5
initialroofwall1.position.x = startMark + beginroofwall.size.width + roofwall.size.width - 10
initialroofwall2.position.x = startMark + beginroofwall.size.width + roofwall.size.width - 10 + roofwall.size.width - 10

initialroofwall1.position.y = roofwallypos
initialroofwall2.position.y = roofwallypos


initialroofwall1.zPosition = frontWallZPos + 0.5
initialroofwall2.zPosition = frontWallZPos + 0.5

backgroundLayer.addChild(initialroofwall1)
backgroundLayer.addChild(initialroofwall2)

entryArc1.position.x = CGRectGetMinX(beginroofwall.frame) + entryArc1.size.width/2 + 15
entryArc2.position.x = CGRectGetMinX(platforms[4].frame) + entryArc2.size.width/2 - 4.5


openwindow.position.x = CGRectGetMaxX(platforms[4].frame) - openwindow.size.width/2 + 30



let startMark2: CGFloat = CGRectGetMaxX(platforms[4].frame) - frontjagged1.size.width/2 + 50

initialfrontjagged1.position.x = startMark2 + frontjagged1.size.width
initialfrontjagged2.position.x = startMark2 + 2*frontjagged1.size.width
exteriorWall.position.x = CGRectGetMaxX(platforms[4].frame) + exteriorWall.size.width/2 - 3

initialfrontjagged1.position.y = CGRectGetMinY(castleFloor.frame) + 10
initialfrontjagged2.position.y = CGRectGetMinY(castleFloor.frame) + 10

initialfrontjagged1.zPosition = frontWallZPos
initialfrontjagged2.zPosition = frontWallZPos

backgroundLayer.addChild(initialfrontjagged1)
backgroundLayer.addChild(initialfrontjagged2)

castlemoves = [platforms[4], vplatforms[4], roomWall1, ground, ceiling, frontWall, castleFloor, castleCeiling, entrance, initialroofwall1, initialroofwall2, openwindow, initialfrontjagged1, initialfrontjagged2, beginroofwall, entryArc1, entryArc2, plainWallRW1] 

if replay == false {

//castlemoves.append(exteriorWall) //removed for bug checking

}

if replay == true {

self.singlePlayerStart()

}

print("setCastle ran")

print("frontWall.position.x: \(frontWall.position.x)")

}
            
        }
        
        
        
        
        
        
        
        
        
        
        
    }
    
    //
    
    
    func startblock() {
    
// *** // *** // 10-2-15 print("run startblock")
    /*
    var st2: CGFloat = startref
    st2 += startref/6
    st2 -= 122
    */
    
    
    platformst2.size.width = size.width/8
    platformst2.size.height = 1600// infinite bounce test: 6000 // was 1600
    
    platformst2.zPosition = 3
    platformst2.position.x = platformst3.position.x - 1400
platformst2.position.y = -100
    
    
    platformst2.physicsBody = SKPhysicsBody(rectangleOfSize: platformst2.size)
    platformst2.physicsBody!.dynamic = false
    platformst2.physicsBody!.friction = wallfriction
    platformst2.physicsBody!.restitution = 0
    platformst2.physicsBody!.categoryBitMask = PhysicsCategory.block
    platformst2.physicsBody!.contactTestBitMask = 0// PhysicsCategory.bird
    platformst2.physicsBody!.collisionBitMask = PhysicsCategory.bird
    platformst2.name = "platform"
    backgroundLayer.addChild(platformst2)
    
    platformst1.size.height = 2000
    platformst1.zPosition = 3
    platformst1.position = self.backgroundLayer.convertPoint(CGPoint(x: platformst2.position.x - 700, y: self.size.height/2), fromNode: self) //x: make3size*2 +
    platformst1.size.width = platformwidth
    platformst1.physicsBody = SKPhysicsBody(rectangleOfSize: platformst1.size)
    platformst1.physicsBody!.dynamic = false
    platformst1.physicsBody!.friction = wallfriction
    platformst1.physicsBody!.restitution = 0
    platformst1.physicsBody!.categoryBitMask = PhysicsCategory.block
    platformst1.physicsBody!.contactTestBitMask = PhysicsCategory.bird
    platformst1.physicsBody!.collisionBitMask = PhysicsCategory.bird
    platformst1.name = "platform"
    backgroundLayer.addChild(platformst1)
    
 //   platformst3.size.width = 150
 //   platformst3.size.height = 1024// infinite bounce test: 6000 // was 1600

platformst3.size.height = 1491*0.85
platformst3.size.width = 956*0.85
    
  
    platformst3.position.x = 0// was -132 before decreasing dx velocity//-1000 //platforms[4].position.x - 500 //450




    platformst3.position.y = platformst3.size.height/2 - 250 //platformst3.size.height/2 - 200 //500
platformst3.zPosition = platformZPos
//platformst3.anchorPoint.y = 0

//platformst3.hidden = true // put back
backgroundLayer.addChild(platformst3)
    
    platformst3pb.size.width = platformwidth
platformst3pb.size.height = platformst3.size.height*0.85
platformst3pb.position.y = 0 //platformst3.size.height/2 - 200
platformst3pb.position.x = 0 //platforms[4].position.x - 500
    platformst3pb.physicsBody = SKPhysicsBody(rectangleOfSize: platformst3pb.size)
    platformst3pb.physicsBody!.dynamic = false
    platformst3pb.physicsBody!.friction = wallfriction
    
    platformst3pb.physicsBody!.restitution = 0
    platformst3pb.physicsBody!.categoryBitMask = PhysicsCategory.block
    platformst3pb.physicsBody!.contactTestBitMask = 0// PhysicsCategory.bird
    platformst3pb.physicsBody!.collisionBitMask = PhysicsCategory.bird
platformst3pb.zPosition = 1

    platformst3pb.name = "platform"
    platformst3.addChild(platformst3pb)
    
    platformst1.physicsBody!.linearDamping = 10
    platformst2.physicsBody!.linearDamping = 10
    platformst3pb.physicsBody!.linearDamping = 10

bigTree.zPosition = -5.5
bigTree.size.width = 956*0.6
bigTree.size.height = 1491*0.6
bigTree.position.x = 375
bigTree.position.y = -125
//bigTree.hidden = true // put back, remove
platformst3.addChild(bigTree)

bigTree2.zPosition = 1
bigTree2.size.width = 956*0.6
bigTree2.size.height = 1491*0.6
bigTree2.position.x = -275 //-375
bigTree2.position.y = -200 // -125
//bigTree2.hidden = true // put back, remove
platformst3.addChild(bigTree2)

bigTree3.zPosition = 2//-5.5
bigTree3.size.width = 956*0.6
bigTree3.size.height = 1491*0.6
bigTree3.position.x = -525 // -575
bigTree3.position.y = -50 //-125
//bigTree3.hidden = true // put back, remove
platformst3.addChild(bigTree3)

bigTree4.zPosition = -5.5//-5.5
bigTree4.size.width = 956
bigTree4.size.height = 1491
bigTree4.position.x = -825 // -575
bigTree4.position.y = 100 //-125
//bigTree4.hidden = true // put back, remove
platformst3.addChild(bigTree4)

flagPole.zPosition = -5.5
flagPole.size.width = 50
flagPole.size.height = 14000
flagPole.position.x = -390
flagPole.position.y = -flagPole.size.height/2 + 300
//platformst3.addChild(flagPole)

checkPointFlag.position.x = bigTree2.position.x + checkPointFlag.size.width/2 - 75
checkPointFlag.position.y = CGRectGetMaxY(bigTree2.frame) - 150
checkPointFlag.zPosition = platformSlotZPos + 0.5
checkPointFlag.size.width = 1.5*checkPointFlag.size.width
checkPointFlag.size.height = 1.5*checkPointFlag.size.height
//platformst3.addChild(checkPointFlag) // PUT BACK

checkPointFlag.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flagtexture2, timePerFrame: 0.09)))

checkPointFlag2.position.x = bigTree2.position.x + checkPointFlag2.size.width/2 - 75
checkPointFlag2.position.y = CGRectGetMaxY(bigTree2.frame) - 300
checkPointFlag2.zPosition = platformSlotZPos + 0.5
//platformst3.addChild(checkPointFlag2) // PUT BACK

checkPointFlag2.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flagtexture, timePerFrame: 0.09)))



// *** // *** // 10-2-15 print("platformst3.position: \(platformst3.position)")
// *** // *** // 10-2-15 print("platformst3.parent: \(platformst3.parent)")
// *** // *** // 10-2-15 print("platformst3.size: \(platformst3.size)")
    
    }
    
    
    // as? UITouch!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    /* Called when a touch begins */
    
    //    undotest = 1
      
      /*  
        UIView.transitionWithView(self.view!, duration: 1.325, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            
            // animation...
            
            }, completion: { (fininshed: Bool) -> () in
                
                // completion...
                
        })

*/
        
         let touchB = touches.first
    
    let touchLocationB = touchB?.locationInNode(backgroundLayer)

    if stopwatchicon1.containsPoint(touchLocationB!) {
touchontimer = 1

if GameState.sharedInstance.timer1running == 1 {

stopwatchLabel1.removeFromParent() // should allow to stop? probably have to run to the end instead
timerLabel1.removeFromParent()
GameState.sharedInstance

if GameState.sharedInstance.oneBlock == 1 {

GameState.sharedInstance.oneTime60 = 10

}

if GameState.sharedInstance.oneBlock == 3 {

GameState.sharedInstance.oneTime180 = 10

}


if GameState.sharedInstance.oneBlock == 4 {

GameState.sharedInstance.oneTime300 = 10

}

if GameState.sharedInstance.oneBlock == 5 {

GameState.sharedInstance.oneTime600 = 10

}

if GameState.sharedInstance.oneBlock == 6 {

GameState.sharedInstance.oneTime600b = 10

}








}

if GameState.sharedInstance.timer1running == -1 {


stopwatchLabel1.fontSize = 60
stopwatchLabel1.color = SKColor.blackColor()
stopwatchLabel1.position.x = stopwatchicon1.position.x + 100
stopwatchLabel1.position.y = stopwatchicon1.position.y
stopwatchLabel1.zPosition = interfaceButtonsZPos - backgroundLayerZPos
stopwatchLabel1.name = "constant"
backgroundLayer.addChild(stopwatchLabel1)


timerLabel1.fontSize = 60
timerLabel1.color = SKColor.yellowColor()
timerLabel1.horizontalAlignmentMode = .Left
timerLabel1.position.x = coinLabel.position.x//stopwatchLabel1.position.x + 100
timerLabel1.position.y = coinLabel.position.y - 100 //stopwatchLabel1.position.y
timerLabel1.zPosition = interfaceButtonsZPos //- backgroundLayerZPos
//backgroundLayer.addChild(timerLabel1)
self.addChild(timerLabel1)



if GameState.sharedInstance.oneBlock == 1 {

GameState.sharedInstance.oneTime60 = 110
GameState.sharedInstance.saveState()

stopwatchLabel1.text = "59"





timerLabel1.text = "0 / 30"


wait = SKAction.waitForDuration(1.0)
time1 = 59 
run1 = 1


}


if GameState.sharedInstance.oneBlock == 3 {

GameState.sharedInstance.oneTime180 = 110
GameState.sharedInstance.saveState()

stopwatchLabel1.text = "179"

timerLabel1.text = "0 / 100"


wait = SKAction.waitForDuration(1.0)
time1 = 179 
run1 = 1

}

if GameState.sharedInstance.oneBlock == 4 {

GameState.sharedInstance.oneTime300 = 110
GameState.sharedInstance.saveState()

stopwatchLabel1.text = "299"

timerLabel1.text = "0 / 200"


wait = SKAction.waitForDuration(1.0)
time1 = 299 
run1 = 1

}

if GameState.sharedInstance.oneBlock == 5 {

GameState.sharedInstance.oneTime600 = 110
GameState.sharedInstance.saveState()

stopwatchLabel1.text = "599"

timerLabel1.text = "0 / 400"


wait = SKAction.waitForDuration(1.0)
time1 = 599 
run1 = 1

}

if GameState.sharedInstance.oneBlock == 6 {

GameState.sharedInstance.oneTime600b = 110
GameState.sharedInstance.saveState()

stopwatchLabel1.text = "599"

timerLabel1.text = "0 / 400"


wait = SKAction.waitForDuration(1.0)
time1 = 599 
run1 = 1

}


let run = SKAction.runBlock {

    stopwatchLabel1.text = "\(self.time1 - self.run1)"
self.run1 += 1

}

let countAction = SKAction.repeatAction(SKAction.sequence([wait, run]), count: time1 + 1)

stopwatchLabel1.runAction(SKAction.sequence([countAction, SKAction.runBlock({

if GameState.sharedInstance.oneBlock == 1 {

GameState.sharedInstance.oneTime60 = 10

}

if GameState.sharedInstance.oneBlock == 3 {

GameState.sharedInstance.oneTime180 = 10

}


if GameState.sharedInstance.oneBlock == 4 {

GameState.sharedInstance.oneTime300 = 10

}

if GameState.sharedInstance.oneBlock == 5 {

GameState.sharedInstance.oneTime600 = 10

}

if GameState.sharedInstance.oneBlock == 6 {

GameState.sharedInstance.oneTime600b = 10

}

GameState.sharedInstance.timer1running *= -1
timerLabel1.removeFromParent()
stopwatchLabel1.removeFromParent()

})]), withKey: "TimerOne")




        




}

GameState.sharedInstance.timer1running *= -1
GameState.sharedInstance.saveState()

}



    let touch = touches.first
    
    let touchLocation = touch?.locationInNode(self)


if levelButton.containsPoint(touchLocation!) {

touchonlevel = 1

}

if matchMakerButton.containsPoint(touchLocation!) {

touchonmult = 1

}
    
        
    
    if pausebutton.containsPoint(touchLocation!) {
    touchonpause = 1
    }

if GameCenterButton.containsPoint(touchLocation!) {


touchongc = 1

}
        
        if matchMakerButton.containsPoint(touchLocation!) {
            
            
            touchonmm = 1
            
        }
    
    if touchonpause == 0 && gpaused == false && touchongc == 0 && touchontimer == 0 {

innerGauge.removeFromParent() // was adding child twice when using navigator
outerGauge.removeFromParent() // was adding child twice when using navigator
bird2.addChild(innerGauge)
bird2.addChild(outerGauge)

  innerGauge.runAction(SKAction.scaleTo(3.0, duration: jumpMax), withKey: "Charge")
outerGauge.runAction(SKAction.scaleTo(3.0, duration: jumpMax), withKey: "Charge")

    starttime = CFAbsoluteTimeGetCurrent()
    //   println("touchesbegan")
    
    // *** // *** // *** // 10-2-15 print("touchesBegan")
    
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
    
    let touch4 = touches.first
    
    
    
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
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: yellow:)")
    }
    
    if GameState.sharedInstance.oneCoinUpg == 1 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfSecondCoinUpg
    GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 10
    oneUpgOrder = GameState.sharedInstance.coinUpgOrder
    twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
    threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
    GameState.sharedInstance.saveState()
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: yellow:)")
    }
    
    if GameState.sharedInstance.oneCoinUpg == 2 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfThirdCoinUpg
    GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 1
    oneUpgOrder = GameState.sharedInstance.coinUpgOrder
    twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
    threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
    GameState.sharedInstance.saveState()
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: yellow:)")
    }
    
    GameState.sharedInstance.oneCoinUpg = GameState.sharedInstance.oneCoinUpg + 1
    updateUpgMeters()
    GameState.sharedInstance.saveState()
    // *** // *** // *** // 10-2-15 print("yellow coin upgrade complete")
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
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: blue:)")
    }
    
    if GameState.sharedInstance.oneCoinUpg == 1 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfSecondCoinUpg
    GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 20
    
    oneUpgOrder = GameState.sharedInstance.coinUpgOrder
    twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
    threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
    GameState.sharedInstance.saveState()
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: blue:)")
    }
    
    if GameState.sharedInstance.oneCoinUpg == 2 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfThirdCoinUpg
    GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 2
    
    oneUpgOrder = GameState.sharedInstance.coinUpgOrder
    twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
    threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
    GameState.sharedInstance.saveState()
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: blue:)")
    }
    
    GameState.sharedInstance.oneCoinUpg = GameState.sharedInstance.oneCoinUpg + 1
    updateUpgMeters()
    GameState.sharedInstance.saveState()
    // *** // *** // *** // 10-2-15 print("blue coin upgrade complete")
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
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: red:)")
    }
    
    if GameState.sharedInstance.oneCoinUpg == 1 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfSecondCoinUpg
    GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 30
    
    oneUpgOrder = GameState.sharedInstance.coinUpgOrder
    twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
    threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
    GameState.sharedInstance.saveState()
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: red:)")
    }
    
    if GameState.sharedInstance.oneCoinUpg == 2 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfThirdCoinUpg
    GameState.sharedInstance.coinUpgOrder = GameState.sharedInstance.coinUpgOrder + 3
    
    oneUpgOrder = GameState.sharedInstance.coinUpgOrder
    twoUpgOrder = GameState.sharedInstance.coinUpgOrder%100
    threeUpgOrder = GameState.sharedInstance.coinUpgOrder%10
    GameState.sharedInstance.saveState()
    
    // *** // *** // *** // 10-2-15 print("upgrade coin: red:)")
    }
    
    GameState.sharedInstance.oneCoinUpg = GameState.sharedInstance.oneCoinUpg + 1
    updateUpgMeters()
    GameState.sharedInstance.saveState()
    // *** // *** // *** // 10-2-15 print("red coin upgrade complete")
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
    
    // *** // *** // *** // 10-2-15 print("navigate on")
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
    // *** // *** // *** // 10-2-15 print("navigate on")
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
    // *** // *** // *** // 10-2-15 print("navigate on")
    
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
    bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart | PhysicsCategory.slidespike | PhysicsCategory.chain
    bird2.physicsBody!.categoryBitMask = PhysicsCategory.bird
    bird2.physicsBody!.affectedByGravity = true
    bird2.physicsBody!.velocity.dx = 100
    newtouch = 1
    
    // *** // *** // *** // 10-2-15 print("set dx = 100 from navigating")
    
    //   stoprolldice = 1 //TO PAUSE ROLLDICE. UNCOMMENT, USE NAVIGATOR TO MOVE TO WHEREVER, THEN HIT A NON-NAVIGATOR AREA TO STOP ROLLDICE.
    }
    
    
    
    
    
    //End Test Navigator
    
    
    
    
    }
    
    
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    
    // *** // *** // *** // 10-2-15 print("touchesEnded")
    
    //reset game REMOVE PUT BACK




    
    let touch0 = touches.first
    
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
    
    if (navigating == 0 || turnoffnavigating == 1) && gameover == false {
    
    
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
    
    if navigating == 0 && touchonpause == 0 && gpaused == false && gameover == false && touchontimer == 0 {
    
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
    
   // // *** // *** // *** // 10-2-15 print("novj at start of touchesend: \(novj)")

innerGauge.removeActionForKey("Charge")
outerGauge.removeActionForKey("Charge")

innerGauge.setScale(1.0)
outerGauge.setScale(1.0)

innerGauge.removeFromParent()
outerGauge.removeFromParent()
    bird2.removeActionForKey("Fall")
    birdfalling = 0
    
    if jumping == false {
    bird2.physicsBody!.velocity.dy = 0 //THIS IS NEW, TRYING THIS OUT TO SEE IF THIS WILL PREVENT THE RUNNING AGROUND AND JUMPING UP ERROR THAT HAPPENS WHEN ENDING THE TOUCH CLOSE TO SLIDING TO AN ATREST POSITION.
  //  // *** // *** // *** // 10-2-15 print("if jumping ==false, bird2 velocity dy = 0")
    }
    
    endtime = CFAbsoluteTimeGetCurrent()
    //   println("touchended")
    
    jumppower = endtime - starttime
    
    gauge.removeAllActions()
    var textures: [SKTexture] = []
    textures.append(SKTexture(imageNamed: "Circle0"))
    
    gauge.runAction(SKAction.animateWithTextures(textures, timePerFrame: 1))
    
    //  animateWithTextures(SKTexture(imageNamed: "Circle0")))
    
    
    
    if jumppower > jumpMax { // was 0.3
    jumppower = jumpMax
    
    }
 //   // *** // *** // *** // 10-2-15 print("jumppower: \(jumppower)")
    
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
 //   // *** // *** // *** // 10-2-15 print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")
    
    }
    
    bird2.physicsBody!.affectedByGravity = true
    newtouch = 1
  //  // *** // *** // *** // 10-2-15 print("newtouch = 1")
    startjx = bird2.position.x
    
    bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.dart | PhysicsCategory.floor | PhysicsCategory.slidespike | PhysicsCategory.chain
    
    
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
        // *** // *** // 10-2-15 print("pssdcounter = 3")
    
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.danger | PhysicsCategory.outline // Needed to exclude floor to prevent running aground
    bird2.physicsBody!.contactTestBitMask = PhysicsCategory.danger | PhysicsCategory.dart
  //  // *** // *** // *** // 10-2-15 print("change collision bitmask: \(bird2.physicsBody!.contactTestBitMask)")
  //  // *** // *** // *** // 10-2-15 print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")
    
    
    sliding = false // causing an issue with triggering sliding again. Is this needed? REMOVED 7/16/2015. I added this back when I added the bird2con = 0 qualifier below 7/17/2015.
    }
  //  // *** // *** // *** // 10-2-15 print("jumppower: \(jumppower)")
    bird2.physicsBody?.velocity = CGVector(dx: facingdirection*(jumppower*jumpMX + jumpYX), dy: jumppower*jumpMY + jumpYY)//CGVector(dx: facingdirection*(jumppower*1750 + 214.5444), dy: jumppower*2625 + 575.22) //dy: 3200// dy: 2625 // (dx: facingdirection*(jumppower*1533.33 + 460), dy: jumppower*1866.67 + 560)//facingdirection*jumppower*2300, dy: jumppower*2800 // 9.8: dx *1950 dy *2400, 14.7: dx 2700 dy 2900 12.0: dx 1950 dy 2500
        // *** // *** // 10-2-15 print("velocity afterset: \(bird2.physicsBody?.velocity)")
     //   networkingEngine?.sendMove(Float(bird2.physicsBody!.velocity.dx), dy: Float(bird2.physicsBody!.velocity.dy), rotation: Float(bird2.zRotation))
playjumpsound()
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
   // // *** // *** // *** // 10-2-15 print("bird5concheck set to 0")
    runpos = 1
   // // *** // *** // *** // 10-2-15 print("bird2con set to 0 in touches ended function")
   // // *** // *** // *** // 10-2-15 print("bird2velocitydx: \(bird2.physicsBody?.velocity.dx)")
  //  // *** // *** // *** // 10-2-15 print("bird2velocitydy: \(bird2.physicsBody?.velocity.dy)")
   // // *** // *** // *** // 10-2-15 print(" touchesended state assessment, normal jump: atrest: \(atrest) ")
    
    
    if facingdirection == -1 {
    
    flytextureL.append(flytextl)
    
    //    bird.removeAllActions(  

//birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureL, timePerFrame: 1000000))) //PUT BACK


//birdimage.texture =  SKTexture(imageNamed: "SimpleJumpLeft3")


birdimageleftjump.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftjump)

birdimageleftjump.anchorPoint.x = 0.5
birdimageleftjump.anchorPoint.y = 0.5
    
} else {
    
    flytextureR.append(flytextr)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureR, timePerFrame: 1000000))) //PUT BACK

//birdimage.texture =  SKTexture(imageNamed: "SimpleJumpRight3")

birdimagerightjump.removeFromParent()

bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightjump)

birdimagerightjump.anchorPoint.x = 0.5
birdimagerightjump.anchorPoint.y = 0.5
    }
    }
    
    //END function: NORMAL JUMP
    
    //function: ATREST JUMP
    
    if atrest == true && novj == 0 {
    //  bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger 
    
    
    bird2.physicsBody?.velocity = CGVector(dx: 0, dy: jumppower*jumpMY + jumpYY) // dy: 3200// dy: jumppower*2625 + 575.22)
        
        // *** // *** // 10-2-15 print("velocity afterset: \(bird2.physicsBody?.velocity)")
     //   networkingEngine?.sendMove(Float(bird2.physicsBody!.velocity.dx), dy: Float(bird2.physicsBody!.velocity.dy), rotation: Float(bird2.zRotation))
playjumpsound()
    sliding = true
    running = false
    jumping = false
    atrest = false
    
    //          bird5con = 0
    bird5concheck = 1
  //  // *** // *** // *** // 10-2-15 print("bird5concheck set to 1")
    newtouch = 0
  //  // *** // *** // *** // 10-2-15 print("atrest jump")
        
        
        
    
    /*   if abs(bird2.physicsBody!.velocity.dx) > 5 {
    
    bird2.physicsBody?.velocity = CGVector(dx: bird2.physicsBody!.velocity.dx, dy: bird2.physicsBody!.velocity.dy) // was dy: jumppower*2800


    
    
    sliding = false
    running = false
    jumping = true
    atrest = false
    newtouch = 1
    
    if cornerland == 0 {
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
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
    ////birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightslidetexture, timePerFrame: 1000000))) // put back


//birdimage.texture =  SKTexture(imageNamed: "RightSlideBirdNew")

birdimagerightjump.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightjump)


birdimagerightjump.anchorPoint.x = 0.3
birdimagerightjump.anchorPoint.y = 0.5
    
} else {
    
    leftslidetexture.append(leftslidetext)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftslidetexture, timePerFrame: 1000000))) // PUT BACK


//birdimage.texture = SKTexture(imageNamed: "LeftSlideBirdNew")

birdimageleftslide.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftslide)


birdimageleftslide.anchorPoint.x = 0.7
birdimageleftslide.anchorPoint.y = 0.5
    }
    
    
    
    }
    //end function: ATREST JUMP
    
    
    
    novj = 0
    }
        }
        
        jumpcheck()
        
    
    if turnoffnavigating == 1 {
    
    navigating = 0
    // *** // *** // *** // 10-2-15 print("navigate off")
    
    }
    
    
    let touch = touches.first
    
    let touchLocation = touch?.locationInNode(self)
    
    
    
    if freecoins.containsPoint(touchLocation!) {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins + 100
    coinLabel.text = "\(GameState.sharedInstance.coins)"
    }
    
    
    
        func pausegame() {

print("pause game")

pauseFilter.removeFromParent()
pauseFilter.alpha = 0.6       
self.addChild(pauseFilter)
pauseFilter.size.height = self.size.height/2
pauseFilter.size.width = self.size.width/2
pauseFilter.position.x = self.size.width/2
pauseFilter.position.y = self.size.height/2
pauseFilter.zPosition = interfaceButtonsZPos
pauseFilter.color = UIColor.blackColor()
pauseFilter.colorBlendFactor = 1
//pauseFilter.runAction(SKAction.fadeAlphaTo(0.6, duration: 0.5))
     /*
    backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in
    
    let pauseplatform = node as! SKSpriteNode
    
    
    
    
    pauseplatform.paused = true
    
    }
    
    backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in
    
    let pausevplatform = node as! SKSpriteNode
    
    
    
    
    pausevplatform.paused = true
    
    }
            
            backgroundLayer.enumerateChildNodesWithName("floorForbid") { node, _ in
                
                let pauseff = node as! SKSpriteNode
                
                
                
                
                pauseff.paused = true
                
            }*/
  //  backgroundLayer.paused = true
    
    pausescreen.size.width = 800
    pausescreen.size.height = 1500
    pausescreen.position.x = self.size.width/2
    
    pausescreen.position.y = self.size.height/2
    pausescreen.zPosition = pauseScreenZPos 
    pausescreen.name = "pausescreen"
    //some kind of problem with this, being added twice PUT BACK but fix first
    
    
    
    screenScoreLabel.removeFromParent()
    screenScoreLabel = SKLabelNode(text: "Score: \(GameState.sharedInstance.score)")
    screenScoreLabel.position.x = 0
    screenScoreLabel.position.y = 400
screenScoreLabel.zPosition = pauseScreenButtonZPos
    screenScoreLabel.fontColor = SKColor.blackColor()
    //  screenScoreLabel.fontName = NoteWorthy
    screenScoreLabel.fontSize = 65
screenScoreLabel.removeFromParent()
    pausescreen.addChild(screenScoreLabel)
    
    screenHighScoreLabel.removeFromParent()
    screenHighScoreLabel = SKLabelNode(text: "High Score: \(GameState.sharedInstance.highScore)")
    screenHighScoreLabel.position.x = 0
    screenHighScoreLabel.position.y = 100
screenHighScoreLabel.zPosition = pauseScreenButtonZPos
    screenHighScoreLabel.fontColor = SKColor.blackColor()
    //    screenhighScoreLabel.fontName = NoteWorthy
    screenHighScoreLabel.fontSize = 65
screenHighScoreLabel.removeFromParent()
    pausescreen.addChild(screenHighScoreLabel)
    
    
    self.addChild(pausescreen) // was backgroundlayer's child


/*
            
           //can't add entire backgroundLayer because exceeds maximum width. Need to enumerate the nodes to blur:



*/


//take screenshot. Will need to remove any moving parts first, then add back after filtered screenshot added


//come back here




//backgroundLayer.removeAllChildren()

/* try 1
UIGraphicsBeginImageContext(view!.frame.size)
view!.layer.renderInContext(UIGraphicsGetCurrentContext()!)
let imageRef = UIGraphicsGetImageFromCurrentImageContext()
let screenCap = SKTexture(image: imageRef)
freezeFrame = SKSpriteNode(texture: screenCap)
freezeFrame.zPosition = 50
freezeFrame.position.x = self.size.width/2
freezeFrame.position.y = self.size.height/2
self.addChild(freezeFrame) 

*/
            
            //try 2: 
            //need to exclude moving things first, then add them back. But you need to take the screenshot in  frame follwoing when removing them.
        //    bird2.removeFromParent()

//take screenshot:
            /*
            UIGraphicsBeginImageContextWithOptions(self.view!.bounds.size, false, 0);
            self.view!.drawViewHierarchyInRect(self.view!.bounds, afterScreenUpdates: true)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            let blur = screenshot //.applyLightEffect() //applyBlurWithRadius(2, tintColor: nil, saturationDeltaFactor: 1.0, maskImage: nil) //UIColor(red: 0, green: 0, blue: 1, alpha: 0.7)//applyDarkEffect()
            let screenCap = SKTexture(image: blur)
            
            freezeFrame = SKSpriteNode(texture: screenCap)
            freezeFrame.zPosition = pauseScreenZPos - 1
            freezeFrame.position.x = self.size.width/2
            freezeFrame.position.y = self.size.height/2
            freezeFrame.size.width = self.size.width
            freezeFrame.size.height = self.size.height
        //   self.addChild(freezeFrame) //put back for blurred effect
        //    
            
         //   Add filter. For filter over screen during pause menu. Need to add each asset individually (only assets that are visible within the self screen).
           
            effectNode.position.x = self.size.width/2
            
            effectNode.position.y = self.size.height/2
            effectNode.zPosition = 50
            
         //   self.addChild(effectNode)
            
        //    effectNode.addChild(freezeFrame)

*/



          //  UIImageWriteToSavedPhotosAlbum(screenshot, nil, nil, nil)       


/*
//UIGraphicsEndImageContext()

backgroundLayer.enumerateChildNodesWithName("*") { node, _ in

let blurNode = node as! SKSpriteNode

if CGRectGetMinX(blurNode.position.x) < bird2.position.x + self.size.width/2 || CGRectGetMaxX(blurNode.position.x) > bird2.position.x - self.size.width/2 {






}
*/

    
    gpaused = true
    //    scene.view?.paused = true
    self.speed = 0 // PUT BACK, EXPERIMENTING WITH STORE SCREEN
    self.physicsWorld.speed = 0 // PUT BACK, EXPERIMENTING WITH STORE SCREEN
    touchonpause = 0
    
    //   replaybutton.runAction(SKAction.moveToY(self.size.height - 1200, duration: 1))
    }
    

if GameCenterButton.containsPoint(touchLocation!) && touchongc == 1 {

// *** // *** // 10-2-15 print("rightbeforeshowLeader")
    
    
    

viewController.showLeader()

    
    
    
    
        }
        
        
        
        if matchMakerButton.containsPoint(touchLocation!) && touchonmm == 1 {
            
       //     // *** // *** // 10-2-15 print("rightbeforeopenMatchMaker")
            
            
            
            
        //    viewController.openMatchmaker()
            
            
      //     viewController.showMatchMakerViewController() //OLD WAY OF MATCHMAKING USING GAMEVIEWCONTROLLER
            // *** // *** // 10-2-15 print("button hit for matchmake")
            
        }



    if pausebutton.containsPoint(touchLocation!) && gpaused == false && touchonpause == 1 {
        
        pausegame()
        
        }
    

if levelButton.containsPoint(touchLocation!) && touchonlevel == 1 {

showLevelScreen()

}


if touchonmult == 0 && touchonlevel == 0 && tapStart == false && levelSelectOn == false {

singlePlayerStart()
tapStart = true

}
        
    //Score Screen Button Clicks:
        

    
    if gameover == true { 
    
    let touch5 = touches.first
    
    
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


if exitButton.containsPoint(touchLocation5!) {

exitToMain()



if noOfCars == 1 {


/*

Storyboard issue


// *** // *** // 10-2-15 print("exit")
//gameViewController.noOfCars = 1
//noOfCars = 1
navController.pushViewController(homeScreenController, animated: false)
// *** // *** // 10-2-15 print("go back to home screen from scorescreen, single player")


*/
}

    


        }
    
    if replaybutton2.containsPoint(touchLocation5!)  {



    // *** // *** // *** // 10-2-15 print("replay")
    
    /* THESE CHANGES ARE MADE WHEN SCORESCREEN COMES UP

print("replaybutton2 pressed")
    
    if GameState.sharedInstance.score >= 5 {
    
    GameState.sharedInstance.checkpointround = GameState.sharedInstance.checkpointround + 1 // MAKE SURE CHECKPOINT ROUND IS ALWAYS BEING COUNTED WHEN SCORE > 5
    
    if GameState.sharedInstance.score > GameState.sharedInstance.checkpointHS && checkpointmode == 0 {
    
    GameState.sharedInstance.checkpointHS = GameState.sharedInstance.score
    
    }
    
    GameState.sharedInstance.saveState()
    }


    */
    

if opponentReplay != 2 && noOfCars > 1 {

networkingEngine?.sendRematch(1)

}
selfReplay = 1

    transitionToGame()
    
    gameover = false
  //  gpaused = false
        }
    
        }

//End Store Button clicks
    
    
    print("begin replay button test")
    //Pause Button Clicks:
    
    // *** // *** // *** // 10-2-15 print("replaybutton.containsPoint(touchLocation!): \(replaybutton.containsPoint(touchLocation!) == true)")
    // *** // *** // *** // 10-2-15 print("gameover: \(gameover)")
    if gpaused == true {
    print("test paused = true pass")
    if gstore == false {
    let touch2 = touches.first
    print("test store = true pass")
    //  let touchLocation2 = touch2?.locationInNode(scorescreen) //PUT BACK for when replay button is in scorescreen again
    
    let touchLocation2 = touch2?.locationInNode(pausescreen)



if exitButton2.containsPoint(touchLocation2!) {


exitToMain()


}
    
    
    if replaybutton.containsPoint(touchLocation2!)  {



bird2.removeFromParent()
awardBackgroundOne.removeFromParent()
awardPlatformOne.removeFromParent()
    
    // *** // *** // *** // 10-2-15 print("replay")
    
    print("REPLAYBUTTON PRESSED")
    
    if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.checkpointunlock == 1 {
    
    GameState.sharedInstance.checkpointround = GameState.sharedInstance.checkpointround + 1
    
    if GameState.sharedInstance.score > GameState.sharedInstance.checkpointHS && checkpointmode == 0 {
    
    GameState.sharedInstance.checkpointHS = GameState.sharedInstance.score
    
    }
    
    GameState.sharedInstance.saveState()
    } //CHECKPOINTPUTBACK


    transitionToGame()
    
    self.speed = 1.0
    self.physicsWorld.speed = physicsSpeed
    
    gameover = false
    gpaused = false

        }
        
    
    if storebutton.containsPoint(touchLocation2!)  {
    
    pausescreen.removeFromParent()
    pausescreen.zPosition = pauseScreenZPos
    storescreen.size.width = 800
    storescreen.size.height = 1500
    storescreen.position.x = self.size.width/2 //bird2.position.x
    
    storescreen.position.y = self.size.height/2
    storescreen.zPosition = storeScreenZPos
    
    self.addChild(storescreen)
    
    // worldNode.runAction(SKAction.moveByX(0, y: -2048, duration: 2))

//worldNode.runAction(SKAction.fadeAlphaTo(0, duration: 0.3))
    
    //  gpaused = false
    gstore = true
    
    }
    
    if backbuttonpause.containsPoint(touchLocation2!)  {
    
    
    //    self.view?.paused = false

pauseFilter.removeFromParent()
//freezeFrame.removeFromParent()
    
    gpaused = false
    pausescreen.removeFromParent()
    
    self.speed = 1.0
    self.physicsWorld.speed = physicsSpeed
        
        // *** // *** // 10-2-15 print("startenum")
    /*
    backgroundLayer.enumerateChildNodesWithName("platform") { node, _ in
    
    let pauseplatform = node as! SKSpriteNode
    
    
    
    
    pauseplatform.paused = false
    
        }
        
    
    backgroundLayer.enumerateChildNodesWithName("vplatform") { node, _ in
    
    let pausevplatform = node as! SKSpriteNode
    
    
    
    
    pausevplatform.paused = false
    
    }
        
        
        
        backgroundLayer.enumerateChildNodesWithName("floorForbid") { node, _ in
            
            let pauseff = node as! SKSpriteNode
            
            
            
            
            pauseff.paused = false
            
        }*/
        backgroundLayer.paused = false
        
        // *** // *** // 10-2-15 print("endenum")
        
        
     //   floorForbids[closepos].paused = false
    }
    }
    
    }
    
    
    
    
    //Store Button Clicks:
        
        func storebuttonclicks() {
    
    if gstore == true {
    
    if gcoinchoice == false {
    
    let touch3 = touches.first
    
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
    // *** // *** // *** // 10-2-15 print("mult1 upgrade complete")
    coinLabel.text = String(GameState.sharedInstance.coins)
    updateUpgMeters()
    }
    
    if GameState.sharedInstance.coins >= costOfCoinMultTwo && GameState.sharedInstance.coinMult == 2 {
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfCoinMultTwo
    GameState.sharedInstance.coinMult = 5
    GameState.sharedInstance.saveState()
    // *** // *** // *** // 10-2-15 print("mult2 upgrade complete")
    coinLabel.text = String(GameState.sharedInstance.coins)
    updateUpgMeters()
    }
    
    if GameState.sharedInstance.coins >= costOfCoinMultThree && GameState.sharedInstance.coinMult == 5 {
    
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfCoinMultThree
    GameState.sharedInstance.coinMult = 10
    GameState.sharedInstance.saveState()
    updateUpgMeters()
    // *** // *** // *** // 10-2-15 print("mult3 upgrade complete")
    coinLabel.text = String(GameState.sharedInstance.coins)
    updateUpgMeters()
    }
    
    }
    
    
    
    if buyslbutton.containsPoint(touchLocation3!) && GameState.sharedInstance.coins >= costOfUnlSecLives && GameState.sharedInstance.secondLife == 0 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfUnlSecLives
    GameState.sharedInstance.secondLife = 1
    secondlives = 1
    GameState.sharedInstance.saveState()
    // *** // *** // *** // 10-2-15 print("second life upgrade complete")
    updateUpgMeters()
    coinLabel.text = String(GameState.sharedInstance.coins)
    
    }
    
    
    if buyOneCoinUpgButton.containsPoint(touchLocation3!) && ((GameState.sharedInstance.coins >= costOfFirstCoinUpg && GameState.sharedInstance.oneCoinUpg == 0) || (GameState.sharedInstance.coins >= costOfSecondCoinUpg && GameState.sharedInstance.oneCoinUpg == 1) || (GameState.sharedInstance.coins >= costOfThirdCoinUpg && GameState.sharedInstance.oneCoinUpg == 2)) {
    
    
    coinchoicescreen.size.width = 600
    coinchoicescreen.size.height = 400
    coinchoicescreen.position.x = self.size.width/2
    coinchoicescreen.position.y = self.size.height/2
    coinchoicescreen.zPosition = coinChoiceScreenZPos
    coinchoicescreen.name = "coinchoicescreen"
    
    self.addChild(coinchoicescreen)
    
    
    gcoinchoice = true
    
    }
    
    
    if buyCheckpointButton.containsPoint(touchLocation3!) && GameState.sharedInstance.coins >= costOfCheckpoint && GameState.sharedInstance.checkpointunlock == 0 {
    
    GameState.sharedInstance.coins = GameState.sharedInstance.coins - costOfCheckpoint
    GameState.sharedInstance.checkpointunlock = 1
    GameState.sharedInstance.saveState()
    // *** // *** // *** // 10-2-15 print("checkpoint upgrade complete")
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

//worldNode.runAction(SKAction.fadeAlphaTo(1, duration: 0.3))
    
  //  worldNode.runAction(SKAction.moveByX(0, y: 2048, duration: 2))
    storescreen.removeFromParent()
    self.addChild(pausescreen)
        
        pausescreen.zPosition = pauseScreenZPos
    gstore = false
    gpaused = true
    
    }
    }
    }
        }
        
        storebuttonclicks()
    
    //Coin Choice Screen
    if gcoinchoice == true {
    
    let touch4 = touches.first
    
    
    
    let touchLocation4 = touch4?.locationInNode(coinchoicescreen)
    
    if backbuttoncoinscreen.containsPoint(touchLocation4!) {
    
    coinchoicescreen.removeFromParent()
    gcoinchoice = false
    
    }
    
    }
    
    
   

let touchL = touches.first
let touchLocationL = touchL?.locationInNode(levelScreen)

print("touchL: \(touchL) touchLocationL: \(touchLocationL)")

if levelSelectOn == true {

if level1Button.containsPoint(touchLocationL!) {

if GameState.sharedInstance.loadLevel == 0 {

hideLevelScreen()


} 


if GameState.sharedInstance.loadLevel != 0 {

GameState.sharedInstance.loadLevel = 0
GameState.sharedInstance.costumechoice = 1 // may need to alter this to not undo manual costume choice user makes
GameState.sharedInstance.saveState()
exitToMain()



}

}

if level2Button.containsPoint(touchLocationL!) {


if GameState.sharedInstance.loadLevel == 1 {

hideLevelScreen()


}

if GameState.sharedInstance.loadLevel != 1 {

GameState.sharedInstance.loadLevel = 1
GameState.sharedInstance.costumechoice = 2 // may need to alter this to not undo manual costume choice user makes
GameState.sharedInstance.saveState()
exitToMain()



}


}

if level3Button.containsPoint(touchLocationL!) {

if GameState.sharedInstance.loadLevel == 2 {

hideLevelScreen()


} 

if GameState.sharedInstance.loadLevel != 2 {

GameState.sharedInstance.loadLevel = 2
GameState.sharedInstance.costumechoice = 3 // may need to alter this to not undo manual costume choice user makes
GameState.sharedInstance.saveState()
exitToMain()



}


}

}

if backbuttonlevelscreen.containsPoint(touchLocationL!) {
    
    hideLevelScreen()

    }

 touchonpause = 0
touchontimer = 0
touchongc = 0
touchonmult = 0
touchonlevel = 0
    
    }



    
    
    /*   ball.physicsBody?.velocity.dx = 0
    println("success")
    }*/
    
    
    override func didFinishUpdate() {
  
//print("didFinishUpdate")
  
    
    
    if firstswadjust != 0 {
    
    firstswadjust = 0
    }
    
    if checkpointmode == 1 && checkpointmove == 0 {
        
        bird2.physicsBody!.contactTestBitMask = 0
        bird2.physicsBody!.collisionBitMask = 0
    // MOVE TO PLACE INSIDE CASTLE   bird2.runAction(SKAction.moveToX(platforms[4].position.x + 250, duration: 1))
        
         bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.floor | PhysicsCategory.dart | PhysicsCategory.slidespike | PhysicsCategory.chain
        bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
    //    bird2.position.y = CGRectGetMaxY(ground.frame) + bird2.size.height/2 + 30
        
    GameState.sharedInstance.score = GameState.sharedInstance.checkpointHS
        
    //   scoreLabel.text = "\(GameState.sharedInstance.score)"
        
    checkpointmove = 1
        
    } //CHECKPOINTPUTBACK
    
    func centerViewOn(centerOn: CGFloat) {
    let x = centerOn
        
        
        let difference: CGFloat = centerOn + worldNode.position.x
    

    worldNode.position.x = -x
        
        distantWorldNode.position.x = distantWorldNode.position.x - difference*distantSpeed
        
        midWorldNode.position.x = midWorldNode.position.x - difference*midSpeed
        
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

if bird2.position.x - self.size.width/2 > -(worldNode.position.x) || downarrow.parent != nil { //forward progression unless second life repo or navigation
    
    var checkplace: Int = 0
    
    if closepos == -1 {
        
        checkplace = 4
        
    
    } else { 
        
        checkplace = closepos  // use catch strip instead for multiplayer, since closepos may not be the next platform for trailing player
        
    }



if castleType > 0 { // == 1

/* old castleType == 1

if bird2.position.x - self.size.width + 300 > -worldNode.position.x {

centerViewOn(bird2.position.x - self.size.width + 300)

}

*/

if bird2.position.x - self.size.width/2 > -(worldNode.position.x) {

centerViewOn(bird2.position.x - self.size.width/2)

}

}


if (CGRectGetMaxX(bird2.frame) < CGRectGetMinX(platforms[4].frame) && bird2.position.x < 2000) || CGRectGetMinX(bird2.frame) > CGRectGetMaxX(platforms[checkplace].frame) || ((CGRectGetMinY(bird2.frame) > CGRectGetMaxY(platforms[checkplace].frame) + 30) && CGRectGetMaxY(bird2.frame) < CGRectGetMinY(vplatforms[checkplace].frame) - 30) || (bird2.position.x > -worldNode.position.x && castleType == 1) || downarrow.parent != nil {

    if bird2.physicsBody!.velocity.dx > 10 || downarrow.parent != nil || introCastle == 1 {



    centerViewOn(bird2.position.x - self.size.width/2)






    }
    
    }
    
    
}
    
    // }
    
    
    
    
    
    if jumping == false || (jumping == true && bird2.physicsBody!.collisionBitMask != 142){ // ADD AND A VARIABLE == 0
    
    if bird2.physicsBody!.affectedByGravity == true && bird2con == 0 && bird2conv == 0 && breakwallcon == 0 {
    
    
    
    
    if jumping == false {
    
    if facingdirection == -1 {
    
    flytextureL.append(flytextl)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureL, timePerFrame: 1000000))) // PUT BACK


//birdimage.texture =  SKTexture(imageNamed: "SimpleJumpLeft3") // With costumes, swap out different birdimages (assembled standing, assembled jumping, etc.)

birdimageleftjump.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftjump)

birdimageleftjump.anchorPoint.x = 0.5
birdimageleftjump.anchorPoint.y = 0.5
    
} else {
    
    flytextureR.append(flytextr)
    
    //    bird.removeAllActions()
     ////birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(flytextureR, timePerFrame: 1000000)))  // PUT BACK

//birdimage.texture =  SKTexture(imageNamed: "SimpleJumpRight3")

birdimagerightjump.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightjump)

birdimagerightjump.anchorPoint.x = 0.5
birdimagerightjump.anchorPoint.y = 0.5
    }
    }
    
    
    jumping = true
    running = false
    sliding = false
    atrest = false
    
    if newtouch == 1 {
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.block | PhysicsCategory.outline | PhysicsCategory.chain
    // *** // *** // *** // 10-2-15 print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")
    
    }
    cornerland = 0
    
    // *** // *** // *** // 10-2-15 print("jumping")
    
    /* if cornerland == 1 {
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.block | PhysicsCategory.outline | PhysicsCategory.chain
    cornerland = 0
    } */
    
    
    
    

    
    
    }
    }
    
    
    //FUNCTION: STATE CHANGE TO ATREST
    
    if atrest == false && birdfalling == 0 && abs(bird2.physicsBody!.velocity.dx) < 50 && runningthisframe == 0 {
    
    if bird2con > 5 {
    
    bird2.physicsBody!.affectedByGravity = true
    // *** // *** // *** // 10-2-15 print("atrest")
    // *** // *** // *** // 10-2-15 print("bird2con after atrest triggered: \(bird2con)")
    //    birdimage.anchorPoint = CGPoint(x: 0.5, y: newAnchorPoint)
    adjustcounter = 0
    bird2.removeActionForKey("Fall")
    birdfalling = 0
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
    bird2.physicsBody!.velocity.dx = 0.00000000000000
    
    jumping = false
    running = false
    sliding = false
    atrest = true
    
    
    
    
    if facingdirection == -1 {
    
    leftresttexture.append(leftresttext)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftresttexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "RightRestBirdNew")

birdimagerightrest.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightrest)

birdimagerightrest.anchorPoint.x = 0.5
birdimagerightrest.anchorPoint.y = 0.5
    
} else {
    
    rightresttexture.append(rightresttext)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightresttexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "LeftRestBirdNew")

birdimageleftrest.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftrest)

birdimageleftrest.anchorPoint.x = 0.5
birdimageleftrest.anchorPoint.y = 0.5
    }
    
    }
    }
    
    //ENDFUNCTION: STATE CHANGE TO ATREST


//FUNCTIONS: ASSIGN RISE AND FALL ACTION IF LANDS ON TOP OF PLATFORM

if firstplatformcontact == 1 && running == true {

var resetp = SKAction!()
var resetb = SKAction!()

if tempplatform.hasActions() {



resetp = SKAction.moveToY(tempplatform.physicsBody!.charge, duration: 0.5)
resetb = SKAction.moveToY(tempplatform.physicsBody!.charge + platformheight/2 + bird2.size.height/2, duration: 0.5) 

} else {

resetp = SKAction.waitForDuration(0.0)
resetb = SKAction.waitForDuration(0.0)

}



tempplatform.removeAllActions()
bird2.removeAllActions()


tempplatform.runAction(SKAction.sequence([resetp, SKAction.waitForDuration(NSTimeInterval(fallwaittime)), SKAction.moveByX(0, y: -1500, duration: falltime)]), withKey: "Fall")

bird2.runAction(SKAction.sequence([resetb, SKAction.waitForDuration(NSTimeInterval(fallwaittime)), SKAction.moveByX(0, y: -1500, duration: falltime)]), withKey: "Fall")


}


//END FUNCTIONS: ASSIGN RISE AND FALL ACTION IF LANDS ON TOP OF PLATFORM

    
    //FUNCTIONS: CANCEL FALSE FALL ACTIONS AND SET BIRDFALLING STATE
    
    //cancels fall action if collision not made - platforms
    
    if firstplatformcontact == 1 && abs(bird2.physicsBody!.velocity.dx) > 50 {
    


   
    
    birdfalling = 0
    
    firstplatformcontact = 0
    // *** // *** // *** // 10-2-15 print("platform fall removed 1")
    
    
    }
    
    if firstplatformcontact == 1 && abs(bird2.physicsBody!.velocity.dx) <= 50 {



if tempplatform.hasActions() == false {



tempplatform.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(fallwaittime)), SKAction.moveByX(0, y: -1500, duration: falltime)]), withKey: "Fall")

   tempplatform.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(fallwaittime)), SKAction.moveByX(0, y: -1500, duration: falltime)]), withKey: "Fall")

}
    
    firstplatformcontact = 0
    
    if bird2.hasActions() == true {
    
    birdfalling = 1
    
    }
    
    }
    
    //cancels fall action if collision not made - vplatforms
    
    if firstvplatformcontact == 1 && abs(bird2.physicsBody!.velocity.dx) > 50 {
    
    tempvplatform.removeActionForKey("Fall")
    bird2.removeActionForKey("Fall")
    // *** // *** // *** // 10-2-15 print("vplatform fall removed 1")
    
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
    // *** // *** // *** // 10-2-15 print("slidespikedeath")
//
 //     death()
    
    //  Function: end spike check
    }
    }
    
    override func didApplyConstraints() {
        if printOn == 1 {
    // *** // *** // *** // 10-2-15 print("didApplyConstraints")
        }
    }
    
    
    override func didSimulatePhysics() {
    
        
        print("didSimulatePhysics")
        if printOn == 1 {
    // *** // *** // *** // 10-2-15 print("didSimulatePhysics")
    // *** // *** // *** // 10-2-15 print("velocity at beginning of didSimulatePhysics: dx: \(bird2.physicsBody!.velocity.dx) dy: \(bird2.physicsBody!.velocity.dy)")
    
    // *** // *** // *** // 10-2-15 print("pssdcounter: \(pssdcounter)")
        }
        // *** // *** // 10-2-15 print("placeholder1: \(placeholder1)")
        // *** // *** // 10-2-15 print("placeholder2: \(placeholder2)")
        // *** // *** // 10-2-15 print("placeholder3: \(placeholder3)")
        // *** // *** // 10-2-15 print("placeholder4: \(placeholder4)")
    
    
    if pssdcounter > 0 {
    
    if pssdcounter == 1 {
    
    // *** // *** // *** // 10-2-15 print("pssdrun")
    preventssdeath = 0
    
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.floor | PhysicsCategory.chain
    
    bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.dart | PhysicsCategory.floor | PhysicsCategory.slidespike | PhysicsCategory.chain
        // *** // *** // 10-2-15 print("reset contactbitmask")
    
    }
    
    pssdcounter = pssdcounter - 1
    
    // *** // *** // 10-2-15 print("pssdcounter = pssdcounter - 1")
    
    }

    
    func setMultTimer() {
        
        




      //  scaleMode = .ResizeFill

let circleRadius: CGFloat = 50
        
        //increase size when first shows up, from 0 to full size very quickly.
        
        let circle = SKShapeNode(circleOfRadius: circleRadius)
        circle.fillColor = SKColor.blueColor()
        circle.strokeColor = SKColor.clearColor()
       // circle.position = view!.center
        circle.zRotation = CGFloat(M_PI_2)
        circle.zPosition = 900
    //    addChild(circle) // put back
        
        let timerLess = SKSpriteNode(imageNamed: "timerLess")
        let timerMore = SKSpriteNode(imageNamed: "timerMore")
        
        timerLess.size.width = circleRadius*2 + 10
        timerLess.size.height = circleRadius*2 + 10
        
        timerMore.size.width = circleRadius*2 + 5
        timerMore.size.height = circleRadius*2 + 5
        
        
        timerLess.zPosition = -0.5
        timerMore.zPosition = 0.5
        
        
        circle.addChild(timerLess)
        circle.addChild(timerMore)

        
        countdown(circle, steps: 420, duration: 7) {
            print("done")



        }
        }
        
        // Creates an animated countdown timer
        func countdown(circle:SKShapeNode, steps:Int, duration:NSTimeInterval, completion:()->Void) {
            let radius = CGPathGetBoundingBox(circle.path).width/2
            let timeInterval = duration/NSTimeInterval(steps)
            let incr = 1 / CGFloat(steps)
            var percent = CGFloat(1.0)
            
            let animate = SKAction.runBlock({
                percent -= incr
                circle.path = circleT(radius, percent:percent)
            })
            let wait = SKAction.waitForDuration(timeInterval)
            let action = SKAction.sequence([wait, animate])
            
            runAction(SKAction.repeatAction(action,count:steps-1)) {
                self.runAction(SKAction.waitForDuration(timeInterval)) {
                    circle.path = nil
                    completion()
                }
            }
        }
        
        // Creates a CGPath in the shape of a pie with slices missing
        func circleT(radius:CGFloat, percent:CGFloat) -> CGPath {
            let start:CGFloat = 0
            let end = CGFloat(M_PI*2) * percent
            let center = CGPointZero
            let bezierPath = UIBezierPath()
            bezierPath.moveToPoint(center)
            bezierPath.addArcWithCenter(center, radius: radius, startAngle: start, endAngle: end, clockwise: true)
            bezierPath.addLineToPoint(center)
            return bezierPath.CGPath
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
    
    
    





        
        func placeholder() {




// *** // *** // 10-2-15 print("start placeholder func")
    
   // // *** // *** // *** // 10-2-15 print("placeholder1: \(placeholder1)")
    
    if placeholder1 != -1 {
    
   // // *** // *** // *** // 10-2-15 print("placeholder run")
    
    platforms[placeholder1].position.y = platforms[placeholder1].physicsBody!.charge
platformImages[placeholder1].removeFromParent()
platformImages[placeholder1].position.x = 0
platformImages[placeholder1].position.y = 0
platformImages[placeholder1].zPosition = 0

platformImages[placeholder1].removeFromParent()
platforms[placeholder1].addChild(platformImages[placeholder1])

  //  // *** // *** // *** // 10-2-15 print("checka1")
    vplatforms[placeholder1].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")

playopenwalls()

//set var for timer set

        if floorForbids[placeholder1].parent != nil {
floorForbids[placeholder1].runAction(SKAction.sequence([SKAction.waitForDuration(floorForbidWait), SKAction.moveByX(0, y: ffmove, duration: fall2time)]))
        }

        // *** // *** // 10-2-15 print("placeholder1run1")
  //  // *** // *** // 10-2-15 print("checka2")
    platforms[placeholder1].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.runBlock({self.playshutgapsound()}), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")
// *** // 10-2-15 print("placeholder1run2")
  //  // *** // *** // 10-2-15 print("placeholder run2")
    if GameState.sharedInstance.score < 5 {
  //  // *** // *** // 10-2-15 print("checka3")
    coins[placeholder1].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[placeholder1].hidden = false
coins[placeholder1].runAction(SKAction.scaleTo(1.7, duration: fall2time))

 //   // *** // *** // 10-2-15 print("placeholder run3")
    }
    
    if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {
 //   // *** // *** // 10-2-15 print("checka4")
    coins2[placeholder1].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins2[placeholder1].hidden = false
coins2[placeholder1].runAction(SKAction.scaleTo(1.7, duration: fall2time))
    }
    
    if GameState.sharedInstance.score >= 10 {
 //   // *** // *** // 10-2-15 print("checka5")
    coins3[placeholder1].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins3[placeholder1].hidden = false
coins3[placeholder1].runAction(SKAction.scaleTo(1.7, duration: fall2time))
    }
    
   // *** // 10-2-15 print("placeholder1run3") 
 ///   // *** // *** // 10-2-15 print("checka6")
     if placeholder1 != closepos {  
if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
endpos = lastclosepos
}

if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
lastclosepos = closepos
}

    closepos = placeholder1
// *** // 10-2-15 print("placeholder1run4")

        }



// *** // 10-2-15 print("placeholder1run5")
platforms[lastclosepos].removeActionForKey("Fall2")
vplatforms[lastclosepos].removeActionForKey("Fall2")
// *** // 10-2-15 print("placeholder1run5.5")
if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {         
platforms[lastclosepos].runAction(SKAction.moveToY(platforms[lastclosepos].physicsBody!.charge - swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[lastclosepos].runAction(SKAction.moveToY(vplatforms[lastclosepos].physicsBody!.charge + swgap/2, duration: fall2time), withKey: "Fall2")
        }
    // *** // 10-2-15 print("placeholder1run5.7")
 //   // *** // *** // 10-2-15 print("ran open gap p1")
 //   // *** // *** // 10-2-15 print("checka7")
   vplatforms[placeholder1].physicsBody!.linearDamping = 0.1 /// changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
  //  // *** // *** // 10-2-15 print("checka8")
    platforms[placeholder1].physicsBody!.linearDamping = 0.1 // changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
  //  // *** // *** // 10-2-15 print("vplatform AG after move1: \(vplatforms[placeholder1].physicsBody!.angularDamping)")
  //  // *** // *** // 10-2-15 print("platform AG after move1: \(platforms[placeholder1].physicsBody!.angularDamping)")
    
    // *** // 10-2-15 print("placeholder1run6")
    
    placeholder1 = -1
        
        if noOfCars > 1 {
            networkingEngine?.sendOpen(NSTimeInterval(CFAbsoluteTimeGetCurrent()), pos: closepos)

multTimerOn = 1
        }
        
        
    }
    
 //   // *** // *** // 10-2-15 print("placeholder2: \(placeholder2)")
    
    if placeholder2 != -1 {
    
//    // *** // *** // 10-2-15 print("check1")
    platforms[placeholder2].position.y = platforms[placeholder2].physicsBody!.charge
platformImages[placeholder2].removeFromParent()
platformImages[placeholder2].position.x = 0
platformImages[placeholder2].position.y = 0
platformImages[placeholder2].zPosition = 0
platformImages[placeholder2].removeFromParent()
platforms[placeholder2].addChild(platformImages[placeholder2])
    
//    // *** // *** // 10-2-15 print("check2")
    vplatforms[placeholder2].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")
        playopenwalls()

//set var for timer set

        if floorForbids[placeholder2].parent != nil {
floorForbids[placeholder2].runAction(SKAction.sequence([SKAction.waitForDuration(floorForbidWait), SKAction.moveByX(0, y: ffmove, duration: fall2time)]))
        }
        
 //   // *** // *** // 10-2-15 print("check3")
    
    // *** // 10-2-15 print("placeholder2run")
    platforms[placeholder2].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.runBlock({self.playshutgapsound()}), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")
//    // *** // *** // 10-2-15 print("check4")
//    // *** // *** // 10-2-15 print("GameState.sharedInstance.score: \(GameState.sharedInstance.score)")
    
    if GameState.sharedInstance.score < 5 {
//    // *** // *** // 10-2-15 print("check5")
    coins[placeholder2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[placeholder2].hidden = false
coins[placeholder2].runAction(SKAction.scaleTo(1.7, duration: fall2time))
//    // *** // *** // 10-2-15 print("check5b")
    }
     // *** // 10-2-15 print("placeholder2run2")
    if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {
////    // *** // *** // 10-2-15 print("check6")
    coins2[placeholder2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins2[placeholder2].hidden = false
coins2[placeholder2].runAction(SKAction.scaleTo(1.7, duration: fall2time))
//    // *** // *** // 10-2-15 print("check6b")
    }
    
    if GameState.sharedInstance.score >= 10 {
//    // *** // *** // 10-2-15 print("check7")
    coins3[placeholder2].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins3[placeholder2].hidden = false
coins3[placeholder2].runAction(SKAction.scaleTo(1.7, duration: fall2time))
//    // *** // *** // 10-2-15 print("check7b")
    }
        
        if placeholder2 != closepos{       

if GameState.sharedInstance.score >= 2 || sharedScore >= 2 { // ADJUST THIS FOR CHECKPOINT!!! PUT BACK. 
endpos = lastclosepos
}
 // *** // 10-2-15 print("placeholder2run3")
if GameState.sharedInstance.score >= 2 || sharedScore >= 2  {
lastclosepos = closepos
}

closepos = placeholder2


        }
        
platforms[lastclosepos].removeActionForKey("Fall2")
vplatforms[lastclosepos].removeActionForKey("Fall2")

if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
platforms[lastclosepos].runAction(SKAction.moveToY(platforms[lastclosepos].physicsBody!.charge - swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[lastclosepos].runAction(SKAction.moveToY(vplatforms[lastclosepos].physicsBody!.charge + swgap/2, duration: fall2time), withKey: "Fall2")
        }
     // *** // 10-2-15 print("placeholder2run4")
//    // *** // *** // 10-2-15 print("ran open gap p1")
//    // *** // *** // 10-2-15 print("check8")
    vplatforms[placeholder2].physicsBody!.linearDamping = 0.1 /// changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
    platforms[placeholder2].physicsBody!.linearDamping = 0.1 /// changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
//    // *** // *** // 10-2-15 print("vplatform AG after move1: \(vplatforms[placeholder2].physicsBody!.angularDamping)")
//    // *** // *** // 10-2-15 print("platform AG after move1: \(platforms[placeholder2].physicsBody!.angularDamping)")
  //  placeholder2 = -1
    
    
    
    placeholder2 = -1
        
        if noOfCars > 1 {
            networkingEngine?.sendOpen(NSTimeInterval(CFAbsoluteTimeGetCurrent()), pos: closepos)

multTimerOn = 1

        }
    }
 //   // *** // *** // 10-2-15 print("placeholder3: \(placeholder3)")
    
    if placeholder3 != -1 {
    platforms[placeholder3].position.y = platforms[placeholder3].physicsBody!.charge
platformImages[placeholder3].removeFromParent()
platformImages[placeholder3].position.x = 0
platformImages[placeholder3].position.y = 0
platformImages[placeholder3].zPosition = 0
platformImages[placeholder3].removeFromParent()
platforms[placeholder3].addChild(platformImages[placeholder3])
    
    vplatforms[placeholder3].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")
        
playopenwalls()

//set var for timer set

        if floorForbids[placeholder3].parent != nil {
floorForbids[placeholder3].runAction(SKAction.sequence([SKAction.waitForDuration(floorForbidWait), SKAction.moveByX(0, y: ffmove, duration: fall2time)]))
        }
        
    // *** // 10-2-15 print("placeholder3run")
    platforms[placeholder3].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.runBlock({self.playshutgapsound()}), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")
    
   
    if GameState.sharedInstance.score < 5 {
    
    coins[placeholder3].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[placeholder3].hidden = false
coins[placeholder3].runAction(SKAction.scaleTo(1.7, duration: fall2time))
    }
    
    if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {
    
    coins2[placeholder3].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins2[placeholder3].hidden = false
coins2[placeholder3].runAction(SKAction.scaleTo(1.7, duration: fall2time))
    }
    
    if GameState.sharedInstance.score >= 10 {
    
    coins3[placeholder3].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins3[placeholder3].hidden = false
coins3[placeholder3].runAction(SKAction.scaleTo(1.7, duration: fall2time))
    }
        
if placeholder3 != closepos { 
    
if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
endpos = lastclosepos
}

if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
lastclosepos = closepos
}

closepos = placeholder3

        }

platforms[lastclosepos].removeActionForKey("Fall2")
vplatforms[lastclosepos].removeActionForKey("Fall2")

        if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
platforms[lastclosepos].runAction(SKAction.moveToY(platforms[lastclosepos].physicsBody!.charge - swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[lastclosepos].runAction(SKAction.moveToY(vplatforms[lastclosepos].physicsBody!.charge + swgap/2, duration: fall2time), withKey: "Fall2")   
        }
  //  // *** // *** // 10-2-15 print("ran open gap p1")
    
    vplatforms[placeholder3].physicsBody!.linearDamping = 0.1 /// changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
    platforms[placeholder3].physicsBody!.linearDamping = 0.1 /// changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
  //  // *** // *** print("vplatform AG after move1: \(vplatforms[placeholder3].physicsBody!.angularDamping)")
  //  // *** // *** print("platform AG after move1: \(platforms[placeholder3].physicsBody!.angularDamping)")
    
    
    placeholder3 = -1
        if noOfCars > 1 {
            networkingEngine?.sendOpen(NSTimeInterval(CFAbsoluteTimeGetCurrent()), pos: closepos)

multTimerOn = 1
        }
    }
    
 //   // *** // *** print("placeholder4: \(placeholder4)")
    if placeholder4 != -1 {
    platforms[placeholder4].position.y = platforms[placeholder4].physicsBody!.charge
platformImages[placeholder4].removeFromParent()
platformImages[placeholder4].position.x = 0
platformImages[placeholder4].position.y = 0
platformImages[placeholder4].zPosition = 0
platformImages[placeholder4].removeFromParent()
platforms[placeholder4].addChild(platformImages[placeholder4])
    
    
    vplatforms[placeholder4].runAction(SKAction.sequence([SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.runBlock({self.checkshutgaploss(self.closepos)})]), withKey: "Fall2")

playopenwalls()

//set var for timer set
        
        if floorForbids[placeholder4].parent != nil {
floorForbids[placeholder4].runAction(SKAction.sequence([SKAction.waitForDuration(floorForbidWait), SKAction.moveByX(0, y: ffmove, duration: fall2time)]))
            
        }
        // *** print("placeholder4run")
    platforms[placeholder4].runAction(SKAction.sequence([SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), SKAction.waitForDuration(closegaptime), SKAction.runBlock({self.playshutgapsound()}), SKAction.moveByX(0, y: self.swgap/2, duration: fall2time)]), withKey: "Fall2")
    
    
    if GameState.sharedInstance.score < 5 {
    
    coins[placeholder4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins[placeholder4].hidden = false
coins[placeholder4].runAction(SKAction.scaleTo(1.7, duration: fall2time))

    }
    
    if GameState.sharedInstance.score >= 5 && GameState.sharedInstance.score < 10 {
    
    coins2[placeholder4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins2[placeholder4].hidden = false
coins2[placeholder4].runAction(SKAction.scaleTo(1.7, duration: fall2time))

    }
    
    if GameState.sharedInstance.score >= 10 {
    
    coins3[placeholder4].physicsBody!.contactTestBitMask = PhysicsCategory.bird
    coins3[placeholder4].hidden = false
coins3[placeholder4].runAction(SKAction.scaleTo(1.7, duration: fall2time))

    }
    
        
        if placeholder4 != closepos { 
            
            
if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
endpos = lastclosepos
}

if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
lastclosepos = closepos
}

closepos = placeholder4

        }

platforms[lastclosepos].removeActionForKey("Fall2")
vplatforms[lastclosepos].removeActionForKey("Fall2")

        if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
platforms[lastclosepos].runAction(SKAction.moveToY(platforms[lastclosepos].physicsBody!.charge - swgap/2, duration: fall2time), withKey: "Fall2")
vplatforms[lastclosepos].runAction(SKAction.moveToY(vplatforms[lastclosepos].physicsBody!.charge + swgap/2, duration: fall2time), withKey: "Fall2")
        }
 //   // *** // *** print("ran open gap p1")
    
    vplatforms[placeholder4].physicsBody!.linearDamping = 0.1 /// changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
    platforms[placeholder4].physicsBody!.linearDamping = 0.1 /// changed the way fall2 works to preserve array position for multiplayer. vplatforms[placeholder1].physicsBody!.angularDamping = 0.1
  //  // *** // *** print("vplatform AG after move1: \(vplatforms[placeholder4].physicsBody!.angularDamping)")
  //  // *** // *** print("platform AG after move1: \(platforms[placeholder4].physicsBody!.angularDamping)")
    placeholder4 = -1
        if noOfCars > 1 {
            networkingEngine?.sendOpen(NSTimeInterval(CFAbsoluteTimeGetCurrent()), pos: closepos)

multTimerOn = 1





        }
    }

           if multTimerOn == 1 {



setMultTimer()
multTimerOn = 0

}

            
        }
        
        
        if placeholder1 != -1 {
            
            placeholder2 = -1
            placeholder3 = -1
            placeholder4 = -1
        }
        
        if placeholder2 != -1 {
            
            placeholder1 = -1
            placeholder3 = -1
            placeholder4 = -1
        }
        
        if placeholder3 != -1 {
            
            placeholder2 = -1
            placeholder1 = -1
            placeholder4 = -1
        }
        
        if placeholder4 != -1 {
            
            placeholder2 = -1
            placeholder3 = -1
            placeholder1 = -1
        }
        
        placeholder()
    
    
  //  // *** // *** print("breakcheck")
    
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
    // REMOVED FOR COLLISION & VELOCITY BASED PHYSICS   bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain//new 5/16/2015. Block added during a normal jump (cornerland = 0)
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
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(righttexture, timePerFrame: 1000000))) // put back


//birdimage.texture =  SKTexture(imageNamed: "Bird")

birdimagerightrun.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightrun)

birdimagerightrun.anchorPoint.x = 0.5
birdimagerightrun.anchorPoint.y = 0.5
    
} else {
    
    lefttexture.append(lefttext)
    
    //    bird.removeAllActions()
   //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(lefttexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "LeftBird")

birdimageleftrun.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftrun)

birdimageleftrun.anchorPoint.x = 0.5
birdimageleftrun.anchorPoint.y = 0.5
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
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
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(righttexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "Bird")

birdimagerightrun.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightrun)

birdimagerightrun.anchorPoint.x = 0.5
birdimagerightrun.anchorPoint.y = 0.5
    
} else {
    
    lefttexture.append(lefttext)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(lefttexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "LeftBird")

birdimageleftrun.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftrun)

birdimageleftrun.anchorPoint.x = 0.5
birdimageleftrun.anchorPoint.y = 0.5
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
    jumping = false
    running = false
    sliding = true
    atrest = false
    newtouch = 0

if bird2.physicsBody!.velocity.dy > 10 {

bird2.physicsBody!.velocity.dy = bird2.physicsBody!.velocity.dy*0.8

}
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
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightslidetexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "RightSlideBirdNew")

birdimagerightslide.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightslide)

birdimagerightslide.anchorPoint.x = 0.3
birdimagerightslide.anchorPoint.y = 0.5
    
} else {
    
    leftslidetexture.append(leftslidetext)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftslidetexture, timePerFrame: 1000000))) //put back

//birdimage.texture =  SKTexture(imageNamed: "LeftSlideBirdNew")

birdimageleftslide.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftslide)

birdimageleftslide.anchorPoint.x = 0.7
birdimageleftslide.anchorPoint.y = 0.5
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
    newtouch = 0

if bird2.physicsBody!.velocity.dy > 10 {

bird2.physicsBody!.velocity.dy = bird2.physicsBody!.velocity.dy*0.8

}
    
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
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(rightslidetexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "RightSlideBirdNew")

birdimagerightslide.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightslide)

birdimagerightslide.anchorPoint.x = 0.3
birdimagerightslide.anchorPoint.y = 0.5
    
} else {
    
    leftslidetexture.append(leftslidetext)
    
    //    bird.removeAllActions()
    //birdimage.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(leftslidetexture, timePerFrame: 1000000))) // put back

//birdimage.texture =  SKTexture(imageNamed: "LeftSlideBirdNew")

birdimageleftslide.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimageleftslide)

birdimageleftslide.anchorPoint.x = 0.7
birdimageleftslide.anchorPoint.y = 0.5
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
    
        func scored() {



if GameState.sharedInstance.score == 0 && castleType == 2 {


print("sawarraypos: \(sawarraypos)")


saws[sawarraypos-3].removeFromParent()
backgroundLayer.addChild(saws[sawarraypos-3])

saws[sawarraypos-2].removeFromParent()
backgroundLayer.addChild(saws[sawarraypos-2])

saws[sawarraypos-1].removeFromParent()
backgroundLayer.addChild(saws[sawarraypos-1])

saws[sawarraypos].removeFromParent()
backgroundLayer.addChild(saws[sawarraypos])




}


print("exteriorWall.parent: \(exteriorWall.parent)")

if enterCastle == 0 {


if noOfCars > 1 {









//probably won't add exterior wall in the first place instead
exteriorWall.runAction(SKAction.sequence([SKAction.fadeAlphaTo(0, duration: 0.6), SKAction.removeFromParent()]))

entrance.alpha = 1
//entrance.runAction(SKAction.fadeAlphaTo(1, duration: 0.1))

}




            }

if self.leftDeath.position.x != -self.leftDeath.size.width/2 - bird2.size.width { // {



self.leftDeath.position.x = -self.leftDeath.size.width/2 - bird2.size.width

//cleanupbarrier.position.x = -self.leftDeath.size.width/2 - platformwidth // is there a need to readjust? This deletes the prior platforms to the left of the screen and prevents multiplayer from being able to work with physics for player 2.

}

//worldNode.runAction(SKAction.moveToX(-(platforms[closepos].position.x + nextclosepos)/2))
         
            
        //    platforms[lastclosepos].removeActionForKey("Fall2")
        //    vplatforms[lastclosepos].removeActionForKey("Fall2")
            GameState.sharedInstance.score = GameState.sharedInstance.score + 1
            scoreLabel.text = String(GameState.sharedInstance.score)
            
            if GameState.sharedInstance.score >= 2 || sharedScore >= 2 {
                platforms[lastclosepos].runAction(SKAction.moveToY(platforms[lastclosepos].physicsBody!.charge, duration: fall2time), withKey: "Fall2")
                vplatforms[lastclosepos].runAction(SKAction.moveToY(vplatforms[lastclosepos].physicsBody!.charge, duration: fall2time), withKey: "Fall2")
            }
            
            playscoresound() 
            
            if noOfCars > 1 {

isGameOver()

if GameState.sharedInstance.score > sharedScore {
                
sharedScore = GameState.sharedInstance.score


    networkingEngine?.sendMake(GameState.sharedInstance.score, xpos: Float(0), charge: Float(0), cyclepos: Int(0))
print("sending initial gen make in scored function")
}

}

if noOfCars == 1 {

//entrance.runAction(SKAction.fadeAlphaTo(1, duration: 0.1))

entrance.alpha = 1
exteriorWall.runAction(SKAction.sequence([SKAction.runBlock({self.physicsWorld.speed = 0}), SKAction.fadeAlphaTo(0, duration: 0.6), SKAction.runBlock({

self.physicsWorld.speed = self.physicsSpeed

}), SKAction.removeFromParent()]))


enterCastle = 1

if castleType == 0 {

if closepos >= 0 && platformImages[closepos].name != nil  {

let wallT: String = platformImages[closepos].name!

checkAchievementsOne(1, coins: 0, wallType: wallT)

} else {



    checkAchievementsOne(1, coins: 0, wallType: "none") 

} 

}


        }
        }
        
        
        
        func updateHighScore() {
            
            if GameState.sharedInstance.score > GameState.sharedInstance.highScore {
                highScoreLabel.text = String(GameState.sharedInstance.score)
                GameState.sharedInstance.highScore = GameState.sharedInstance.score
                
                saveHighscore(GameState.sharedInstance.score)
            }
            
        }
    
    
    if bird2.position.x > posA + 0.5*bird2.size.width + 10 && posA > 0 {
    
    scored()
    updateHighScore()
    
    
    GameState.sharedInstance.saveState()
    
    //try assigning  var openpos , then run the action the next time a barrier opens. To link open and close barriers, to be more natural.


    
    posA = -1
    
    if posAs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posAs = 0
    }
    }
    if bird2.position.x > posB + 0.5*bird2.size.width + 10 && posB > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
   
    
    GameState.sharedInstance.saveState()
    
   
    
    
    
    posB = -1
    
    if posBs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posBs = 0
    }
    
    }
    if bird2.position.x > posC + 0.5*bird2.size.width + 10 && posC > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
   
    
    
    GameState.sharedInstance.saveState()
    
   
    
    posC = -1
    
    if posCs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posCs = 0
    }
    
    }
    if bird2.position.x > posD + 0.5*bird2.size.width + 10 && posD > 0 {
    
        scored()
        updateHighScore()

    xposlastscore = bird2.position.x
    
   
    GameState.sharedInstance.saveState()
    
    
    posD = -1
    
    if posDs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posDs = 0
    }
    }
    if bird2.position.x > posE + 0.5*bird2.size.width + 10 && posE > 0 {
    
    // *** print("posE before reset: \(posE)")
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
  
    GameState.sharedInstance.saveState()

    
    posE = -1
    
    if posEs == 1 && bird2con > 0{
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posEs = 0
    }
    
    }
    if bird2.position.x > posF + 0.5*bird2.size.width + 10 && posF > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
  
    GameState.sharedInstance.saveState()
    
    
    posF = -1
    
    if posFs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posFs = 0
    }
    }
    if bird2.position.x > posG + 0.5*bird2.size.width + 10 && posG > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
   
    GameState.sharedInstance.saveState()
    
    
    posG = -1
    
    if posGs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posGs = 0
    }
    
    }
    if bird2.position.x > posH + 0.5*bird2.size.width + 10 && posH > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
   
    GameState.sharedInstance.saveState()
    
    
    posH = -1
    
    if posHs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posHs = 0
    }
    
    }
    if bird2.position.x > posI + 0.5*bird2.size.width + 10 && posI > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
  
    GameState.sharedInstance.saveState()

    
    posI = -1
    
    if posIs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posIs = 0
    }
    
    }
    if bird2.position.x > posJ + 0.5*bird2.size.width + 10 && posJ > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    

    GameState.sharedInstance.saveState()

    
    posJ = -1
    
    if posJs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posJs = 0
    }
    
    }
    if bird2.position.x > posK + 0.5*bird2.size.width + 10 && posK > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
  
    GameState.sharedInstance.saveState()

    
    posK = -1
    
    if posKs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posKs = 0
    }
    
    }
    if bird2.position.x > posL + 0.5*bird2.size.width + 10 && posL > 0 {
    
        scored()
        updateHighScore()
    
    xposlastscore = bird2.position.x
    
  
    GameState.sharedInstance.saveState()
    
    
    posL = -1
    
    if posLs == 1 && bird2con > 0 {
    bird2.physicsBody!.velocity.dx = 0.000000000000
    posLs = 0
    }
    
    }
    //// *** print("breakcheck5")
    
   /* if GameState.sharedInstance.score == 2 && frontClosed == 0 {
    
    platforms[4].runAction(SKAction.moveByX(0, y: self.swgap/2, duration: fall2time), withKey: "Fall2")
    vplatforms[4].runAction(SKAction.moveByX(0, y: -self.swgap/2, duration: fall2time), withKey: "Fall2")
        frontClosed = 1
    }*/
    
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



if contact.bodyA.node?.name == "chain" || contact.bodyB.node?.name == "chain" {

facingdirection *= -1
bird2con = 1
sliding = true
jumping = false
running = false
atrest = false

bird2.physicsBody!.velocity.dx = 0
//birdimage.texture = SKTexture(imageNamed: "RightSlideBirdNew")

birdimagerightslide.removeFromParent()
bird2.removeChildrenInArray([birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath])
bird2.addChild(birdimagerightslide)

var removepb = SKNode()


if contact.bodyA.node?.name == "chain" {

removepb = contact.bodyA.node!

}

if contact.bodyB.node?.name == "chain" {


removepb = contact.bodyB.node!

}

removepb.physicsBody = nil



}



if ((contact.bodyA.node?.name == "floorForbid" && contact.bodyB.node?.name == "bird2") || (contact.bodyB.node?.name == "floorForbid" && contact.bodyA.node?.name == "bird2")) && gameover == false && reposition == 0 {

print("floorForbid contact")
// death()

}

if ((contact.bodyA.node?.name == "danger" && contact.bodyB.node?.name == "bird2") || (contact.bodyB.node?.name == "danger" && contact.bodyA.node?.name == "bird2")) && gameover == false && reposition == 0 {

print("bottom or left death contact")

bird2.removeAllActions() 
bird2.removeFromParent()

shakeNode.runAction(SKAction.sequence([SKAction.waitForDuration(0.0), SKAction.screenShakeWithNode(shakeNode, amount: CGPoint(x: 15, y: 15), oscillations: 5, duration: 1.7), SKAction.waitForDuration(0.0), SKAction.runBlock({



})]))


self.runAction(SKAction.sequence([SKAction.waitForDuration(1.0), SKAction.runBlock({

// self.death()

})]))


//midWorldNode.runAction(SKAction.screenShakeWithNode(midWorldNode, amount: CGPoint(x: 15, y: 15), oscillations: 3, duration: 2.0))
//distantWorldNode.runAction(SKAction.screenShakeWithNode(distantWorldNode, amount: CGPoint(x: 15, y: 15), oscillations: 3, duration: 2.0))




}



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
//pchild.runAction(SKAction.removeFromParent())
pchild.removeFromParent()


}

//contact.bodyB.node?.runAction(SKAction.removeFromParent())
contact.bodyB.node?.removeFromParent()

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
//pchild.runAction(SKAction.removeFromParent())
pchild.removeFromParent()

}

//contact.bodyA.node?.runAction(SKAction.removeFromParent())
contact.bodyA.node?.removeFromParent()
}


    if contact.bodyA.node?.name == "coin" && (abs(bird2.physicsBody!.velocity.dx) > 50 || GameState.sharedInstance.loadLevel == 1) {
    
    
    //     minicoinlabels[minicycle].removeFromParent()
    
    playcoinsound("1")
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
    
        checkAchievementsOne(0, coins: yellowCoinBase, wallType: "none")
    
    }
    
    if contact.bodyB.node?.name == "coin" && (abs(bird2.physicsBody!.velocity.dx) > 50 || GameState.sharedInstance.loadLevel == 1) {
    
    playcoinsound("1")
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

checkAchievementsOne(0, coins: yellowCoinBase, wallType: "none")
    }
    
    if contact.bodyA.node?.name == "coin2" && (abs(bird2.physicsBody!.velocity.dx) > 50 || GameState.sharedInstance.loadLevel == 1) {
    playcoinsound("2")
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

checkAchievementsOne(0, coins: bluCoinBase, wallType: "none")
    
    }
    
    if contact.bodyB.node?.name == "coin2" && (abs(bird2.physicsBody!.velocity.dx) > 50 || GameState.sharedInstance.loadLevel == 1) {
    playcoinsound("2")
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
checkAchievementsOne(0, coins: bluCoinBase, wallType: "none")
    }
    
    if contact.bodyA.node?.name == "coin3" && (abs(bird2.physicsBody!.velocity.dx) > 50 || GameState.sharedInstance.loadLevel == 1) {
    playcoinsound("3")
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
    checkAchievementsOne(0, coins: redCoinBase, wallType: "none")
    }
    
    if contact.bodyB.node?.name == "coin3" && (abs(bird2.physicsBody!.velocity.dx) > 50 || GameState.sharedInstance.loadLevel == 1) {
    playcoinsound("3")
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
checkAchievementsOne(0, coins: redCoinBase, wallType: "none")
    }
    
    
    if contact.bodyA.node?.name == "platform" && contact.bodyA.node?.physicsBody!.linearDamping < 14000 && contact.bodyA.node?.physicsBody!.linearDamping > 100 {
    

firstplatformcontact = 1
    tempplatform = contact.bodyA.node

/* old platform fall. Platform keeps falling when bird2 lands on top
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
    
    
    */
    
    
    if contact.bodyA.node?.hasActions() == false {
    
    
   // tempplatform = contact.bodyA.node // removed on this line for new fall. will always need to assign tempplatform
    
    // *** print("\(tempplatform)")
    
    
    
    contact.bodyA.node?.physicsBody!.mass = CGFloat(CFAbsoluteTimeGetCurrent())%100 // records start time for fall action
    
    // *** print("record mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")
    // *** print("actual mass: \(contact.bodyB.node?.physicsBody!.mass)")
    // *** print("truncate mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")
    
    
    
    // *** print("run fall 1")
    }
    
    
    
    }
    
    
    
    
    
    
    if contact.bodyB.node?.name == "platform" && contact.bodyB.node?.physicsBody!.linearDamping < 14000 && contact.bodyB.node?.physicsBody!.linearDamping > 100{
    
   firstplatformcontact = 1
tempplatform = contact.bodyB.node


/* old platform fall where platform keeps falling when bird2 lands on top. 

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
    
    
    
    
    contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(fallwaittime)), SKAction.moveByX(0, y: -1500, duration: falltime)]), withKey: "Fall")
    
    contact.bodyB.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(fallwaittime)), SKAction.moveByX(0, y: -1500, duration: falltime)]), withKey: "Fall")
    
    }
    
    
    */
    
    
    
    if contact.bodyB.node?.hasActions() == false {
    
    
 //   tempplatform = contact.bodyB.node // removed on this line for new fall. will always need to assign tempplatform

    // *** print("\(tempplatform)")

    
    contact.bodyB.node?.physicsBody!.mass = CGFloat(CFAbsoluteTimeGetCurrent())%100 //records start time for fall action
    
    // *** print("record mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")
    // *** print("actual mass: \(contact.bodyB.node?.physicsBody!.mass)")
    // *** print("truncate mass: \(CGFloat(CFAbsoluteTimeGetCurrent())%100)")
    
    
    
    // *** print("run fall 2")
    }
    
    
    }
    
    
    
    //End Function: Platform falling
    
    
    //Function VPlatform Falling
    
    if contact.bodyA.node?.name == "vplatform" && contact.bodyA.node?.physicsBody!.linearDamping < 14000 && contact.bodyA.node?.physicsBody!.linearDamping > 100 {
    
    
    if contact.bodyA.node?.hasActions() == false {
    
    
    tempvplatform = contact.bodyA.node
    
    // *** print("\(tempvplatform)")
    firstvplatformcontact = 1
    
    
    contact.bodyA.node?.runAction(SKAction.sequence([SKAction.waitForDuration(NSTimeInterval(1.0)), SKAction.moveByX(0, y: 1500, duration: 8)]), withKey: "Fall")
    }
    
    
    
    }
    
    
    if contact.bodyB.node?.name == "vplatform" && contact.bodyB.node?.physicsBody!.linearDamping < 14000 && contact.bodyB.node?.physicsBody!.linearDamping > 100 { 
    
    
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
    
    if contact.bodyA.node?.physicsBody!.linearDamping > 14000 { //if contact.bodyA.node?.physicsBody!.angularDamping < 0.09 || contact.bodyA.node?.physicsBody!.angularDamping > 0.11
    
    placeholder1 = Int(contact.bodyA.node!.physicsBody!.angularDamping)
    
    
    
    
    }
    
    }
    
    
    
    if contact.bodyB.node?.name == "platform" {
    
    if contact.bodyB.node?.physicsBody!.linearDamping > 14000  { // angularDamping < 0.09 || contact.bodyB.node?.physicsBody!.angularDamping > 0.11
    
    placeholder2 = Int(contact.bodyB.node!.physicsBody!.angularDamping)
    
    
    
    }
    }
    
    
    if contact.bodyA.node?.name == "vplatform" {
    
    if contact.bodyA.node?.physicsBody!.linearDamping > 14000 { // angularDamping < 0.09 || contact.bodyA.node?.physicsBody!.angularDamping > 0.11
    
    placeholder3 = Int(contact.bodyA.node!.physicsBody!.angularDamping)
    
    
    
    
    }
    
    }
    
    
    
    if contact.bodyB.node?.name == "vplatform" {
    
    if contact.bodyB.node?.physicsBody!.linearDamping > 14000  { // angularDamping < 0.09 || contact.bodyB.node?.physicsBody!.angularDamping > 0.11
    
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

if bird2.physicsBody!.velocity.dy > 10 {

bird2.physicsBody!.velocity.dy = bird2.physicsBody!.velocity.dy*0.8

}
    
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
    

if bird2.physicsBody!.velocity.dy > 10 {

bird2.physicsBody!.velocity.dy = bird2.physicsBody!.velocity.dy*0.8

}

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
        
        
    /* //old, using death() function now
    // Begin Death by danger: PUT BACK FOR DEATH BY DANGER
        
    
    if contact.bodyA.categoryBitMask == PhysicsCategory.danger || contact.bodyB.categoryBitMask == PhysicsCategory.danger
{
    if contact.bodyA.node!.name == "bird2" || contact.bodyB.node!.name == "bird2"{
    
    // *** print("danger death")
    gameover = true
    GameState.sharedInstance.saveState()
    
    scorescreen.removeFromParent()
    scorescreen.size.width = scorescreenwidth
    scorescreen.size.height = scorescreenheight
    scorescreen.position.x = self.size.width/2
    
    scorescreen.position.y = self.size.height/2 // was -500 for scroll up
    scorescreen.zPosition = 10
    self.addChild(scorescreen) //some kind of problem with this, being added twice PUT BACK but fix first


    /*
    replaybutton.size.width = 150
    replaybutton.size.height = 150
    replaybutton.position = CGPoint(x: -scorescreen.size.width/2 + replaybutton.size.width/2 + 50, y: -scorescreen.size.height/2 + replaybutton.size.height/2 + 50)
    replaybutton.zPosition = scoreScreenButtonZPos

replaybutton.removeFromParent()
    scorescreen.addChild(replaybutton) //some kind of problem with this, being added twice PUT BACK but fix first
    */
    screenScoreLabel = SKLabelNode(text: "Score: \(GameState.sharedInstance.score)")
    screenScoreLabel.position.x = 0
    
    screenScoreLabel.position.y = 400
    
    screenScoreLabel.fontColor = SKColor.blackColor()
    //  screenScoreLabel.fontName = NoteWorthy
    screenScoreLabel.fontSize = 65
screenScoreLabel.removeFromParent()
    scorescreen.addChild(screenScoreLabel)
    
    screenHighScoreLabel = SKLabelNode(text: "High Score: \(GameState.sharedInstance.highScore)")
    screenHighScoreLabel.position.x = 0
    
    screenHighScoreLabel.position.y = 100
    
    
    screenHighScoreLabel.fontColor = SKColor.blackColor()
    //    screenhighScoreLabel.fontName = NoteWorthy
    screenHighScoreLabel.fontSize = 65

screenHighScoreLabel.removeFromParent()
    scorescreen.addChild(screenHighScoreLabel)
    
    scorescreen.runAction(SKAction.moveToY(self.size.height/2, duration: 1))
    //   replaybutton.runAction(SKAction.moveToY(self.size.height - 1200, duration: 1))
    
   // bird2.runAction(SKAction.removeFromParent()) /// CHANGED AWAY FORM SKACTION 9/29/15
bird2.removeFromParent()
    //   bird2.paused = true
    
    }
    
    
    // 3
    // from megajump tutorial     let reveal = SKTransition.fadeWithDuration(0.5)
    // from megajump tutorial     let endGameScene = EndGameScene(size: self.size)
    // from megajump tutorial     self.view!.presentScene(endGameScene, transition: reveal)
    }
    // END death by danger
    */
    
    
    
    
    
    
    if contact.bodyA.categoryBitMask == PhysicsCategory.dart && contact.bodyB.categoryBitMask == PhysicsCategory.bird {
    
    if contact.bodyA.node!.name == "bird2" || contact.bodyB.node!.name == "bird2" {
    
// death()

    }
    }
    
    if contact.bodyA.categoryBitMask == PhysicsCategory.bird && contact.bodyB.categoryBitMask == PhysicsCategory.dart {
    
    if contact.bodyA.node!.name == "bird2" || contact.bodyB.node!.name == "bird2" {

// death()    

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

print("didEvaluateActions")
    
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
    
  //  var startpos: CGFloat = 0
 //   startpos = bird2.position.x
    
     //   print("bird2.physicsBody!.velocity: \(bird2.physicsBody!.velocity)")
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
        
        
/*
print("imagearray[4].xScale: \(imagearray[4].xScale)")
print("imagearray[5].xScale: \(imagearray[5].xScale)")
print("bird2.physicsBody!.velocity.dx: \(bird2.physicsBody!.velocity.dx)")

if cycle != -1 {
print("coins[cycle].position.y: \(coins[cycle].position.y)")
print("coins[cycle+4].position.y: \(coins[cycle+4].position.y)")
print("coins[cycle+8].position.y: \(coins[cycle+8].position.y)")
}
*/


print("GameState.sharedInstance.timer1running: \(GameState.sharedInstance.timer1running)")
print("GameState.sharedInstance.redCollected: \(GameState.sharedInstance.redCollected)")
print("GameState.sharedInstance.oneScore40: \(GameState.sharedInstance.oneScore40)")
print("GameState.sharedInstance.oneTime300: \(GameState.sharedInstance.oneTime300)")
print("GameState.sharedInstance.oneTime600: \(GameState.sharedInstance.oneTime600)")
print("GameState.sharedInstance.oneColl200: \(GameState.sharedInstance.oneColl200)")
print("GameState.sharedInstance.oneClear300: \(GameState.sharedInstance.oneClear300)")

//print("placeholder1: \(placeholder1) placeholder2: \(placeholder2) placeholder3: \(placeholder3) placeholder4: \(placeholder4)")
print("GameState.sharedInstance.oneBlock: \(GameState.sharedInstance.oneBlock)")
print("GameState.sharedInstance.oneFloatWall: \(GameState.sharedInstance.oneFloatWall)")

//print("GameState.sharedInstance.oneScore5: \(GameState.sharedInstance.oneScore5)")
//print("self.size.width: \(self.size.width)")
//print("self.view!.bounds.size.width: \(self.view!.bounds.size.width)")
//print("roomWall1.position = \(roomWall1.position)")
//print("backgroundLayer.position: \(backgroundLayer.position)")
//print("castlemoves: \(castlemoves)")
//print("gstore: \(gstore) gpaused: \(gpaused)")
//print("initialroofwall2.position: \(initialroofwall2.position)")


 //  print("closetree1.position.x: \(closeTree1.position.x)") 
//print("worldNode.position.x: \(worldNode.position.x)")
print("bird2.position.x: \(bird2.position.x)")
//print("pausescreen.parent: \(pausescreen.parent) pausescreen.position: \(pausescreen.position)")
//print("minPHeight: \(minPHeight) maxPHeight: \(maxPHeight)")
//print("ground.position.y: \(ground.position.y)")
//print("worldNode.position.x: \(worldNode.position.x)")
    //     println("platforms2.position.y: \(platform2.position.y) platform6.position.y: \(platform6.position.y) platform10.position.y: \(platform10.position.y)")
    
  //  print("bird2.position.x: \(bird2.position.x)")
//print("birdimage.position.x: \(birdimage.position.x)")
//print("platforms[4].position.x: \(platforms[4].position.x)")
    //  println("(435%100)%0.01 = \((435%100)%0.01)")
    
    // println("rightarrow parent: \(rightarrow.parent)")
    
 //       // *** print("gameover: \(gameover)")
    testvar = 0
     //   print("bird2.position: \(bird2.position)")
 //       print(" platforms[4].position: \(platforms[4].position) platforms[4].parent: \(platforms[4].parent)")
  //      print("cycle: \(cycle)")
    
//print("bird2 colBM: \(bird2.physicsBody!.collisionBitMask) and conBM: \(bird2.physicsBody!.contactTestBitMask)")
print("bird2con: \(bird2con) running: \(running) jumping: \(jumping) atrest: \(atrest) sliding: \(sliding) facing: \(facingdirection) newtouch: \(newtouch)")

  //      print("noOfcars: \(noOfCars)")
        
        if gpaused == true && blurAmount < 10 {
            
            blurAmount = blurAmount + 0.1
            
        //    print("b1")

if blurAmount > oldblurcounter + 0.9 {

            gfilter!.setValue(blurAmount, forKey: kCIInputRadiusKey)
            effectNode.filter = gfilter
oldblurcounter = blurAmount
  //  print("b2")
            }
            
        }
        
if noOfCars > 1  {
    
 //   bird2.zRotation = 0.35
    

    networkingEngine?.sendMove(Float(bird2.position.x), dy: Float(bird2.position.y), rotation: Float(bird2.zRotation))
//networkingEngine?.sendMove(Float(bird2.physicsBody!.velocity.dx), dy: Float(bird2.physicsBody!.velocity.dy), rotation: Float(bird2.zRotation))

//print("bird3.position: \(bird3.position.x) dy: \(bird3.position.y)")
 //   print("bird2.position: \(bird2.position.x) dy: \(bird2.position.y)")
}


if makemsgcounter > 0 && isPlayer1 == true {

if makemsgcounter == startmakemsgcounter - 3 {


networkingEngine?.sendMake(0, xpos: Float(makemsgxpos1), charge: Float(makemsgcharge1), cyclepos: makemsgcyclepos1)
    
    print("sending make from update function, round 1 - cycle")

}

if makemsgcounter == startmakemsgcounter - 6 {


networkingEngine?.sendMake(0, xpos: Float(makemsgxpos2), charge: Float(makemsgcharge2), cyclepos: makemsgcyclepos2)
 print("sending make from update function, round 2 - cpos")
}

if makemsgcounter == startmakemsgcounter - 9 {


networkingEngine?.sendMake(0, xpos: Float(makemsgxpos3), charge: Float(makemsgcharge3), cyclepos: makemsgcyclepos3)
     print("sending make from update function, round 3 - cpos2")

}

makemsgcounter = makemsgcounter - 1



}





        if printOn == 1 {
            // *** print("update")
            
          // *** print("testvar: \(testvar)")
            // ***
            // *** print("checkpointmode: \(checkpointmode)")
            // *** print("checkpointmove: \(checkpointmove)")
            // *** print("checkpointround: \(GameState.sharedInstance.checkpointround)")
            // *** print("checkpointunlock: \(GameState.sharedInstance.checkpointunlock)")
            
            // *** print("birdimage pos: \(birdimage.position)")
            // *** print("bird2 pos: \(bird2.position)")
            // ***
            //GameState.sharedInstance.coinMult = 1
            // *** print("cycle: \(cycle)")
            // *** print("platform1 pos.y: \(platform1.position.y)")
            //  println("Bird2posx: \(bird2.position.x)")
            // *** print("initialcount: \(initialcount)")
            // ***
            // *** print("breakwallcon: \(breakwallcon)  bird2con: \(bird2con) bird2conv: \(bird2conv) breakwall")
            //     println("emittedNode parent: \(emitterNode.parent) emittedNode position: \(emitterNode.position)")
            // *** print("bird2 parent: \(bird2.parent)")
            // *** print("xplatform1 parent: \(xplatform1.parent) xplatform1 position: \(xplatform1.position)")
            
            // *** print("bird2gravity: \(bird2.physicsBody!.affectedByGravity)")
            
            // *** print("updatecheck mark")
            print("bird2.position.x: \(bird2.position.x)")
            
            
            
            
            
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
//    birdimage.alpha = 1
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
    print("moveBAckground() complete")
        
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
    
    
    
    if jumppower > jumpMax { // was 0.4
    jumppower = jumpMax
    
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
        
    // *** print("change collision bitmask: \(bird2.physicsBody!.collisionBitMask)")
    
    }
    
    bird2.physicsBody!.affectedByGravity = true
    newtouch = 1
    // *** print("newtouch = 1")
    startjx = bird2.position.x
    
    
    bird2.physicsBody!.contactTestBitMask = PhysicsCategory.block | PhysicsCategory.danger | PhysicsCategory.dart | PhysicsCategory.floor | PhysicsCategory.slidespike | PhysicsCategory.chain
    
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
    
    bird2.physicsBody?.velocity = CGVector(dx: facingdirection*(jumppower*2286.45 + 53.635), dy: jumppower*4063.03 + 143.81) // jumppower*2625 + 575.22) // (dx: facingdirection*(jumppower*1533.33 + 460), dy: jumppower*1866.67 + 560)//facingdirection*jumppower*2300, dy: jumppower*2800 // 9.8: dx *1950 dy *2400, 14.7: dx 2700 dy 2900 12.0: dx 1950 dy 2500
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
    
    
    bird2.physicsBody?.velocity = CGVector(dx: 0, dy: jumppower*2625 + 575.22) // CGVector(dx: 0, dy: jumppower*2625 + 575.22)
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
    bird2.physicsBody!.collisionBitMask = PhysicsCategory.block | PhysicsCategory.floor | PhysicsCategory.danger | PhysicsCategory.outline | PhysicsCategory.chain
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
    
    
    
    
    
    print("secondlives: \(secondlives)")
    
    if GameState.sharedInstance.oneBlock == 2 { // for debug. put back —- remove


/*
castleMoveNode.removeAllActions()
worldNode.removeAllActions()
castleMoveNode.removeAllChildren()
castleMoveNode.removeFromParent()
bird2.removeFromParent()
midWorldNode.removeAllActions()
distantWorldNode.removeAllActions()
shakeNode.removeAllActions()
*/
}


print("update complete")
}

}




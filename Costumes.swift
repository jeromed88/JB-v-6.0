//
//  Costumes.swift
//  JB v 6.0
//
//  Created by Jerome Elmore on 11/12/15.
//  Copyright © 2015 Jerome Elmore. All rights reserved.
//

import SpriteKit

let birdimagerightrun = SKSpriteNode(texture: SKTexture(imageNamed: "Bird")) //"Bird"))
let birdimageleftrun = SKSpriteNode(texture: SKTexture(imageNamed: "LeftBird"))
let birdimagerightslide = SKSpriteNode(texture: SKTexture(imageNamed: "RightSlideBirdNew"))
let birdimageleftslide = SKSpriteNode(texture: SKTexture(imageNamed: "LeftSlideBirdNew"))
let birdimagerightjump = SKSpriteNode(texture: SKTexture(imageNamed: "SimpleJumpRight3"))
let birdimageleftjump = SKSpriteNode(texture: SKTexture(imageNamed: "SimpleJumpLeft3"))
let birdimagerightrest = SKSpriteNode(texture: SKTexture(imageNamed: "RightRestBirdNew"))
let birdimageleftrest = SKSpriteNode(texture: SKTexture(imageNamed: "LeftRestBirdNew"))
let birdimagedeath = SKSpriteNode(texture: SKTexture(imageNamed: "monkey-death-state"))

let birdimage2rightrun = SKSpriteNode(texture: SKTexture(imageNamed: "Bird")) //"Bird")))
let birdimage2leftrun = SKSpriteNode(texture: SKTexture(imageNamed: "LeftBird"))
let birdimage2rightslide = SKSpriteNode(texture: SKTexture(imageNamed: "RightSlideBirdNew"))
let birdimage2leftslide = SKSpriteNode(texture: SKTexture(imageNamed: "LeftSlideBirdNew"))
let birdimage2rightjump = SKSpriteNode(texture: SKTexture(imageNamed: "SimpleJumpRight3"))
let birdimage2leftjump = SKSpriteNode(texture: SKTexture(imageNamed: "SimpleJumpLeft3"))
let birdimage2rightrest = SKSpriteNode(texture: SKTexture(imageNamed: "RightRestBirdNew"))
let birdimage2leftrest = SKSpriteNode(texture: SKTexture(imageNamed: "LeftRestBirdNew"))
let birdimage2death = SKSpriteNode(texture: SKTexture(imageNamed: "monkey-death-state"))

let rightjumplegs = SKSpriteNode(texture: SKTexture(imageNamed: "rightjumplegs"))
let piraterighthat = SKSpriteNode(texture: SKTexture(imageNamed: "piraterighthat"))
let piraterightearrings = SKSpriteNode(texture: SKTexture(imageNamed: "piraterightearrings"))
let piraterighteyepatch = SKSpriteNode(texture: SKTexture(imageNamed: "piraterighteyepatch"))

let piraterightvestfar = SKSpriteNode(texture: SKTexture(imageNamed: "piraterightvestfar"))
let piraterightvestnear = SKSpriteNode(texture: SKTexture(imageNamed: "piraterightvestnear"))
let piraterightlegs = SKSpriteNode(texture: SKTexture(imageNamed: "piraterightlegs"))
let piraterightsword = SKSpriteNode(texture: SKTexture(imageNamed: "piraterightsword"))
let piraterighthook = SKSpriteNode(texture: SKTexture(imageNamed: "piraterighthook"))
let monkeyrightjumparmfar = SKSpriteNode(texture: SKTexture(imageNamed: "monkeyrightjumparmfar"))
let monkeyrightjumparmnear = SKSpriteNode(texture: SKTexture(imageNamed: "monkeyrightjumparmnear"))

var bird2images: Array<SKSpriteNode!> = []
var bird3images: Array<SKSpriteNode!> = []
var imagearray: Array<SKSpriteNode!> = []




func assembleCostume(image: CGFloat, costumechoice: Int, progress: Int) {
    
    bird2images = [birdimagerightrun, birdimageleftrun, birdimagerightslide, birdimageleftslide, birdimagerightjump, birdimageleftjump, birdimagerightrest, birdimageleftrest, birdimagedeath]
    
    bird3images = [birdimage2rightrun, birdimage2leftrun, birdimage2rightslide, birdimage2leftslide, birdimage2rightjump, birdimage2leftjump, birdimage2rightrest, birdimage2leftrest, birdimage2death]
    
    imagearray = []
    
    
    if image == 1 {
        
        imagearray = bird2images
    }
    
    if image == 2 {
        
        imagearray = bird3images
    }
    
    print("imagearray: \(imagearray)")
print("costumechoice: \(costumechoice)")

    
    if (costumechoice == 0) || (costumechoice == 1 && progress == 1) || (costumechoice == 2 && progress == 1) || costumechoice == 3 {
        

imagearray[0].removeAllChildren()
imagearray[1].removeAllChildren()
imagearray[2].removeAllChildren()
imagearray[3].removeAllChildren()
imagearray[4].removeAllChildren()
imagearray[5].removeAllChildren()
imagearray[6].removeAllChildren()
imagearray[7].removeAllChildren()
imagearray[8].removeAllChildren()
 
imagearray[0].texture = SKTexture(imageNamed: "Bird")
imagearray[1].texture = SKTexture(imageNamed: "Bird")
imagearray[2].texture = SKTexture(imageNamed: "RightSlideBirdNew")
imagearray[3].texture = SKTexture(imageNamed: "LeftSlideBirdNew")
imagearray[4].texture = SKTexture(imageNamed: "SimpleJumpRight3")
imagearray[5].texture = SKTexture(imageNamed: "SimpleJumpLeft3")
imagearray[6].texture = SKTexture(imageNamed: "RightRestBirdNew")
imagearray[7].texture = SKTexture(imageNamed: "LeftRestBirdNew")
imagearray[8].texture = SKTexture(imageNamed: "monkey-death-state")
        
        imagearray[0].size.width = 91
        imagearray[1].size.width = 91
        imagearray[2].size.width = 119
        imagearray[3].size.width = 119
        imagearray[4].size.width = 127
        imagearray[5].size.width = 127
        imagearray[6].size.width = 91
        imagearray[7].size.width = 91
        imagearray[8].size.width = 121
        
        
            imagearray[0].size.height = 123
            imagearray[1].size.height = 123
            imagearray[2].size.height = 163
            imagearray[3].size.height = 163
            imagearray[4].size.height = 161
            imagearray[5].size.height = 161
            imagearray[6].size.height = 123
            imagearray[7].size.height = 123
            imagearray[8].size.height = 154
        
        
        
        imagearray[1].texture = flippedTextureWithImageNamed("Bird")
        
        
    }

    

if GameState.sharedInstance.costumechoice == 1 && progress > 1 {



//birdimagerightjump2.position.x = birdimagerightjump.position.x + 350
    //birdimagerightjump2.position.y = birdimagerightjump.position.y
    //bird2.addChild(birdimagerightjump2)



    
    //Right Jump
    
    
    imagearray[4].removeAllChildren()
    

//need to rework sizes
    
    
    imagearray[4].size.width = 0.7*(153/123)*59 //roughmonkeynotail: (153/123)*59// with tail: 118 // was 140 // was 130
    imagearray[4].size.height = 0.7*153 //roughmonkeynotail: 153 //123 // with tail: 153 // was 140
    imagearray[4].zPosition = 0
    imagearray[4].color = UIColor(red: 240/255, green: 255/255, blue: 255/255, alpha: 1.0) 
    imagearray[4].colorBlendFactor = 0 // 0.5  
    
    imagearray[4].texture = SKTexture(imageNamed: "monkeyrightnolimbs")

//using pirate placeholder before mage AI

    
    print("rightjumplegs: \(rightjumplegs)")
    print("imagearray[4]: \(imagearray[4])")
    rightjumplegs.removeFromParent()
rightjumplegs.position.x = -15
    rightjumplegs.position.y = CGRectGetMinY(imagearray[4].frame) - rightjumplegs.size.height/2 + 5
    rightjumplegs.zPosition = -0.1
    imagearray[4].addChild(rightjumplegs)



piraterightvestfar.position.x = 8
    piraterightvestfar.position.y = -20
    piraterightvestfar.zPosition = -0.1
    imagearray[4].addChild(piraterightvestfar)
    
    piraterightvestnear.position.x = -10
    piraterightvestnear.position.y = -20
    piraterightvestnear.zPosition = 0.1
    imagearray[4].addChild(piraterightvestnear)

if progress > 2 {

piraterighthat.position.x = 0
    piraterighthat.position.y = 60
    piraterighthat.zPosition = 0.1
    imagearray[4].addChild(piraterighthat)

}



if progress > 3 {

piraterightearrings.position.x = -15
    piraterightearrings.position.y = 15
    piraterightearrings.zPosition = 0.1
    imagearray[4].addChild(piraterightearrings)

}

if progress > 4 {

piraterighteyepatch.position.x = 5
    piraterighteyepatch.position.y = 30
    piraterighteyepatch.zPosition = 0.1
    imagearray[4].addChild(piraterighteyepatch)


}

if progress > 5 {

rightjumplegs.removeFromParent()

piraterightlegs.position.x = -15
    piraterightlegs.position.y = CGRectGetMinY(imagearray[4].frame) - piraterightlegs.size.height/2 + 5
piraterightlegs.zPosition = -0.1
imagearray[4].addChild(piraterightlegs)


}

if progress > 6 {

//need to adjust size

piraterightsword.size.height = 35
piraterightsword.size.width = 15
piraterightsword.zPosition = 0.1
piraterightsword.position.x = -20
piraterightsword.position.y = -30
imagearray[4].addChild(piraterightsword)

}

if progress > 7 {


piraterighthook.position.x = CGRectGetMaxX(monkeyrightjumparmfar.frame) + 2
    piraterighthook.position.y = CGRectGetMaxY(monkeyrightjumparmfar.frame) + 12
    piraterighthook.zPosition = -0.1
    imagearray[4].addChild(piraterighthook)

}



    
    
    
    monkeyrightjumparmfar.position.x = 30
    monkeyrightjumparmfar.position.y = 5
    monkeyrightjumparmfar.zPosition = -0.2
    imagearray[4].addChild(monkeyrightjumparmfar)
    
    
    
    
    
    monkeyrightjumparmnear.position.x = -30
    monkeyrightjumparmnear.position.y = 15
    monkeyrightjumparmnear.zPosition = 0.2
    imagearray[4].addChild(monkeyrightjumparmnear)
    
  
   imagearray[4].texture = skView!.textureFromNode(imagearray[4])
    
    
    
    imagearray[4].removeAllChildren()
    imagearray[4].size.width = imagearray[5].size.width
    imagearray[4].size.height = imagearray[5].size.height
 //   imagearray[4].xScale = 1
    
    //End Right Jump




 //Left Jump
    
    
    imagearray[5].texture = imagearray[4].texture
    imagearray[5].xScale = -1

imagearray[5].texture = skView!.textureFromNode(imagearray[5])
imagearray[5].xScale = 1 // need to revert to make right jump face the correct way after the first round.

    
     //  imagearray[5].runAction(SKAction.scaleBy(-1, duration: 0)) 
//imagearray[5].yScale = -1
    
    //End Left Jump
}




if GameState.sharedInstance.costumechoice == 2 && progress > 1 {
    

    
    //Right Jump
    
    
    imagearray[4].removeAllChildren()
    

//need to rework sizes
    imagearray[4].size.width = 0.7*(153/123)*59 //roughmonkeynotail: (153/123)*59// with tail: 118 // was 140 // was 130
    imagearray[4].size.height = 0.7*153 //roughmonkeynotail: 153 //123 // with tail: 153 // was 140
    imagearray[4].zPosition = 0
    imagearray[4].color = UIColor(red: 240/255, green: 255/255, blue: 255/255, alpha: 1.0) 
    imagearray[4].colorBlendFactor = 0 // 0.5  
    
    imagearray[4].texture = SKTexture(imageNamed: "monkeyrightnolimbs")


piraterightvestfar.position.x = 8
    piraterightvestfar.position.y = -20
    piraterightvestfar.zPosition = -1
    imagearray[4].addChild(piraterightvestfar)
    
    piraterightvestnear.position.x = -10
    piraterightvestnear.position.y = -20
    piraterightvestnear.zPosition = 1
    imagearray[4].addChild(piraterightvestnear)

if progress > 1 {

piraterighthat.position.x = 0
    piraterighthat.position.y = 60
    piraterighthat.zPosition = 1
    imagearray[4].addChild(piraterighthat)

}



if progress > 2 {

piraterightearrings.position.x = -15
    piraterightearrings.position.y = 15
    piraterightearrings.zPosition = 1
    imagearray[4].addChild(piraterightearrings)

}

if progress > 3 {

piraterighteyepatch.position.x = 5
    piraterighteyepatch.position.y = 30
    piraterighteyepatch.zPosition = 1
    imagearray[4].addChild(piraterighteyepatch)


}

if progress > 4 {

//need to remove normal legs first

piraterightlegs.position.x = -15
    piraterightlegs.position.y = CGRectGetMinY(birdimagerightjump.frame) - piraterightlegs.size.height/2 + 5
    monkeyrightjumparmfar.zPosition = -1
    imagearray[4].addChild(piraterightlegs)


}

if progress > 5 {

//need to adjust size

piraterightsword.size.height = 35
piraterightsword.size.width = 15
piraterightsword.zPosition = 1
piraterightsword.position.x = -20
piraterightsword.position.y = -30
imagearray[4].addChild(piraterightsword)

}

if progress > 6 {


piraterighthook.position.x = CGRectGetMaxX(monkeyrightjumparmfar.frame) + 2
    piraterighthook.position.y = CGRectGetMaxY(monkeyrightjumparmfar.frame) + 12
    piraterighthook.zPosition = -1
    imagearray[4].addChild(piraterighthook)

}



    
    
    
    monkeyrightjumparmfar.position.x = 30
    monkeyrightjumparmfar.position.y = 5
    monkeyrightjumparmfar.zPosition = -2
    imagearray[4].addChild(monkeyrightjumparmfar)
    
    
    
    
    
    monkeyrightjumparmnear.position.x = -30
    monkeyrightjumparmnear.position.y = 15
    monkeyrightjumparmnear.zPosition = 2
    birdimagerightjump.addChild(monkeyrightjumparmnear)
    
    
    
    
    
    
    
    
    
    
    
    
    //End Right Jump

    
}

}

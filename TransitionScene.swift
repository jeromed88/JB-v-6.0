//
//  TransitionScene.swift
//  JB v 37.0 (customized spikedetectors)
//
//  Created by Jerome Elmore on 8/20/15.
//  Copyright (c) 2015 Jerome Elmore. All rights reserved.
//

import Foundation
import SpriteKit

class TransitionScene : SKScene{
    
    
    override init(size: CGSize) {
        
        super.init(size: size)
        

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
  /*  func transitiontoGameScene() {
        
        let transition: SKTransition = SKTransition.flipHorizontalWithDuration(0.15)
        let scene: SKScene = GameScene(size: size)
        scene.scaleMode = scaleMode
        self.view?.presentScene(scene, transition: transition)
        
        

    }*/
    
    override func didMoveToView(view: SKView) {
        
   //     self.runAction(SKAction.sequence([SKAction.waitForDuration(1), SKAction.runBlock({self.transitiontoGameScene()})]))
    
    
    }
    
    
    
    
}

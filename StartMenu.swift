import Foundation
import SpriteKit


/*
class StartMenu : SKScene{
    
    let classicbutton: SKSpriteNode = SKSpriteNode(imageNamed: "barrier")
    let crushbutton: SKSpriteNode = SKSpriteNode(imageNamed: "barrier")
    
    override init(size: CGSize) {
        
        super.init(size: size)
        let message: NSString = "Jump Bird"
        let label: SKLabelNode = SKLabelNode(fontNamed: "Optima-ExtraBlack")
        label.text = message as String
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: size.width/2, y: size.height/1.2)
        addChild(label)
        classicbutton.position = CGPoint(x: size.width/2, y: size.width/3)
        classicbutton.xScale = 0.3
        classicbutton.yScale = 0.1
        addChild(classicbutton)
        crushbutton.position = CGPoint(x: size.width/2, y: size.width/4)
        crushbutton.xScale = 0.3
        crushbutton.yScale = 0.1
        addChild(crushbutton)
        
        
    }
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    func transitiontogame() {
        /*
        let transition: SKTransition = SKTransition.flipHorizontalWithDuration(1)
        let scene: SKScene = GameScene(size: size)
        scene.scaleMode = scaleMode
        self.view?.presentScene(scene,transition: transition)
*/
        
        let gctransition: SKTransition = SKTransition.flipHorizontalWithDuration(1.0)
    //    let gcscene: SKScene = GameScene(size: size) // put back. experimenting with .sks file
        gcscene.scaleMode = self.scaleMode
        self.view?.presentScene(gcscene, transition: gctransition)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch = touches.first
        
        let touchLocation = touch?.locationInNode(self)
        
        if classicbutton.containsPoint(touchLocation!) {
            self.runAction(SKAction.runBlock(transitiontogame))
        } else {
            if crushbutton.containsPoint(touchLocation!) {
                self.runAction(SKAction.runBlock(transitiontogame))
            }
        }
    
    
    }
    
  /*  override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
       
        
    } */
    
}

*/



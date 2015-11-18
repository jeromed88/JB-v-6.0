import UIKit
import SpriteKit
import CoreMotion
import GameKit

/*
extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            let sceneData = try! NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
            let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

*/
/*
protocol GameViewControllerDelegate : NSObjectProtocol {
    func setMultiButtonHidden(hidden : Bool)
}

*/

class GameViewController: UIViewController, GKGameCenterControllerDelegate { // GameViewControllerDelegate    
  //  var noOfCars: Int? // removed this, using global one instead
    var networkingEngine: MultiplayerNetworking?
    
    
    override func viewDidLoad() {
        
        homeScreenController = self
        super.viewDidLoad()
        
        //USING .SKS
        /*
        let scene = GameScene(fileNamed:"GameScene")
        
     //   if let scene = GameScene(fileNamed:"GameScene") {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
    //    }
        
        */
        
        //END USING .SKS
        
        
        
        func authenticateLocalPlayer(){
            
            print("run authenticateLocalPlayer()")
            
            var localPlayer = GKLocalPlayer.localPlayer()
            
            localPlayer.authenticateHandler = {(viewController, error) -> Void in
                
                if (viewController != nil) {
                    self.presentViewController(viewController!, animated: true, completion: nil)
                    
                    print("self.presentViewController(viewController!, animated: true, completion: nil)")
                }
                    
                else {
                    print((GKLocalPlayer.localPlayer().authenticated))
                    print("(GKLocalPlayer.localPlayer().authenticated)")
                }
            }
            /* 
            if localPlayer.authenticated {
            localPlayer.registerListener(self)
            */
        }
        
        authenticateLocalPlayer()
        

        
        
        
        
        
        
        
        
        
        
        
        
        
        
       // if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
        let scene = GameScene(size:CGSize(width: 1536, height: 2048))
        skView = self.view as! SKView
         skView.showsFPS = true
        skView.showsNodeCount = true
        //   skView.showsDrawCount = true
        //   skView.showsQuadCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
   //      gameVCDelegate = self //scene. //put back
       
        //  gcViewController = self
        skView.presentScene(scene)
        
    
        
         viewController = self
        
        // 1
        let blurEffect = UIBlurEffect(style: .Light)
        // 2
        let blurView = UIVisualEffectView(effect: blurEffect)
        // 3
     //   blurView.setTranslatesAutoresizingMaskIntoConstraints(false)
        view.insertSubview(blurView, atIndex: 0)
        
        
        
            if noOfCars > 1 {
               
             //   scene.noOfCars = nrOfCars
            //    hidemult() // put back
                networkingEngine = MultiplayerNetworking()
            //    networkingEngine!.noOfLaps = 5
                networkingEngine!.delegate = scene
                
                scene.networkingEngine = networkingEngine
                
         //       pauseButton.hidden = true
                GameKitHelper.sharedInstance.findMatch(noOfCars, maxPlayers: noOfCars, presentingViewController: self, delegate: networkingEngine!)

            }
        
        
        
  //      saveHighscore(GameState.sharedInstance.highScore) //Why would I need to save high score here?
        
        
        
        //
        
        
        
      //  skView.frameInterval = 20
          skView.showsPhysics = true
        
    }
    
    
   
 //   @IBOutlet var MultiButton: UIButton!
    /*
   // MultiButton.origin.x = 700
    
    
    func setMultiButtonHidden(hidden : Bool) {
        
        print("run setMultiButtonHidden, hidden: \(hidden)")
        
        
        self.MultiButton.hidden = hidden
        
        print("MultiButton.hidden: \(MultiButton.hidden)")
        
    }
    
    
    func hidemult() {
        
        print("run hidemult()")
        MultiButton.hidden = true
        
    }
    
    @IBAction func playMultiPlayer4(sender: UIButton) {
        
        
        
        print("run playMultiPlayer")
        if !GKLocalPlayer.localPlayer().authenticated {
            return
        }
        
        
        if let storyboard = storyboard {
            
            
            //this way wasn't setting hiding multiplayer button successfully after moving multiplayer button to GameViewController.
            
            print("mult run, is authenticated")
            let gameViewController = storyboard.instantiateViewControllerWithIdentifier("GameViewController") as! GameViewController
           // gameViewController.noOfCars = 2
            noOfCars = 2
            navigationController?.pushViewController(gameViewController, animated: false)
            
            print("noOfCars in GameViewController: \(noOfCars)")
            
            //can't get noOfCars set to 2
            
            
            
            /*
            print("mult run, is authenticated")
            noOfCars = 2
            let transition: SKTransition = SKTransition.flipHorizontalWithDuration(1)
            let scene = GameScene(size:CGSize(width: 1536, height: 2048))
            //scene.scaleMode = scaleMode
            let skView = self.view as! SKView
            //   skView.showsDrawCount = true
            //   skView.showsQuadCount = true
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .AspectFill
            skView.presentScene(scene,transition: transition)
          */
            
            
            
            
            
            
            
            
            
        }
        
        
        hidemult()

        
        
    }
    */
    
    
    
     
   
        
        
        
        
       

        

   /* @IBAction func playMultiPlayer(sender: UIButton) {    }
    */
    
    func matchStarted() {
        print("Match has started successfully")
    }
    func matchEnded() { print("Match has ended")
    }
    func matchReceivedData(match: GKMatch, data: NSData,
        fromPlayer player: String) { }
   
   

    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController!)
    {
        gameCenterViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }
    /*
    func matchmakerViewController(viewController: GKMatchmakerViewController!,
        didFailWithError error: NSError!) {
    }
    */
 /* //originally: 

func matchmakerViewController(viewController: GKMatchmakerViewController!,
        didFindHostedPlayers players: [AnyObject]!) {
    }
*/
    /*
    func matchmakerViewController(viewController: GKMatchmakerViewController, didFindHostedPlayers players: [GKPlayer]) {
        
    }
    
    func matchmakerViewControllerWasCancelled(viewController: GKMatchmakerViewController!) {
        
        
        
        viewController.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func matchmakerViewController(viewController: GKMatchmakerViewController!,
        hostedPlayerDidAccept player: GKPlayer!) {
            
           


    }
 */   
    
    func showLeader() {
        
        saveHighscore(GameState.sharedInstance.highScore)
        loadAchievements()
        
        
        
        
        print("showleader started")
        var vc = self.view?.window?.rootViewController
        var gc = GKGameCenterViewController()
        gc.gameCenterDelegate = self
        vc?.presentViewController(gc, animated: true, completion: nil)
        
        
        
    }
    
    
    @IBOutlet var SingePlayerStart: SKView!

       /* 
        func multiMatch() {
            let r = GKMatchRequest()
            
            r.minPlayers = 2; r.maxPlayers = 2
            r.defaultNumberOfPlayers = 2
            
            let vc = GKTurnBasedMatchmakerViewController(
                matchRequest: r
            )
            
            vc.turnBasedMatchmakerDelegate = self
            
            presentViewController(vc, animated: true, completion: nil)
            
        }
        
    
    func openMatchmaker() {
        var r = GKMatchRequest()
        let gcViewController = GKMatchmakerViewController(matchRequest: r) //rootViewController: self
       
        gcViewController!.matchmakerDelegate = self
        
        gcViewController!.hosted = false
        gcViewController!.matchRequest.minPlayers = 2
        gcViewController!.matchRequest.maxPlayers = 2
        gcViewController!.matchRequest.defaultNumberOfPlayers = 2
        
        self.showViewController(gcViewController!, sender: self)
 self.navigationController?.pushViewController(gcViewController!, animated: true)
   //     self.presentViewController(gcViewController, animated: true, completion: nil)
        /*
        
        /*
       // gcViewController.matchmakerDelegate.matchmakerDelegate = self
        
        gcViewController.hosted = false
        gcViewController.matchRequest.minPlayers = 2
        gcViewController.matchRequest.maxPlayers = 2
        gcViewController.matchRequest.defaultNumberOfPlayers = 2
        
        self.showViewController(gcViewController, sender: self)
        self.navigationController?.pushViewController(gcViewController, animated: true)
     //   self.presentViewController(viewController, animated: true, completion: nil)
        
        */ */     }
*/

    
    /* OLD WAY OF USING GAMEVIEWCONTROLLER AS GAMEKITHELPERDELEGATE, BEFORE MULTIPLAYER FILE
func showMatchMakerViewController() { 
            GameKitHelper.sharedInstance.findMatch(2,
    maxPlayers: 2, presentingViewController: self,
    delegate: self) 
    
    print("attempt matchmaking")
    }
        */
    
    override func prefersStatusBarHidden() -> Bool  {
        return true
    }
    
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
   
  
        
      
        
    
}











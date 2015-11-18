/*import UIKit
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

*/ // ,

class GameViewController: UIViewController, GKGameCenterControllerDelegate { // GameKitHelperDelegate //  GKMatchmakerViewControllerDelegate, 
    
    var noOfCars: Int?
    var networkingEngine: MultiplayerNetworking?
    
    
    override func viewDidLoad() {
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
        
        
              
        
              
        
        
        
        
        
        
        
        
        
        
        
        
       // if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
        let scene = GameScene(size:CGSize(width: 1536, height: 2048))
        let skView = self.view as! SKView
         skView.showsFPS = true
        skView.showsNodeCount = true
        //   skView.showsDrawCount = true
        //   skView.showsQuadCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        
       
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
                
                networkingEngine = MultiplayerNetworking()
            //    networkingEngine!.noOfLaps = 5
                networkingEngine!.delegate = scene
                
                scene.networkingEngine = networkingEngine
                
         //       pauseButton.hidden = true
                GameKitHelper.sharedInstance.findMatch(noOfCars!, maxPlayers: noOfCars!, presentingViewController: self, delegate: networkingEngine!)

            }
        
        
        
  //      saveHighscore(GameState.sharedInstance.highScore) //Why would I need to save high score here?
        
        
        
        //
        
        
        
      //  skView.frameInterval = 20
          skView.showsPhysics = false
        
    }
    
    
    func showAuthenticationViewController() {
        let gameKitHelper = GameKitHelper.sharedInstance
        
        if let authenticationViewController = gameKitHelper.authenticationViewController {
            topViewController!.presentViewController(authenticationViewController, animated: true,
                completion: nil)
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    @IBAction func playMultiPlayer(sender: UIButton) {
        
        if !GKLocalPlayer.localPlayer().authenticated {
            return
        }
        
        
        if let storyboard = storyboard {
            let gameViewController = storyboard.instantiateViewControllerWithIdentifier("GameViewController") as! GameViewController
            gameViewController.noOfCars = 2
            noOfCars = 2
            navigationController?.pushViewController(gameViewController, animated: false)
            
            
        }
    }
    
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



*/







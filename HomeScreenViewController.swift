//
//  HomeScreenViewController.swift
//  JB 2.0
//
//  Created by Jerome Elmore on 9/23/15.
//  Copyright © 2015 Jerome Elmore. All rights reserved.
//

import UIKit
import GameKit

class HomeScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        
        
       
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        
        
                
        
        
    }
    
    override func prefersStatusBarHidden() -> Bool  {
        return true
    }
    
   
   
    
    @IBAction func playSinglePlayer(sender: UIButton) {
        
       
        
        print("start playsingleplayer")
        
        if let storyboard = storyboard {
            let gameViewController = storyboard.instantiateViewControllerWithIdentifier("GameViewController") as! GameViewController
            
            print("let gameViewController... finished")
          //  gameViewController.noOfCars = 1
            noOfCars = 1
            navigationController?.pushViewController(gameViewController, animated: false)
            print("playsingleplayercomplete")
        }

    }
    
}
    
    
   
    

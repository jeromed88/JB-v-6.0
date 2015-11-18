//
//  NavigationController.swift
//  JB 2.0
//
//  Created by Jerome Elmore on 9/23/15.
//  Copyright © 2015 Jerome Elmore. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            Selector("showAuthenticationViewController"), name:
            PresentAuthenticationViewController, object: nil)
        
        GameKitHelper.sharedInstance.authenticateLocalPlayer()
        navController = self
        super.viewDidLoad()
        
        
    }
    
    override func prefersStatusBarHidden() -> Bool  {
        return true
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
}
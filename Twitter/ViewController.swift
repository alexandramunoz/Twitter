//
//  ViewController.swift
//  Twitter
//
//  Created by Alexandra Munoz on 2/2/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit
import BDBOAuth1Manager
import AFNetworking

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(sender: AnyObject) {
        TwitterClient.sharedInstance.loginWithCompletion(){
            (user: User?, error: NSError?) in
            if user != nil{
                //perform segue
                self.performSegueWithIdentifier("loginSegue", sender: self)
            }else{
                //handle login error
            }
        }
    }

}


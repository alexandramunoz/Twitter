//
//  ComposeTweetViewController.swift
//  Twitter
//
//  Created by Alexandra Munoz on 2/14/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController {

    @IBOutlet weak var tweetTextField: UITextField!
    
    var tweet: Tweet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    @IBAction func didPressTweet(sender: AnyObject) {
        let tweet = tweetTextField.text?.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        TwitterClient.sharedInstance.postTweet(tweet!)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  TweetDetailsViewController.swift
//  Twitter
//
//  Created by Alexandra Munoz on 2/8/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit

class TweetDetailsViewController: UIViewController {
    
    var tweet: Tweet!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var retweetsCountLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeStampLabel.text = tweet.createdAtString
        tweetLabel.text = tweet.text
        likesCountLabel.text = "\(String(tweet.likeCount!)) Likes"
        retweetsCountLabel.text = "\(String(tweet.retweetCount!)) Retweets"
        profileImageView.setImageWithURL(NSURL(string:(tweet.user?.profileImageUrl)!)!)
        nameLabel.text = tweet.user!.name
        usernameLabel.text = "@\(String(tweet.user!.screenname!))"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressRetweet(sender: UIButton) {
        let id = tweet.id!
        
        var idDict = ["id" : id] as! NSDictionary
        
        TwitterClient.sharedInstance.retweetTweetWithParams(idDict) { (id, error) -> () in
        }
        self.tweet.retweetCount!++
        retweetsCountLabel.text = ("\(tweet.retweetCount!) Retweets")
    }
    
    @IBAction func didPressLike(sender: UIButton) {
        let id = tweet.id!
        
        var idDict = ["id" : id] as! NSDictionary
        
        TwitterClient.sharedInstance.favoriteTweetWithParams(idDict) { (id, error) -> () in
        }
        self.tweet.likeCount!++
        likesCountLabel.text = ("\(tweet.likeCount!) Likes")
        
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

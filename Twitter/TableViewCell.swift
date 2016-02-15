//
//  TableViewCell.swift
//  Twitter
//
//  Created by Alexandra Munoz on 2/7/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var likesCountLabel: UILabel!
    @IBOutlet weak var retweetsCountLabel: UILabel!
    
    var tweet: Tweet!
    
    
    @IBAction func didPressRetweet(sender: UIButton) {
        let id = tweet.id!
        
        var idDict = ["id" : id] as! NSDictionary
        
        TwitterClient.sharedInstance.retweetTweetWithParams(idDict) { (id, error) -> () in
        }
        self.tweet.retweetCount!++
        retweetsCountLabel.text = ("\(tweet.retweetCount!)")
    }

  
    @IBAction func didPressFavorite(sender: UIButton) {
        let id = tweet.id!
        
        var idDict = ["id" : id] as! NSDictionary
        
        TwitterClient.sharedInstance.favoriteTweetWithParams(idDict) { (id, error) -> () in
        }
        self.tweet.likeCount!++
        likesCountLabel.text = ("\(tweet.likeCount!)")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        
        tweetLabel.preferredMaxLayoutWidth = tweetLabel.frame.size.width

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tweetLabel.preferredMaxLayoutWidth = tweetLabel.frame.size.width
    }
}

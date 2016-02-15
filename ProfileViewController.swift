//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Alexandra Munoz on 2/14/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var numberOfTweetsLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        profileImageView.setImageWithURL(NSURL(string:(user?.profileImageUrl)!)!)
        profileImageView.layer.cornerRadius = 3.0
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.whiteColor().CGColor
        headerImageView.setImageWithURL(NSURL(string:(user!.headerImageUrl)!)!)
        
         numberOfTweetsLabel.text = "\(user!.tweetsCount!) tweets"
        followingLabel.text = "\(user!.followingCount!) following"
        followersLabel.text = "\(user!.followersCount!) followers"
        nameLabel.text = user!.name
        usernameLabel.text = "@\(String(user!.screenname!))"
        

        // Do any additional setup after loading the view.
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

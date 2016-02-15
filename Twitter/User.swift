//
//  User.swift
//  Twitter
//
//  Created by Alexandra Munoz on 2/6/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"

class User: NSObject {
    var name: String?
    var screenname: String?
    var profileImageUrl: String?
    var userDescription: String?
    var dictionary: NSDictionary
    var tweetsCount: String?
    var followersCount: String?
    var followingCount: String?
    var headerImageUrl: String?
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"]
            as? String
        headerImageUrl = dictionary["profile_banner_url"] as? String
        userDescription = dictionary["description"] as? String
        tweetsCount = String(dictionary["statuses_count"]!)
        followersCount = String(dictionary["followers_count"]!)
        followingCount = String(dictionary["friends_count"]!)
        
        
    }
    
    func logout(){
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
        
        
    }
    
    class var currentUser: User? {
        get{
            if _currentUser == nil{
                var data = NSUserDefaults.standardUserDefaults().objectForKey(currentUserKey) as? NSData
                if data != nil{
                    do{
                    let dictionary =  try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                    }
                    catch{
                    }
                }
        }
            return _currentUser
        }
        set(user){
            _currentUser = user
            
            if _currentUser != nil{
                do {
                   let data = try NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: [])
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                }
                catch{
                }
            }else{
                 NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    
}

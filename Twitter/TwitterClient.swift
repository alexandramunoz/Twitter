//
//  TwitterClient.swift
//  Twitter
//
//  Created by Alexandra Munoz on 2/2/16.
//  Copyright © 2016 Alexandra Munoz. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "t348TsUBipU9C99yiu61JSd8P"
let twitterConsumerSecret = "mTj2EWo3XxERl9mTFhdOxlSf43sQYl1zlc5Nbz6h2eLroneQ8k"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    
    var loginCompletion: ((user: User?, error: NSError?) -> ())?
    
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
        }
        return Static.instance
    }
    
    func homeTimelineWithParams(params: NSDictionary?, completion: ( tweets: [Tweet]?, error: NSError?) -> ()){
        GET("1.1/statuses/home_timeline.json", parameters: params, success: { (operation: NSURLSessionDataTask, response: AnyObject) -> Void in
            //print(response)
            var tweets = Tweet.tweetsWithArray(response as! [NSDictionary])
            completion(tweets: tweets, error: nil)
            }, failure: { (operation:NSURLSessionDataTask?, error: NSError) -> Void in
                print("error getting home timeline")
                completion(tweets: nil, error: error)
            })
        
    }
    
    func favoriteTweetWithParams(params: NSDictionary?, completion: (id: Int?, error:NSError?)->()){
        POST("1.1/favorites/create.json"
            , parameters: params, success: { (operation: NSURLSessionDataTask, response: AnyObject) -> Void in
                var id = params!["id"] as? Int
                completion(id: id, error: nil)
            }) { (operation: NSURLSessionDataTask?, error: NSError) -> Void in
                completion(id: nil, error: error)
        }
    }
   
    func retweetTweetWithParams(params: NSDictionary?, completion: (id: Int?, error: NSError?) -> ()){
        let id = params!["id"] as! Int
        POST("1.1/statuses/retweet/\(id).json", parameters: params, success: { (operation:NSURLSessionDataTask, response: AnyObject) -> Void in
            completion(id: id, error: nil)
            }) { (operation: NSURLSessionDataTask?, error: NSError) -> Void in
                completion(id:nil, error: error)
        }
        
    }

    func composeTweet(tweet: String){
        let params = NSMutableDictionary()
        params["status"] = tweet
        POST("1.1/statuses/update.json", parameters: params, success: { (operation: NSURLSessionDataTask, response: AnyObject) -> Void in
            print("tweeted")
            }) { (operation: NSURLSessionDataTask?, error: NSError) -> Void in
            print(error)
        }
    }
    
    func loginWithCompletion(completion: (user: User?, error: NSError?) -> ()){
        loginCompletion = completion
        
        //Fetch request token & redirect to authorization page
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        TwitterClient.sharedInstance.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "cptwitterdemo://oauth"), scope: nil, success: { (requestToken:BDBOAuth1Credential!) -> Void in
            print("Got the request token")
            var authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")
            UIApplication.sharedApplication().openURL(authURL!)
        }) { (error: NSError!) -> Void in
            print("Failed to get request token")
            self.loginCompletion?(user: nil, error: error)
                
        }
        
    }
    
    
    func openURL(url: NSURL){
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: BDBOAuth1Credential(queryString: url.query), success: { (accessToken: BDBOAuth1Credential!) -> Void in
            print("Got the access token!")
            
            TwitterClient.sharedInstance.requestSerializer.saveAccessToken(accessToken)
            TwitterClient.sharedInstance.GET("1.1/account/verify_credentials.json", parameters: nil, success: { (operation: NSURLSessionDataTask, response: AnyObject?) -> Void in
                //print(response)
                var user = User(dictionary: response as! NSDictionary)
                User.currentUser = user
                print("user: \(user.name)")
                self.loginCompletion?(user: user, error: nil)
            }, failure: { (operation: NSURLSessionDataTask?, error: NSError) -> Void in
                print("error getting current user")
                self.loginCompletion?(user: nil, error: error)
            })
            }) { (error: NSError!) -> Void in
                print("Failed to receive access token")
                self.loginCompletion?(user: nil, error: error)
        }
        
    }

}

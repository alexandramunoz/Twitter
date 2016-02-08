# Project 4 - *Twitter*

**Twitter** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **14** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can sign in using OAuth login flow
- [X] User can view last 20 tweets from their home timeline
- [X] The current signed in user will be persisted across restarts
- [X] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [X] Retweeting and favoriting should increment the retweet and favorite count.

The following **optional** features are implemented:

- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
- [ ] User can pull to refresh.

The following **additional** features are implemented:

- [X] Added username to tweet cell

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. How does replying to tweets on Twitter work?
2. Implementing a profile page with user's tweets

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/ACcIjAN.gif' title='Twitter' width='' alt='Twitter' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

I encountered difficulties pushing the app to GitHub, which led to my late submission. I apologize for the late submission, and I will make sure that I start pushing and pulling my projects every time I add a new feature to the app to ensure that my work is submitted on time from now on. I also had difficulties incrementing the favorite and retweet count as it would not allow me to use the += operator on an Int and I was not able to go back to figure it out before the deadline as I tried to solve my issues with GitHub. 

Update: 

I was able to implement the last requirement into the app (user can retweet and favorite and count is incremented). I would like to apologize again for my late submission and am hoping that I can use this as my one and only late submission that we are allowed to have during the class. I will not miss any classes, and as mentioned above, I will start pushing updates to my projects to GitHub as I complete them so that I do not arrive at midnight without having anything submitted. I did commit my updates before 11:59 so the features of the app were there (as seen in http://i.imgur.com/9PTfqYP.png, which shows that the project was committed before 11:59) but I had difficulty with the pulling in the repository. I will not make this mistake again and will seek help sooner if I find myself having trouble with GitHub again. Thank you. 

## License

    Copyright [2016] [Alexandra Munoz]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

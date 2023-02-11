# iOS Auto Video Player
> The purpose of this project is to demonstrate how to implement auto video functionality in a Swift application. This feature is commonly found in social media and video streaming apps, where a video starts playing automatically as soon as it is visible on the screen.

## Prerequisites
- Xcode 11.0 or later
- iOS 13.0 or later
- Swift 5.0 or later
- Knowledge of Swift programming language and iOS development

# Preview
![](https://drive.google.com/uc?id=13nK2CPMxVHkNhXyrOxvULluLlQIocP76)

## Getting Started
To start, you need to create a new project in Xcode. You can either use the Single View Application template or any other suitable template that matches your requirements.

Next, you need to add a video player to your project. For this purpose, you can use Apple's AVFoundation framework, which provides a powerful and flexible set of APIs for working with audio and video content.

To start playing a video, you need to create an instance of the AVPlayer and set the player's URL. You can then use the player's play() method to start playing the video.

## Implementing Auto Video Play Functionality
The key to implementing auto video play functionality is to observe the video player's status and start playing the video as soon as it becomes visible on the screen.

To do this, you can use the AVPlayerItemDidPlayToEndTime notification, which is fired when the player reaches the end of the video. You can use this notification to check the player's status and start playing the video as soon as it becomes visible.

## Features

- Plays video from a streaming URL 
- Videos are cached and the resumability is maintained too
- Easily customisable
- Video player controller handles all the play and pause functionality


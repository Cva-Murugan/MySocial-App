# MySocia-App

A social media application for iOS that allows users to connect, share updates, and communicate with friends. Built with Swift and Firebase backend, it provides secure user authentication and authorization using Firebase Authentication, and stores user information in a Firestore database.

Features

User Authentication: Users can securely sign up and log in to the app using their email and password, with authentication handled by Firebase Authentication.

User Profiles: Each user has a profile page that displays their basic information, profile picture, and posts.

News Feed: Users can view posts from their friends and engage with them by liking, commenting, and sharing.

Post Creation: Users can create new posts with text, images, and other media to share updates with their friends.

Friendship Management: Users can send friend requests, accept or decline incoming requests, and manage their list of friends.

Real-time Updates: The app utilizes Firebase's real-time capabilities to instantly update the user's feed and notify them of new interactions.

Requirements

iOS 16.4+

Xcode 13.0+

Swift 5.5

Firebase project with Authentication and Firestore enabled

Installation

Clone or download the repository.

Set up your Firebase project and configure the necessary credentials.

Install Firebase dependencies using Cocoapods:

Open Deus.xcworkspace in Xcode.

Update the Firebase configuration in AppDelegate.swift with your project's settings.

Build and run the app on your simulator or device.

Usage
Launch the app, and you will be presented with the login screen.
Sign up for a new account or log in using your existing credentials.
Once logged in, you will see your news feed with posts from your friends.

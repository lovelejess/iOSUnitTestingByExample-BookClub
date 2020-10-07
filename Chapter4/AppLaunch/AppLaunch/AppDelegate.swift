//
//  AppDelegate.swift
//  AppLaunch
//
//  Created by Jess Lê on 10/6/20.
//

import UIKit

/*
 “On the regular app delegate, the @UIApplicationMain attribute tells the Swift compiler to generate a “main” routine that starts the application with the designated app delegate. Since we’re taking control, remove @UIApplicationMain from AppDelegate.swift as well as from TestingAppDelegate.swift.”

 Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
 */
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions:
                    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(">> Launching with real app delegate")
        return true
    }
}

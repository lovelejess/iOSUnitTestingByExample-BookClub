//
//  TestingAppDelegate.swift
//  AppLaunchTests
//
//  Created by Jess Lê on 10/6/20.
//

import Foundation
import UIKit


/*
 How to bypass the AppDelegate and use a fake one instead
 

 “Remove the @UIApplicationMain attribute from the class declaration.

 Change the name of the class to TestingAppDelegate, and add a declaration @objc(TestingAppDelegate). By giving it an Objective-C name, we can refer to it without a namespace.

 Remove all methods except application(_:didFinishLaunchingWithOptions:).

 Customize the remaining method. For our example, let’s change the print(_:) statement.”

 Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
 */
@objc(TestingAppDelegate)
class TestingAppDelegate: UIResponder, UIApplicationDelegate {
    func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions:
                    [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("<< Launching with testing app delegate")
        return true
    }
}


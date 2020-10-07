//
//  main.swift
//  AppLaunch
//
//  Created by Jess Lê on 10/6/20.
//

import Foundation
import UIKit


/**
 NOTE this file must be named "main.swift"
 
 “This code tries to find a class named TestingAppDelegate outside of any namespace.
 If we’re running tests, the test bundle will be present, so the class will be there.
 But on regular runs, the test bundle will be missing, so NSClassFromString will return nil. ”

 Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
 */
let appDelegateClass: AnyClass =
        NSClassFromString("TestingAppDelegate") ?? AppDelegate.self
    
UIApplicationMain(CommandLine.argc,
                  CommandLine.unsafeArgv,
                  nil,
                  NSStringFromClass(appDelegateClass))

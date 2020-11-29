//
//  ClosurePropertyViewController.swift
//  HardDependencies
//
//  Created by Quinne Farenwald on 11/3/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

import UIKit

class ClosurePropertyViewController: UIViewController {
    // “For types where we can’t change the initializer, we can provide closures using property injection. This is necessary for storyboard-based view controllers.”
    // “Injecting closures gives us a way to extract creation of new instances.
    // But injecting closures may show that there is a new type trying to break free.
    // See if you can move the closures into a new type, changing them to methods.”
    //
    // Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
    var makeAnalytics: () -> Analytics = { Analytics.shared }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeAnalytics().track(event: "viewDidAppear - \(type(of: self))")
    }
}

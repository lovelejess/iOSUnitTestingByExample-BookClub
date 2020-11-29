//
//  InstancePropertyViewController.swift
//  HardDependencies
//
//  Created by Quinne Farenwald on 11/3/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

import UIKit

class InstancePropertyViewController: UIViewController {
    // “By declaring it lazy, the property won’t have an initial value.
    // A lazy stored property is a property whose initial value is not calculated until the first time it is used.
    // Once it’s accessed, it will receive the value—but only if it doesn’t already have one. ”
    //
    // Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
    lazy var analytics = Analytics.shared
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics.track(event: "viewDidAppear - \(type(of: self))")
    }
}

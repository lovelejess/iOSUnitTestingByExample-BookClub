//
//  ClosurePropertyViewController.swift
//  HardDependencies
//
//  Created by Quinne Farenwald on 11/3/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

import UIKit

class ClosurePropertyViewController: UIViewController {
    var makeAnalytics: () -> Analytics = { Analytics.shared }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeAnalytics().track(event: "viewDidAppear - \(type(of: self))")
    }
}

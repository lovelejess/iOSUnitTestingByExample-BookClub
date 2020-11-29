//
//  InstanceInitializerViewController.swift
//  HardDependencies
//
//  Created by Quinne Farenwald on 11/3/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

import UIKit

class InstanceInitializerViewController: UIViewController {
    private let analytics: Analytics

    // “The initializer parameter has a default value of Analytics.shared.
    // This lets the view controller set the dependency, unless a call site passes in a different argument.”
    //
    // Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
    init(analytics: Analytics = Analytics.shared) {
        self.analytics = analytics
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        analytics.track(event: "viewDidAppear - \(type(of: self))")
    }
}

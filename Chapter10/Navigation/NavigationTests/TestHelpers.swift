//
//  TestHelpers.swift
//  NavigationTests
//
//  Created by Jess Lê on 12/8/20.
//

import Foundation
import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}
/**
 “If a unit test calls UIKit but you don’t see the expected results, try executing the run loop.”

 “What we’re doing is asking the run loop to execute until Date(), which is the current time. So it nudges the run loop by telling it,
 “Run until I tell you. Now stop!” This gets us what we want while keeping the test duration short.”

 Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
 */
func executeRunLoop() {
    RunLoop.current.run(until: Date())
}

func putInWindow(_ vc: UIViewController) {
    let window = UIWindow()
    window.rootViewController = vc
    window.isHidden = false
}

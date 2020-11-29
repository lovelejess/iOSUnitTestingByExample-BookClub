//
//  TestHelpers.swift
//  ButtonTapTests
//
//  Created by Jess Lê on 11/29/20.
//

import Foundation
import UIKit

func tap(_ button: UIButton) {
    button.sendActions(for: .touchUpInside)
}

//“UIBarButtonItems aren’t UIControls, so we can’t call sendActions(for:) on them.”
//
//Excerpt From: Jon Reid. “iOS Unit Testing by Example.” Apple Books.
func tap(_ button: UIBarButtonItem) {
    _ = button.target?.perform(button.action, with: nil)
}

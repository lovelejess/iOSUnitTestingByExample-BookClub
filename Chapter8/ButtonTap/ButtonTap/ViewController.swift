//
//  ViewController.swift
//  ButtonTap
//
//  Created by Jess Lê on 11/29/20.
//

import UIKit

class ViewController: UIViewController {
    #if false
    @IBOutlet private var button: UIButton!
    #endif

    @IBOutlet private(set) var button: UIButton!

    @IBAction private func buttonTap() {
        print(">> Button was tapped")
    }
}

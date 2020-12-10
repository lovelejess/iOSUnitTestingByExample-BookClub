//
//  SegueNextViewController.swift
//  Navigation
//
//  Created by Jess Lê on 12/6/20.
//

import UIKit

class SegueNextViewController: UIViewController {
    var labelText: String?

    @IBOutlet private(set) var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = labelText
    }

    deinit {
        print(">> SegueNextViewController.deinit")
    }

}

//
//  ViewController.swift
//  Refactoring
//
//  Created by Quinne Farenwald on 3/2/21.
//

import UIKit

final class ViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "changePassword" {
            let changePasswordVC = segue.destination
                    as? ChangePasswordViewController
            changePasswordVC?.securityToken = "TOKEN"
        }
    }
}


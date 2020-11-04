//
//  Analytics.swift
//  HardDependencies
//
//  Created by Quinne Farenwald on 11/3/20.
//  Copyright © 2020 Quinne Farenwald. All rights reserved.
//

import Foundation

class Analytics {
    static let shared = Analytics()
    
    func track(event: String) {
        print(">>" + event)
        
        if self !== Analytics.shared {
            print (">> ...Not the Analytic singleton")
        }
    }
}

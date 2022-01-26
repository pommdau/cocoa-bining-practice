//
//  ViewController.swift
//  Preferences Demo
//
//  Created by HIROKI IKEUCHI on 2022/01/26.
//  Copyright © 2022 1024jp. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func checkUserDefaultsButtonClicked(_ sender: Any) {
        guard let message = UserDefaults.standard.string(forKey: "message") else {
            return
        }
        print("DEBUG: \(message)")
    }
    
}

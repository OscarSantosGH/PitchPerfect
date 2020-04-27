//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Oscar Santos on 4/26/20.
//  Copyright © 2020 Oscar Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func recordButtonTap(_ sender: Any) {
        recordLabel.text = "Recording..."
    }
    
    @IBAction func stopButtonTap(_ sender: Any) {
        
    }
    
}


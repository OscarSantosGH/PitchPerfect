//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Oscar Santos on 4/26/20.
//  Copyright © 2020 Oscar Santos. All rights reserved.
//

import UIKit

class RecordSoundViewController: UIViewController {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordButton.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    @IBAction func recordButtonTap(_ sender: Any) {
        recordLabel.text = "Recording in Progress"
        stopRecordButton.isEnabled = true
        recordButton.isEnabled = false
    }
    
    
    @IBAction func stopButtonTap(_ sender: Any) {
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true
        recordLabel.text = "Tap to Record"
    }
    
}


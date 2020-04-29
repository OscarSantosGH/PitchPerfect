//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Oscar Santos on 4/28/20.
//  Copyright © 2020 Oscar Santos. All rights reserved.
//

import UIKit

class PlaySoundViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playSoundButton(_ sender: UIButton){
        print("play sound button pressed")
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        print("stop audio button pressed")
    }

}

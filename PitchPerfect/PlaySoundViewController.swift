//
//  PlaySoundViewController.swift
//  PitchPerfect
//
//  Created by Oscar Santos on 4/28/20.
//  Copyright © 2020 Oscar Santos. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //MARK: Properties
    
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
        setButtonImageContentMode(buttons: snailButton, chipmunkButton, rabbitButton, vaderButton, echoButton, reverbButton)
    }
    
    // setButtonImageContentMode is a handy Variadic function to fix the squished images on iPhone SE landscape
    func setButtonImageContentMode(buttons:UIButton...){
        for button in buttons{
            // This solution was found on StackOverflow (https://stackoverflow.com/questions/38697032/how-to-center-an-image-inside-an-uibutton-without-stretching-in-both-direction-i)
            button.contentMode = .center
            button.imageView?.contentMode = .scaleAspectFit
        }
    }
    
    //MARK: playSoundButton IBAction
    
    @IBAction func playSoundButton(_ sender: UIButton){
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)
    }
    
    //MARK: stopButtonPressed IBAction
    
    @IBAction func stopButtonPressed(_ sender: AnyObject){
        stopAudio()
    }

}

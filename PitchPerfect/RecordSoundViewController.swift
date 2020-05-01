//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Oscar Santos on 4/26/20.
//  Copyright © 2020 Oscar Santos. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {
    
    //MARK: Outlets
    
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordButton.isEnabled = false
    }
    
    // UpdateUI take a RecordStatus parameter to update the UI
    func updateUI(isRecording:Bool){
        recordLabel.text = isRecording ? "Recording in Progress" : "Tap to Record"
        stopRecordButton.isEnabled = isRecording
        recordButton.isEnabled = !isRecording
    }
    
    //MARK: recordButton IBAction
    
    @IBAction func recordButtonTap(_ sender: Any) {
        // Updating the UI
        updateUI(isRecording: true)
        
        // Getting the file path to save the recorded audio
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        // Creating the AVAudioSession
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        // Initializing the audioRecorder with the file path
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    //MARK: stopButton IBAction
    
    @IBAction func stopButtonTap(_ sender: Any) {
        // Updating the UI
        updateUI(isRecording: false)
        
        // Stopping the recording
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    //MARK: AVAudioRecorderDelegate function
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        // If flag is successful perform the segue and send the audioRecorder url
        if flag{
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        }else{
            print("Recording was not successful")
        }
    }
    
    // Preparing the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If segue identifier is equal to "stopRecording" set the property recordedAudioURL of PlaySoundViewController equal to audioRecorder.url
        if segue.identifier == "stopRecording"{
            let destinationVC = segue.destination as! PlaySoundViewController
            let recordedAudioURL = sender as! URL
            destinationVC.recordedAudioURL = recordedAudioURL
        }
    }
}

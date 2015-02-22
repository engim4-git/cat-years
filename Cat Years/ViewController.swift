//
//  ViewController.swift
//  Cat Years
//
//  Created by Carl-Uwe Würfel on 22.02.15.
//  Copyright (c) 2015 Carl-Uwe Würfel. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer?

class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer? = nil
    
    @IBOutlet weak var textFieldAge: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    
    @IBAction func findAge(sender: AnyObject) {
        
        var enteredAge = textFieldAge.text.toInt()
        
        if let path = NSBundle.mainBundle().pathForResource("Meow", ofType: "mp3") {
            audioPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: path), fileTypeHint: "mp3", error: nil)
            
            if let sound = audioPlayer {
                sound.prepareToPlay()
                sound.play()
            }
        }
        
        if enteredAge != nil {
            var catYears = enteredAge! * 7
            if catYears >= 70 {
                 catImage.image = UIImage(named: "old")
            } else if catYears >= 20 {
                 catImage.image = UIImage(named: "middle")
            } else {
                 catImage.image = UIImage(named: "young")
            }
            
            resultLabel.text = "Your Cat is \(catYears) in cat years"
        } else {
            resultLabel.text = "Please type in an age"
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    let eggTimes = ["Soft" : 300 , "Medium" : 420 , "Hard" : 720 ]
    var totalTime = 0
    var secondPassed = 0
        
        var timer = Timer()
   
    @IBOutlet var label: UILabel!
    
    @IBOutlet var timeprogress: UIProgressView!
    @IBOutlet var eggTimePro: NSLayoutConstraint!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        timer.invalidate() // stoping it and starting it again
//        print(eggTimes[hardness]!)
        timeprogress.progress = 0.0
        secondPassed = 0
        label.text = hardness
   
        
       totalTime = Int(eggTimes[hardness]!)
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
          
       
    
    }
    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    @objc func update() {
           if (secondPassed < totalTime) {
               secondPassed  += 1
               timeprogress.progress = Float(secondPassed) / Float(totalTime)
               
               secondPassed  += 1
               }else{
                   timer.invalidate()
            label.text = ("DONE✅")
            playSound()
                   
        }
           
       }
    
}

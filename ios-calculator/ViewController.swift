//
//  ViewController.swift
//  ios-calculator
//
//  Created by Wesam on 6/27/16.
//  Copyright © 2016 Wesam. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var btnSund: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bath = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: bath!)
        do {
            try btnSund = AVAudioPlayer(contentsOfURL: soundURL)
            btnSund.prepareToPlay()
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    }

    @IBAction func pressedBoutton(btn: UIButton!){
        btnSund.play()
    }

}


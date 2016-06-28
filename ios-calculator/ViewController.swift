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
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var btnSund: AVAudioPlayer!
    var currentOperation: Operation = Operation.Empty
    var runnigNumber = ""
    var courentOperator = ""
    var leftValNum = ""
    var rightValNum = ""
    var result = ""

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
    
//     pressedBoutton a @IBAction for number buttons 
//     0 to 9 by tag
    
    @IBAction func pressedBoutton(btn: UIButton!){
        plaSound()
        
        runnigNumber += "\(btn.tag)"
        outputLabel.text = runnigNumber
    }
    
//    @IBAction for operators 
    @IBAction func onSub(sender: AnyObject) {
        processOpration(Operation.Subtract)
    }

    @IBAction func onCal(sender: AnyObject) {
        processOpration(Operation.Add)
    }
    
    @IBAction func onDiv(sender: AnyObject) {
        processOpration(Operation.Divide)
    }
    
    @IBAction func onMul(sender: AnyObject) {
        processOpration(Operation.Multiply)
    }
    
    @IBAction func onEcu(sender: AnyObject) {
        processOpration(currentOperation)
    }
    
    func processOpration(op : Operation){
        plaSound()
        
        if currentOperation != Operation.Empty {
            
            if runnigNumber != "" {
                rightValNum = runnigNumber
                runnigNumber = ""
                
                if currentOperation == Operation.Multiply{
                    result = "\( Double(leftValNum)! * Double(rightValNum)! )"
                }else if currentOperation == Operation.Divide{
                    result = "\( Double(leftValNum)! / Double(rightValNum)!)"
                }else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValNum)! - Double(rightValNum)!)"
                }else if currentOperation == Operation.Add{
                    result = "\(Double(leftValNum)! + Double(rightValNum)!)"
                }
                
                leftValNum = result
                outputLabel.text = result
            }
            
        }else{
            //first time oprator pressed
            leftValNum = runnigNumber
            runnigNumber = ""
        }
        currentOperation = op
    }
    
    
    // if the sund is playng stop him it can make crash
    func plaSound(){
        if btnSund.playing{
            btnSund.stop()
        }
        btnSund.play()
    }
}


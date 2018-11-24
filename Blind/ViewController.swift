//
//  ViewController.swift
//  Blind
//
//  Created by Hay Dane on 11/24/18.
//  Copyright © 2018 Hay Dane. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
    @IBOutlet weak var lblNum: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var exactSwtich: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var counter = 0
    var randomNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber = Int(arc4random_uniform(101))
        lblNum.text = "Move the slider to: \(randomNumber)"
    }

   
    @IBAction func checkValue(_ sender: Any) {
        if exactSwtich.isOn == false
        {
            if Int(numSlider.value) >= randomNumber-3 && Int(numSlider.value) <= randomNumber+3
            {
                lblResult.text = "You were on the right point"
                lblResult.textColor = UIColor.green
            }
            else
            {
                lblResult.text = "Whoops! you missed! try again"
                lblResult.textColor = UIColor.red
            }
        }
        else
        {
            if randomNumber == Int(numSlider.value)
            {
                lblResult.text = "You were on the right point"
                lblResult.textColor = UIColor.green
            }
            else
            {
                lblResult.text = "Whoops! you missed! try again"
                lblResult.textColor = UIColor.red
            }
        }
        playAgainButton.isHidden = false
        lblResult.isHidden = false
    }
    @IBAction func sliderValueChanged(_ sender: Any) {
    }
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        lblNum.text = "Move the slider to: \(randomNumber)"
        lblResult.isHidden = true
        playAgainButton.isHidden = true
    }
}


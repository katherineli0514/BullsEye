//
//  ViewController.swift
//  BullsEye
//
//  Created by Katherine Li on 9/25/18.
//  Copyright © 2018 katherine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func setupSlider() {
        if let thumbImageNormal = UIImage(named: "SliderThumb-Normal"), let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted"), let trackLeftImage = UIImage(named: "SliderTrackLeft"), let trackRightImage = UIImage(named: "SliderTrackRight") {
            slider.setThumbImage(thumbImageNormal, for: .normal)
            slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
            let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
            let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
            slider.setMinimumTrackImage(trackLeftResizeable, for: .normal)
            let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
            slider.setMaximumTrackImage(trackRightResizeable, for: .normal)
        }
    }

    @IBAction func showAlert(_ sender: Any) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        var title = ""
        if difference == 0 {
            title = "Perfect!"
            points *= 2
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close :("
        }
        score += points
        
        let message = "Your scored \(points) points!"
        let scoreAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { [weak self] action in
            self?.startNewRound()
        })
        scoreAlert.addAction(action)
        present(scoreAlert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lrintf(slider.value)
    }
    
    @IBAction func startButtonClicked(_ sender: UIButton) {
        score = 0
        round = 0
        startNewRound()
    }
    
    @IBAction func infoButtonClicked(_ sender: UIButton) {
    }
}


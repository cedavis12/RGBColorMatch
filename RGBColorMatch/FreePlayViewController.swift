//
//  ViewController.swift
//  RGBColorMatch
//
//  Created by Courtney Davis on 5/10/20.
//  Copyright © 2020 Courtney Davis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleView: UIView!
    @IBOutlet var guessLabel: UILabel!
    @IBOutlet var rgbLabel: UILabel!
    @IBOutlet var rgbColors: [UIButton]!
    
    @IBOutlet var playAgainLabel: UILabel!
    
    
    var pickedColor: UIColor!
    var colors: [UIColor] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        generateColors()
        configureButtons()
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            colors = []
            generateColors()
            configureButtons()
            guessLabel.text = "Can You Match Me?"
            playAgainLabel.text = ""
            titleView.backgroundColor = .secondarySystemBackground
        }
    }
    
    func generateColors() {
        for _ in rgbColors {
            colors.append(.random())
        }
        
        pickedColor = colors.randomElement()
        
        let randomRed = pickedColor.cgColor.components?[0] ?? 1.0
        let randomBlue = pickedColor.cgColor.components?[1] ?? 1.0
        let randomGreen = pickedColor.cgColor.components?[2] ?? 1.0
        
        let redRGB = Int(randomRed * 255.0)
        let blueRGB = Int(randomBlue * 255.0)
        let greenRGB = Int(randomGreen * 255.0)
    
        rgbLabel.text = "RGB(\(redRGB), \(blueRGB), \(greenRGB))"
    }
    
    // configure buttons
    func configureButtons() {
        var index = 0
        for button in rgbColors {
            button.layer.cornerRadius = 8
            button.addTarget(self, action: #selector(colorPressed), for: .touchUpInside)
            button.backgroundColor = colors[index]
            index += 1
        }
        
    }
    
    
    // MARK: Button Events
    
    @objc func colorPressed(sender: UIButton) {
        if sender.backgroundColor == pickedColor {
            for button in rgbColors {
                button.backgroundColor = pickedColor
            }
            guessLabel.text = "You found me!"
            playAgainLabel.text = "Shake to Play Again!"
            playAgainLabel.font = .boldSystemFont(ofSize: 30)
            titleView.backgroundColor = pickedColor
        } else {
            sender.backgroundColor = .systemBackground
            guessLabel.text = "Try Again"
        }
    }
}

// TO DO
// configure segmented controls to toggle game difficulty



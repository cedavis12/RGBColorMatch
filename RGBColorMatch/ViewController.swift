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
    @IBOutlet var newColorsLabel: UIButton!
    @IBOutlet var rgbColors: [UIButton]!
    
    var randomColor: UIColor!
    var pickedColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        getRandomColor()
    }
    
    // generate a random color
    func getRandomColor() {
        randomColor = .random()
        let randomRed = randomColor.cgColor.components?[0] ?? 1.0
        let randomBlue = randomColor.cgColor.components?[1] ?? 1.0
        let randomGreen = randomColor.cgColor.components?[2] ?? 1.0
        
        let redRGB = Int(randomRed * 255.0)
        let blueRGB = Int(randomBlue * 255.0)
        let greenRGB = Int(randomGreen * 255.0)
        
        print("Red: \(redRGB), Blue: \(blueRGB), Green: \(greenRGB)")
        
        rgbLabel.text = "RGB(\(redRGB), \(blueRGB), \(greenRGB))"
    }
    
    
    
    // configure buttons
    func configureButtons() {
        for button in rgbColors {
            button.layer.cornerRadius = 8
            button.backgroundColor = .random()
            button.addTarget(self, action: #selector(colorPressed), for: .touchUpInside)
        }
    }
    

    @IBAction func newColorsButtonPressed(_ sender: UIButton) {
    }
    
    @objc func colorPressed(sender: UIButton) {
        if sender.backgroundColor == randomColor {
            print("you found me!")
        } else {
            sender.backgroundColor = .systemBackground
        }
        
    }
    
    
}

// TO DO
    // check if sender button matches the random color in the title
    // change text of Can You Match Me to Incorrect or Correct based on gues
    // add Instructions view
    // link new colors to reset the colors of the squares



//
//  ViewController.swift
//  RGB Slider
//
//  Created by sarah on 1/2/18.
//  Copyright © 2018 sarah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorSquare: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSquare.layer.borderColor = UIColor.black.cgColor
        colorSquare.layer.borderWidth = 1
        let defaults = UserDefaults.standard
        redSlider.value = defaults.float(forKey: "red")
        greenSlider.value = defaults.float(forKey: "green")
        blueSlider.value = defaults.float(forKey: "blue")
        updateBackgroundColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="openColor") {
            let newViewController = segue.destination
            newViewController.view.backgroundColor = colorSquare.backgroundColor
        }
    }
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat (greenSlider.value)
        let blue = CGFloat (blueSlider.value)
        
        colorSquare.backgroundColor = UIColor (red: red, green: green, blue: blue, alpha: 1)
        let defaults = UserDefaults.standard
        defaults.set (redSlider.value, forKey: "red")
        defaults.set (greenSlider.value, forKey: "green")
        defaults.set (blueSlider.value, forKey: "blue")
        defaults.synchronize()
    }
    

}



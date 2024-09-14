//
//  ViewController.swift
//  quizApp
//
//  Created by Umut Yüksel on 2.09.2024.
//

import UIKit

class Anasayfa: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        startButton.layer.cornerRadius = 12
        
        /*
        startButton.layer.borderWidth = 2.5
        startButton.layer.borderColor = UIColor.black.cgColor
        */
        
        self.view.bringSubviewToFront(startButton)
    }
    
    
}


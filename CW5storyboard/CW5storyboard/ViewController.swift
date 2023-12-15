//
//  ViewController.swift
//  CW5storyboard
//
//  Created by Mac on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var squareView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressButton(_ sender: Any) {
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat]) {
            self.squareView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.squareView.transform = CGAffineTransform(rotationAngle: .pi / 4)
        }
        UIView.animate(withDuration: 3, delay: 1, options: [.autoreverse, .repeat]) {
            self.squareView.layer.opacity = 0
        }
        
    }
    
}


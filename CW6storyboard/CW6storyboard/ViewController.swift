//
//  ViewController.swift
//  CW6storyboard
//
//  Created by Mac on 19.12.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    private let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let rgb = userDefault.object(forKey: "backgroundColor") as? [CGFloat] {
            view.backgroundColor = UIColor(red: rgb[0], green: rgb[1], blue: rgb[2], alpha: 1)
        }
 
        greenView.layer.borderWidth = 2
        greenView.layer.borderColor = UIColor.black.cgColor
        
        whiteView.layer.borderWidth = 2
        whiteView.layer.borderColor = UIColor.black.cgColor
        
        blueView.layer.borderWidth = 2
        blueView.layer.borderColor = UIColor.black.cgColor
        
        greenView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))
        whiteView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))
        blueView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))

    }
        
    @objc func tapped(_ sender: UITapGestureRecognizer){
        guard let color = sender.view?.layer.backgroundColor else {return}
        view.backgroundColor = UIColor(cgColor: color)
        
        userDefault.setValue(color.components, forKey: "backgroundColor")

    }
    
  
}


//
//  ViewController.swift
//  Light
//
//  Created by Jaron Patena on 3/27/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        offState()
    }
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBAction func switchToggled(_ sender: UISwitch) {
        updateUI(sender: sender)
    }
    
    func updateUI(sender: UISwitch) {
        if sender.isOn {
            onState()
        }
        else {
            offState()
        }
    }
    
    func onState() {
        view.backgroundColor = .white
        switchLabel.text = "On"
        switchLabel.textColor = .black
    }
    
    func offState() {
        view.backgroundColor = .black
        switchLabel.text = "Off"
        switchLabel.textColor = .white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


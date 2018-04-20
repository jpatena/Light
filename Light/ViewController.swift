//
//  ViewController.swift
//  Light
//
//  Created by Jaron Patena on 3/27/18.
//

import UIKit
import AVFoundation

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
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                let alert = UIAlertController(title: "Error", message: "Torch could not be used. Please try again.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Torch is not available for this device.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func onState() {
        view.backgroundColor = .white
        switchLabel.text = "On"
        switchLabel.textColor = .black
        toggleTorch(on: true)
    }
    
    func offState() {
        view.backgroundColor = .black
        switchLabel.text = "Off"
        switchLabel.textColor = .white
        toggleTorch(on: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

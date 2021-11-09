//
//  ViewController.swift
//  BlurView
//
//  Created by Tabish on 5/22/21.
//

import UIKit

class ViewController: UIViewController {

    // Outlets
    @IBOutlet weak var blurVu: UIVisualEffectView!
    @IBOutlet weak var tapToOpenLbl: UILabel!
    @IBOutlet weak var vuTopConstraint: NSLayoutConstraint!
    
    // Variable
    var vuIsVisible = false
    
    // Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedVu))
        view.addGestureRecognizer(tapGesture)
    }

    // Action
    @objc func tappedVu() {
        
        if !vuIsVisible {
            vuTopConstraint.constant = 50
            tapToOpenLbl.text = "Tap to Close."
            blurVu.alpha = 0.4
        } else {
            vuTopConstraint.constant = -300
            tapToOpenLbl.text = "Tap to Open."
            blurVu.alpha = 0
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.view.layoutIfNeeded()
        })
        
        vuIsVisible = !vuIsVisible
    }
}


//
//  ViewController.swift
//  AddressTicketApp
//
//  Created by Elena Diniz on 27/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.loginImageView.image = UIImage(named: "label")
        self.startButton.layer.cornerRadius = 5
        self.startButton.layer.borderWidth = 1


    }

    @IBAction func tappedStartButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "editView", sender: nil)
    }
    
}


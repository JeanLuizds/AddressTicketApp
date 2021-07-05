//
//  TicketCheckOutView.swift
//  AddressTicketApp
//
//  Created by Elena Diniz on 27/06/21.
//

import UIKit

class TicketCheckOutView: UIViewController {

    @IBOutlet weak var checkOutLabel: UILabel!
    @IBOutlet weak var printButton: UIButton!
    
    var receivedData = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkOutLabel.textColor = UIColor.white
        self.printButton.layer.cornerRadius = 5
        self.printButton.layer.borderWidth = 1
        
        self.checkOutLabel.text = self.receivedData
        // Do any additional setup after loading the view.
        
    }

    @IBAction func tappedPrintButton(_ sender: UIButton) {
        
        self.printAlert(title: "ATENÇÃO!!")
    }
    
    func printAlert(title: String){
        let alertController = UIAlertController(title: title, message: "Etiqueta enviada para impressora", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }

}

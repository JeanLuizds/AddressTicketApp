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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkOutLabel.textColor = UIColor.white
        self.printButton.layer.cornerRadius = 5
        self.printButton.layer.borderWidth = 1
        // Do any additional setup after loading the view.
        
//        if let value = UserDataManager.shared.defaults?.value(forKey: "checkOut") as? String {
//            checkOutLabel.text = value
//        }
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

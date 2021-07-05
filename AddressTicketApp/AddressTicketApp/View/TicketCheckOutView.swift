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
    @IBOutlet weak var checkOutLabel2: UILabel!
    @IBOutlet weak var checkOutLabel3: UILabel!
    @IBOutlet weak var checkOutLabel4: UILabel!
    @IBOutlet weak var checkOutLabel5: UILabel!
    @IBOutlet weak var checkOutLabel6: UILabel!
    @IBOutlet weak var checkOutLabel7: UILabel!
    @IBOutlet weak var checkOutLabel8: UILabel!
    
    var receivedDataDestinatario = String()
    var receivedDataCep = String()
    var receivedDataEndereco = String()
    var receivedDataNumero = String()
    var receivedDataComplemento = String()
    var receivedDataBairro = String()
    var receivedDataCidade = String()
    var receivedDataEstado = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.checkOutLabel.textColor = UIColor.white
        self.printButton.layer.cornerRadius = 5
        self.printButton.layer.borderWidth = 1
        
        self.checkOutLabel.text = self.receivedDataDestinatario
        self.checkOutLabel2.text = self.receivedDataCep
        self.checkOutLabel3.text = self.receivedDataEndereco
        self.checkOutLabel4.text = self.receivedDataNumero
        self.checkOutLabel5.text = self.receivedDataComplemento
        self.checkOutLabel6.text = self.receivedDataBairro
        self.checkOutLabel7.text = self.receivedDataCidade
        self.checkOutLabel8.text = self.receivedDataEstado
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

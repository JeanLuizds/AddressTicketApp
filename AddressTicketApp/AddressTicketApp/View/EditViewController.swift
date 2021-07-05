//
//  EditViewController.swift
//  AddressTicketApp
//
//  Created by Elena Diniz on 27/06/21.
//

import UIKit

protocol EditViewControllerProtocol: AnyObject {
    func tappedTicketButton(value: Address)
}

class EditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var destinatarioTextField: UITextField!
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var enderecoTextField: UITextField!
    @IBOutlet weak var numeroTextField: UITextField!
    @IBOutlet weak var complementoTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var estadoTextField: UITextField!
    @IBOutlet weak var ticketButton: UIButton!
    
    var label = "Bem vindo! Digite os dados abaixo para gerar sua etiqueta. Os campos obrigatórios estão preenchidos com um ASTERISCO(*)!"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.destinatarioTextField.delegate = self
        self.cepTextField.delegate = self
        self.enderecoTextField.delegate = self
        self.numeroTextField.delegate = self
        self.complementoTextField.delegate =  self
        self.bairroTextField.delegate =  self
        self.cidadeTextField.delegate = self
        self.estadoTextField.delegate = self
        self.welcomeLabel.text = label
        
        self.destinatarioTextField.becomeFirstResponder()
        self.addDoneButtonOnKeyboard()
        self.ticketButton.layer.cornerRadius = 5
        self.ticketButton.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
        
        let ticket1: Address = Address(nomeDestinario: self.destinatarioTextField.text, cep: self.cepTextField.text, endereco: self.enderecoTextField.text, numero: self.numeroTextField.text, bairro: self.bairroTextField.text, cidade: self.cidadeTextField.text, estado: self.estadoTextField.text, complemento: self.complementoTextField.text)
    }


    @IBAction func tappedTicketButton(_ sender: UIButton) {
        
        if self.destinatarioTextField.validateDestinatario() ||
            self.cepTextField.validateCEP() ||
            self.enderecoTextField.validateEndereco() ||
            self.numeroTextField.validateNumero() ||
            self.bairroTextField.validateBairro() ||
            self.cidadeTextField.validateCidade() ||
            self.estadoTextField.validateEstado() {
            self.doneAlert()
        }else{
            self.showAlert(title: "Preencha todos os campos acima!")
        }
    }
    
    func showAlert(title: String){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func doneAlert(){
        let alertController = UIAlertController(title: "ATENÇÃO!", message: "Confirme sua etiqueta antes de imprimir", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default) { action -> Void in
            self.performSegue(withIdentifier: "checkOut", sender: nil)
            }
        alertController.addAction(okButton)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(destinatarioTextField){
            self.cepTextField.becomeFirstResponder()
        }else if textField.isEqual(cepTextField) {
            self.enderecoTextField.becomeFirstResponder()
        }else if textField.isEqual(enderecoTextField) {
        self.numeroTextField.becomeFirstResponder()
        }else if textField.isEqual(numeroTextField) {
            self.complementoTextField.becomeFirstResponder()
        }else if textField.isEqual(complementoTextField) {
            self.bairroTextField.becomeFirstResponder()
        } else if textField.isEqual(bairroTextField) {
            self.cidadeTextField.becomeFirstResponder()
        } else if textField.isEqual(cidadeTextField) {
            self.estadoTextField.becomeFirstResponder()
        } else {
            self.estadoTextField.resignFirstResponder()
        }
        return true
    }
    
    private func addDoneButtonOnKeyboard() {
        
        let toolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonTapped))
        
        let items = [flexSpace, doneButton]
        toolBar.items = items
        toolBar.sizeToFit()
        
        self.numeroTextField.inputAccessoryView = toolBar
    }
    
    @objc func doneButtonTapped() {
        print("DoneButtonTapped")
        self.complementoTextField.becomeFirstResponder()
    }
}

extension UITextField {
    
    func validateDestinatario() -> Bool {
        let destinatarioRegex = "[/^A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/{2,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", destinatarioRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validateCEP() -> Bool {
        let cepRegex = "[0-9-]{8,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", cepRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validateEndereco() -> Bool {
        let enderecoRegex = "[/^A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/[.-]{2,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", enderecoRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validateNumero() -> Bool {
        let numeroRegex = "[0-9]{2,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", numeroRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validateBairro() -> Bool {
        let bairroRegex = "[/^A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/[.-]{2,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", bairroRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validateCidade() -> Bool {
        let cidadeRegex = "[/^A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/[.-]{2,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", cidadeRegex)
        return validateRegex.evaluate(with: self.text)
    }
    
    func validateEstado() -> Bool {
        let estadoRegex = "[/^A-Za-záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ ]+$/[.-]{2,}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", estadoRegex)
        return validateRegex.evaluate(with: self.text)
    }

}

extension EditViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc: TicketCheckOutView = segue.destination as! TicketCheckOutView
        vc.receivedData = destinatarioTextField.text!
    }
}

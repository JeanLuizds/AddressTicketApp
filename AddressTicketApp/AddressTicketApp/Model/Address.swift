//
//  Address.swift
//  AddressTicketApp
//
//  Created by Elena Diniz on 27/06/21.
//

import Foundation

class Address {
    
    var nomeDestinatario: String?
    var cep: String?
    var endereco: String?
    var numero: String?
    var bairro: String?
    var cidade: String?
    var estado: String?
    var complemento: String?
    
    init(nomeDestinario: String?, cep: String?, endereco: String?, numero: String?, bairro: String?, cidade: String?, estado: String?, complemento: String?) {
        self.nomeDestinatario = nomeDestinario
        self.cep = cep
        self.endereco = endereco
        self.numero = numero
        self.bairro = bairro
        self.cidade = cidade
        self.estado = estado
        self.complemento = complemento
    }
}

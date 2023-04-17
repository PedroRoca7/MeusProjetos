//
//  Cep.swift
//  Cep
//
//  Created by Pedro Henrique on 30/03/23.
//

import Foundation

struct Cep: Decodable{
    
    var logradouro: String
    var bairro: String
    var localidade: String
    var uf: String
    var ddd: String
}

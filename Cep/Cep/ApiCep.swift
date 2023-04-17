//
//  ApiCep.swift
//  Cep
//
//  Created by Pedro Henrique on 30/03/23.
//

import Foundation

class ApiCep{
    
    class func searchCEP(_ cep: String, completion: @escaping (Cep) -> Void){
        guard let url = URL(string: "https://viacep.com.br/ws/\(cep)/json/") else {return}
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if error == nil{
                guard let response = response as? HTTPURLResponse else {return}
                if response.statusCode == 200{
                    
                    guard let data = data else {return}
                    do{
                        let cep = try JSONDecoder().decode(Cep.self,from:data)
                        completion(cep)
                        
                    }catch{
                        print(error.localizedDescription)
                    }
                }else{
                    print("Status inválido do servidor, Status Code: \(response.statusCode)")
                }
            }else{
                print(error!.localizedDescription)
            }
        }.resume()
    }
}

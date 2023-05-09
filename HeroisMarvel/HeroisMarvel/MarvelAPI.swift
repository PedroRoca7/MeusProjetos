//
//  MarvelAPI.swift
//  HeroisMarvel
//
//  Created by Pedro Henrique on 06/04/23.
//  Copyright © 2023 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI{
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    //. Coloque sua chave privada aqui.
    static private let privateKey = ""
    // Coloque sua chave publica aqui.
    static private let publicKey = ""
    static private let limit = 1


    class func loadHeros(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = page * limit
        let startWith: String
        if let name = name , !name.isEmpty{
            startWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
        }else{
            startWith = ""
        }
        
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + startWith + getCredentials()
        print(url)
        
        AF.request(url).responseDecodable(of: MarvelInfo.self) { (response) in
            switch response.result {
                case let .success(data):
                    onComplete(data)
                case .failure:
                    onComplete(nil)
            }
         }
        
    }
    
    private class func getCredentials() -> String{
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}


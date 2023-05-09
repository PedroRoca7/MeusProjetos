//
//  MarvelAPI.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPI{
    
    static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
    //. Coloque sua chave privada aqui.
    static private let privateKey = ""
    //. Coloque sua chave publica aqui.
    static private let publicKey = ""
    static private let limit = 1
    
    class func loadHeros(name: String, onComplete: @escaping (MarvelInfo?) -> Void) {
        let offset = 0
        let name = "name=\(name.replacingOccurrences(of: " ", with: "%20"))&"
        let url = basePath + "offset=\(offset)&limit=\(limit)&" + name + getCredentials()
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

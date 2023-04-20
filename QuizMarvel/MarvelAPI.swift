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
    static private let privateKey = "ad002ee52218cea9bd4ed12dcb88788fff9815da"
    static private let publicKey = "d3871eed0bc3a17f06b5df66bd515223"
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

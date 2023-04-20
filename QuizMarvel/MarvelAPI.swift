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
    static private let limit = 50


    class func loadHeros(onComplete: @escaping (MarvelInfo?) -> Void) {
        //let offset = page * limit
        let name: String
        let namePerson = randomNamePerson()
        name = "name=\(namePerson)&"
        let url = basePath + name + getCredentials()
        //let url = basePath + "offset=\(offset)&limit=\(limit)&" + name + getCredentials()
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
    
    private class func randomNamePerson() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyz"
        var randomString = ""
        for _ in 0..<1 {
           let randomIndex = Int.random(in: 0..<letters.count)
           let randomCharacter = letters[letters.index(letters.startIndex, offsetBy: randomIndex)]
           randomString.append(randomCharacter)
        }
        return randomString
     }
    
    private class func getCredentials() -> String{
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
}

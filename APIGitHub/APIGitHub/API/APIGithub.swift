//
//  APIGithub.swift
//  APIGitHub
//
//  Created by Pedro Henrique on 11/04/23.
//

import Foundation
import Alamofire

class APIGithub{
    
    // MARK: - Private propeties
    
    static private let basePath = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
    
    // MARK: - API call method
    
    class func loadRepositories(page: Int = 1, onComplete: @escaping (RepositoriesGitHub?) -> Void){
        
        let url = basePath + "&page=\(page)"
        AF.request(url).responseDecodable(of: RepositoriesGitHub.self) { response in
            switch response.result {
            case let .success(data):
                onComplete(data)
            case .failure:
                onComplete(nil)
            }
        }
    }
}

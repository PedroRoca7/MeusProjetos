//
//  GithubInfo.swift
//  APIGitHub
//
//  Created by Pedro Henrique on 11/04/23.
//

import Foundation


struct RepositoriesGitHub: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [Repository]
}

struct Repository: Codable{
    let name: String
    let owner: Profile
    let watchers: Int
}

struct Profile: Codable{
    let login: String
    let avatar_url: String
}

//
//  GithubInfo.swift
//  APIGitHub
//
//  Created by Pedro Henrique on 11/04/23.
//

import Foundation


struct RepositoriesGitHub: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
    
}

struct Repository: Codable {
    let name: String
    let owner: Profile
    let htmlUrl: String
    let watchers: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case owner
        case htmlUrl = "html_url"
        case watchers
    }
}

struct Profile: Codable {
    let login: String
    let avatarUrl: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrl = "avatar_url"
    }
}

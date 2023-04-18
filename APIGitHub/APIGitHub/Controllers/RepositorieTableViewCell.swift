//
//  RepositorieTableViewCell.swift
//  APIGitHub
//
//  Created by Pedro Henrique on 11/04/23.
//

import UIKit
import Kingfisher

class RepositorieTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbStars: UILabel!
    @IBOutlet weak var lbRepositories: UILabel!
    @IBOutlet weak var lbNameAuthor: UILabel!
    
    // MARK: - Setups
    
    func prepareCell(with repos: Repository) {
        lbStars.text = "Estrelas: \(repos.watchers.formatNumber())"
        lbRepositories.text = "Repositórios: \(repos.name)"
        lbNameAuthor.text = "Autor: \(repos.owner.login)"
        if let url = URL(string: repos.owner.avatarUrl){
            ivAvatar.kf.indicatorType = .activity
            ivAvatar.kf.setImage(with: url)
        } else {
            ivAvatar.image = nil
        }
    }
}

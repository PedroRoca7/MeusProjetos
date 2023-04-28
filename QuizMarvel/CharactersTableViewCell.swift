//
//  CharactersTableViewCell.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 27/04/23.
//

import UIKit
import Kingfisher

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameCharacterCorrectLabel: UILabel!
    @IBOutlet weak var nameCharacterSelectedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //prepara a celula para apresentar na tableView
    func prepareCell(with charater: Character) {
        nameCharacterCorrectLabel.text = charater.nameCorrect
        nameCharacterSelectedLabel.text = charater.nameSelected
        if let url = URL(string: charater.thumbnail) {
            thumbImageView.kf.indicatorType = .activity
            thumbImageView.kf.setImage(with: url)
        } else {
            thumbImageView.image = nil
        }
    }
}

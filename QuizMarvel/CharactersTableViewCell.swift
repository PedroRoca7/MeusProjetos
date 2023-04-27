//
//  CharactersTableViewCell.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 27/04/23.
//

import UIKit

class CharactersTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameCharacterCorrectLabel: UILabel!
    @IBOutlet weak var nameCharacterSelectedLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

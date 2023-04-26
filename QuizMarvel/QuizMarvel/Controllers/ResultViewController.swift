//
//  ResultViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var answeredLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    var score: Int = 0
    var quiz: QuizManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        answeredLabel.text = "Perguntas respondidas: \(totalAnswers)"
        correctLabel.text = "Respostas corretas: \(totalCorrectAnswers)"
        wrongLabel.text = "Respostas erradas: \(totalAnswers - totalCorrectAnswers)"
        if totalCorrectAnswers != 0 {
            score = (totalCorrectAnswers*100/totalAnswers)
        }
        scoreLabel.text = "\(score)%"
        
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true)
    }
    
}

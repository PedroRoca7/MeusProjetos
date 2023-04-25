//
//  QuizViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit
import Kingfisher

class QuizViewController: UIViewController {

    
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet var answersbutton: [UIButton]!
    @IBOutlet weak var timerView: UIView!
    
    let quizManager = QuizManager()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNewQuiz()
        
    }
        
    func getNewQuiz() {
       
        quizManager.loadHeros(onComplete: { result in
            if let result = result {
                self.configureScreen()
            }
        })
       

        
    }
    
    func configureScreen() {
        if let url = URL(string: quizManager.quiz.image) {
            personImageView.kf.setImage(with: url)
        } else {
            personImageView.image = nil
        }
        for i in 0..<quizManager.quiz.options.count {
            let option = quizManager.quiz.options[i]
            let button = answersbutton[i]
            button.setTitle(option, for: .normal)
        }
        let button = answersbutton[3]
        button.setTitle(quizManager.quiz.correctedAnswer, for: .normal)
    }
    
    func showResults() {
        
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let buttonSelected = String(sender.title(for: .normal) ?? "")
        quizManager.validadeAnswer(name: buttonSelected)
        getNewQuiz()
    }
}

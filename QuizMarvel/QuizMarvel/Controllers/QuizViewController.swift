//
//  QuizViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit
import Kingfisher

class QuizViewController: UIViewController {

    
    
    @IBOutlet weak var PersonImageView: UIImageView!
    @IBOutlet var Answersbutton: [UIButton]!
    @IBOutlet weak var TimerView: UIView!
    
    let quizManager = QuizManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadHeros()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TimerView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 120.0, delay: 0, options: .curveLinear) {
            self.TimerView.frame.size.width = 0
        } completion: { success in
            self.showResults()
        }
        quizManager.loadHeros()
        //getNewQuiz()
    }
        
//    func getNewQuiz() {
//        quizManager.loadHeros()
//        if let url = URL(string: hero.thumbnail.url) {
//            PersonImageView.kf.setImage(with: url)
//        } else {
//            PersonImageView.image = nil
//        }
//        for i in 0..<quizManager.quiz.options.count {
//            let option = quizManager.quiz.options[i]
//            let button = Answersbutton[i]
//            button.setTitle(option, for: .normal)
//
//        }
//        let button = Answersbutton[3]
//        button.setTitle(quizManager.quiz.correctedAnswer, for: .normal)
//    }
    
    func showResults() {
        
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let buttonSelected = sender.titleLabel?.text as! String
        quizManager.validadeAnswer(name: buttonSelected)
        //getNewQuiz()
    }
}

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
    let queue = DispatchQueue(label: "IOS")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        TimerView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 120.0, delay: 0, options: .curveLinear) {
            self.TimerView.frame.size.width = 0
        } completion: { success in
            self.showResults()
        }
        getNewQuiz()
        
    }
        
    func getNewQuiz() {
       queue.sync {
           quizManager.refreshQuiz()
       }
        
        queue.sync{
            if let url = URL(string: quizManager.quiz.image) {
                PersonImageView.kf.setImage(with: url)
            } else {
                PersonImageView.image = nil
            }
            for i in 0..<quizManager.quiz.options.count {
                let option = quizManager.quiz.options[i]
                let button = Answersbutton[i]
                button.setTitle(option, for: .normal)
            }
            let button = Answersbutton[3]
            button.setTitle(quizManager.quiz.correctedAnswer, for: .normal)
        }
    }
    
    func showResults() {
        
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let buttonSelected = String(sender.title(for: .normal) ?? "")
        quizManager.validadeAnswer(name: buttonSelected)
        getNewQuiz()
    }
}

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
        DispatchQueue.main.async {
            self.quizManager.loadHeros(onComplete: { result in
                if let result = result {
                    self.configureScreen(result)
                }
            })
        }
       
        
       

        
    }
    
    func configureScreen(_ result: MarvelInfo) {
        guard let thumb = result.data.results.first?.thumbnail.url else { return }
        if let url = URL(string: thumb) {
            personImageView.kf.indicatorType = .activity
            personImageView.kf.setImage(with: url)
        } else {
            personImageView.image = nil
        }
        for i in 0..<quizManager.quiz.options.count {
            let option = quizManager.quiz.options[i]
            let button = answersbutton[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults() {
        
    }
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        if let buttonSelected = sender.currentTitle{
        quizManager.validadeAnswer(name: buttonSelected)
        getNewQuiz()
        }
    }
}

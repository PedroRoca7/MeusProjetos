//
//  QuizViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit
import Kingfisher
import SwiftUI

class QuizViewController: UIViewController {

        
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet var answersbutton: [UIButton]!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerSlider: UISlider!
    @IBOutlet weak var buttonsView: UIView!
    
    var seconds = 120
    var timer = Timer()
    let quizManager = QuizManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hiddenButtons()
        
        quizManager.characters.removeAll()
        
        let loader = loader()

        resetTimeResults()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuizViewController.updateTimer), userInfo: nil, repeats: true)
        
        getNewQuiz(loader)
        
    }
    
    private func resetTimeResults() {
        seconds = 120
        quizManager._totalAnswers = 0
        quizManager._totalCorrectAnswers = 0
    }
    
    private func hiddenButtons() {
        buttonsView.isHidden = true
        timerSlider.isHidden = true
        timerSlider.tintColor = .green
        timeLabel.isHidden = true
    }
    
    private func showButtons() {
        buttonsView.isHidden = false
        timerSlider.isHidden = false
        timeLabel.isHidden = false
    }
    
    @objc private func updateTimer() {
        seconds -= 1
        timeLabel.text = String(seconds)
        
        timerSlider.value = Float(seconds)
        if seconds <= 20{
            timerSlider.tintColor = .red
        }
        
        if seconds <= 0 {
            timer.invalidate()
            showResults()
            
        }
    }
    
    @IBAction private func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timeLabel.text = String(seconds)
        
    }
    
    private  func getNewQuiz(_ loader: UIAlertController ) {
       DispatchQueue.main.async {
            self.quizManager.loadHeros(onComplete: { [weak self] result in
                guard let self = self else { return }
                
                if let result = result {
                    self.configureScreen(result)
                    self.showButtons()
                    self.stopLoader(loader: loader)
                }
            })
        }
    }
    
    private func configureScreen(_ result: MarvelInfo) {
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
    
    private func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewcontroller = segue.destination as? ResultViewController{
            resultViewcontroller.totalAnswers = quizManager.totalAnswers
            resultViewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswers
            resultViewcontroller.chars = quizManager.characters
        }
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let loader = loader()
        if let buttonSelected = sender.currentTitle{
        quizManager.validadeAnswer(name: buttonSelected)
        getNewQuiz(loader)
        }
    }
}



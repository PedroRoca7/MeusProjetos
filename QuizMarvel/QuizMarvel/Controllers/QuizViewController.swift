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
    
    var seconds = 120
    var timer = Timer()
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        seconds = 10
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QuizViewController.updateTimer), userInfo: nil, repeats: true)
        getNewQuiz()
        
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timeLabel.text = String(seconds)
        
        timerSlider.value = Float(seconds)
        if seconds <= 20{
            timerSlider.tintColor = .red
        }
        
        if seconds == 0 {
            timer.invalidate()
            showResults()
        }
    }
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timeLabel.text = String(seconds)
        
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
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultViewcontroller = segue.destination as? ResultViewController{
            resultViewcontroller.totalAnswers = quizManager.totalAnswers
            resultViewcontroller.totalCorrectAnswers = quizManager.totalCorrectAnswers
        }
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        if let buttonSelected = sender.currentTitle{
        quizManager.validadeAnswer(name: buttonSelected)
        getNewQuiz()
        }
    }
}

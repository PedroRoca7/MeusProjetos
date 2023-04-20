//
//  ResultViewController.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var AnsweredLabe: UILabel!
    @IBOutlet weak var CorrectLabel: UILabel!
    @IBOutlet weak var WrongLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
    }
    
}

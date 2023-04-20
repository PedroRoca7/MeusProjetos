//
//  Quiz.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 19/04/23.
//

import Foundation

class Quiz {
    let image: String
    let options: [String]
    private let correctedAnswer: String
    
    init(image: String, options: [String], correctedAnswer: String) {
        self.image = image
        self.options = options
        self.correctedAnswer = correctedAnswer
    }

    func validadeOption(_ optionSelected: String) -> Bool {
        let answer = optionSelected
        return answer == correctedAnswer
    }
    
    deinit{
        print("Liberou Quiz da memoria")
    }
}

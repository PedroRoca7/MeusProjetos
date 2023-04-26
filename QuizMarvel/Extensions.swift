//
//  Extensions.swift
//  QuizMarvel
//
//  Created by Pedro Henrique on 26/04/23.
//

import Foundation
import UIKit

extension QuizViewController {
    func loader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Carregando...", preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        indicator.hidesWhenStopped = true
        indicator.style = UIActivityIndicatorView.Style.large
        indicator.startAnimating()
        alert.view.addSubview(indicator)
        present(alert, animated: true)
        return alert
    }
    
    func stopLoader(loader: UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true)
        }
    }
    
}

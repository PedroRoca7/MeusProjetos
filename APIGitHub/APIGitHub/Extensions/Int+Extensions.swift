//
//  Int+Extensions.swift
//  APIGitHub
//
//  Created by Pedro Henrique on 13/04/23.
//

import Foundation

extension Int {
    func formatNumber() -> String {
        let numberFormatter = NumberFormatter()
            numberFormatter.minimumFractionDigits = 0
            numberFormatter.numberStyle = .decimal
        
        return numberFormatter.string(for: self) ?? "0"
    }
}

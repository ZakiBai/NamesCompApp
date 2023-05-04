//
//  ResultViewController.swift
//  NamesCompApp
//
//  Created by Zaki on 04.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var namesLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    @IBOutlet var resultCalcLabel: UILabel!
    
    // MARK: - Public properties
    var firstName: String!
    var secondName: String!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"
        
        resultCalcLabel.text = getResult().formatted(.percent)
        
        progressView.progress = Float(getResult()) / 100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)

    }
    
    // MARK: - Private methods
    private func getValue(name: String) -> Int {
        var count = 0
        
        switch name.lowercased() {
        case "a", "b", "c", "q", "l":
            count += 5
        case "n", "r", "m":
            count += 8
        case "e", "t", "y":
            count += 7
        case "u", "i", "o":
            count += 4
        case "z", "x", "v":
            count += 3
        default:
            count += 2
        }
        
        return count
    }
    
    private func getResult() -> Int {
        var result = 0
        
        let firstValue = getValue(name: firstName)
        let secondValue = getValue(name: secondName)
        let difference = abs(firstValue - secondValue)
        
        switch difference {
        case 1, 4, 6:
            result = 100
        case 3, 5, 7:
            result = 65
        case 2, 8, 9:
            result = 85
        case 10, 11, 12:
            result = 45
        default:
            result = 30
        }
        
        return result
    }
}

//
//  ResultViewController.swift
//  NamesCompApp
//
//  Created by Zaki on 04.05.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet var namesLabel: UILabel!
    
    @IBOutlet var progressView: UIProgressView!
    
    @IBOutlet var resultCalcLabel: UILabel!
    
    var firstName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namesLabel.text = "\(firstName ?? "") and \(secondName ?? "")"

        
    }
    

   

}

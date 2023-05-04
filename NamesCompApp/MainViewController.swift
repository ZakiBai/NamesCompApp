//
//  ViewController.swift
//  NamesCompApp
//
//  Created by Zaki on 04.05.2023.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet var firstName: UITextField!
    
    @IBOutlet var secondName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.firstName = firstName.text
        resultVC.secondName = secondName.text
    }
    
    @IBAction func showResultButtonTapped() {
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        firstName.text = ""
        secondName.text = ""
    }


}


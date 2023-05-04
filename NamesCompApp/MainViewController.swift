//
//  ViewController.swift
//  NamesCompApp
//
//  Created by Zaki on 04.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var firstName: UITextField!
    @IBOutlet var secondName: UITextField!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultVC = segue.destination as? ResultViewController else { return }
        resultVC.firstName = firstName.text
        resultVC.secondName = secondName.text
    }
    
    // MARK: - IB Actions
    @IBAction func showResultButtonTapped() {
        guard let firstNameTF = firstName.text, let secondNameTF = secondName.text else { return }
        
        if firstNameTF.isEmpty || secondNameTF.isEmpty {
            displayAlert(
                title: "Names are missing",
                message: "Please enter both names"
            )
        
        }
        
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        firstName.text = ""
        secondName.text = ""
    }


}
// MARK: - Alert Creating
extension MainViewController {
    private func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
// MARK: - TextField Delegate
extension MainViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstName {
            secondName.becomeFirstResponder()
        } else {
            showResultButtonTapped()
        }
        return true
    }
   
    
}

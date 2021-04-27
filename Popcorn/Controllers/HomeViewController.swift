//
//  ViewController.swift
//  Popcorn
//
//  Created by Petru Popa on 4/22/21.
//

import UIKit
import MBProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var queryTextField: UITextField!
    
    private var viewModel: HomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViewModel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let resultsViewController = segue.destination as? ResultsViewController {
            resultsViewController.viewModel = ResultsViewModel(query: self.queryTextField.text!.trimmingCharacters(in: .whitespaces), movies: self.viewModel.movies!)
        }
    }
    
    func initViewModel() {
        self.viewModel = HomeViewModel()
        self.viewModel.showResults = {
            MBProgressHUD.hide(for: self.view, animated: true)
            if let error = self.viewModel.error {
                self.showAlert(title: error.localizedDescription)
            } else if self.viewModel.movies!.results.count == 0 {
                self.showAlert(title: "No movies!") {
                    self.queryTextField.becomeFirstResponder()
                }
            } else {
                self.performSegue(withIdentifier: "results", sender: nil)
            }
        }
    }
    
    func showAlert(title: String, handler: (() -> ())? = nil) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel) { _ in
            handler?()
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue) {
        queryTextField.text = ""
    }

}

extension HomeViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let query = textField.text!.trimmingCharacters(in: .whitespaces)
        if !query.isEmpty {
            textField.resignFirstResponder()
            MBProgressHUD.showAdded(to: self.view, animated: true)
            viewModel.searchMovies(query: query)
        }
        return true
    }
    
}

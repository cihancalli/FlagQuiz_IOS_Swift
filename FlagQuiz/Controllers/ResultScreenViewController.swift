//
//  ResultScreenViewController.swift
//  FlagQuiz
//
//  Created by Cihan Çallı on 23.03.2022.
//

import UIKit

class ResultScreenViewController: UIViewController {
    
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var successTextLabel: UILabel!
    
    var CorrectCount:Int?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        if let cc = CorrectCount {
            resultTextLabel.text = "\(cc) CORRECT - \(5-cc) WRONG"
            successTextLabel.text = "% \(cc*100/5) SUCCESS "
        }
    }
    @IBAction func didTrayAgainButtonTapped(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
}

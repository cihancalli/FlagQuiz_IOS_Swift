//
//  QuizScreenViewController.swift
//  FlagQuiz
//
//  Created by Cihan Çallı on 23.03.2022.
//

import UIKit

class QuizScreenViewController: UIViewController {
    
    @IBOutlet weak var correctTextLabel: UILabel!
    @IBOutlet weak var wrongTextLabel: UILabel!
    @IBOutlet weak var questionTextLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    
    @IBOutlet weak var AButton: UIButton!
    @IBOutlet weak var BButton: UIButton!
    @IBOutlet weak var CButton: UIButton!
    @IBOutlet weak var DButton: UIButton!
    
    var Questions = [FlagModel]()
    var WrongOptions = [FlagModel]()
    var CorrectQuestion = FlagModel()
    var QuestionCount = 0
    var CorrectCount = 0
    var WrongCount = 0
    var Options = [FlagModel]()
    var MixOptionsList = Set<FlagModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Questions = FlagDAO().getRandom5()
        
        loadQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let goToViewController = segue.destination as! ResultScreenViewController
        goToViewController.CorrectCount = CorrectCount
    }
    
     func loadQuestion() {
        questionTextLabel.text = "\(QuestionCount+1). Flag Question"
        correctTextLabel.text = "Correct: \(CorrectCount)"
        wrongTextLabel.text = "Wrong: \(WrongCount)"
        
        CorrectQuestion = Questions[QuestionCount]
        flagImageView.image = UIImage(named: CorrectQuestion.flag_image!)
        
        WrongOptions = FlagDAO().getRandom3WrongOption(flag_id: CorrectQuestion.flag_id!)
        
        MixOptionsList.removeAll()
        MixOptionsList.insert(CorrectQuestion)
        MixOptionsList.insert(WrongOptions[0])
        MixOptionsList.insert(WrongOptions[1])
        MixOptionsList.insert(WrongOptions[2])
        
        Options.removeAll()
        
        for o in MixOptionsList {
            Options.append(o)
        }
        
        AButton.setTitle(Options[0].flag_name, for: .normal)
        BButton.setTitle(Options[1].flag_name, for: .normal)
        CButton.setTitle(Options[2].flag_name, for: .normal)
        DButton.setTitle(Options[3].flag_name, for: .normal)
    }
    
    func CorrectControl(button:UIButton) {
        let ButtonText = button.titleLabel?.text
        let CorrectAnswer = CorrectQuestion.flag_name
        print("Button Text: \(ButtonText!)")
        print("Correct Answer: \(CorrectAnswer!)")
        
        if CorrectAnswer == ButtonText {
            CorrectCount += 1
        }else {
            WrongCount += 1
        }
        correctTextLabel.text = "Correct: \(CorrectCount)"
        wrongTextLabel.text = "Wrong: \(WrongCount)"
        
    }
    
    func QuestionCountControl() {
        QuestionCount += 1
        
        if QuestionCount != 5 {
            loadQuestion()
        }else {
            performSegue(withIdentifier: "toResult", sender: nil)
        }
    }
    
    @IBAction func didAButtonTapped(_ sender: Any) {
        CorrectControl(button: AButton)
        QuestionCountControl()
    }
    @IBAction func didBButtonTapped(_ sender: Any) {
        CorrectControl(button: BButton)
        QuestionCountControl()
    }
    @IBAction func didCButtonTapped(_ sender: Any) {
        CorrectControl(button: CButton)
        QuestionCountControl()
    }
    @IBAction func didDButtonTapped(_ sender: Any) {
        CorrectControl(button: DButton)
        QuestionCountControl()
    }
    
}

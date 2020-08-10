//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

enum TrueFalse : String {
    case True = "True"
    case False = "False"
}

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var optionNumberOne: UIButton!
    @IBOutlet weak var optionNumberTwo: UIButton!
    @IBOutlet weak var optionNumberThree: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizController = QuizController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: 0"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.currentTitle else { return }// TRUE FALSE
        
        let userCorrectAnswer = quizController.checkAnswer(userAnswer)
        
        if userCorrectAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizController.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        
//        guard let optionOne = self.quizController.answerOne, let optionTwo = self.quizController.answerTwo, let optionThree = self.quizController.answerThree else { return }

        DispatchQueue.main.async {
            self.optionNumberOne.setTitle(self.quizController.answerOne, for: .normal)
            self.optionNumberTwo.setTitle(self.quizController.answerTwo, for: .normal)
            self.optionNumberThree.setTitle(self.quizController.answerThree, for: .normal)
        }
            
            self.questionLabel.text = self.quizController.getQuestionText()
            self.scoreLabel.text = "Score: \(self.quizController.getScore())"
            self.optionNumberOne.backgroundColor = .clear
            self.optionNumberTwo.backgroundColor = .clear
            self.optionNumberThree.backgroundColor = .clear
            self.progressBar.progress = self.quizController.getProgress()
        
    }
}

extension ViewController {
    private func createAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

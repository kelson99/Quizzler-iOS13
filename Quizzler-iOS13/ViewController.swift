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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
        
    var quizController = QuizController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        questionLabel.text = quizController.getQuestionText()
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        progressBar.progress = quizController.getProgress()
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

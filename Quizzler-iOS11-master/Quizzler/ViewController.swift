//
//  ViewController.swift
//  Quizzler
//
//  Created by Arun Atluri.
//  Copyright (c) 2018 Arun Atluri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        //let firstQuestion = allQuestions.list[0]
        //questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        
        questionNumber += 1
        
        
        nextQuestion()
    }
    
    
    func updateUI() {
      
        scoreLabel.text = "Score: \(score)" //String(score)
        progressLabel.text = "\(questionNumber + 1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber + 1)
        
    }
    

    func nextQuestion() {
        
        if questionNumber <= allQuestions.list.count - 1 {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else {
            
            let alert  = UIAlertController(title: "Excellent", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    func checkAnswer() {
        
        if questionNumber <= allQuestions.list.count - 1 {
            
            let correctAnswer = allQuestions.list[questionNumber].answer
            
            if correctAnswer == pickedAnswer {
                ProgressHUD.showSuccess("Correct")
                score += 1
                updateUI()
            }
            else {
                ProgressHUD.showError("Wrong!")
            }
        }
        
    }
    
    
    
    func startOver() {
        
        questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
    }
    

    
}